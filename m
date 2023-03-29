Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756906CD13B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 06:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34E711EE;
	Wed, 29 Mar 2023 06:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34E711EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680064691;
	bh=YvhpzIOwnMIkfEnVFBguW1rULWG+3K+RW7YJnMZzEW0=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=bZOMRCX4a6yg5G4M/Fge/vIiIcdehOqLwu+h9rvmphFJFWHSb1IuP2CDsIkkBIq4u
	 wgsaCLSMKTdvMtk91Zag3rGEJtEMvnyqsIkTlSnIomcK3rr5i1rOwR1l9zvchBM7gQ
	 l4LzAd/C7If0e5bs6bV4PnESH/EIGYWRYgcJm2oM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B06AF8024E;
	Wed, 29 Mar 2023 06:37:19 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Use u16 consistently for old_legacy_ctrl
Date: Wed, 29 Mar 2023 07:36:27 +0300
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4FEJYG6GCTE6GFEVNRYDY5GOPBE3VY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168006463848.26.5973702077192164661@mailman-core.alsa-project.org>
From: Tasos Sahanidis via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tasos Sahanidis <tasos@tasossah.com>
Cc: tiwai@suse.com, tasos@tasossah.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F5C8F80272; Wed, 29 Mar 2023 06:37:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 02DF3F80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 06:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02DF3F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com
 header.a=rsa-sha256 header.s=vps header.b=TPxWI4dN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=81SeohqT7BrSin3WuibfGD8VK+kFaHuEYfKK3arcVaY=; b=TPxWI4dNpDzhzE+xeONiwT2XLb
	F0vP/n2ov+n3BvwYYve0Mdx6XlyLUDVLTZkjoTd5dahM2fkVOr9KfGWGj6KplZmZG7lXmGvMECOPO
	holoR7OCBAWPDS6Ct9DW0WuUXMz/FFzaIwBA5rEh6HUdN/bW0AH/SGX2pgBwFZzihj7U=;
Received: from [2a02:587:6a11:9400::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1phNYI-00Guoj-2I; Wed, 29 Mar 2023 07:36:50 +0300
From: Tasos Sahanidis <tasos@tasossah.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ymfpci: Use u16 consistently for old_legacy_ctrl
Date: Wed, 29 Mar 2023 07:36:27 +0300
Message-Id: <20230329043627.178899-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E4FEJYG6GCTE6GFEVNRYDY5GOPBE3VY3
X-Message-ID-Hash: E4FEJYG6GCTE6GFEVNRYDY5GOPBE3VY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E4FEJYG6GCTE6GFEVNRYDY5GOPBE3VY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There's no need to switch between unsigned short and u16, especially since
all the functions that end up using old_legacy_ctrl specify u16 anyway.

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 sound/pci/ymfpci/ymfpci.h      | 4 ++--
 sound/pci/ymfpci/ymfpci_main.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.h b/sound/pci/ymfpci/ymfpci.h
index 669687764..d11f9bf5a 100644
--- a/sound/pci/ymfpci/ymfpci.h
+++ b/sound/pci/ymfpci/ymfpci.h
@@ -276,7 +276,7 @@ struct snd_ymfpci {
 	unsigned long reg_area_phys;
 	void __iomem *reg_area_virt;
 
-	unsigned short old_legacy_ctrl;
+	u16 old_legacy_ctrl;
 #ifdef SUPPORT_JOYSTICK
 	struct gameport *gameport;
 #endif
@@ -355,7 +355,7 @@ struct snd_ymfpci {
 
 int snd_ymfpci_create(struct snd_card *card,
 		      struct pci_dev *pci,
-		      unsigned short old_legacy_ctrl);
+		      u16 old_legacy_ctrl);
 void snd_ymfpci_free_gameport(struct snd_ymfpci *chip);
 
 extern const struct dev_pm_ops snd_ymfpci_pm;
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index 2858736ed..d44ecd916 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -2309,7 +2309,7 @@ SIMPLE_DEV_PM_OPS(snd_ymfpci_pm, snd_ymfpci_suspend, snd_ymfpci_resume);
 
 int snd_ymfpci_create(struct snd_card *card,
 		      struct pci_dev *pci,
-		      unsigned short old_legacy_ctrl)
+		      u16 old_legacy_ctrl)
 {
 	struct snd_ymfpci *chip = card->private_data;
 	int err;
-- 
2.25.1

