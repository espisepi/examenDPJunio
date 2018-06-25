
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Audits;

@Component
@Transactional
public class AuditsToStringConverter implements Converter<Audits, String> {

	@Override
	public String convert(final Audits Audits) {
		String result;

		if (Audits == null)
			result = null;
		else
			result = String.valueOf(Audits.getId());
		return result;
	}
}
