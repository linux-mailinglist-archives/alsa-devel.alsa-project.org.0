Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55015766B2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 20:25:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC041939;
	Fri, 15 Jul 2022 20:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC041939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657909540;
	bh=NYTTZJSFZVD0DTXIxnLto7eWFJzO5w6TOMrTxPCOZmA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PKQTwxoeohfcgsR3z80SQjQiYFazGt6st7I2wfCeG2nRJy6grGPaNrEg7RpvZQ5lc
	 zufwiN+fSMFXnk1G4AtgXtUu5tO/wVZSBpCfXpIAAvutSouQUcx9/UCDhpQIl0u4JX
	 wNGTcSvZAQgy+W2HRY0Zqv1BD77x0lQUV9E0+8i0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D20AF8012F;
	Fri, 15 Jul 2022 20:24:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18310F8012F; Fri, 15 Jul 2022 20:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E43DCF8012F
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 20:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E43DCF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Z+k3TG3I"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="U/A4pdQV"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0AE1534F39;
 Fri, 15 Jul 2022 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657909469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jTgp2xSspcsahHLEXvx2g88T4l52tTGfy+WLc/LqjGE=;
 b=Z+k3TG3Iu9a8Jh4Fto2p2EMtMIjMhoXFhi1lZOF7fAPYRV/H43y1M7OUh5Vye0TFIsuSIM
 80ZowhfcbyBSg2KtWif17uyNjE+HUAhUpHSLbnm6VR9+NS4CZMdkD4VC7uz/+b2EQAnmii
 PfkX6uDIL47ht7CyvbANRUr78mg8wCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657909469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=jTgp2xSspcsahHLEXvx2g88T4l52tTGfy+WLc/LqjGE=;
 b=U/A4pdQVGaRb1EBCy3LWPi2zR5Y909Ogypqwq9vK9SfJJlBG4/nmky4YxqttsJri7OiwcH
 zAnRitMBABRAOwDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E405213754;
 Fri, 15 Jul 2022 18:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PmbkNtyw0WJhGQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 18:24:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: hda: cs35l41: Allow compilation test on
 non-ACPI configurations"
Date: Fri, 15 Jul 2022 20:24:27 +0200
Message-Id: <20220715182427.18891-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since the recent change in CS35L41 codec requires the reference of
acpi_dev handle, the current Kconfig may lead to a build breakage.

Revert the Kconfig change and re-introduce the hard dependency on
CONFIG_ACPI again as a temporary workaround.

Fixes: eef375960210 ("ALSA: hda: cs35l41: Support reading subsystem id from ACPI")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 44c33bc0740e..a8e8cf98befa 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -103,7 +103,7 @@ config SND_HDA_CS_DSP_CONTROLS
 config SND_HDA_SCODEC_CS35L41_I2C
 	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
 	depends on I2C
-	depends on ACPI || COMPILE_TEST
+	depends on ACPI
 	depends on SND_SOC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
@@ -118,7 +118,7 @@ comment "Set to Y if you want auto-loading the side codec driver"
 config SND_HDA_SCODEC_CS35L41_SPI
 	tristate "Build CS35L41 HD-audio codec support for SPI Bus"
 	depends on SPI_MASTER
-	depends on ACPI || COMPILE_TEST
+	depends on ACPI
 	depends on SND_SOC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
-- 
2.35.3

