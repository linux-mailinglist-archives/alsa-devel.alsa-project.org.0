Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B6846C24E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 19:03:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBAC923A9;
	Tue,  7 Dec 2021 19:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBAC923A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638900222;
	bh=qQwzi5Z/Ei+zT/rivJx2fVOJ13H3RDHIhPNgsuWEGAc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xf54+vFJZcMD5/G25hjXwhMXnEjQDg1uV1bn+tNuD5YcSSw/ftQCgIULbEE24vdCZ
	 +l2xYap+io4olppLONkIDiY9OFcoiAcHNWuCHwVn6IDy/JGvTl8z3fDmmQ4ijgfbiM
	 hjJCKqJgw/QhvGLcADlu4hWhZITOcABuT1g0hKvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CFF7F80253;
	Tue,  7 Dec 2021 19:02:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 933B2F8028D; Tue,  7 Dec 2021 19:02:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E084F80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 19:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E084F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bJFHJd4u"
Received: by mail-lj1-x236.google.com with SMTP id e11so28813749ljo.13
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 10:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sqoUoMtUBmHodK2PJJEDxB6ED3784jkw/8tgiFLOL6Q=;
 b=bJFHJd4uXpwYV7ifbUZrGZDtcpLtYf10riM503HihUISrQRgoFT3Q9hZ8ef4bsmQNB
 JG6n7TshIzNt7J2EffIDjCz7U8FaB4o9C2CYEUwj8QIA3354fg6W4CuYn+S1Uj3VtCCr
 5+Rkz/oQGUyLYOxDStDiJHfnfR3zu5qp+x5QP30V9M9T3ZfUyJj9X1Fd0YzssvBI6jvl
 2clFJhgknW4Uhm6nkL9YJMWXt5ReOdPfJo36ECq7dfIF3EWCLt9cmGmLwB2P0i228HGn
 8Uy/0jbUJwj74alicGPV+cSZuof3GjVsF7CKAihZLYAAl7ms/zAs2Ba8kfpQ13ojJjPA
 /1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sqoUoMtUBmHodK2PJJEDxB6ED3784jkw/8tgiFLOL6Q=;
 b=ieehF5D6a7gQYGMXoZMQu0PbOWkjgOfHtU9u+U6PIgpK+EmUZIcdUyY/vhgaXY0j5g
 haz0j8Vr/LxBWgly4oHv7IWug3nUnVRbler/m7D9D2BZmS1cfZ6/r2jxurSeqL7/yIP/
 QX9jUZ/dLwail/VIfHJwxnlKdK2nRvQl9sa2Q7ql672RscBhoDBBMPKrJWR6mJL4HKe5
 IkT+Fm167Bj4wSMQnsMzTPjp1OlrrHgfuLN4bQrra1q/xXvj2IJeHweHprOrf2f5Ja06
 izdeeGtzog24maeCTcXZ8PCPHDE7G82GU4QEh+lb4EcJI4uSbNeJOQUoYjJ97jRdNUjA
 MU+w==
X-Gm-Message-State: AOAM530MLUrWOMxjElNq7BgXYH1uphwKhMTyaLbSdY/nXC0lic++rBQc
 a3GPbS4umaSfoFfBmNMUKNDddoRgmGM=
X-Google-Smtp-Source: ABdhPJwCj8oArFSu/8QVwop2LAW+6QUY+qwLMixQnx5V8GYd+tftm6uJDuFh4bo53x4nRWt0VVtYBA==
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr44082043ljp.353.1638900137688; 
 Tue, 07 Dec 2021 10:02:17 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id n6sm29541lfh.28.2021.12.07.10.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 10:02:16 -0800 (PST)
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
 <95cc7efa-251c-690b-9afa-53ee9e052c34@gmail.com>
 <148fba18-5d14-d342-0eb9-4ff224cc58ad@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3b0de739-7866-3886-be9c-a853c746f8b7@gmail.com>
Date: Tue, 7 Dec 2021 21:02:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <148fba18-5d14-d342-0eb9-4ff224cc58ad@nvidia.com>
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

07.12.2021 20:37, Sameer Pujar пишет:
..
>> HDA won't be reset while display is active on T186+.
> 
> No. HDA reset is applied whenever power-domain is ungated. It can happen
> when either HDA or display device becomes active.

I said "display is active", where do you see "becomes active"?

> So I don't think that
> it is inconsistent.

If display is already active, then shared power domain is already
ungated. It won't be ungated second time in a row, HDA won't get the reset.
