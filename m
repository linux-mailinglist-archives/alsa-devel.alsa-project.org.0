Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED04446BF8D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 16:36:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9756624C8;
	Tue,  7 Dec 2021 16:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9756624C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638891404;
	bh=9tIAWEbejgbi4g4ZGOXPQB6OLU3q2y6qHbN58tCPbl0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8zTORIRO05mJ43jOBpQGNDDpXbNsjF/3x6J2lsxDJf0ehMH+WxcqsLoxd1rvX+CJ
	 HupVdECqNzOapFwZP6V7VNmBkTcdj/hNGVttwItx/Q4YJDOgYh7xe+gl2YCBQSDR+a
	 XzSddY+owx7EhYCy2f8zxkNbIscAFoa7vT78IFBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13082F8032B;
	Tue,  7 Dec 2021 16:35:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA81F8028D; Tue,  7 Dec 2021 16:35:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA28F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 16:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA28F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gjMvzabe"
Received: by mail-lj1-x235.google.com with SMTP id k2so28161802lji.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6QJHwvAIj7j6f9tXcv3t1jDYcyJk0MG+odriPhUknmc=;
 b=gjMvzabeYrtiD2l4Ppofk0NmbF2NeHkBy3RKVQY6q5lwJxyQj6t6Hb/1Lqt667WBl7
 nBEHCeGtXXXoqIcawTvzlZrmK34PF4DDZ6durwpMs9n8YJQmsBhzLkP2kx+OKYGvJIhi
 n/c5L3ynfKirxqvexlPKBa9ie4H59UI60l9TswOhBzcFPVysh54UKdf2n01/UZmD75Nx
 2sPDu8zABxfYiKrueVw8j6NQVVkhPqvCZ6RZZ3C7BJ7QvJe3TG2D3Z98KF4c/6lRuuxx
 SOOgHpATXEFThcn433wYrvqvWjItjYepmDIrGN0l+K2T0yh1Fx139BK3veAjkcuQcFlk
 zjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QJHwvAIj7j6f9tXcv3t1jDYcyJk0MG+odriPhUknmc=;
 b=wcDqMFJaMWr07XOYUqSsLV1AnE8PJoh0Xi0lPu/ZN+IUoYPnmxLlgzPzbD441YKc+Z
 wKgt7nDmDfKN8BYLM9Axd9A9Vhux4nAn0I0ys5PydxWBRKCyV6Ci2qh6Ymm6UcEuqNRU
 vpqTajoa6Nhd1zHY9rU1Brj5f7lNhaI5xe8n7OTpfrAWIODg0C0e0bsjSxmep1kTwMPZ
 bGzPmnUfUvdhLBM37T7KbKQjNh0CWmk3eBfJEUkN/dOALIi3Mf8/PABTwqc5n+CF3m6I
 XeGSN4DwFtsscDleF5MLqw1Kc+SbuC1V1b6PAqRz7ynignKm9IERn10NvV4yf2wqzhT0
 2MRg==
X-Gm-Message-State: AOAM530sZPT5S7ykl8AlWYsyqBZYGMfz7Sd193sUyyh8GK4g6uMpxSWm
 yMRfKGQ9ZpqeCIaQEptEfOCGObZ5QSQ=
X-Google-Smtp-Source: ABdhPJxHGZ+65r90qy522XHUaM4sCGrdC5fWeHGrHG5KsxuLtJvqNuqbIoCPKboT5L1H87xO47QUSw==
X-Received: by 2002:a2e:9702:: with SMTP id r2mr43684071lji.482.1638891323459; 
 Tue, 07 Dec 2021 07:35:23 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id n15sm454740lfu.228.2021.12.07.07.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 07:35:22 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, thierry.reding@gmail.com, perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
 <8fd704d9-43ce-e34a-a3c0-b48381ef0cd8@nvidia.com>
 <56bb43b6-8d72-b1de-4402-a2cb31707bd9@gmail.com>
 <4855e9c4-e4c2-528b-c9ad-2be7209dc62a@nvidia.com>
 <5d441571-c1c2-5433-729f-86d6396c2853@gmail.com>
 <f32cde65-63dc-67f8-ded8-b58ea5e89f4e@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <95cc7efa-251c-690b-9afa-53ee9e052c34@gmail.com>
Date: Tue, 7 Dec 2021 18:35:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f32cde65-63dc-67f8-ded8-b58ea5e89f4e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 robh+dt@kernel.org, linux-tegra@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>
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

07.12.2021 17:49, Sameer Pujar пишет:
...
>>> How the reload case would be different? Can you please specify more
>>> details if you are referring to a particular scenario?
>> You have a shared power domain. Since power domain can be turned off
>> only when nobody keeps domain turned on, you now making reset of HDA
>> controller dependent on the state of display driver.
> 
> I don't think that the state of display driver would affect. The HDA
> driver itself can issue unpowergate calls which in turn ensures h/w
> reset. If display driver is already runtime active, HDA driver runtime
> resume after this would be still fine since h/w reset is already applied
> during display runtime resume. Note that both HDA and display resets are
> connected to this power-domain and BPMP applies these resets during
> unpowergate.

HDA won't be reset while display is active on T186+.
HDA will be reset while is display is inactive on T186+.
HDA will be reset regardless of display state on pre-T186.

This is a pure inconsistency of the reset behaviour. Please don't do it.
