Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136546BA8A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 12:59:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9017E2365;
	Tue,  7 Dec 2021 12:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9017E2365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638878356;
	bh=wB1oSoz8ExpkKfBrqFp7RNMtunZjMRyg0wb4afKfCN0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qLWZ5wx6YlwmbOYJbavFQFEP4Z+VKdb/prLG+tp7pmlMianu+wQknHqalSK3IFHv/
	 /2Ghfn0wJ8r5K2W7AlJtpkdWCIIgLRaJcs6awmLKExMfV9rktXvATvAZqeaCs7Uc0K
	 W33rjK+StCHA9rbKpY5eVxRyuwTmFTdMfZe9rQrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA52F80217;
	Tue,  7 Dec 2021 12:58:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48548F8028D; Tue,  7 Dec 2021 12:58:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E81F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 12:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E81F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iyKr1Mur"
Received: by mail-lf1-x132.google.com with SMTP id c32so33008495lfv.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 03:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=plzsSmhgPNtDpsGtXQUnfrI8h3dSda395HMl2iG3SuA=;
 b=iyKr1MurwxWda44ZyfWPKvOS6nj+VfYfQM7RTH/Zj8L2tak3VVkwf31PqGTmpegadq
 91pckZUPU4PBqqF46pKghNJthHC1dfCyYJ7eXMYGef5EE/ESHzkmtbEjoCxTk528U93r
 +iHjw/Q+Udg0g6DBqv61JQlmPRpn0B46PZLtFhKCCN3gM9Ut6YZFyr94byMoPAptgwAO
 z4XxoAqoMvqMrGUbMqN82SDyMUVs2jKSDWsIe1P76AA/R3ZiFbJyO1ntHevL3wQ8xR72
 51dWYvPlPZIqjSO2TgMRp9EKuVcIbS4oUogkQvviaj53x9G5vEMQfkMAD6Sivsq1PMRs
 8e5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=plzsSmhgPNtDpsGtXQUnfrI8h3dSda395HMl2iG3SuA=;
 b=U4u6VZJoZ1JR69rp7QunfqvYRuSpm6iMNDZiPY6koE1xT8hVhzuThInstf132J2iSl
 WM0HXWC43yr8Y22Xyk+1fG3aVlCcXLYx+E5uj7+lwU1RQBSBgWW7VpphxWxek6tMA7mE
 MfLspZj8Z4AiUCSRf5c+5MXvQyFYVC+56jMxpG8+GelSpZEBq2N406w7HxJCeZK/qKmZ
 /V9U8FeMr92Fy6kPHu19hJ1w6juSHg0osv2nBkAwWdDMoin0T9ZirJ7qpJfkzr2uk4Jc
 CAE1eHZZCx0OXqYgHvALcEBvaGHfYAkwBo8utPr4m+r0JE1/q1J18RUm/8O7OEjQgrZj
 bWPA==
X-Gm-Message-State: AOAM533CPBbfgDB+/PMgoNoEdHrTxJZck9j1xngjhi7WTy8Qtpq581sl
 c6jWvwZjBf/fUDQJBm/cmkk=
X-Google-Smtp-Source: ABdhPJwQBiN5fOAvH4OFJ+BjV2Fim81s1zJF7Nig/omJZCfIEi0M8gTsvczRHxlKF6f/1tC4FcVyJg==
X-Received: by 2002:a05:6512:33cd:: with SMTP id
 d13mr11400239lfg.360.1638878275882; 
 Tue, 07 Dec 2021 03:57:55 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id b14sm1666824lfs.174.2021.12.07.03.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:57:55 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
To: Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 tiwai@suse.com, broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
 <2f29f787-7c77-a56e-3b90-0fc452fd1c88@gmail.com>
 <9c21aa0d-b7e6-17b8-cd1a-f12a2b2a1a57@gmail.com>
 <5e50e8a1-5436-b543-f15d-50c5089304e3@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9da3de11-b6c5-b2ac-f4cf-e14c73ec134a@gmail.com>
Date: Tue, 7 Dec 2021 14:57:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5e50e8a1-5436-b543-f15d-50c5089304e3@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

07.12.2021 14:02, Jon Hunter пишет:
> 
> On 07/12/2021 10:58, Dmitry Osipenko wrote:
>> 07.12.2021 13:44, Dmitry Osipenko пишет:
>>> 07.12.2021 13:22, Dmitry Osipenko пишет:
>>>> 07.12.2021 09:32, Sameer Pujar пишет:
>>>>> HDA regression is recently reported on Tegra194 based platforms.
>>>>> This happens because "hda2codec_2x" reset does not really exist
>>>>> in Tegra194 and it causes probe failure. All the HDA based audio
>>>>> tests fail at the moment. This underlying issue is exposed by
>>>>> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
>>>>> response") which now checks return code of BPMP command response.
>>
>> I see that this BPMP commit already has been reverted. There is no
>> problem in this hda_tegra driver at all.
> 
> That is temporary until this fix is merged and then we will revert the
> revert.

It's the device-tree that is broken, not the driver. If you don't care
about broken HDMI audio using outdated dtb, then there is nothing to fix
in the code.

Otherwise, the fix is to skip the non-existent reset.

You could add workaround to the BPMP reset driver by making it always
return success for TEGRA194_RESET_HDA2CODEC_2X invocation instead of
making the FW call for that reset.
