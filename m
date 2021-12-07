Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3123A46B962
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 11:45:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6A3623EF;
	Tue,  7 Dec 2021 11:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6A3623EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638873931;
	bh=QPJ1QYGCah8qoR7vWVb1Jky1w3lQ5eE+IrZ6rEiCyfI=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aV9QaXHC1RDs2UNN/4uGaagpUmuQlKViKqya88tlxP8bgnlUkPUqlIPMZ2C5GFnkS
	 OJ5C4t8LlajBRLb6v1OgIHxYaWgM1RaZ2GEqGM76keZcGPBqBkDmYSkxGp9SYNl44n
	 nxjqzdi0adaBOdUK7orGgRPhP2S2ZrmQfL+kqpAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E1F0F8032B;
	Tue,  7 Dec 2021 11:44:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5FFF8028D; Tue,  7 Dec 2021 11:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF9EF80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 11:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF9EF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xrw5tNA8"
Received: by mail-lf1-x12f.google.com with SMTP id bi37so32601105lfb.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 02:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GTY458qscFL4zCNgrOoq7nfsYMMYLdnO5OGlspbKm8A=;
 b=Xrw5tNA8ddJCZZfFtYx8nYKhUZdl8cE7vpx/c8cejLLBcxZjhCaZx2H2+uL811Ny4a
 RhOTbB/44rnqNKuCMDkN3TrfeDu+G2W/BTNgINQwbZdQhysH5rYaxHO4axvnH4DPv62Y
 OMLTX4SILniGXCNEp3mHQ8tcLx6p6CL0vuh9Kps3Tm0JETB5dWB/AiDoNXh7qSOg4HNc
 aZHDjHUwE+0FgATmvbZ+y8GylUXFYENI8fmZK4vv1xwGWBbkHGhIShE3495e5ztH9VwR
 aF7MWA+ZufeykzuwawilpRuQylJIMTIGxgzeKiOa4dgHuxGy9rF8gtwekwKLA956CF8d
 l32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GTY458qscFL4zCNgrOoq7nfsYMMYLdnO5OGlspbKm8A=;
 b=Xe0dy8MslqHZ4YFwnmazc/UtZyDQQM+nHfCxkAg+gs5BEXbKYgiQ9lX9+TNyQS3GyI
 2G8RZZKg+RisTsDd5/2ap3doPuaCST0zEkNMvG4p6r1LW0ww+WIwRuEEMBq4DNgJpUdT
 gsm8tAw3Rk2MFr5IX2fFnG/ALfkb3LtXd2hs5qQWJs/GMUUywj613Rswj6Xw4085J89f
 7tYOiCEdz9IjfcF0NF52ao3rLwX9TkEu1kLYbLXn078xr0CMu23B7JKUhyhvIZVwzv3o
 fr00dmc8H/kGQfM7TC8cZLsYgT374W0NwqKCu5FVkiEIwzClIlNKVik/Y4+vokw+EyJu
 Io1w==
X-Gm-Message-State: AOAM532RakB0ZUtDGx6SN1dWAUTW10Tkt0G/EuH7VKedABrU/RA8jtxJ
 t4nrDvOi3gADVMKcXn2qAv+OvAShD1U=
X-Google-Smtp-Source: ABdhPJyFB+FQBCdM0pWLTlNf+RWgmGRbBRwJt6T/X+LP5gnOtiLiGCxzX5gtJFxiTKiG61zidFm5UQ==
X-Received: by 2002:ac2:5388:: with SMTP id g8mr41211335lfh.382.1638873846629; 
 Tue, 07 Dec 2021 02:44:06 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id w6sm1649527lfr.11.2021.12.07.02.44.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:44:06 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
From: Dmitry Osipenko <digetx@gmail.com>
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
Message-ID: <2f29f787-7c77-a56e-3b90-0fc452fd1c88@gmail.com>
Date: Tue, 7 Dec 2021 13:44:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
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

07.12.2021 13:22, Dmitry Osipenko пишет:
> 07.12.2021 09:32, Sameer Pujar пишет:
>> HDA regression is recently reported on Tegra194 based platforms.
>> This happens because "hda2codec_2x" reset does not really exist
>> in Tegra194 and it causes probe failure. All the HDA based audio
>> tests fail at the moment. This underlying issue is exposed by
>> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
>> response") which now checks return code of BPMP command response.
>>
>> The failure can be fixed by avoiding above reset in the driver,
>> but the explicit reset is not necessary for Tegra devices which
>> depend on BPMP. On such devices, BPMP ensures reset application
>> during unpowergate calls. Hence skip reset on these devices
>> which is applicable for Tegra186 and later.
> 
> The power domain is shared with the display, AFAICS. The point of reset
> is to bring h/w into predictable state. It doesn't make sense to me to
> skip the reset.
> 
> If T194+ doesn't have hda2codec_2x reset, then don't request that reset
> for T194+.
> 

I don't see the problem in the driver. It's only the device-tree that is
wrong. This hda_tegra.c patch should be unneeded, please fix only the
device-tree.
