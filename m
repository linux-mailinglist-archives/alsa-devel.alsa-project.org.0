Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512173BF14
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 21:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FAE843;
	Fri, 23 Jun 2023 21:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FAE843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687550014;
	bh=jwqi0XBxM+ilnXx5n+X1yLNFkfsiN9JUB8ijKjCM3Hw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ISc/kYTm5jjIWzFZLrm20u1/rBJCxLhY4aTfX1TKDoMVmh0HcjABhYGFXnCPA7SYZ
	 JX+CXZcSl075JrsM7kGPSuOH0Y2GV1wjtncKTBnXaJUdslsgtMRyUa9D8aZbStZmRD
	 IHPfQVBASfBN5/zz1AxURBk55Mi70CICIoYmCyUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE305F80132; Fri, 23 Jun 2023 21:52:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB85BF80132;
	Fri, 23 Jun 2023 21:52:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2B0EF80141; Fri, 23 Jun 2023 21:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C3ACDF80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 21:52:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3ACDF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687549929256497622-webhooks-bot@alsa-project.org>
References: <1687549929256497622-webhooks-bot@alsa-project.org>
Subject: Focusrite Scarlett 2i2 3rd Gen suffers from high output latency with
 the 1.2.9-1 update
Message-Id: <20230623195215.B2B0EF80141@alsa1.perex.cz>
Date: Fri, 23 Jun 2023 21:52:15 +0200 (CEST)
Message-ID-Hash: MEM3K6W2KYI426RS2572APM73S2MMQPP
X-Message-ID-Hash: MEM3K6W2KYI426RS2572APM73S2MMQPP
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEM3K6W2KYI426RS2572APM73S2MMQPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #329 was opened from IsaacLambat:

Hello, I have recently upgraded from `alsa-ucm-conf 1.2.8-1` to `1.2.9-1` and this has caused some latency of around 1 second for outputting audio via the `Focusrite Scarlett 2i2 3rd Gen` with is connected the computer via USB. No latency is introduced when plugging wired headphones directly in to the motherboard so this seems to be isolated to the device. 

I noticed the change logs indicate better support for this device was added in this version (which is great!) so these changes may have affected the existing settings of the headphones. I have downgraded only `alsa-ucm-conf` to `1.2.8-1` and the output has no latency so I am using this as a workaround.

I use PulseAudio with ALSA on Arch Linux.

Versions:
```
alsa-card-profiles - 0.3.71
alsa-lib - 1.2.9
alsa-ucm-conf - 1.2.9
alsa-utils - 1.2.9

pulseaudio - 16.1
Arch Linux - 6.3.9-arch1-1
```

Please let me know if any more information is needed (such as logs or config files) and if there is anything I should try.

Many thanks :D

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/329
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
