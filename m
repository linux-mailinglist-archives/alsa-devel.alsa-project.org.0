Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3E3033A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 22:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5267D165F;
	Thu, 30 May 2019 22:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5267D165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559247623;
	bh=oSzJY/lKb2JD5wzX9rS/gQHixV7VFf4tzX8dnUyrgrw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EwSRtACg2k2h6Q+xM0yNmWqLPCBIEOK4kcM/2j2e5Sc6ZVH9GkWV169Bt0KarNIbM
	 IA1+zFMfNPXO3cqBwf22z1UQSNgCnxAoIq5nkfcnNirCyNqPqvh+IapQmbfixhyFzM
	 zckMJVpDQG0I+Okr2rePglw8sb7pblSafCreANiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9826F896F8;
	Thu, 30 May 2019 22:18:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DF4F896F8; Thu, 30 May 2019 22:18:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45ADF8065A
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 22:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45ADF8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 13:18:29 -0700
X-ExtLoop1: 1
Received: from egbruss-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.254.88.201])
 by orsmga003.jf.intel.com with ESMTP; 30 May 2019 13:18:28 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 30 May 2019 13:18:28 -0700
Message-Id: <20190530201828.2648-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH] ASoC: hda: increment codec device refcount
	when it is added to the card
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Calling snd_device_new() makes the codec devices managed by the card.
So, when the card is removed, the refcount for the codec
device is decremented and results in the codec device's kobject
being cleaned up if the refcount is 0. But, this leads to a NULL
pointer exception while attempting to remove the symlinks when the
codec driver is released later on. Therefore, increment the codec
device's refcount before adding it to the card to prevent this.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/pci/hda/hda_codec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b20eb7fc83eb..0d5d95b07e19 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -985,6 +985,14 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 		codec->core.subsystem_id, codec->core.revision_id);
 	snd_component_add(card, component);
 
+	/*
+	 * snd_device_new() makes the codec device managed by the card.
+	 * When the card is removed, the device reference count is
+	 * decremented. Therefore, increment it here to prevent removing
+	 * the codec device's kobject when the card is removed.
+	 */
+	get_device(hda_codec_dev(codec));
+
 	err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
 	if (err < 0)
 		goto error;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
