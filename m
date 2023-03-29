Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D236CD121
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 06:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79F7820F;
	Wed, 29 Mar 2023 06:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79F7820F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680063460;
	bh=DssIjk1H7SHsPXibJaOYmRJ0ZpHjkkyvtKJ8o7TAtEk=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=e3GrUTJt+Xo90WlHMI2hk2W0bQ2fgsc/Yans5kfzI/FNYRGEic41pL/XA78UBhFcM
	 ppWpWewMSUdZB7FHw1KXoeUkhYv5BWowdMczudHLFXKa7Bhe4BSJOkM5XwvU3wMuaP
	 RgC8uNW3rUOfpdeERzNcQ56fC5BuMSIB1cJ+ylTc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F03D5F80482;
	Wed, 29 Mar 2023 06:16:00 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: ymfpci: Store saved legacy registers in an array
Date: Wed, 29 Mar 2023 07:14:39 +0300
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4XIXMJMTI7VXD6BENTEMZW4ALUKAOGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006335932.26.8046936037081040657@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E523FF80290; Wed, 29 Mar 2023 06:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from devnull.tasossah.com (devnull.tasossah.com
 [IPv6:2001:41d0:1:e60e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F61AF80272
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 06:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F61AF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=JgYv+Wa9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ug1EpXMZGuAlmXHKsN+O+ty4IztOKG9QDatgF7EPgfw=; b=JgYv+Wa9NkE74vnkRPzyB6uJHA
	OssdOoRfQdemsmmL279/31Npk0rJOjp0Dbt/B/oJxws4m+IZqxuaRXaPO366NYyXahSLiyNmv92jF
	YZLjMSIO5mdhljBzsrisZ4cxIDXj1LJZtZ7HND4O2UZ+I3BZ8jMuGvtOvRup1QhjbRIc=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phNDQ-00GucY-AT; Wed, 29 Mar 2023 07:15:16 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: ymfpci: Store saved legacy registers in an array
Date: Wed, 29 Mar 2023 07:14:39 +0300
Message-Id: <20230329041440.177363-4-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329041440.177363-1-tasos@tasossah.com>
References: <20230329041440.177363-1-tasos@tasossah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F4XIXMJMTI7VXD6BENTEMZW4ALUKAOGK
X-Message-ID-Hash: F4XIXMJMTI7VXD6BENTEMZW4ALUKAOGK
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4XIXMJMTI7VXD6BENTEMZW4ALUKAOGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In preparation for storing more than two legacy PCI registers, the
existing ones are moved into a new array.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.h      |  9 +++++++--
 sound/pci/ymfpci/ymfpci_main.c | 18 ++++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index 04e280004..192f6ce9b 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -297,6 +297,12 @@ static const int saved_regs_index[] = {
 };
 #define YDSXGR_NUM_SAVED_REGS	ARRAY_SIZE(saved_regs_index)
 
+static const int pci_saved_regs_index[] = {
+	PCIR_DSXG_LEGACY,
+	PCIR_DSXG_ELEGACY,
+};
+#define DSXG_PCI_NUM_SAVED_REGS	ARRAY_SIZE(pci_saved_regs_index)
+
 struct snd_ymfpci {
 	int irq;
 
@@ -376,8 +382,7 @@ struct snd_ymfpci {
 
 	u32 saved_regs[YDSXGR_NUM_SAVED_REGS];
 	u32 saved_ydsxgr_mode;
-	u16 saved_dsxg_legacy;
-	u16 saved_dsxg_elegacy;
+	u16 saved_dsxg_pci_regs[DSXG_PCI_NUM_SAVED_REGS];
 };
 
 int snd_ymfpci_create(struct snd_card *card,
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 8bf647824..02c9e454c 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2228,13 +2228,16 @@ static int snd_ymfpci_suspend(struct device *dev)
 	
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 	snd_ac97_suspend(chip->ac97);
+
 	for (i = 0; i < YDSXGR_NUM_SAVED_REGS; i++)
 		chip->saved_regs[i] = snd_ymfpci_readl(chip, saved_regs_index[i]);
+
 	chip->saved_ydsxgr_mode = snd_ymfpci_readl(chip, YDSXGR_MODE);
-	pci_read_config_word(chip->pci, PCIR_DSXG_LEGACY,
-			     &chip->saved_dsxg_legacy);
-	pci_read_config_word(chip->pci, PCIR_DSXG_ELEGACY,
-			     &chip->saved_dsxg_elegacy);
+
+	for (i = 0; i < DSXG_PCI_NUM_SAVED_REGS; i++)
+		pci_read_config_word(chip->pci, pci_saved_regs_index[i],
+				      chip->saved_dsxg_pci_regs + i);
+
 	snd_ymfpci_writel(chip, YDSXGR_NATIVEDACOUTVOL, 0);
 	snd_ymfpci_writel(chip, YDSXGR_BUF441OUTVOL, 0);
 	snd_ymfpci_disable_dsp(chip);
@@ -2258,10 +2261,9 @@ static int snd_ymfpci_resume(struct device *dev)
 
 	snd_ac97_resume(chip->ac97);
 
-	pci_write_config_word(chip->pci, PCIR_DSXG_LEGACY,
-			      chip->saved_dsxg_legacy);
-	pci_write_config_word(chip->pci, PCIR_DSXG_ELEGACY,
-			      chip->saved_dsxg_elegacy);
+	for (i = 0; i < DSXG_PCI_NUM_SAVED_REGS; i++)
+		pci_write_config_word(chip->pci, pci_saved_regs_index[i],
+				      chip->saved_dsxg_pci_regs[i]);
 
 	/* start hw again */
 	if (chip->start_count > 0) {
-- 
2.25.1

