Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA938CDBD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 20:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910BB16C7;
	Fri, 21 May 2021 20:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910BB16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621622696;
	bh=85wW/oHBPELMnVgx3DhsE6yVEI3vGpozw9zIC+jc1ec=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyIg3HSCNxLvW5p+wkpd7YUOmp0oEvORWKy/5dFfyw+QrBTsg2C7OWJfwPpv6FoOB
	 vVCFG5NoDluIj+GzprFQoJNSGfUq1NJiM6BlN0pzrQVEvsI/8f0tVAr/trAMdLZdPs
	 E7YIkg5Pc9Z2whD3HHF+fyX6yQ34XHY8DJAtjjf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10EA1F800C1;
	Fri, 21 May 2021 20:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD287F801DB; Fri, 21 May 2021 20:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7754AF800C1
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 20:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7754AF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DQa6aM0l"
Received: by mail-lf1-x133.google.com with SMTP id q3so948139lfu.2
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 11:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fuy4eXWPqUUba10mtYw0ydLr89ZV2AWylPLaoR+Jdl4=;
 b=DQa6aM0lePceIRpuhRStqIbL+0JixghBlOWL6jmxditypPGSFAVvbu27mIad8oVCF0
 jcEEToZJ1ntmf24pqZaqhwZQdb2qpi6Elm7gp9UBxDOM8MoYJJlXw+ANSRsD2jBKZhtx
 +2iNnQ1+JsxHImxts70WdWW5FAYQF3MK3/jR5wzN96uhnNQoe1ISZ0e3puYKlam2ps3V
 QmeUd0WcY/N8O1bWcoLnhzYNqPlNv4wUoHs406rh+b6ObEOONTwOcq1+b1sjCpoabXYr
 RemqN3HYXDkP+HM5UOzO0z4CqhWSTW7CKKVZYKmqxwHgg4U1nmg7hwQsggEGNN3WiiSJ
 e1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fuy4eXWPqUUba10mtYw0ydLr89ZV2AWylPLaoR+Jdl4=;
 b=tuFm7sOPfmKIV4QAb3iuu0V9WheDDrr5LcnK+QWYqqH+N7thwVEdSKsIUQYnTdja8H
 GcrX6+yoTLc1FLmN4L0JpX4k8oxQDrCRiipUQRruc+6qsvBkjeih5CY9erxMEkvSZCoB
 ykW1ggYYS96c1NkUizSLBMvn8IAnDV8hVNuc1lLiY+muHXmIjo8okWDaIdeIT7zS8DOS
 zC88rwicntYLw9G/OaqwTUg2AV6C1IJL0vU/YIrdpUX1yB9wHpOmIV39Rr+ZNhEfvR8N
 8VhZd6Fp/OHaX9HJEhWvC3uHFrZ/yS79loyFPRducx7KTMVuGeAmPQM0C+Lwfh79TYPp
 tNsQ==
X-Gm-Message-State: AOAM533A2V/OnTqPQKpCeZAYJhexZWiCbDSPtrqQF9Nv3wkt3MWTSmBe
 iPtP5NeswY+uzcxm5WQ1d/s=
X-Google-Smtp-Source: ABdhPJykY/D5oofYHxfJOnXrtAfrHO/SJq42rpPqSjtNPr7PXXaNRmaOHopXk0tiOH+2TZLNuWwWUw==
X-Received: by 2002:ac2:539b:: with SMTP id g27mr3123732lfh.534.1621622600111; 
 Fri, 21 May 2021 11:43:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-100.dynamic.spd-mgts.ru.
 [109.252.193.100])
 by smtp.googlemail.com with ESMTPSA id s17sm767044ljo.117.2021.05.21.11.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 11:43:19 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Jaroslav Kysela <perex@perex.cz>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1752b39e-d693-50c0-55c9-dab18a2fd499@gmail.com>
Date: Fri, 21 May 2021 21:43:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8e5d4442-00a4-460b-d37a-8962960dd7ff@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

20.05.2021 22:02, Jaroslav Kysela пишет:
> Dne 20. 05. 21 v 19:50 Dmitry Osipenko napsal(a):
>> Squash all machine drivers into a single-universal one. This reduces
>> code duplication, eases addition of a new drivers and upgrades older
>> code to a modern Linux kernel APIs.
>>
> 
> 
>> +static struct snd_soc_card snd_soc_tegra_wm9712 = {
>> +	.dai_link = &tegra_wm9712_dai,
>> +	.num_links = 1,
>> +	.fully_routed = true,
>> +};
> Please, could you also initialize snd_soc_card->components? It may be useful
> to pass the codec identification to the user space like:
> 
> .components = "codec:wm9712"
> 
> The passed information should be consistent. You may look into the Intel ASoC
> drivers for the examples (card->components initialization). There are also
> hints about the number of connected microphones ("cfg-mic:2" - configuration
> with 2 microphones) or the codec purpose ("hs:rt711" - headset codec is RT711)
> etc.

Alright, I see why you're wanting this. It may allow us to have more
generic UCMs and group them together.
