Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0E5473D15
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 07:17:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BDA1EEB;
	Tue, 14 Dec 2021 07:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BDA1EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639462622;
	bh=nIEH4NIhCn/YGJrr+I0jUdwJcoyZnYHYq+PyISnf7OQ=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IhV7qPGTSRJMIHmlm3xZkVjhni0mtIkoT2tY/glvACPDYp556IfQZ+QhouqoG8kvy
	 6ilehDIQe7QwzpfVJVrLsAF/7dxllASxA2qqOkN7PfK5Shx01AoqxmhPxT07TnYQ13
	 XX6qeohJXSsVruS7/SBEUe/eYxuR7lzbMeFJHjXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8C2F8013C;
	Tue, 14 Dec 2021 07:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6026BF80246; Tue, 14 Dec 2021 07:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBFF5F8016A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 07:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBFF5F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GmfHh5wt"
Received: by mail-lj1-x230.google.com with SMTP id u22so26806851lju.7
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 22:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=725ChSobD1VD4Ep/VU60OT9W4QyTtvRCLihRfx/XJFI=;
 b=GmfHh5wtbAkMz0d5F80QG380DoERfkquzkQHI58BfCR6UCF/ppBX0QcILykcLGLCLR
 bLSyfzKtL6fIji52++qq+XvXsRJErPWGut7/jVxOntewKVynrWajhoLJNr8KkIKNx/n9
 UF5Pcg0fpFjUc0XUHuD3val8uMBCIl/jMoXVWkoYqZygHcN6wdc9WhgApBRH4Mn78tdP
 v3jmzinXx8xdnr/9pHN4yFWYprcewMc4IefBDH5EmKOMRoZ3d2RnAAaPb9234eEeddkG
 hs5lDo1Yl8e5E/2BD34LHsjsN/Bf0YOSqPWUHr3bFABdKJvvh6IOw5IZ4vpDCOAGa0RL
 qZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=725ChSobD1VD4Ep/VU60OT9W4QyTtvRCLihRfx/XJFI=;
 b=1u/IeNgLX3QFRzdI5ZriT9ZuE1Tv2Bea3ciU+98p+HIlEUhx/AmvI4CzLNKFZUYQQR
 l48QmmJSM/auNnU8Sipus4D/bSzooKr4eLT+UQSbXvQIqKBx/950wXp72pX15+PhCHUS
 a1kWi01f3rNJlcfuWyDGRcFU7gdN3FusblQwaMrkNoawhoZs8SRwzduaVHrxk/wOcscU
 j/+9gXRobeOHtF9apadUZcUOiJ6r4dNdTHGK7x/uxj8Sr7c85HX78lQzARfO/kcVshix
 yz4R5/Jnf6/qPfdIj98jZZW0LYvTqBg4g1I+CsvDz1/pcm9LwyVduUah7ebd4jAfWq0t
 1ReQ==
X-Gm-Message-State: AOAM532bKXbGo9nWQq7gaTbfLYjtWWmqIQe8F57H1ki8lLk33KlWsTSc
 HnfbK9rPUIkp89aDhKHxbsU=
X-Google-Smtp-Source: ABdhPJyRbqZooRhCMtT9QRyO1YM7LLBWlPUm2wZXVvfxkW5q+x6LMK0P9+LRK86sL3exSHwBjzHi4w==
X-Received: by 2002:a05:651c:1791:: with SMTP id
 bn17mr3075419ljb.525.1639462546955; 
 Mon, 13 Dec 2021 22:15:46 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id v2sm1723169ljv.6.2021.12.13.22.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 22:15:46 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
From: Dmitry Osipenko <digetx@gmail.com>
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
 <95cc7efa-251c-690b-9afa-53ee9e052c34@gmail.com>
 <148fba18-5d14-d342-0eb9-4ff224cc58ad@nvidia.com>
 <3b0de739-7866-3886-be9c-a853c746f8b7@gmail.com>
 <73d04377-9898-930b-09db-bb6c4b3eb90a@nvidia.com>
 <ad388f5e-6f60-cf78-8510-87aec8524e33@gmail.com>
 <50bf5a83-051e-8c12-6502-aabd8edd0a72@nvidia.com>
 <7230ad0b-2b04-4f1b-b616-b7d98789ded0@gmail.com>
Message-ID: <93276b40-9ff8-f401-2624-04c0ff02c755@gmail.com>
Date: Tue, 14 Dec 2021 09:15:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7230ad0b-2b04-4f1b-b616-b7d98789ded0@gmail.com>
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

14.12.2021 09:09, Dmitry Osipenko пишет:
> 14.12.2021 09:02, Sameer Pujar пишет:
>>
>>
>> On 12/8/2021 5:35 PM, Dmitry Osipenko wrote:
>>> 08.12.2021 08:22, Sameer Pujar пишет:
>>>>
>>>> On 12/7/2021 11:32 PM, Dmitry Osipenko wrote
>>>>> If display is already active, then shared power domain is already
>>>>> ungated.
>>>> If display is already active, then shared power domain is already
>>>> ungated. HDA reset is already applied during this ungate. In other
>>>> words, HDA would be reset as well when display ungates power-domain.
>>> Now, if you'll reload the HDA driver module while display is active,
>>> you'll get a different reset behaviour. HDA hardware will be reset on
>>> pre-T186, on T186+ it won't be reset.
>>
>> How the reset behavior is different? At this point when HDA driver is
>> loaded the HW is already reset during display ungate. What matters,
>> during HDA driver load, is whether the HW is in predictable state or not
>> and the answer is yes. So I am not sure what problem you are referring
>> to. Question is, if BPMP already ensures this, then why driver needs to
>> take care of it.
> 
> 1. Enable display
> 2. Play audio over HDMI
> 3. HDA hardware now is in dirty state
> 4. Reload HDA driver
> 5. In your case HDA is kept in dirty state, in my no
> 

The power domain is shared by display and HDA, is this correct?

If yes, then the shared power domain will be turned off only when all
its clients are turned off, i.e. both display and HDA simultaneously.
