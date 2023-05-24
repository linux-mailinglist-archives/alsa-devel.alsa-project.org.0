Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C528270F178
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 10:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B241FA;
	Wed, 24 May 2023 10:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B241FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684918327;
	bh=tLRv5a1cXN4xeACxpa7qmk/KVOQ7oMe6yX6+Py1WrXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sROhwfZnKDbfp7zXZJwIa/pNjaZ3PrCGAGfYddNJ1vGpqT18eVda6FGtks5k1SLHa
	 T74Saf6ybtG+yP4/x05tLuMSrTXPgAonVh4s4ghr7jvVvsqcwVoLdxzfw4zWsy2rHm
	 z7nZ5hStySFNP9x5rvAKiYTjV9/lCfwbClMelVfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D71F3F80249; Wed, 24 May 2023 10:51:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 832F9F80053;
	Wed, 24 May 2023 10:51:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C568CF8024E; Wed, 24 May 2023 10:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A241FF80086
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 10:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A241FF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HvFRB1UT
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f607059b4eso6060015e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684918263; x=1687510263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpwZKl15N1ARAVTzHTzpdCx10bm72H5sA4Jzbb3JTYA=;
        b=HvFRB1UTElygxUYfN+8OUAQV8DHc74GM/qd3uJNTM/5AUFFeH870fRxbP6cS6hs87s
         snYxkYZtpIgTx3j4tj+byXvhspX7IO7OThCVtps6DSplS5IzGMV853X/sqgk1yoYzv7i
         nHohAn9kJ9ofONnx71cWdBxU04VSJ0XMeBywsh83eVkPhu0SASoI3MLWX+zWAE0v3tBd
         uhnYiZ8g3udr18R9Fn2aVsB+RKVR83W7ocAZ1wyT0AIzlSnuaXoFZHmkTVAiKLAhVPgf
         lSR1L9yUrW9rVKKeWIlLIPqqYN7SbWnpObC8njObLhEF/AyST1zCxxRqnswhIRj15c36
         ruAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684918263; x=1687510263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qpwZKl15N1ARAVTzHTzpdCx10bm72H5sA4Jzbb3JTYA=;
        b=EBTL4cFSvDD1CqOxqDZmR84slvbdO4ZC43NomUddPyQJo/pBalB2wvPD6qI8A8mN6h
         O3CSvTshyt8Iy18EcJ25ZYaVlq+3prqNIqeroKH+kuERGVaQvRQZOnUOOj9cc1noSk5z
         zrQoPegPyRw7nXYKwiFig6IhkNkS95Pxiqzk31bpnbOjplDoDddNuUWFSjVWD6R9w7Hu
         /ybcUXCujjfk7XgZU00zqA73t5m664MMDE3d+atmBdS53orSt71M4N/e3BuikcmopU4E
         RdEMQjxyIcbsB6DynkqUL4gmjwv93POVx1u/koqLH8a+1mb00k1Sf18NNztmGAEhMNpa
         /k1g==
X-Gm-Message-State: AC+VfDzVKHVKg9ePvDyDr2Bc9k1SNIGn3M9lXYFdvOuVCJl5EiioN3IQ
	fU8DTkmpThWvVddaUSVtcjPIkQ==
X-Google-Smtp-Source: 
 ACHHUZ5pq80iTCiDU+xKmX+H47kSR1xBIKDG6rPFbX5sZR6vWq/q/bTRaLpBwsF09Dabfc+MOBUfBQ==
X-Received: by 2002:a7b:c8cf:0:b0:3f6:26a1:1d58 with SMTP id
 f15-20020a7bc8cf000000b003f626a11d58mr594423wml.37.1684918262841;
        Wed, 24 May 2023 01:51:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 m11-20020a7bce0b000000b003f6042d6da0sm1613875wmc.16.2023.05.24.01.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 01:51:02 -0700 (PDT)
Message-ID: <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
Date: Wed, 24 May 2023 09:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: U2R7OC7XNDVEUWAT3KPTI42NWTYGAR7T
X-Message-ID-Hash: U2R7OC7XNDVEUWAT3KPTI42NWTYGAR7T
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2R7OC7XNDVEUWAT3KPTI42NWTYGAR7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 23/05/2023 17:55, Mark Brown wrote:
> On Tue, May 23, 2023 at 04:46:04PM +0100, Srinivas Kandagatla wrote:
>> regmap-sdw does not support multi register writes, so there is
>> no point in setting this flag. This also leads to incorrect
>> programming of WSA codecs with regmap_multi_reg_write() call.
> 
>> This invalid configuration should have been rejected by regmap-sdw.
> 
> Does the CODEC support mulitple writes?  If so it seems better to leave
No, the codec itself does not support multi-write. All the codec 
register level interface is via SoundWire Bus. which also does not 
support with the existing code.


--srini

> the flag set and just do the appropriate fix in the regmap code until
> such time as it's updated to be able to exercise it.
