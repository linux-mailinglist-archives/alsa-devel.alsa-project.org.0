Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C33756D87FF
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04376826;
	Wed,  5 Apr 2023 22:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04376826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725705;
	bh=uKemii2rpUbKsgOFyOD+tBK5fvGqF3D2JxBG8N22rBY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pYOxb4thHDw4kPucpXk5vNzY6S/fSsyr1BhwZcP31Q4qj2tZ/iN5QfwoDoYK+eSd4
	 Umlgv6V9bDD/BHpqdN2ZZaA5utdCOvcU6DReOHq+hLtHEx9TeHyInbSvLqn6hLERMY
	 9jnjdcuJcxL6Xu3Y6r83NibtRt+xHWh2xqFBuJfs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CE9F8052D;
	Wed,  5 Apr 2023 22:12:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 132E8F8055C; Wed,  5 Apr 2023 22:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A76CF8028B
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A76CF8028B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 5CF022424A
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:20 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-Dky-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: hda/sigmatel: add pin overrides for Intel DP45SG
 motherboard
Date: Wed,  5 Apr 2023 22:12:19 +0200
Message-Id: <20230405201220.2197826-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TNSBEN5AJVSRHNUFGNVMY3AFG4MCYJQA
X-Message-ID-Hash: TNSBEN5AJVSRHNUFGNVMY3AFG4MCYJQA
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNSBEN5AJVSRHNUFGNVMY3AFG4MCYJQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like the other boards from the D*45* series, this one sets up the
outputs not quite correctly.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/hd-audio/models.rst | 2 +-
 sound/pci/hda/patch_sigmatel.c          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/sound/hd-audio/models.rst b/Documentation/sound/hd-audio/models.rst
index 9b52f50a6854..120430450014 100644
--- a/Documentation/sound/hd-audio/models.rst
+++ b/Documentation/sound/hd-audio/models.rst
@@ -704,7 +704,7 @@ ref
 no-jd
     BIOS setup but without jack-detection
 intel
-    Intel DG45* mobos
+    Intel D*45* mobos
 dell-m6-amic
     Dell desktops/laptops with analog mics
 dell-m6-dmic
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index a794a01a68ca..64a97d8c1b03 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -1955,6 +1955,8 @@ static const struct snd_pci_quirk stac92hd73xx_fixup_tbl[] = {
 				"DFI LanParty", STAC_92HD73XX_REF),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_DFI, 0x3101,
 				"DFI LanParty", STAC_92HD73XX_REF),
+	SND_PCI_QUIRK(PCI_VENDOR_ID_INTEL, 0x5001,
+				"Intel DP45SG", STAC_92HD73XX_INTEL),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_INTEL, 0x5002,
 				"Intel DG45ID", STAC_92HD73XX_INTEL),
 	SND_PCI_QUIRK(PCI_VENDOR_ID_INTEL, 0x5003,
-- 
2.40.0.152.g15d061e6df

