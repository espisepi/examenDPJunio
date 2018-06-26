
package converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import domain.Troblem;

@Component
@Transactional
public class TroblemToStringConverter implements Converter<Troblem, String> {

	@Override
	public String convert(final Troblem Troblem) {
		String result;

		if (Troblem == null)
			result = null;
		else
			result = String.valueOf(Troblem.getId());
		return result;
	}
}
