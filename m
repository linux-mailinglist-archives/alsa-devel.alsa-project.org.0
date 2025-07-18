Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF10B0AC27
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Jul 2025 00:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ACDB601B9;
	Sat, 19 Jul 2025 00:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ACDB601B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752877460;
	bh=TutYYNReeOU6/QbjEamP+uKg9RD4UVu4n+IbJXu96QU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HvG/6PsdWGbQ8FZeZ/FlBkSJsTQUTNQzS3Plahs3zCSSArZZ7fyEdAmOs8dZwe1ri
	 f5ljWPpRdCS5DkPzBlDgxOS+1yc93V/xrvYzc+JVkChbVQG/mqmvBTLvOLaWdHI11D
	 JQJ2RpQ/U3+CZR+/SbsNzWCEHtb6g+HVTeeClFEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D64C0F805C5; Sat, 19 Jul 2025 00:23:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBF45F805C3;
	Sat, 19 Jul 2025 00:23:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06575F80254; Sat, 19 Jul 2025 00:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 84F5AF80088
	for <alsa-devel@alsa-project.org>; Sat, 19 Jul 2025 00:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F5AF80088
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <185378b63613d100-webhooks-bot@alsa-project.org>
In-Reply-To: <185378b635cae200-webhooks-bot@alsa-project.org>
References: <185378b635cae200-webhooks-bot@alsa-project.org>
Subject: Internal Microphone not working
Date: Sat, 19 Jul 2025 00:23:28 +0200 (CEST)
Message-ID-Hash: 7QEWRA63VKTZW7EZ7IYQW7KVGSIOR5GR
X-Message-ID-Hash: 7QEWRA63VKTZW7EZ7IYQW7KVGSIOR5GR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QEWRA63VKTZW7EZ7IYQW7KVGSIOR5GR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #464 was opened from crashthepose:

After updating my computer my internal microphone is not working. 




Originally when I went to my Audio settings it would say under Input "headset unplugged". I was able to go into the HDAjackretask interface and  override one of the pins where now the internal microphone is showing on the input list but now I only hear static noise. 


Info on my computer:

OS: Pop!_OS 22.04 LTS x86_64 
Host: ASUSLaptop_Q530VJ 1.0
Kernal: 6.12.10-76061203-generic 
Desktop Environment: GNOME 42.9
 Terminal: gnome-terminal 
CPU: 13th Gen Intel i7-13620H (16) @ 4.700GHz 
 GPU: Intel Device a7a8 
 GPU: NVIDIA 01:00.0 NVIDIA Corporation Device 25ac 
Memory: 7828MiB / 15610MiB

Here is my alsa info: http://alsa-project.org/db/?f=ed8089460c52b3b91175d52dfd51c4bad1f7388f

I've never submitted a bug before so apologies if i'm not doing this the correct way.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/464
Repository URL: https://github.com/alsa-project/alsa-lib
