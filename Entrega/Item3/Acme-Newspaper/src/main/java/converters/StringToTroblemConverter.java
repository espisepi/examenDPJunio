
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.TroblemRepository;
import domain.Troblem;

@Component
@Transactional
public class StringToTroblemConverter implements Converter<String, Troblem> {

	@Autowired
	private TroblemRepository	TroblemRepository;


	@Override
	public Troblem convert(final String text) {

		Troblem result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.TroblemRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
