Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF06348B7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 21:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBE2163B;
	Tue, 22 Nov 2022 21:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBE2163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669150208;
	bh=WoqdMSrDh1aSCwbEOBB5q9ekxo7PYzlQpg5zweyNflE=;
	h=Date:To:References:Subject:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUHjbELAbnNF9o4KAacfNNIPgqtkudFAUIcqx/QyGiP18I8zjT459vPLXwp7grHp1
	 Xnu3KamAZSt3/DzP/SLuKyCxekyV/tUrl++S06BpgN9PwOh7VcF6TNonO2tXo3n9ty
	 j6Eq3lBx5yWUoqnjO+7eTTgFeL74jPde5P2jPhiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32BE9F80310;
	Tue, 22 Nov 2022 21:49:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EE73F80272; Tue, 22 Nov 2022 21:49:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26486F80149
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 21:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26486F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e50+0O8E"
Received: by mail-wm1-x335.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso12262565wms.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 12:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xzKzCRrQ0kD01ErE8/DSm8QGUxYgutvYGN37un2fEs=;
 b=e50+0O8ETpq4Otf+oxktx8UlVwPlghSMuG3s/gznq5eMw3JFpyHlvGHOsuwgSS1vBw
 KxmDQoXQWWczTxhtTMl47jcH6FXEQYfwevU6NrtUm0UbLlt/W/lLomgHws9P7U9+RoWU
 /WgpdOjrtJ5NQm7/1LSt1lj5RhYS9txXlel9Q+tcLMY7/r+c36jwlWiFYT5Azxnl5WSj
 JTF7bYvrpBJXhA9T6NvBUmO/EGp+EmEQB4GrXtQ47xh9Bhu56ZAbWuxTdvbhEQBomjvA
 DmsjykKsMPUVdO2Z7HqT+u8ynkCTzC1gCAFl5xElujyQQWOMky4gcFrDkwe8lXpvb2zy
 TwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language:subject
 :references:cc:to:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8xzKzCRrQ0kD01ErE8/DSm8QGUxYgutvYGN37un2fEs=;
 b=Fg0DJC5sT6cNagIiNmyWrrlk0XiAWVUfYaPvbHzFSc7k1E5zxzBULHOs70heqDAsIt
 rQ5pObx6UOdh92FL9byexhS3vBbq3FEbZkZn0CfHNDUbXjVBqsyKBEFVG6TY0DWuo623
 Tr0S+AsihNLmCPgrcP8jEkmXg+I2q6w4OQAoh9aOv5q9Dsw5JpIFNFEr/QAToAxCYefH
 YA40W/albv4TcylxZhGOgluWPj3t6bida4I7ea3c/SSIfATftM6ZUsYYPxhadTBFvItj
 w3d0daF0G1FVB5+6j+HszQ0JnU7ufmL4aI3womcoYqkPTn/BwGgbF9jkKJiCCNv1+xAB
 105w==
X-Gm-Message-State: ANoB5pmv4xJo/8/LdzifI7OuyVvINRS1o2KCRbVqHjjDeW6bxWiUwJDU
 WCbpeuTK5215b6AqT2C9E7M=
X-Google-Smtp-Source: AA0mqf5luX8xyap/ZIY48+LE5qXXkRRDwsYMk2Qz5GlrYjdqO0IivztM2rUASWdPg1F4GAspr2u2kA==
X-Received: by 2002:a05:600c:2241:b0:3cf:9ced:dce4 with SMTP id
 a1-20020a05600c224100b003cf9ceddce4mr17457810wmm.120.1669150146130; 
 Tue, 22 Nov 2022 12:49:06 -0800 (PST)
Received: from [10.10.20.10] (80.49.50.209.ipv4.supernova.orange.pl.
 [80.49.50.209]) by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003c6bd12ac27sm17745612wmc.37.2022.11.22.12.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 12:49:05 -0800 (PST)
Message-ID: <77f06a82-6765-4e7e-d30e-554acb8309b2@gmail.com>
Date: Tue, 22 Nov 2022 21:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: cezary.rojewski@intel.com
References: <ee8fb5be-e31b-2000-84de-85db5989ee92@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Add missing audio amplifier for KBL
Content-Language: en-GB
From: Alicja Michalska <ahplka19@gmail.com>
In-Reply-To: <ee8fb5be-e31b-2000-84de-85db5989ee92@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com, ahplka19@gmail.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

Hello Czarek, trying to re-send that mail from my workstation since 
email client on my phone didn't cc properly.

No, I've got no idea why it's been duplicated. It's my first time 
contributing to mainline, so sorry about that. Will double-check my 
patches in the future.

On 22/11/2022 19:10, Cezary Rojewski wrote:
 > On 2022-11-22 12:20 AM, Alicja Michalska wrote:
 >> KBL platform is missing the definition of 'max98357a' audio amplifier.
 >> This amplifier is used on many KBL Chromebooks, for instance variant
 >> 'nami' of 'Google/poppy' baseboard.
 >>
 >> Reported-by: CoolStar <coolstarorganization@gmail.com>
 >> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
 >>
 >> diff --git a/sound/soc/intel/avs/board_selection.c 
b/sound/soc/intel/avs/board_selection.c
 >> index 87f9c18be238..650faebb33ef 100644
 >> --- a/sound/soc/intel/avs/board_selection.c
 >> +++ b/sound/soc/intel/avs/board_selection.c
 >> @@ -129,6 +129,14 @@ static struct snd_soc_acpi_mach 
avs_kbl_i2s_machines[] = {
 >>           },
 >>           .tplg_filename = "max98373-tplg.bin",
 >>       },
 >> +    {
 >> +        .id = "MX98357A",
 >> +        .drv_name = "avs_max98357a",
 >> +        .mach_params = {
 >> +            .i2s_link_mask = AVS_SSP(0),
 >> +        },
 >> +        .tplg_filename = "max98357a-tplg.bin",
 >> +    },
 >>       {
 >>           .id = "DLGS7219",
 >>           .drv_name = "avs_da7219",
 >> ---
 >>   sound/soc/intel/avs/board_selection.c | 8 ++++++++
 >>   1 file changed, 8 insertions(+)
 >>
 >> diff --git a/sound/soc/intel/avs/board_selection.c 
b/sound/soc/intel/avs/board_selection.c
 >> index 87f9c18be238..650faebb33ef 100644
 >> --- a/sound/soc/intel/avs/board_selection.c
 >> +++ b/sound/soc/intel/avs/board_selection.c
 >> @@ -129,6 +129,14 @@ static struct snd_soc_acpi_mach 
avs_kbl_i2s_machines[] = {
 >>           },
 >>           .tplg_filename = "max98373-tplg.bin",
 >>       },
 >> +    {
 >> +        .id = "MX98357A",
 >> +        .drv_name = "avs_max98357a",
 >> +        .mach_params = {
 >> +            .i2s_link_mask = AVS_SSP(0),
 >> +        },
 >> +        .tplg_filename = "max98357a-tplg.bin",
 >> +    },
 >>       {
 >>           .id = "DLGS7219",
 >>           .drv_name = "avs_da7219",
 >
 >
 > Any reason why diff is repeated twice? It seems that the first copy 
of diff is part of the commit message.

