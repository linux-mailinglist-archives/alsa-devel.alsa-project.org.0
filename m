Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2775C0CC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:07:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46CA85D;
	Fri, 21 Jul 2023 10:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46CA85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926855;
	bh=SuJwK7lqr4jOuKZ5CcskM7W9hyUpksE4t0vIhKghGLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JxIWpJSWT/H3s3BAJ0ioTTyrlSY6NpcF5+08XszpCrlmEeDBtVivj3K0F0+Drl4nh
	 juQ9aZ/Uot8knrdmVvIV0rX1ZpsBy0C6VJRAhP93iQWfN3G2hcSbiE3oWgETosMnTU
	 zShG7uhFwKT6T+P0/o0f2Ll0dXbq85JB0QvLYgWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 181F3F805AD; Fri, 21 Jul 2023 10:06:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6121DF805A8;
	Fri, 21 Jul 2023 10:06:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65411F8055B; Wed, 19 Jul 2023 18:42:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 98AD4F80494;
	Wed, 19 Jul 2023 18:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98AD4F80494
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
Subject: [PATCH v2 4/9] ALSA: hda/i915: Allow xe as match for
 i915_component_master_match
Date: Wed, 19 Jul 2023 18:41:36 +0200
Message-Id: <20230719164141.228073-5-maarten.lankhorst@linux.intel.com>
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
Message-ID-Hash: FNST2ZXJQ3P5AQDE4JACIR2DLP5THSX7
X-Message-ID-Hash: FNST2ZXJQ3P5AQDE4JACIR2DLP5THSX7
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:05:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNST2ZXJQ3P5AQDE4JACIR2DLP5THSX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

xe is a new driver for intel GPU's that shares the sound related code
with i915.

Don't allow it to be modprobed though; the module is not upstream yet
and we should exclusively use the EPROBE_DEFER mechanism.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 sound/hda/hdac_i915.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 961fcd3397f40..12c1f8d93499f 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -115,7 +115,8 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
 	hdac_pci = to_pci_dev(bus->dev);
 	i915_pci = to_pci_dev(dev);
 
-	if (!strcmp(dev->driver->name, "i915") &&
+	if ((!strcmp(dev->driver->name, "i915") ||
+		 !strcmp(dev->driver->name, "xe")) &&
 	    subcomponent == I915_COMPONENT_AUDIO &&
 	    connectivity_check(i915_pci, hdac_pci))
 		return 1;
-- 
2.39.2

