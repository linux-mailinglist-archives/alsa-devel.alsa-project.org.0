Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAF6CD11C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 06:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DDAD1F1;
	Wed, 29 Mar 2023 06:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DDAD1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680063403;
	bh=6vx1Lb5SegnTjMm1n5QwqwKVxUHh3miCTZYweYGbO74=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Oen/Sg7ONyh5e3agPrIft20Qi5gm9tRCyJ7ywPztrN4+lbPdgaC21L4lwlVA0f6FY
	 Bx4QrKqzyEBNL6CBxUL5l82kkQdt/qdf2cIZ7e+LGla6+gAyTQ/TC8J5Dv5SZN4VK7
	 gnKnB/83La76hdkYfEhBZWTVaGM9IDNGkbCSodRM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B486FF80423;
	Wed, 29 Mar 2023 06:15:51 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: ymfpci: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed, 29 Mar 2023 07:14:37 +0300
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZIBAOTSXDK4JQTV45M2DDXUBNCNOFPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006335063.26.17112137661731848878@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C56B3F80423; Wed, 29 Mar 2023 06:15:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AC6E8F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 06:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC6E8F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=uXIrbHkd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NTLfGkPvmtEzlTW5uIBVbxADwJQj7zhenA7S7MwRCFg=; b=uXIrbHkdd0DmXfiUh8++3NcNaR
	rpLyRHX6um3vvfJf/WsEWKHRTN37Rzm7rcEIcf3lgz8eTgobnb/y0b8i8FzA1PewfVRpPiY7jmSf6
	jgbmEjSnNF94HIXshBdhyAEg573O81NjSF9MN1bc5m50mA+6kpO5tSVu7VRgz9aZisX8=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phNDP-00GucY-7f; Wed, 29 Mar 2023 07:15:15 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: ymfpci: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed, 29 Mar 2023 07:14:37 +0300
Message-Id: <20230329041440.177363-2-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329041440.177363-1-tasos@tasossah.com>
References: <20230329041440.177363-1-tasos@tasossah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZIBAOTSXDK4JQTV45M2DDXUBNCNOFPH
X-Message-ID-Hash: DZIBAOTSXDK4JQTV45M2DDXUBNCNOFPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZIBAOTSXDK4JQTV45M2DDXUBNCNOFPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate
old ones") SIMPLE_DEV_PM_OPS has been marked deprecated.

The intent is to remove CONFIG_PM_SLEEP guards for PM callbacks. As such
the ifdefs are now removed.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.c      | 4 +---
 sound/pci/ymfpci/ymfpci.h      | 2 --
 sound/pci/ymfpci/ymfpci_main.c | 6 +-----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index 1e198e4d5..30109aa0f 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -337,11 +337,9 @@ static struct pci_driver ymfpci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ymfpci_ids,
 	.probe = snd_card_ymfpci_probe,
-#ifdef CONFIG_PM_SLEEP
 	.driver = {
-		.pm = &snd_ymfpci_pm,
+		.pm = pm_sleep_ptr(&snd_ymfpci_pm),
 	},
-#endif
 };
 
 module_pci_driver(ymfpci_driver);
diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index 669687764..2103654c6 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -345,12 +345,10 @@ struct snd_ymfpci {
 	const struct firmware *dsp_microcode;
 	const struct firmware *controller_microcode;
 
-#ifdef CONFIG_PM_SLEEP
 	u32 *saved_regs;
 	u32 saved_ydsxgr_mode;
 	u16 saved_dsxg_legacy;
 	u16 saved_dsxg_elegacy;
-#endif
 };
 
 int snd_ymfpci_create(struct snd_card *card,
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 2858736ed..6d13f4152 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2220,7 +2220,6 @@ static void snd_ymfpci_free(struct snd_card *card)
 	release_firmware(chip->controller_microcode);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static const int saved_regs_index[] = {
 	/* spdif */
 	YDSXGR_SPDIFOUTCTRL,
@@ -2304,8 +2303,7 @@ static int snd_ymfpci_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(snd_ymfpci_pm, snd_ymfpci_suspend, snd_ymfpci_resume);
-#endif /* CONFIG_PM_SLEEP */
+DEFINE_SIMPLE_DEV_PM_OPS(snd_ymfpci_pm, snd_ymfpci_suspend, snd_ymfpci_resume);
 
 int snd_ymfpci_create(struct snd_card *card,
 		      struct pci_dev *pci,
@@ -2374,12 +2372,10 @@ int snd_ymfpci_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
-#ifdef CONFIG_PM_SLEEP
 	chip->saved_regs = devm_kmalloc_array(&pci->dev, YDSXGR_NUM_SAVED_REGS,
 					      sizeof(u32), GFP_KERNEL);
 	if (!chip->saved_regs)
 		return -ENOMEM;
-#endif
 
 	snd_ymfpci_proc_init(card, chip);
 
-- 
2.25.1

