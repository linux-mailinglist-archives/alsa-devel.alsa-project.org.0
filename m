Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E47D959E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 12:52:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B883A4B;
	Fri, 27 Oct 2023 12:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B883A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698403948;
	bh=0AZQZgMYvsSV2ehPvsa3l/tYw1k//VhkOXCTnY7xQ3s=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GbLp1yc13PzU5wlgGX3vCQ8sL66THzgDseo7BVUm8UElryKPcxM6anAxEqjPzvOpN
	 9h4fecgWz9LCZ7mS5p2x5ILJeeLTWfgeV+tKnqiXC8cqLpQGpfta3iyl4mQe7I9tOv
	 z5YfRE1PhXSrwI9MlJIkY+MvXrgSB0QofamIpjnE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC5CF8012B; Fri, 27 Oct 2023 12:51:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73A79F80165;
	Fri, 27 Oct 2023 12:51:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C2ADF8019B; Fri, 27 Oct 2023 12:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39137F8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 12:51:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39137F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=z2pkwJeH
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40859c464daso15464615e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698403867; x=1699008667;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5GMaDMg99nAklQh1qDlCO1TyWf93Sxk8f/KTLZFXGDM=;
        b=z2pkwJeH8p7WN6MiKKZqdTJvGEIfnzWztA5v9djD3/wxOKqXP7Z6mAucmxxN3UAoti
         lDrnoIF5w1apnjRcqM0WSFkXQs/eUsT43zSydnVQIaL/6bIXnihtcIJn5SDFYPOyGX3R
         /HgvEQyASgtBZzJW1ScGxXm+DDttOa99UgGsmylVce17eQSfsuTVkNKR+LeftBZXsoHh
         IJOgMv6m95cypS9sQhhu3RJW1aMc6VrjMLWP6Z6DQZK170kUPlPyhUQT01YRgsyfiujq
         Lqb8X0jl3rIoBHeFa74Uk891pQ7tsztEym2HfAdRTcJyJEeVZgRie01kWuBHRFQgMw/0
         BKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698403867; x=1699008667;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GMaDMg99nAklQh1qDlCO1TyWf93Sxk8f/KTLZFXGDM=;
        b=guY/aSqbvBJz3Az/CO45BGL+Vp74x0F7u+YyzbKmvI3SyVO1OPPjLaastyD1t00IXA
         TjVon/p2L+vFWKs735JYpXPdLSuLaukMpOAdMx0so3bN7/QiuQBYhoup76eFJnQf+wK9
         bjBydHW8XozrxFxnEYpwBKHVLu9HDjLhr4TDriK1n3syQF2DcW1B1bRTzMlSoYqsx9en
         ARG+Ua9NhZtKTCfGbqfwsZWrJKc88UHRGOCQaQnILO2MfTo9KUr6E0YQ4pCI+bfXHgu1
         32Ok9/OBwjnWWFaWH5Ltk8aqsU/AAk+/1Pi0ItqLVLhEzi9zNbYv4svH1UoHqfC/eiiF
         8Gpg==
X-Gm-Message-State: AOJu0Yy1ccXreXPx853d7jgL7CZTRaxNKFxJh1NVoMls95S3CoMNTKhH
	IK3XwLpsyo5it/0XDNZa4OaMMg==
X-Google-Smtp-Source: 
 AGHT+IHdmua5zVi+ZxIFHrXsTwBL0mnHN3EnRlt4+jCLxKzUHqOycqakChHQbS4LdHAroIwqyan+aw==
X-Received: by 2002:a05:600c:4fcb:b0:401:b204:3b97 with SMTP id
 o11-20020a05600c4fcb00b00401b2043b97mr2127444wmq.4.1698403866687;
        Fri, 27 Oct 2023 03:51:06 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 m28-20020a05600c3b1c00b003feae747ff2sm4881007wms.35.2023.10.27.03.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 03:51:06 -0700 (PDT)
Message-ID: <4da5dbea-fc3c-4b72-90b6-246f8e6fe9e7@linaro.org>
Date: Fri, 27 Oct 2023 11:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: mute/unmute PA in correct
 sequence
To: Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 johan+linaro@kernel.org, steev@kali.org, dmitry.baryshkov@linaro.org
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
 <20230323164403.6654-4-srinivas.kandagatla@linaro.org>
 <ff3eb88a-6941-4303-a4ba-17cad3842b88@sirena.org.uk>
 <2a0aabf5-41a3-cc07-3203-9b0bca6b71aa@linaro.org>
 <ZTjKWHAAfSYfc5px@hovoldconsulting.com>
 <6df45f92-5fe6-4b44-af04-c528d540ac06@sirena.org.uk>
 <ZTkNcHAzgnL5xpAO@hovoldconsulting.com>
 <9c622323-6b94-4622-840f-5f126942ae96@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <9c622323-6b94-4622-840f-5f126942ae96@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B6XDPCG7EG22R55M36KEQRZTXCBIG377
X-Message-ID-Hash: B6XDPCG7EG22R55M36KEQRZTXCBIG377
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6XDPCG7EG22R55M36KEQRZTXCBIG377/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 26/10/2023 14:05, Mark Brown wrote:
> On Wed, Oct 25, 2023 at 02:43:28PM +0200, Johan Hovold wrote:
>> On Wed, Oct 25, 2023 at 01:36:14PM +0100, Mark Brown wrote:
>>> On Wed, Oct 25, 2023 at 09:57:12AM +0200, Johan Hovold wrote:
> 
>>>> I understand Srini has looked at this but has not yet been able to come
>>>> up with a generic implementation. Would it be possible to merge the two
>>>> codec fixes as an interim workaround for 6.7?
> 
>>> You're talking about two fixes here but this is a 4 patch series...
> 
>> Yes, sorry, I should have been more clear. I was talking about the codec
>> fixes so that's patch 3 and 4.
> 
>> I believe the first two have already been applied.
> 
> So, having gone and fished the series out of lore to look at what the
> patches are I'm pretty surprised here, it's been about six months since
> the original discussion and I'd not have expected this to be such a
> difficult thing to do, or at least that any issues would have been
> flagged up by now.  What are the issues that have been encountered here?

The approach I tried was to reuse the existing 
snd_soc_dai_digital_mute() from generic snd_soc_pcm_dai_trigger()

The issue is that prepare also unmutes the stream which is why moving 
this to generic code is not helping in this setup.

To overcome this I have added a flag in snd_soc_dai_ops which seems to 
have helped

Let me send that patch as RFC for more discussion.

thanks,
Srini


