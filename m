Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E0C2351
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 16:32:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF3401654;
	Mon, 30 Sep 2019 16:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF3401654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569853933;
	bh=DN2hJkIbpZ75H+Klnc0AVXPh+/fMFDJgGcd1dwa2UlU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CvMU8cNz5vBMQP0HdM8P7dbfCSTIA+0ChJBqVMVDEp1FkwxJQ+rNWCcV627UjaZOR
	 njIj/vSm/RMMS0X6+iNa9WWoZqFfoBEQyMgLQbJ06j+oINPDmeKOzVA69sjcRqMt/D
	 lEIGglG1qOVMMpYb3kUUCBuYrpco9hwQSZPrqCV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08005F800D0;
	Mon, 30 Sep 2019 16:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BA3CF8036E; Mon, 30 Sep 2019 16:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 325A3F800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 16:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 325A3F800D0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 07:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; d="scan'208";a="390841926"
Received: from araj-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.26.24])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2019 07:30:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 30 Sep 2019 09:29:45 -0500
Message-Id: <20190930142945.7805-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hdac: clear link output stream mapping
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@linux.intel.com>

Fix potential DMA hang upon starting playback on devices in HDA mode
on Intel platforms (Gemini Lake/Whiskey Lake/Comet Lake/Ice Lake). It
doesn't affect platforms before Gemini Lake or any Intel device in
non-HDA mode.

The reset value for the LOSDIV register is all output streams valid.
Clear this register to invalidate non-existent streams when the bus
is powered up.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/hda_register.h        | 3 +++
 sound/hda/ext/hdac_ext_controller.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index 0fd39295b426..057d2a2d0bd0 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -264,6 +264,9 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_REG_ML_LOUTPAY		0x20
 #define AZX_REG_ML_LINPAY		0x30
 
+/* bit0 is reserved, with BIT(1) mapping to stream1 */
+#define ML_LOSIDV_STREAM_MASK		0xFFFE
+
 #define ML_LCTL_SCF_MASK			0xF
 #define AZX_MLCTL_SPA				(0x1 << 16)
 #define AZX_MLCTL_CPA				(0x1 << 23)
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index 211ca85acd8c..cfab60d88c92 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -270,6 +270,11 @@ int snd_hdac_ext_bus_link_get(struct hdac_bus *bus,
 
 		ret = snd_hdac_ext_bus_link_power_up(link);
 
+		/*
+		 * clear the register to invalidate all the output streams
+		 */
+		snd_hdac_updatew(link->ml_addr, AZX_REG_ML_LOSIDV,
+				 ML_LOSIDV_STREAM_MASK, 0);
 		/*
 		 *  wait for 521usec for codec to report status
 		 *  HDA spec section 4.3 - Codec Discovery
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
