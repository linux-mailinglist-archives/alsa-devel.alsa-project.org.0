Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13CE46D2EF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 13:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F58526E4;
	Wed,  8 Dec 2021 13:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F58526E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638965240;
	bh=749YHfutBh5xMX9WKwl8p+uu+3gB2zttQ9ZhIupVe0o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0i/9lwAT/Iw99fENo8a1ie/pTTzmNfbrZ6/CAdkyBLZAABE5AR+f2BH8JJxfaYI8
	 WO7WDMeLGxlZmFQVSVDvVAgQb48nHjcpBNAls5q1GckdKntsTpLEt8mL3tO+LSyiJ6
	 zQoziq51vEtDgpg2+TCBqGLWGi0BmdVxOeU+i9Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F7EF804F1;
	Wed,  8 Dec 2021 13:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBF6CF804ED; Wed,  8 Dec 2021 13:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0311F804CC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0311F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hC7KXTCq"
Received: by mail-lf1-x12e.google.com with SMTP id bu18so5324185lfb.0
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 04:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WBqTn91DshTm+EF7h4CWYhAUdvliMN1/YG7EIZemZ/A=;
 b=hC7KXTCq18inK8j/wksZ8jk/R0Jn1EVYKEjxi8PhAlPDhDWvamWsADzhKyxUK24M7r
 64AnzN9j+c3KdoF24P/p0+2fNjgiEtiL2j7l2Yhkpkkj5S8vO0Pq5g5HrHrFT9JngQ5O
 W6TMzBmSxZAfBjetJMD+jcape9iTT1TRtdfPzSWY6Gz3GTG2w173DwOGi3Srg1/ZoFGg
 jCBfyxbpbDapehEblZJN+AhuYjdDmxRvH82LV5pr/CoVX2leC03F2Hmqpimt3ZZTT7Eh
 g2w2P+OvDKPxFHjEmb2B3NYdedix4iF3t2OSi5buom7RX1Fk14htuGrAKbALtzc4klOO
 jEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WBqTn91DshTm+EF7h4CWYhAUdvliMN1/YG7EIZemZ/A=;
 b=IPMMpWTFw2X7q2nySFYtx2p6voW8YGOp5nwormsO40mCFYABbq+7Jvk+kGmm6IXPnC
 yBdw6nV0gG929+szVzF0KZzyZFE4hdwWlQvzvqv10kFY0DWFwJp9swd1RDWZYAz5eyRo
 FN5XST+f6XhYrR+IBkmbFsZnv6bWxhP2ay4VTMtihjiTvoszE/T3rekPVIU4Jeq0PaFD
 DNLDjbujrALUnbD6hsQidzIl4T3Dcve8qiGzI/ya6vi4Hh/kbFWaKm1V9iL0fj8Kkvm6
 YRt+evytZg7cwUezIc+0q8owmP14et8tFzfWwwhA8igL37r7ZQJ1QK9bNknD0vo/qZgH
 H19Q==
X-Gm-Message-State: AOAM532ElYj67MDMEnZdhqFZnhU4GNq8QX4C2rLo2PsykPmcCieMGahy
 PKwu4NhWT/S2eahBYL9irV3fESYx2Mk=
X-Google-Smtp-Source: ABdhPJwRAoidBQuHR+uavIg6rJVFE4uuyU2sNZRE3wZOa/3r0nA9fKFSbBYkuJLzyDryl1L7J2lJwA==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr37516701lfr.639.1638965155879; 
 Wed, 08 Dec 2021 04:05:55 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id j20sm269214lfh.190.2021.12.08.04.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 04:05:55 -0800 (PST)
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
 <3b0de739-7866-3886-be9c-a853c746f8b7@gmail.com>
 <73d04377-9898-930b-09db-bb6c4b3eb90a@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ad388f5e-6f60-cf78-8510-87aec8524e33@gmail.com>
Date: Wed, 8 Dec 2021 15:05:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <73d04377-9898-930b-09db-bb6c4b3eb90a@nvidia.com>
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

08.12.2021 08:22, Sameer Pujar пишет:
> 
> 
> On 12/7/2021 11:32 PM, Dmitry Osipenko wrote
>> If display is already active, then shared power domain is already
>> ungated.
> 
> If display is already active, then shared power domain is already
> ungated. HDA reset is already applied during this ungate. In other
> words, HDA would be reset as well when display ungates power-domain.

Now, if you'll reload the HDA driver module while display is active,
you'll get a different reset behaviour. HDA hardware will be reset on
pre-T186, on T186+ it won't be reset.

Please make v2 using devm_reset_control_bulk_get_exclusive(), skipping
the non-existent reset, or move the workaround to the BPMP driver like I
suggested in the other reply.
