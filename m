Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CE8148C4
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 14:12:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F0CDF3;
	Fri, 15 Dec 2023 14:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F0CDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702645964;
	bh=YVAj81xR3UGWwi9IwTdMMiN5qIvtNDMXbLSVFQDC2Zw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pr6PE7+Obnzbbd5l74ohpoHXK6D94YAJVc7RTUTygLTGvQ75PqysxpLmfS/VpznT/
	 OpTmtfbi4fQkOYNqLeb954tVEAMwWqaYmq/2KBId5M5IOwFsj0LiMgFVGAupNVUYby
	 Y372jjYoWDwC5rrON06jPEM0tLjY+Lg8ewHbk3zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB1C9F80579; Fri, 15 Dec 2023 14:12:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C822F80578;
	Fri, 15 Dec 2023 14:12:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8442F8016A; Fri, 15 Dec 2023 14:12:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C6F4F8001F
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 14:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6F4F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DfqBNkLa
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso7413695e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Dec 2023 05:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702645920; x=1703250720;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elp6Thk4qtd/V/VmcwBF9x0WrXlslVQD7aBSrD8E/B4=;
        b=DfqBNkLarwFFWQXYBUNtBrgqE2KOQ4lRhZQDLXLDg4XHoR9IlwM04kgK0bKmgz9apk
         TmLahhm3XolpiM1+gD41TVfgTzRl/wFWBWMOp9pu3fUOgP248ehlzXMffmT9arH6uQWt
         dRRVDYfVG6HdV9L3UtZumUotcRZVT2dI34EEIb+HTT7PcybKdbHiJxyppeY55wr1CIW0
         tQYJIMxrcKdgPhiX0WXn5UUHL3dbHEwmY7MzevtWzMfmMs3cWbIhRnneVsq4CyXZ11WR
         chCeXx25l2GJTrIbKSNE8d0ZDZXMYUdkoNoCrSshCaPliK+Gd68Y1stzS2tYHniuZmau
         gQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702645920; x=1703250720;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=elp6Thk4qtd/V/VmcwBF9x0WrXlslVQD7aBSrD8E/B4=;
        b=X6KioYxrDrpbUUykccXsUMmM7eKQHjr5QDKvp2OauJNuqxZrQPag/VK0bZ7vhOb45H
         aMrFq1eu0oAbCM+WENdDmacBdhRT9dEJa7YHbQ1kC4hbN9sYIxRb8kvA0lyCtQR/SlDn
         45QzdGEWF0OOuHPCfPFMUR7vlCRvNWGoPdrXn4biVlV5d8SPJK4zl3mjZrWrNEH2SIgz
         AIIqBWuueufnCzI5r8c2or3RanhRl0KuWHT8tws1RomQx18osuc0hfI4tmaraqsezBma
         IxL9Gn7xRucrNVcBE5rvCIf2yz9zK0HQTZfARLLIzpqCP1hS3X1BWVXpGbzshmmTKskM
         5oUQ==
X-Gm-Message-State: AOJu0YwAdzr3UL26os2VZELE4bEIlgWc5ZrXvYBCL8j+yjTkWaAX1n6Y
	m8qQkKqWoroNoRxKa90Qd4aBOw==
X-Google-Smtp-Source: 
 AGHT+IGMLOefGAWydo1H4s1lMv7uUuyJss4sJUB5Q94jIew2eAFblDKp0NXWewGQfoB3FGjV3sHXtA==
X-Received: by 2002:a05:600c:164a:b0:40b:5e59:c566 with SMTP id
 o10-20020a05600c164a00b0040b5e59c566mr6001053wmn.144.1702645919664;
        Fri, 15 Dec 2023 05:11:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bfe9:1376:5584:1682?
 ([2a01:e0a:982:cbb0:bfe9:1376:5584:1682])
        by smtp.gmail.com with ESMTPSA id
 be9-20020a05600c1e8900b0040596352951sm31552567wmb.5.2023.12.15.05.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 05:11:59 -0800 (PST)
Message-ID: <eb805e37-20a5-4462-8285-8942f8bfc74c@linaro.org>
Date: Fri, 15 Dec 2023 14:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/5] ASoC: codecs: Add WCD939x Codec driver
Content-Language: en-US, fr
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-5-6df9585ec7c8@linaro.org>
 <4dae5296-9984-4c3b-803a-f6024edd0dd9@sirena.org.uk>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <4dae5296-9984-4c3b-803a-f6024edd0dd9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5A2YZKBXI7IPYGTRSL6PN4OLVS6XR5V7
X-Message-ID-Hash: 5A2YZKBXI7IPYGTRSL6PN4OLVS6XR5V7
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: neil.armstrong@linaro.org
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A2YZKBXI7IPYGTRSL6PN4OLVS6XR5V7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/12/2023 20:20, Mark Brown wrote:
> On Thu, Dec 07, 2023 at 11:28:08AM +0100, Neil Armstrong wrote:
> 
>> +static int wcd939x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
>> +	u32 mode_val;
>> +
>> +	mode_val = ucontrol->value.enumerated.item[0];
>> +
>> +	if (wcd939x->variant == WCD9390) {
>> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
>> +			dev_dbg(component->dev, "%s: Invalid HPH Mode\n", __func__);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +	if (mode_val == CLS_H_NORMAL) {
>> +		dev_dbg(component->dev, "%s: Unsupported HPH Mode\n", __func__);
>> +		return -EINVAL;
>> +	}
>> +
>> +	wcd939x->hph_mode = mode_val;
> 
> This seems strange - the code will accept any value other than a small
> number of specifically enumerated ones?  I would have expected us to
> check a defined list of modes and reject anything that isn't in that
> list.  This also means that the get() function can return out of bounds
> values which is buggy.  Please use the mixer-test selftest on a card
> with this driver running, it should identify at least that issue.
> 
>> +
>> +	return 1;
>> +}
> 
> This will also unconditionally report that the value of the mux changed,
> the function should return 0 if the value written is the control value
> hasn't changed.

Ack, I'll fix this, I wasn't happy anyway with the design

Neil
