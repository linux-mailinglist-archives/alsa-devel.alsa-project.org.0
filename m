Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46131C7E43B
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Nov 2025 17:37:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FBC60181;
	Sun, 23 Nov 2025 17:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FBC60181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763915833;
	bh=p2IBszKWyRikiujzPJzZdhs9Fn/3RTQKTaZuMxQP+m4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WMu0pyb8vMsQ9VVSYXHRRvfRZjT8OYURrWGZ1mWouJZCwqjL8diQs5H5wFfn0J23X
	 EAkN7C65S0yv0Q1JdK5MHQKjTtSH20a0TBKhb3ACX2+7KV3C/4Yys0UyWUBBL+6SGf
	 AFiXAFENh42I4/eweo3JliWEIfTQW2/dJ/DVGqPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3A3EF805B4; Sun, 23 Nov 2025 17:36:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99BA5F805C9;
	Sun, 23 Nov 2025 17:36:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1CCDF8051D; Sun, 23 Nov 2025 17:36:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4597AF8016E
	for <alsa-devel@alsa-project.org>; Sun, 23 Nov 2025 17:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4597AF8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187ab00d33f34b00-webhooks-bot@alsa-project.org>
In-Reply-To: <187ab00d32dfbc00-webhooks-bot@alsa-project.org>
References: <187ab00d32dfbc00-webhooks-bot@alsa-project.org>
Subject: Scarlett Solo gen 3, Direct Scarlett profile is missing,
 "Input 1 Mic" option is missing too.
Date: Sun, 23 Nov 2025 17:36:22 +0100 (CET)
Message-ID-Hash: BBOMQ75U2ZVPZ2PLDWI5TE3I4RVPGIQ4
X-Message-ID-Hash: BBOMQ75U2ZVPZ2PLDWI5TE3I4RVPGIQ4
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBOMQ75U2ZVPZ2PLDWI5TE3I4RVPGIQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #648 was opened from scaledteam:

Hello! I just discovered that Alsa UCM might be cause of my issues, but i don't know how to confirm and diagnose that. So i'm asking for help.

When i was using Arch Linux, it allowed me to select mono microphone input. It's important feature, because many communication programs just average microphone and instrument input, resulting in loosing half of the volume, which cannot be compensated with 200% gain in pavucontrol.

Now i switched to Linux Mint and i lost that feature. But ucm files in /usr/share/alsa seems identical to archlinux. Just to be sure i tried Manjaro liveusb and i found all of this options, no config required.

There is alsa info just in case: [alsa-info.txt](https://github.com/user-attachments/files/23697024/alsa-info.txt)

Can someone help me with this?

Linux mint:
<img width="700" height="421" alt="Image" src="https://github.com/user-attachments/assets/c555d380-bb2b-4fcf-b835-d0c92ce59897" />

Manjaro:
![Image](https://github.com/user-attachments/assets/e2ecae99-0fb0-4203-82f2-b9c4c97a733f)

![Image](https://github.com/user-attachments/assets/5c277b7a-f19c-4e0b-a786-b51eb51ee5f9)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/648
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
