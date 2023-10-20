Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791C67D0942
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 09:14:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348AF836;
	Fri, 20 Oct 2023 09:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348AF836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697786058;
	bh=48rGZC2ugBpwSS7GwDlCpsQH1wcswmY/hZO0szR1pxE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aK7c6LDdtUwgTyELEusU/a/cNw7vCi9uVcXx3ThPdano/a+zpFNxlPyO7iboTvbrO
	 wVtrHNXAWNdI/2N2RYI4uBNhbQ98l5EDhoB4xWCYNHPn7+ILVESEfwjnW0fu5ZyV8X
	 EeQzdV/H19MZzwfWiOX5/R8TyHf5OYebxHa2z7pU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D2CCF8055A; Fri, 20 Oct 2023 09:13:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56778F8019B;
	Fri, 20 Oct 2023 09:13:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA67F8025F; Fri, 20 Oct 2023 09:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D540FF8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 09:13:14 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 42D4F1A5C;
	Fri, 20 Oct 2023 09:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 42D4F1A5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1697785993; bh=VchgZE6L1KVI0pHeq9XJIXZ06OoCWpE7+3egrvwIXgs=;
	h=From:To:Cc:Subject:Date:From;
	b=stgR9GdlhMzrCnwD9BS6GSOaSfTzGaVfiHpd4HdcAtWZL98B8rFjfRCUc+v8yCr7t
	 dl02u6czymKMNVusYnOjSHbuIs/ZkrUswzIgvtRsUbcwD4s6t7e8ZlJlEsnW3Fq1+f
	 WZUh+78B/N/KGawFcluGj3xdG7MlJvTSVsrQakUo=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Fri, 20 Oct 2023 09:13:06 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH] MAINTAINERS: ALSA: change mailing list to linux-sound on vger
Date: Fri, 20 Oct 2023 09:12:47 +0200
Message-ID: <20231020071247.973909-1-perex@perex.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JZKOHUIHOMGBRRDLN4MZS7BEQDIOFEXN
X-Message-ID-Hash: JZKOHUIHOMGBRRDLN4MZS7BEQDIOFEXN
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZKOHUIHOMGBRRDLN4MZS7BEQDIOFEXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As discussed on alsa-devel mailing list [1], it is useful to have an open
mailing list to avoid moderation delays for the kernel patch work. Use
linux-sound mailing list for kernel driver related threads.

In the first stage, change the list for the ALSA core, ASoC and tests.

[1] https://lore.kernel.org/alsa-devel/20231019-posture-cache-fe060b@meerkat/

Cc: Takashi Iwai <tiwai@suse.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a7bd8bd80e9..007c0b204df7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20061,7 +20061,7 @@ F:	include/linux/sony-laptop.h
 SOUND
 M:	Jaroslav Kysela <perex@perex.cz>
 M:	Takashi Iwai <tiwai@suse.com>
-L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linux-sound@vger.kernel.org
 S:	Maintained
 W:	http://www.alsa-project.org/
 Q:	http://patchwork.kernel.org/project/alsa-devel/list/
@@ -20074,7 +20074,7 @@ F:	tools/testing/selftests/alsa
 
 SOUND - ALSA SELFTESTS
 M:	Mark Brown <broonie@kernel.org>
-L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linux-sound@vger.kernel.org
 L:	linux-kselftest@vger.kernel.org
 S:	Supported
 F:	tools/testing/selftests/alsa
@@ -20100,7 +20100,7 @@ F:	sound/soc/soc-generic-dmaengine-pcm.c
 SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
 M:	Liam Girdwood <lgirdwood@gmail.com>
 M:	Mark Brown <broonie@kernel.org>
-L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linux-sound@vger.kernel.org
 S:	Supported
 W:	http://alsa-project.org/main/index.php/ASoC
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
@@ -22931,7 +22931,7 @@ F:	fs/vboxsf/*
 
 VIRTUAL PCM TEST DRIVER
 M:	Ivan Orlov <ivan.orlov0322@gmail.com>
-L:	alsa-devel@alsa-project.org
+L:	linux-sound@vger.kernel.org
 S:	Maintained
 F:	Documentation/sound/cards/pcmtest.rst
 F:	sound/drivers/pcmtest.c
-- 
2.41.0

