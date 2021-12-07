Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2446B9AC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 12:00:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115C223B1;
	Tue,  7 Dec 2021 11:59:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115C223B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638874804;
	bh=wgWOlYLwHyDE8K1AAQTCJ9OM2XHRiRkfg6/MbNrfVk8=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9MA3E39czPivkloQPM/QejHFTPfr+OxTvN+N6bhRnZQychifC8kC5dUdqlEavy1V
	 TALbZZ0DwIAp/kxhxwI8i7Yte2QeInXXQMwSaBxq8G3pFzJnkbvamMyKovalPxwkAx
	 GoXKTfuhYVs0enImMvsgn7BZgYGB9wS2AijDQdzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C89F8032B;
	Tue,  7 Dec 2021 11:58:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A884F8028D; Tue,  7 Dec 2021 11:58:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FE2F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 11:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FE2F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Haspf0TM"
Received: by mail-lj1-x233.google.com with SMTP id i63so26707465lji.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7f2BYRkHt8MhUv7MJ0rG/eBUmUyHFQ+AN78efL2lEY=;
 b=Haspf0TMEDKoSi9DP6mb2vaEnZJkJR/At3xVyAhX8B0HuOL/FWo84rk7rwFSFNMskW
 BtN6hFtQeVzFlD/f2jqPv5wokOBH9DeEpBUq+v3PBrAfeXGlKGGz/93N2vPdii6P77xo
 rTBAIynwW9ikYbaJ5/JotS9OEaf7miKt0LyzVRwSaFWpR71dB7HV5GjNI+xXnjPGpytr
 PeggeKbwO7rLnn7w6ydwJdqfFmtLj4zzp+8KFqhq9oTkiVlEuVImBoi6J/KhX+lG+cyT
 LHUxwTvFnVsJIsBs1ZouPzv89E5Z2DYg1o9u4GjJNumnSSYRlqkRMMyp8B+U8LzeowcV
 6yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7f2BYRkHt8MhUv7MJ0rG/eBUmUyHFQ+AN78efL2lEY=;
 b=DQzIi4wO7+s0an6z2y/WYBawskmraNHpYh1Xss50eAtrELmGiVhbKu3oVBiGkCS89F
 tc7PeH4w+26q5N84A8F8SippLYYYlcHPkqURj7VevlKFDJUH9NMRyuB9SXQFMhtFHxJd
 XigC5xC5+pF2uwMgh1oPldYl8n4ZYUbfWFGSe4/rCW4nRr6kb5reU6s9nW+aiqUeMQ1Y
 hYJYEQgdje7tVM8vioEoAKoenwa+fbPync8NnZcj86s7k6U5vPIy6nUWYaWdO8tX4mcS
 RiT0j3xrhpcThNoOz7MUn3h/zYPBJwvqtomGfkVwuCdxFwBdr072L7xTp9i/KaD+awtL
 Pq1Q==
X-Gm-Message-State: AOAM533gxn25Fr9wk05gJrmyCZYLvcrxJUyaMSO0SDiZOH2KsNQuUb72
 c2eG//n6n/aXRAlOnPTp5pI=
X-Google-Smtp-Source: ABdhPJxyHT3p1A/j7SwfN7khEiU4g35DC8t+JdXDzi7hqN4F4J16vGCeSKEiwTDcj+OP/UuISdkIWg==
X-Received: by 2002:a05:651c:1117:: with SMTP id
 d23mr39699896ljo.299.1638874722741; 
 Tue, 07 Dec 2021 02:58:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id q13sm1648336lfm.13.2021.12.07.02.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:58:42 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
From: Dmitry Osipenko <digetx@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
 <2f29f787-7c77-a56e-3b90-0fc452fd1c88@gmail.com>
Message-ID: <9c21aa0d-b7e6-17b8-cd1a-f12a2b2a1a57@gmail.com>
Date: Tue, 7 Dec 2021 13:58:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2f29f787-7c77-a56e-3b90-0fc452fd1c88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
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

07.12.2021 13:44, Dmitry Osipenko пишет:
> 07.12.2021 13:22, Dmitry Osipenko пишет:
>> 07.12.2021 09:32, Sameer Pujar пишет:
>>> HDA regression is recently reported on Tegra194 based platforms.
>>> This happens because "hda2codec_2x" reset does not really exist
>>> in Tegra194 and it causes probe failure. All the HDA based audio
>>> tests fail at the moment. This underlying issue is exposed by
>>> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
>>> response") which now checks return code of BPMP command response.

I see that this BPMP commit already has been reverted. There is no
problem in this hda_tegra driver at all.

>>> The failure can be fixed by avoiding above reset in the driver,
>>> but the explicit reset is not necessary for Tegra devices which
>>> depend on BPMP. On such devices, BPMP ensures reset application
>>> during unpowergate calls. Hence skip reset on these devices
>>> which is applicable for Tegra186 and later.
>>
>> The power domain is shared with the display, AFAICS. The point of reset
>> is to bring h/w into predictable state. It doesn't make sense to me to
>> skip the reset.
>>
>> If T194+ doesn't have hda2codec_2x reset, then don't request that reset
>> for T194+.
>>
> 
> I don't see the problem in the driver. It's only the device-tree that is
> wrong. This hda_tegra.c patch should be unneeded, please fix only the
> device-tree.
> 

