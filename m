Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7B37E0489
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 15:17:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11C6825;
	Fri,  3 Nov 2023 15:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11C6825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699021055;
	bh=ZckemY2fI/52XRknUCjWvcgvufsdKbOiaTnLX0CW5i0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ei6XtlffxvkpZXrkd9jzgCeQIWBmpgSepTCCyDIhSvnMlTn6xjWJjlkHJV/QvxGJA
	 oSWhKGAArrWg+dgMVixPi4hoiPrpX3RI7gZ4jiaTM9PjzKCdlyyMZ4bfEUohNRCXIi
	 Z6uGDgucrrMp//oOkFVIwcuHw2DYvIqisXn4L4Pg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB6FFF8055B; Fri,  3 Nov 2023 15:16:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBD1F8020D;
	Fri,  3 Nov 2023 15:16:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE788F80290; Fri,  3 Nov 2023 15:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 835E2F8003C
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 15:16:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 835E2F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e9TqI2UZ
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so1957820f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 03 Nov 2023 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699020993; x=1699625793;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evXjT31VfWFinCwS9eVIYPm4dsZFzW7Jc82ftHB3Fl8=;
        b=e9TqI2UZdST2wCHNtLDhLZ7e5spA9EGDJ6hg1VE4ORJSuk0yPILqEuCzJQIaOClnGd
         6eaD5vkIr4QutCtTuWDI4XtbVbBkFGH+vQR2BQQwcBQHN1vUHApeNWMoXxU1koB9qjyR
         +PsMGqymgiw+O2O5NY33cmiMUSvoh4s0JtjWjLvfjmIbq5iFz2YNz6X3G9Dypuh9vIBt
         0W7hHfkOP5lAJM+cMMx5BmMePbHA4dSUKH0L7wdJyOO7V3IOAhoLVMkEwflbrUqwA+h1
         MkP/JBt9gGjz/oqrWtaefboavqJjZCafm0o8W9bit/FdpIrkPca3Uohj0jdxkbXkn4gj
         sKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699020993; x=1699625793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evXjT31VfWFinCwS9eVIYPm4dsZFzW7Jc82ftHB3Fl8=;
        b=etAtQKOMn0TcGJ0z7O9AMuwoS2u1DCDsNhdAm+PDZeCWfbyzvgZdmHCKpYgOKM6A3p
         +LNZM1xJhSuOPZKfJOqSESMyi+bGTN4nnHYnvW5Dwgrq4NHlPJhZ5NC3yF0ajLP7+ssV
         iRzwvwx/pwajqNdPVhhuvpkscn9eTq3GoNQUs7fa9iTQuqr9qze/y/xABBcR1+8ZEXG4
         3358uQ8WwcRO5+UaPNOHRfcwnkVrttLhrAa6NObLYaavk3k+Q3Je5T5v21azSNuklz2F
         gRdrD3E8HgrDfmYrRy6VP+kkZgc5s9wYmS2wuDktkY2iQxNmqsLJHd+eNFILpCXiaBnK
         DafQ==
X-Gm-Message-State: AOJu0YyjY7bvpzyLhJ9WlSrWUKP3iKcy1zo99D5hmHG46/VQfbQNaWas
	EAewQEyvBj000fs4jxUJS9T+cwazyLmMwUl0Efg=
X-Google-Smtp-Source: 
 AGHT+IGn31m/dJNBXZFppXDkdzaC8uBqRWYSpLjgTz7gbjkVWnQc1uyK6AYeX85jvWMZ/DG4XpDYCg==
X-Received: by 2002:a05:6000:184:b0:32f:68ae:239c with SMTP id
 p4-20020a056000018400b0032f68ae239cmr3171736wrx.16.1699020993224;
        Fri, 03 Nov 2023 07:16:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 h17-20020adff4d1000000b0032d96dd703bsm1970175wrp.70.2023.11.03.07.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 07:16:32 -0700 (PDT)
Message-ID: <160752cb-7772-4b1d-9096-8be25e76213c@linaro.org>
Date: Fri, 3 Nov 2023 15:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wsa884x: check if set_stream is called
 for proper bus
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
 <20231025144601.268645-3-krzysztof.kozlowski@linaro.org>
 <8b9db87b-0f61-4824-acf1-6b5ebdf45e63@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8b9db87b-0f61-4824-acf1-6b5ebdf45e63@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GDWNRNH4IHQZOUG7GYZ4ZYDOWRVADH2J
X-Message-ID-Hash: GDWNRNH4IHQZOUG7GYZ4ZYDOWRVADH2J
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GDWNRNH4IHQZOUG7GYZ4ZYDOWRVADH2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/10/2023 17:03, Pierre-Louis Bossart wrote:
> 
> 
> On 10/25/23 09:46, Krzysztof Kozlowski wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> If multiple WSA8840 speakers, from two separate Soundwire buses, are
>> used in one codec DAI link, the set_stream() should ignore calls for
>> setting stream from other Soundwire controller.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  sound/soc/codecs/wsa884x.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
>> index bee6e763c700..91205e8c96f1 100644
>> --- a/sound/soc/codecs/wsa884x.c
>> +++ b/sound/soc/codecs/wsa884x.c
>> @@ -1775,6 +1775,12 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
>>  			      void *stream, int direction)
>>  {
>>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>> +	struct sdw_stream_runtime *sruntime = stream;
>> +	struct sdw_slave *sdw = dev_to_sdw_dev(dai->dev);
>> +
>> +	/* Check if this belongs to same bus */
>> +	if (sdw->bus->dev != sruntime->dev)
>> +		return 0;
> 
> Sorry, maybe I am really thick or need coffee, but I can't figure out
> why this is necessary. Each amplifier has its own "wsa884x_priv" context
> and should have its own DAI, not following why the set_stream would
> mix-up the two dais?
> 
> We've been using two buses for two amplifiers since CometLake (2019?)
> and I don't see what's different?

Let me start with some hardware representation in DTS.

We have two Soundwire controllers swr0 and swr3, each with two WSA884x
speakers (codecs):

-------------
&swr0 {
	status = "okay";

	left_woofer: speaker@0,0 {
		compatible = "sdw20217020400";
		reg = <0 0>;
		// ...
	};

	/* WSA8845, Left Tweeter */
	left_tweeter: speaker@0,1 {
		compatible = "sdw20217020400";
		reg = <0 1>;
		// ...
	};
};

&swr3 {
	status = "okay";

	/* WSA8845, Right Woofer */
	right_woofer: speaker@0,0 {
		compatible = "sdw20217020400";
		reg = <0 0>;
		// ...
	};

	/* WSA8845, Right Tweeter */
	right_tweeter: speaker@0,1 {
		compatible = "sdw20217020400";
		reg = <0 1>;
		// ...
	};
};
-------------

Now, for four-speaker playback, we have sound card with links like:

-------------
wsa-dai-link {
	link-name = "WSA Playback";

	cpu {
		sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
	};

	codec {
		sound-dai = <&left_woofer>, <&left_tweeter>,
			    <&swr0 0>, <&lpass_wsamacro 0>,
			    <&right_woofer>, <&right_tweeter>,
			    <&swr3 0>, <&lpass_wsa2macro 0>;
	};

	platform {
		sound-dai = <&q6apm>;
	};
};
-------------

We need to prepare the stream for all four speakers and two soundwire
controllers (so two different soundwire buses), however without the
patches here, the stream (sdw_stream_runtime *sruntime) right
woofer/twitter is set to swr0 (the other bus!). But it should stay as
swr3 (their bus).

Does it help a bit? I hope I am able to properly explain it.

Thanks for your feedback and review!

Best regards,
Krzysztof

