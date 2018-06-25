
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.AuditsRepository;
import domain.Audits;

@Component
@Transactional
public class StringToAuditsConverter implements Converter<String, Audits> {

	@Autowired
	private AuditsRepository	AuditsRepository;


	@Override
	public Audits convert(final String text) {

		Audits result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.AuditsRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
