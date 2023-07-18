Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5837570FB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 02:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51027E72;
	Tue, 18 Jul 2023 02:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51027E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689640339;
	bh=snD0Eo/VYjRjGit1jZ3DB3f+21qBXC5DToerjkMGLGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TzACKbTrSlC1Eiam09oXn0Ieh3BTSfmBWoO0NHGBXOed7b7LohkJGz9hOpl7P6KbO
	 cOIs39u0DGadFrzMsgMehwm5NZtvzjW8zA/8HN1lzQu3sdE8GQ6BDsD4xKio4w5V3+
	 cgws2FEwxYLu56Td5VWTnGAkrlALrBIab3J2eWg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9F35F8057A; Tue, 18 Jul 2023 02:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE905F8056F;
	Tue, 18 Jul 2023 02:30:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CA2AF8027B; Tue, 18 Jul 2023 02:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58E5BF8032D
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 02:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E5BF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EASJiqi7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 451B061370;
	Tue, 18 Jul 2023 00:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47CBC433CA;
	Tue, 18 Jul 2023 00:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689640202;
	bh=snD0Eo/VYjRjGit1jZ3DB3f+21qBXC5DToerjkMGLGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EASJiqi7Ly00yQGpkuE68DknJ2uuk81E+xf84VkP6/LvzK2+EyM2xkKbswtkHeoqa
	 tZ0ImiGE0GItbBWGDp6gmalV1wKrmCNt3+5SmOvCENeIQ/HTI6VyX9iaU86Z8QqfUT
	 AYfaQTZ2BbRBghwtycDsx4i4xpGQ4bwqBKUBS9v0vkOqUlYnSOPTMMS0IUvSjcG4w8
	 7snqjWeGqMXUCraC43lHkm+luQ0BSGEaihe7xxetFzr/ar6+tlrH++gxmGKWV4W/ha
	 SqLgCzqeH3ShsHujBZY5lLl3SdNgAstuAl5BGOYfLY9vtnh1rXdadrOdmCYJ9o8roT
	 +aT9GnK56QD5Q==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jul 2023 01:28:44 +0100
Subject: [PATCH v2 3/5] ALSA: Enable build with UML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-asoc-topology-kunit-enable-v2-3-0ee11e662b92@kernel.org>
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=broonie@kernel.org;
 h=from:subject:message-id; bh=snD0Eo/VYjRjGit1jZ3DB3f+21qBXC5DToerjkMGLGM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktdz6QD6q9FAILvFmBY8HlF3zn6cc9gUPfjrQS
 OQ9Y5c72fKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLXc+gAKCRAk1otyXVSH
 0GOPB/9bMFYsS1o4LqHp876+Z8FMoLwbWJqrzAD4yRpkJGzYmmvjkgcmEgpoQ8PqIsWLwcS0lhH
 8KiyzGYfeVEPHd7KCfGFlAmYXUkUKdnOBPLJ+Soncc7w6AXIHvULLU+UFtXhbBYpGAmZfHl8Lue
 w1Fz3y2zUFXFwE6PgzipDZ+tKN5rEB4H2Jjzu2Dyk+VDqulT4CiOeOgZPTAvxOXpmOtlOL/pwAc
 QAWOaiK+37tXolRxEiy5fLptJL6lLbSyZr24lY6ptIkT6erfXvRB8fisEkf3eELagl9UHBHKZVE
 1pNTd21Jy4nepcNB44BulWg9iVtFUF2Au/W8kG86TJs4co6a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: IVJ5OXIFL5QRCWUE5KMMHMKBNZOU72RS
X-Message-ID-Hash: IVJ5OXIFL5QRCWUE5KMMHMKBNZOU72RS
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVJ5OXIFL5QRCWUE5KMMHMKBNZOU72RS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to facilitate testing using KUnit allow ALSA to build with UML,
it's not super useful at runtime but that's a user problem rather than
an actual dependency.  The apparent reason for the dependency was the
widespread use of iomem APIs in ALSA drivers, earlier patches in this
series have provided stubs for these APIs so that there are no build
time issues even without individual drivers having IOMEM dependencies
added.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/Kconfig b/sound/Kconfig
index 0ddfb717b81d..f0e15822e858 100644
--- a/sound/Kconfig
+++ b/sound/Kconfig
@@ -39,8 +39,6 @@ config SOUND_OSS_CORE_PRECLAIM
 
 source "sound/oss/dmasound/Kconfig"
 
-if !UML
-
 menuconfig SND
 	tristate "Advanced Linux Sound Architecture"
 	help
@@ -103,8 +101,6 @@ source "sound/virtio/Kconfig"
 
 endif # SND
 
-endif # !UML
-
 endif # SOUND
 
 config AC97_BUS

-- 
2.39.2

