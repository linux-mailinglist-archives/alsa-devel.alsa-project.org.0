Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0706CD122
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 06:17:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35D2F6C1;
	Wed, 29 Mar 2023 06:16:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35D2F6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680063468;
	bh=n/3oNMC4NKPNIOYS0LS51C8OTzsSte+iJ+FXy0Ut5oM=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=RMpf9TTJKNfkF34rpffyiq0Byw4kXpHnkpbeZYiWaG0nLREs0hmppfiKxkBE3E74Z
	 JEoRa0WTsa65kziTFxmfEjHbtw23roo3WmNpZdVibz4KeJuRt00+CsFjlfROcNgf95
	 Q6ivVdrJZLyPPBSpyrO1NMIm0oh93zCtqCBk6TyY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31661F8053D;
	Wed, 29 Mar 2023 06:16:03 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: ymfpci: Store additional legacy registers on
 suspend
Date: Wed, 29 Mar 2023 07:14:40 +0300
In-Reply-To: <20230329041440.177363-1-tasos@tasossah.com>
References: <20230329041440.177363-1-tasos@tasossah.com>
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006336180.26.16161966652336525961@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7761F80482; Wed, 29 Mar 2023 06:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B027F8024E
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 06:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B027F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=cDQy05fB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=czlhVys8aOgYF2z2dAk0YpEXfcqxeCkF+PBNosmgzwE=; b=cDQy05fBLx1M9Wlpazz3H8H8/A
	TWx4i8UKY9nXE1dNU3pzHLfsGuyTRR4kFhIcuO9PCAqs9iong3Eqj5xnGgfLywqlEzxJ/EIzXHHs2
	UfHc/J7527+C7/xGo6d++l57wUy3kSNKV3B8y8TavxKIJc7eYZqaCo3aOVOjNClDdNsQ=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phNDQ-00GucY-S1; Wed, 29 Mar 2023 07:15:17 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: ymfpci: Store additional legacy registers on
 suspend
Date: Wed, 29 Mar 2023 07:14:40 +0300
Message-Id: <20230329041440.177363-5-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329041440.177363-1-tasos@tasossah.com>
References: <20230329041440.177363-1-tasos@tasossah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XCOTML3KO6LC2TWW7HTHLOQMWFMZ6J7E
X-Message-ID-Hash: XCOTML3KO6LC2TWW7HTHLOQMWFMZ6J7E
X-MailFrom: tasos@tasossah.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, tasos@tasossah.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

YMF744 and newer store the base IO ports in separate PCI config registers.

Since these registers were not restored, when set to a non-default value,
features that rely on them (FM, MPU401, gameport) were not functional
after restore, as their respective IO ports were reset to their defaults.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.h      |  8 ++++++++
 sound/pci/ymfpci/ymfpci_main.c | 16 +++++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index 192f6ce9b..d5dd0e5ae 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -298,10 +298,18 @@ static const int saved_regs_index[] = {
 #define YDSXGR_NUM_SAVED_REGS	ARRAY_SIZE(saved_regs_index)
 
 static const int pci_saved_regs_index[] = {
+	/* All Chips */
 	PCIR_DSXG_LEGACY,
 	PCIR_DSXG_ELEGACY,
+	/* YMF 744/754 */
+	PCIR_DSXG_FMBASE,
+	PCIR_DSXG_SBBASE,
+	PCIR_DSXG_MPU401BASE,
+	PCIR_DSXG_JOYBASE,
 };
 #define DSXG_PCI_NUM_SAVED_REGS	ARRAY_SIZE(pci_saved_regs_index)
+#define DSXG_PCI_NUM_SAVED_LEGACY_REGS	2
+static_assert(DSXG_PCI_NUM_SAVED_LEGACY_REGS <= DSXG_PCI_NUM_SAVED_REGS);
 
 struct snd_ymfpci {
 	int irq;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 02c9e454c..0963f3ae3 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2224,8 +2224,11 @@ static int snd_ymfpci_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct snd_ymfpci *chip = card->private_data;
-	unsigned int i;
-	
+	unsigned int i, legacy_reg_count = DSXG_PCI_NUM_SAVED_LEGACY_REGS;
+
+	if (chip->pci->device >= 0x0010) /* YMF 744/754 */
+		legacy_reg_count = DSXG_PCI_NUM_SAVED_REGS;
+
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 	snd_ac97_suspend(chip->ac97);
 
@@ -2234,7 +2237,7 @@ static int snd_ymfpci_suspend(struct device *dev)
 
 	chip->saved_ydsxgr_mode = snd_ymfpci_readl(chip, YDSXGR_MODE);
 
-	for (i = 0; i < DSXG_PCI_NUM_SAVED_REGS; i++)
+	for (i = 0; i < legacy_reg_count; i++)
 		pci_read_config_word(chip->pci, pci_saved_regs_index[i],
 				      chip->saved_dsxg_pci_regs + i);
 
@@ -2249,7 +2252,10 @@ static int snd_ymfpci_resume(struct device *dev)
 	struct pci_dev *pci = to_pci_dev(dev);
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct snd_ymfpci *chip = card->private_data;
-	unsigned int i;
+	unsigned int i, legacy_reg_count = DSXG_PCI_NUM_SAVED_LEGACY_REGS;
+
+	if (chip->pci->device >= 0x0010) /* YMF 744/754 */
+		legacy_reg_count = DSXG_PCI_NUM_SAVED_REGS;
 
 	snd_ymfpci_aclink_reset(pci);
 	snd_ymfpci_codec_ready(chip, 0);
@@ -2261,7 +2267,7 @@ static int snd_ymfpci_resume(struct device *dev)
 
 	snd_ac97_resume(chip->ac97);
 
-	for (i = 0; i < DSXG_PCI_NUM_SAVED_REGS; i++)
+	for (i = 0; i < legacy_reg_count; i++)
 		pci_write_config_word(chip->pci, pci_saved_regs_index[i],
 				      chip->saved_dsxg_pci_regs[i]);
 
-- 
2.25.1

