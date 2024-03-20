Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD6881944
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 22:45:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B1A22AE;
	Wed, 20 Mar 2024 22:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B1A22AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710971150;
	bh=7veMNXpgGRbqRi474oCKjmnmLC+u3j7tDc/UD+MDScA=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aAJOY+rsaWChw8pXcFpYkvw31WgIoH7FM0QwhA6+DE/p/SBY15W4QrsUC/Fb2GOr3
	 Hklik8zm77S3MUgvtEP3F12bQh00infZiTAuy+zPh+ZtTPz7LiVOthXm+mmcS1RLds
	 wHxmKIbJAO1GahF4op5a1xsX67PlNjYkLYdd0DWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8480F80589; Wed, 20 Mar 2024 22:45:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62030F80589;
	Wed, 20 Mar 2024 22:45:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE8A4F804E7; Wed, 20 Mar 2024 22:45:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cloudserver3206585-3206616.home.pl
 (cloudserver3206585-3206616.home.pl [46.242.241.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DED82F80088
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 22:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED82F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ijbd.eu header.i=@ijbd.eu header.a=rsa-sha256
 header.s=dkim header.b=oqJFov86
Received: from [192.168.1.26] (79.184.234.139.ipv4.supernova.orange.pl
 [79.184.234.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by cloudserver3206585-3206616.home.pl (Postfix) with ESMTPSA id B881C102D0
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 22:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijbd.eu; s=dkim;
	t=1710971101; bh=7veMNXpgGRbqRi474oCKjmnmLC+u3j7tDc/UD+MDScA=;
	h=Date:To:From:Subject;
	b=oqJFov86JFrlcLQo/nYafKcPTivOj8rbAQTC1306A+rPuQ3Ykpn4NysA9h7o1yRu4
	 4rVsx12tmW9okUqyHsS3YYedI/6ktHVzT5SYg/tM4906/I1yLHX+F3lmHSqK1L5yJ5
	 CgvAxOaIyoAQrs8HHgGM6oPk1u4/Z8mbWQjXwjvng6D3PfYTeorW1ze3QXZq0XJpmG
	 y7GA5jKOm4T6h9ZY2PQw5n40bb6i0Hkq8wQ3dWStWY3yk15l8TEtT67xwsPf4r/Z/a
	 bokMcpARAiYuMLHeSy9Xzi1HCMBgRz0MTC3gj6g+8W853mhPDpkBq1O0LWqF47mqCR
	 erHNCcSFJXGRA==
Message-ID: <24b60761-a940-40e2-9f20-afb0e5eaf839@ijbd.eu>
Date: Wed, 20 Mar 2024 22:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: Jacek Blocki <jblocki@ijbd.eu>
Subject: Internal speakers and headphone not working on Huawei notebook
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CLIENT-IP: 79.184.234.139
X-CLIENT-HOSTNAME: 79.184.234.139.ipv4.supernova.orange.pl
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: 
 gggruggvucftvghtrhhoucdtuddrgedvledrleeggdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecunecujfgurhepkfffgggfvffhufgtgfesthekredttddvjeenucfhrhhomheplfgrtggvkhcuuehlohgtkhhiuceojhgslhhotghkihesihhjsggurdgvuheqnecuggftrfgrthhtvghrnhephefghfeifeekhfejvedttedvueegkefhhefghefggffhjeekheefieektddvueegnecuffhomhgrihhnpehrvghsuhhlthdrtggrthenucfkphepjeelrddukeegrddvfeegrddufeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeelrddukeegrddvfeegrddufeelpdhhvghloheplgduledvrdduieekrddurddviegnpdhmrghilhhfrhhomheplfgrtggvkhcuuehlohgtkhhiuceojhgslhhotghkihesihhjsggurdgvuheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrgh
X-DCC--Metrics: sv109.home.net.pl 1024; Body=1 Fuz1=1 Fuz2=1
Message-ID-Hash: NPCOFYZCYQVYJY4O34ZTRHFK2LGGNF3D
X-Message-ID-Hash: NPCOFYZCYQVYJY4O34ZTRHFK2LGGNF3D
X-MailFrom: jblocki@ijbd.eu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPCOFYZCYQVYJY4O34ZTRHFK2LGGNF3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

I have Huawei notebook (KLVL-WXXW-PCB) with Ubuntu 22.04.3 LTS installed 
alongside Windows. In Ubuntu, neither internal speakers nor headphone 
jack work. I only see Dummy Output while trying to adjust volume, but 
sound works with external HDMI monitor. Internal speakers work with 
Windows, so I believe hardware is fine and kernel driver 
(snd_hda_intel?) needs to be modified to fix the problem.
I have submitted Ubuntu bug report back in January, but nobody touched 
it. So I try this list hoping for better result.

$ cat /proc/asound/cards
  0 [Generic        ]: HDA-Intel - HD-Audio Generic
                       HD-Audio Generic at 0xd03c0000 irq 64
  1 [acp            ]: acp - acp
                       HUAWEI-KLVL_WXXW-M1010-KLVL_WXXW_PCB

I run 6.5.0-26-generic kernel.

Regards, Jacek Błocki


