Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A122D7B813E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:46:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 884C3857;
	Wed,  4 Oct 2023 15:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 884C3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696427195;
	bh=4rgf7moCn4i3mIZqnrLnasgiazi0IcFuy9N+ZcY3W9A=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l2OdT4RzeCU4hhj8QJp7lWkn8iUIwM1hOWMlxq2DwcHRqVlGGbgJj3kpdfOd6coys
	 CVZbbuLDeZDzXhWv+hhMfDijtTzetT1Rs8qpTT0BzG2aukwntxQnxkgjmlqIMoKEhY
	 Z3rR2vf/lfO97kGmae+wXvDi6SfCBPRa3vXOSqf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18C6EF80130; Wed,  4 Oct 2023 15:45:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D61FDF80310;
	Wed,  4 Oct 2023 15:45:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 018DBF8047D; Wed,  4 Oct 2023 15:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5A79F80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5A79F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ydyl4joh
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso21063335e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Oct 2023 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696427134;
 x=1697031934; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=1kmHDAPg7pC8MPq7oQS5jeonYYhLXbcc4B09UyTLOUA=;
        b=ydyl4johh249nd5ltEjBpPmS2q+/wFKz2u13LgQ0hnrOpTwt6NX50iyNn5F01rr76T
         YMJyIHSObaZe4t9kXIt0dYklPHmebPLejJVNtlLODlTjWadV6MS48YFuPs3bCXpDM8AF
         5GiMinr/XhsGH1lhszN/oR41rdjThNNZoCOLrBaBXYJPO7lZxbi21XXLMr7tqym3AMtu
         M0kQm5cZdLAR5PS9uCs4To22i5NeohxUo/bJENGnktgQR4JLh6Q9iBfuXNNKU8BJSGRb
         dgFjg7ekbDGVRbH6nCjCLPWb8Sfm5g3AqED5/H170d+3SFiRdeRz4h15ZBrxSMjByYY1
         mmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696427134; x=1697031934;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kmHDAPg7pC8MPq7oQS5jeonYYhLXbcc4B09UyTLOUA=;
        b=eaIKnHvsLaqStSQqeLXog7EpI6Niph5STYuHPVyYAAP6fDfBOaoKZCw1pW6RKkAvaf
         SeP631SOB18NfqPWE2nv1gO9KXx1qdiyXe6R2CVGnaYLObEaDn/qzZ11ZZ6BAM4wupyN
         8/kLfGo5nfAYT8GDh9dp1hVYGT8iYpp+SjkWz3W/kZMQcofXmQEIHVWuuix1s4IUrd7p
         1mBOS+4MaQ7+cLgII35KOwT6+1Pr0AW/iF9Rjm26Q/jkm6FdprVYff+6AVo/WxWFuln0
         63IjGmfzzxuWMUFiM1CcuwC2xUJO2bFMkRh61M7XsAkuZOoKrtlE4BxrdMZdUfo0lax7
         Jgbw==
X-Gm-Message-State: AOJu0YwNecGT0V/pqH/1Nftt4VahH5QoMdsioKaOmjecjGl72R1FigyK
	HCDwiyXDbtaXYrpa2WObe05odg==
X-Google-Smtp-Source: 
 AGHT+IGCZafkK72JRIJK5lTUX7MZlFYjq8+XF7Rv0FwSsj/+dogAAsBIDx2bfk4/aturVsqvAc5Brw==
X-Received: by 2002:a7b:cc95:0:b0:3fe:f726:4a94 with SMTP id
 p21-20020a7bcc95000000b003fef7264a94mr2423461wma.14.1696427134190;
        Wed, 04 Oct 2023 06:45:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d9fc:647c:aca8:fc21])
        by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b004060f0a0fdbsm1578396wmi.41.2023.10.04.06.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:45:33 -0700 (PDT)
References: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
 <87h6n6g69d.wl-kuninori.morimoto.gx@renesas.com>
 <6c249580-ccdd-453f-9051-ca2a32dc4189@linux.intel.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/2] ASoC: soc-pcm.c: fixup validation check of multi
 CPU/Codec on soc_get_playback_capture()
Date: Wed, 04 Oct 2023 15:30:07 +0200
In-reply-to: <6c249580-ccdd-453f-9051-ca2a32dc4189@linux.intel.com>
Message-ID: <1jcyxuy002.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: IKPEULX7YHDUSWHRGNOT7XDJMTPG7DPQ
X-Message-ID-Hash: IKPEULX7YHDUSWHRGNOT7XDJMTPG7DPQ
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKPEULX7YHDUSWHRGNOT7XDJMTPG7DPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed 04 Oct 2023 at 09:06, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> Hi Morimoto-san,
>
>> Current soc_get_playback_capture() are checking validation of CPU/Codec
>> like below
>> 
>> 	static int soc_get_playback_capture(...)
>> 	{
>> 		...
>>  ^		if (dai_link->dynamic || dai_link->no_pcm) {
>> (X)				...
>>  v		} else {
>>  ^			...
>>  |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
>>  |				...
>>  |				if (snd_soc_dai_stream_valid(codec_dai, ...) &&
>>  |				    snd_soc_dai_stream_valid(cpu_dai,   ...))
>> (Y)(a)					has_playback = 1;
>>  |				if (snd_soc_dai_stream_valid(codec_dai, ...) &&
>>  |				    snd_soc_dai_stream_valid(cpu_dai,   ..))
>>  | (b)					has_capture = 1;
>>  |			}
>>  v		}
>> 		...
>> 	}
>> 
>> (X) is for DPCM connection, (Y) is for Normal connection.
>> In Normal connection (Y), it is handling CPU/Codec, and it will set
>> has_playback/capture = 1 at (a)(b), but it means today is "at least one
>> of CPU/Codec pair was valid" in multi CPU/Codec case.
>> 
>> This is wrong, it should be handled when "all CPU/Codec are valid".
>> This patch fixup it.
>
> I knew this code looked familiar and sure enough we've been there before
> in 2020. This code was introduced by
>
> 4f8721542f7b ASoC: core: use less strict tests for dailink capabilities
>
> the initial stricter tests caused a number of regressions reported by
> Jerome Brunet so we lowered the bar from "all dais" to "at least one
> dai" to be backwards-compatible.
>
> I don't think we can revisit this without hitting the same sort of issues.

Good memory :)

Hi Morimoto-san,

Here is an example:
1 CPU - 1 dai link - 2 codecs:
* 1 codec handles the playback and just that
* the other does same capture

I have fair number of boards doing just that.

This is valid from the HW i2s/TDM point of view.

Going with 'all must be valid for the direction' makes this use case
impossible. Each codec would disable the direction of the other one.

As long as there is component, at least one, capable of handling the
stream direction then it is fine to do it.

Do you have an actual problem because/error because of this ?

>
> Regards,
> -Pierre

