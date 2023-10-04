Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBF7B9BB1
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 10:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4584ECE;
	Thu,  5 Oct 2023 10:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4584ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492853;
	bh=WJocYPAyB1bcQhLubf27KQJMUy72Fq/6gayLT2+nBPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kv7ZLV8MiXhfaELKQ7n2UqKOb6EBITOJUj3ka5TZYjDAGKE2KgwALQbEsm7wS9dPZ
	 beim6Noow/ssuvHhTmKpjjz/ef/FAxrzZtP8S6/Vy1v5tL7YumdASKGjVj8lrWibvi
	 Q0kTQ/1oVRmLvohSQph7vzQ+pBcaGK8WeSjId0Zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2183F8057E; Thu,  5 Oct 2023 09:54:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70753F80568;
	Thu,  5 Oct 2023 09:54:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B6A0F80310; Wed,  4 Oct 2023 16:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2996EF80567;
	Wed,  4 Oct 2023 16:56:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2996EF80567
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v6 07/12] ALSA: hda: i915: Allow xe as match for
 i915_component_master_match
Date: Wed,  4 Oct 2023 16:55:35 +0200
Message-Id: <20231004145540.32321-8-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4KFMXHPMJJVOWYU3VTOK6X67VA4VV4O4
X-Message-ID-Hash: 4KFMXHPMJJVOWYU3VTOK6X67VA4VV4O4
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:53:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KFMXHPMJJVOWYU3VTOK6X67VA4VV4O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Xe is a new driver for intel GPU's that shares the sound related code
with i915.

The modprobe mechanism is being replaced by the -EPROBE_DEFER mechanism,
so we don't need to add a modprobe xe call. Adding this would have
required a telepathy module to correctly guess whether to load i915 or
xe.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/hda/hdac_i915.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index ffa35d7a367c..0765e5350e7b 100644
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
2.40.1

