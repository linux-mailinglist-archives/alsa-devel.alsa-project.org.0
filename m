Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9775C0CB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A95820;
	Fri, 21 Jul 2023 10:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A95820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926852;
	bh=y86V53vTGjiD5QKnUoY3xUhGQpmwE4+fFX8Km+TrbRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O3Uls5oUg1+oV5dFFZ8eJIVZeisfzrzMNMgkIIN5XSjegP8BDZH6kkv+fCAf71sPh
	 ivOkRRSIxFcbDIqnBDDcIyPHLkaS5F6fV++Awly9MxwaM539eZ1qwoGAEUaYLi3laA
	 WfgpQgd8rIrQLaGcFlxlwTOhRaO0r3JD4XlFo7cs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B95F8057B; Fri, 21 Jul 2023 10:06:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FBDDF8057F;
	Fri, 21 Jul 2023 10:06:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38154F80548; Wed, 19 Jul 2023 18:42:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABE29F8032D;
	Wed, 19 Jul 2023 18:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE29F8032D
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2 1/9] ALSA: hda/intel: Fix error handling in azx_probe()
Date: Wed, 19 Jul 2023 18:41:33 +0200
Message-Id: <20230719164141.228073-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZAJCSI55EWTJ7KKN7LTWU5LL4NZRQMDC
X-Message-ID-Hash: ZAJCSI55EWTJ7KKN7LTWU5LL4NZRQMDC
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:05:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAJCSI55EWTJ7KKN7LTWU5LL4NZRQMDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add missing pci_set_drv to NULL call on error.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 sound/pci/hda/hda_intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ef831770ca7da..0d2d6bc6c75ef 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2188,6 +2188,7 @@ static int azx_probe(struct pci_dev *pci,
 	return 0;
 
 out_free:
+	pci_set_drvdata(pci, NULL);
 	snd_card_free(card);
 	return err;
 }
-- 
2.39.2

