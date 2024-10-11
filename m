Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B4899A013
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2258AEB1;
	Fri, 11 Oct 2024 11:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2258AEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638587;
	bh=s65Bz3+ieIAUqwK5ADHiCy63ZY39r7OBbLrjyxkUk4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YL02JOoleF1JH6orjLZu2/CJ+CxzkeHj2sUINCUxzZl6NvE3zKnLimpuBeY3k04iy
	 39wicZUDr9apDY7NOoE6qitbBXdHNBcPflxmta0z+Xk8Az+DewpN8rKkC7D9rJNDsp
	 CjkMwpdZzLGDgYRD4ofGwEEbg0FrGNOssw92y8vg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F361F806DF; Fri, 11 Oct 2024 11:20:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA61F806DF;
	Fri, 11 Oct 2024 11:20:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C392F80528; Fri, 11 Oct 2024 07:20:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F46EF8001E
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 07:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F46EF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=manjaro.org header.i=@manjaro.org header.a=rsa-sha256
 header.s=2021 header.b=GHb/WN63
Message-ID: <94782cf4-5317-49fb-bd8c-8dfc4eafae74@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1728624024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y/llnmoIv2jFYjcnFeNjsM9lCHRTODti3ojbao7n7Sc=;
	b=GHb/WN63nq81PzDEaMiWyiiT/1uRK+SE5qK0HiO5zEyIUa6xb/Kru1yvNAGtapeB9cfLqT
	kPQ1e9RFxQfqkX6J2C0MyX/yG8LQ3F9/jPr9Rcr+tLE/znewRfx60kISkh8usXRjIG1TxE
	RKqD5FlpZs8T88R1+ahxticaOgqp1GX7m8Y1bIqa9Qu70SQxy4Vw/EIW2rRarge9iiUc9U
	+N9mu+onKzMq//w/kvVR/0bkO1NUC+qZOLNU3sWaKB+NnPo4dECqakz886nsJOccYyROkM
	aEbDunUbGl9EJCMH5yLlDqy5bI1nKB4IZLNbvBtQ2Cql5TczzBj7WuR4IdlaDw==
Date: Fri, 11 Oct 2024 12:20:10 +0700
MIME-Version: 1.0
Subject: Re: [PATCH] ALSA: hda/realtek: tas2781: Fix ROG ALLY X audio
To: Takashi Iwai <tiwai@suse.de>
Cc: Jonathan LoBue <jlobue10@gmail.com>, perex@perex.cz, tiwai@suse.com,
 shenghao-ding@ti.com, kailang@realtek.com, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 derekjohn.clark@gmail.com, luke@ljones.dev, benato.denis96@gmail.com,
 Kyle Gospodnetich <me@kylegospodneti.ch>,
 Jan Drogehoff <sentrycraft123@gmail.com>,
 Richard Alvarez <alvarez.richard@gmail.com>,
 Miles Montierth <cyber_dopamine@intheblackmedia.com>,
 "Chen, Robin" <robinchen@ti.com>, Antheas Kapenekakis <lkml@antheas.dev>,
 "Xu, Baojun" <baojun.xu@ti.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20240812045325.47736-1-jlobue10@gmail.com>
 <87frra2ocp.wl-tiwai@suse.de>
 <CAGwozwF7aR5UypRTe7tNFR+xOfQ=rhqkzYUgBcYH4_LvO9_zXQ@mail.gmail.com>
 <87cymedlrt.wl-tiwai@suse.de>
 <CAGwozwEyhhDspUTyUwd9fqacKwoUwJJ=ZOHpJ5UfsaBs1kcx_w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: 
 <CAGwozwEyhhDspUTyUwd9fqacKwoUwJJ=ZOHpJ5UfsaBs1kcx_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=philm@manjaro.org smtp.mailfrom=philm@manjaro.org
X-MailFrom: philm@manjaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5HS456UN4SKVUHDG2F5AXO2LXSCOU5HZ
X-Message-ID-Hash: 5HS456UN4SKVUHDG2F5AXO2LXSCOU5HZ
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:20:26 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HS456UN4SKVUHDG2F5AXO2LXSCOU5HZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/8/24 19:58, Antheas Kapenekakis wrote:
> Hi everyone,
> I created the following Draft MR for the Ally firmware files:
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/272
> 
> Please comment on it at your leisure. I will remove the Draft status once
> all the sign-off members verify it for correctness.
> 
> @Shenghao: can you restate publicly the license of the firmware files and if
> there are no issues, sign-off on the MR?
> 
> Best,
> Antheas

The firmware is now finally merged upstream: 
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/317/diffs

For now a symlink was added to make the current driver implementation by 
Jonathan work: 
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/318/diffs

Jim and Robin from TI will adjust the tas2781_hda_i2c driver to load the 
correct firmware per speaker vendor so the different optimized 
protection parameters are given.

For example the following can be used to readout the GUID for 
calibration data in UEFI BIOS:

status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz, data);

Example source:

find /sys/firmware/efi/efivars/ -name *-1f52* -print -exec hexdump -C {} \;
/sys/firmware/efi/efivars/CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92
00000000  07 00 00 00 dd f5 15 41  4d ab bb 0f f4 11 bd 31 
|.......AM......1|
00000010  bf 5e 97 00 00 00 00 24  2f 8d 10 3e 77 b9 7f 10 
|.^.....$/..>w...|
00000020  f3 07 6e 2f b3 d0 93 00  00 00 00 24 00 00 00 00 
|..n/.......$....|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
|................|
*
00000050  00 00 00 00 f2 e1 73 66  8e 08 d9 2b 00 00 00 01 
|......sf...+....|
00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 
|................|
*
00000080  00 00 00 00                                       |....|
00000084

-- 
Best, Philip
