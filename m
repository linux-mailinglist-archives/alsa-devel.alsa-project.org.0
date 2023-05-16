Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AA7057F4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 21:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6997FA;
	Tue, 16 May 2023 21:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6997FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684266719;
	bh=vrJbb+thE3XsnqrA0f75v2in+7O7pevNPGynZ++e5hM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gm5+KKX4mhMeI3rgkKyVVyHnEPYOfFb09I26gzD7Ce8qQm4lcwMG//Z++Fal4IcHu
	 LV97CGAYR2c425oJO1T0lySKBCTMiWysL6dz6Xjyz1W+JRJubV0iq8TXaIeehyf2mc
	 1yRykQEpNuLxWypG7Zec90XP5gHr3LwJnI+yos4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0233F8016A; Tue, 16 May 2023 21:51:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D6D2F8025A;
	Tue, 16 May 2023 21:51:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BDE5F80272; Tue, 16 May 2023 21:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63124F8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 21:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63124F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nh1LnlD0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F31F763DD7;
	Tue, 16 May 2023 19:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167C8C433D2;
	Tue, 16 May 2023 19:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684266653;
	bh=vrJbb+thE3XsnqrA0f75v2in+7O7pevNPGynZ++e5hM=;
	h=From:To:Cc:Subject:Date:From;
	b=nh1LnlD0t0THNvDVMhBt7li9Log+fQWxVGvdJw/NtuM/fsAVOhoizufYtKFp70Mv6
	 OoME9qlmwvFOZfroTn2r4GWypEvnRlAwMgEH/meA+3CNQl5CD9kubIgjl6K+GqRlBF
	 JJCVNjIVvtPOMwOKQ+mHHu7XBX27qnk3gYqKoODkd2tsXwAA5NWSqn5Ya9RSEXCS2f
	 tRKQ1aYIduQQmX9VKVJfy5wxQz0gthaWwe0PgijCmxmMNiT6+9zp4bIYroh/NF/z/R
	 RHbaUT1SsDDr1M9OM0HbRx01n1wFvhmGyVEjiPJlITKOYHhj/buYg6FCbFMO3KlDMt
	 nEog8AHZhFr3Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: cs46xx: mark snd_cs46xx_download_image as static
Date: Tue, 16 May 2023 21:50:41 +0200
Message-Id: <20230516195046.550584-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J36M3VUSP5FP5YS3XXBOJMUR4B3AOKRH
X-Message-ID-Hash: J36M3VUSP5FP5YS3XXBOJMUR4B3AOKRH
X-MailFrom: arnd@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J36M3VUSP5FP5YS3XXBOJMUR4B3AOKRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

snd_cs46xx_download_image() was originally called from dsp_spos.c, but
is now local to cs46xx_lib.c. Mark it as 'static' to avoid a warning
about it lacking a declaration, and '__maybe_unused' to avoid a warning
about it being unused when CONFIG_SND_CS46XX_NEW_DSP is disabled:

sound/pci/cs46xx/cs46xx_lib.c:534:5: error: no previous prototype for 'snd_cs46xx_download_image'

Fixes: 89f157d9e6bf ("[ALSA] cs46xx - Fix PM resume")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/cs46xx/cs46xx_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 62f45847b351..7d882b33d45e 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -531,7 +531,7 @@ static int load_firmware(struct snd_cs46xx *chip)
 	return err;
 }
 
-int snd_cs46xx_download_image(struct snd_cs46xx *chip)
+static __maybe_unused int snd_cs46xx_download_image(struct snd_cs46xx *chip)
 {
 	int idx, err;
 	unsigned int offset = 0;
-- 
2.39.2

