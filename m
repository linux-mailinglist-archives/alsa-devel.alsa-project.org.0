Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ECA6CD120
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 06:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA3571F4;
	Wed, 29 Mar 2023 06:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA3571F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680063427;
	bh=/w7wXYIbbjds+dHj8hzQlMWEZHlwt0WI/Lgw35hj5Dc=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=QK1OoYKYr9rKDdQs4c6X1DoLtopqPqx37ljyx8OpOBzYbaX9/vvVTBgWBbQ/KFWoT
	 zOj1AM7gzNJuo+OHJoHtYWY3yyhRD3LkqGBge6yw7sAvMEjkeDOEQ6zD/Wn4lOwBXj
	 oz6J+JUQsflLfTjDIf3hoOhbN7Hoo3tvq2e8Z8mE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A9B7F80272;
	Wed, 29 Mar 2023 06:15:50 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: ymfpci: Move allocation of saved registers to
 struct snd_ymfpci
Date: Wed, 29 Mar 2023 07:14:38 +0300
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VR3QYXSYS2JNFNYGYABG5FMFUKCHZBF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006334833.26.13441719652980718121@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 268CFF80482; Wed, 29 Mar 2023 06:15:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B274F80249
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 06:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B274F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=qhFMrGN4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oulTBEm0RqyNtZsXDc80rF/xwAAA0O9HvPhrSextl04=; b=qhFMrGN4mJrZE1L28wLYYeLGcn
	mJkPvr3lgAaS+I414Uqb7vPkMc9+l23PVNTcNxpe47bDSWodRfkzizv4O7nYHaC2M/nnojsgjyssT
	XkXAmz5v9TBH26IFBVJNyeSZ+sQtA09IQEKYabbPe3HsbogSktrtWVqNPsfzewzgZZgI=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phNDP-00GucY-Ou; Wed, 29 Mar 2023 07:15:15 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: ymfpci: Move allocation of saved registers to
 struct snd_ymfpci
Date: Wed, 29 Mar 2023 07:14:38 +0300
Message-Id: <20230329041440.177363-3-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329041440.177363-1-tasos@tasossah.com>
References: <20230329041440.177363-1-tasos@tasossah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VR3QYXSYS2JNFNYGYABG5FMFUKCHZBF3
X-Message-ID-Hash: VR3QYXSYS2JNFNYGYABG5FMFUKCHZBF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VR3QYXSYS2JNFNYGYABG5FMFUKCHZBF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The registers were previously allocated when CONFIG_PM_SLEEP was set,
however this only saved an insignificant amount of memory otherwise.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.h      | 31 ++++++++++++++++++++++++++++++-
 sound/pci/ymfpci/ymfpci_main.c | 34 ----------------------------------
 2 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index 2103654c6..04e280004 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -268,6 +268,35 @@ struct snd_ymfpci_pcm {
 	u32 shift;
 };
 
+static const int saved_regs_index[] = {
+	/* spdif */
+	YDSXGR_SPDIFOUTCTRL,
+	YDSXGR_SPDIFOUTSTATUS,
+	YDSXGR_SPDIFINCTRL,
+	/* volumes */
+	YDSXGR_PRIADCLOOPVOL,
+	YDSXGR_NATIVEDACINVOL,
+	YDSXGR_NATIVEDACOUTVOL,
+	YDSXGR_BUF441OUTVOL,
+	YDSXGR_NATIVEADCINVOL,
+	YDSXGR_SPDIFLOOPVOL,
+	YDSXGR_SPDIFOUTVOL,
+	YDSXGR_ZVOUTVOL,
+	YDSXGR_LEGACYOUTVOL,
+	/* address bases */
+	YDSXGR_PLAYCTRLBASE,
+	YDSXGR_RECCTRLBASE,
+	YDSXGR_EFFCTRLBASE,
+	YDSXGR_WORKBASE,
+	/* capture set up */
+	YDSXGR_MAPOFREC,
+	YDSXGR_RECFORMAT,
+	YDSXGR_RECSLOTSR,
+	YDSXGR_ADCFORMAT,
+	YDSXGR_ADCSLOTSR,
+};
+#define YDSXGR_NUM_SAVED_REGS	ARRAY_SIZE(saved_regs_index)
+
 struct snd_ymfpci {
 	int irq;
 
@@ -345,7 +374,7 @@ struct snd_ymfpci {
 	const struct firmware *dsp_microcode;
 	const struct firmware *controller_microcode;
 
-	u32 *saved_regs;
+	u32 saved_regs[YDSXGR_NUM_SAVED_REGS];
 	u32 saved_ydsxgr_mode;
 	u16 saved_dsxg_legacy;
 	u16 saved_dsxg_elegacy;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 6d13f4152..8bf647824 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2220,35 +2220,6 @@ static void snd_ymfpci_free(struct snd_card *card)
 	release_firmware(chip->controller_microcode);
 }
 
-static const int saved_regs_index[] = {
-	/* spdif */
-	YDSXGR_SPDIFOUTCTRL,
-	YDSXGR_SPDIFOUTSTATUS,
-	YDSXGR_SPDIFINCTRL,
-	/* volumes */
-	YDSXGR_PRIADCLOOPVOL,
-	YDSXGR_NATIVEDACINVOL,
-	YDSXGR_NATIVEDACOUTVOL,
-	YDSXGR_BUF441OUTVOL,
-	YDSXGR_NATIVEADCINVOL,
-	YDSXGR_SPDIFLOOPVOL,
-	YDSXGR_SPDIFOUTVOL,
-	YDSXGR_ZVOUTVOL,
-	YDSXGR_LEGACYOUTVOL,
-	/* address bases */
-	YDSXGR_PLAYCTRLBASE,
-	YDSXGR_RECCTRLBASE,
-	YDSXGR_EFFCTRLBASE,
-	YDSXGR_WORKBASE,
-	/* capture set up */
-	YDSXGR_MAPOFREC,
-	YDSXGR_RECFORMAT,
-	YDSXGR_RECSLOTSR,
-	YDSXGR_ADCFORMAT,
-	YDSXGR_ADCSLOTSR,
-};
-#define YDSXGR_NUM_SAVED_REGS	ARRAY_SIZE(saved_regs_index)
-
 static int snd_ymfpci_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -2372,11 +2343,6 @@ int snd_ymfpci_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
-	chip->saved_regs = devm_kmalloc_array(&pci->dev, YDSXGR_NUM_SAVED_REGS,
-					      sizeof(u32), GFP_KERNEL);
-	if (!chip->saved_regs)
-		return -ENOMEM;
-
 	snd_ymfpci_proc_init(card, chip);
 
 	return 0;
-- 
2.25.1

