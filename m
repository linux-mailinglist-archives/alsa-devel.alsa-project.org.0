Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9611921F141
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31ADE15F2;
	Tue, 14 Jul 2020 14:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31ADE15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594729881;
	bh=B5v9gi6bh34SR9XaJHtUp8mYk1pGUQoVsgZNb662Fsk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXEdQt08yXVZ07CHscjsglMixF14+GIhL8MGXaoApA6EbbHG4f1x7bjGNrNUFT9gl
	 tlcPbtmUg7ZV9oUVwLLArH/irwnKnbLRx/iGpmeDWbU/heLLN79aDz/QrAS6ps8V30
	 LIMI3xtL/nslbaRivwCU8CGlDpRr6ScztiObVcFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67894F802E2;
	Tue, 14 Jul 2020 14:27:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8409F8027B; Tue, 14 Jul 2020 14:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F9EBF8020C
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9EBF8020C
IronPort-SDR: a3XK43BzHQeg4YlNIRz6gNTmJOITKE/7W7A3r5xpN3Sv6VkdoP/zgVPFf7QyXOM7uFKhql7RMq
 zEvhGoxi1b0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166981794"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="166981794"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:26:34 -0700
IronPort-SDR: VM+E7Bl6mwONDdffefmvAu7CwNwuaJnDLOoAmw3PbtwtnZeolgHiYafDi+q9C4u/zhLVHI/304
 RCsIexfwQndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="485860432"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2020 05:26:32 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 06/10] topology: decode: Change declaration of enum
 decoding function
Date: Tue, 14 Jul 2020 13:25:07 +0200
Message-Id: <1594725911-14308-7-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Size constraints are always checked before invoking
tplg_decode_control_enum1. There is no need to validate it twice.
Alos moved debug print about size to invoking function, since now it's it
responsibility to check size.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
---
 src/topology/ctl.c        | 19 +++++--------------
 src/topology/dapm.c       |  3 +--
 src/topology/tplg_local.h |  2 +-
 3 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/src/topology/ctl.c b/src/topology/ctl.c
index 1f39846..47db400 100644
--- a/src/topology/ctl.c
+++ b/src/topology/ctl.c
@@ -1335,22 +1335,10 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 			      struct list_head *heap,
 			      struct snd_tplg_enum_template *et,
 			      size_t pos,
-			      void *bin, size_t size)
+			      struct snd_soc_tplg_enum_control *ec)
 {
-	struct snd_soc_tplg_enum_control *ec = bin;
 	int i;
 
-	if (size < sizeof(*ec)) {
-		SNDERR("enum: small size %d", size);
-		return -EINVAL;
-	}
-
-	tplg_log(tplg, 'D', pos, "enum: size %d private size %d",
-		 ec->size, ec->priv.size);
-	if (size != ec->size + ec->priv.size) {
-		SNDERR("enum: unexpected element size %d", size);
-		return -EINVAL;
-	}
 	if (ec->num_channels > SND_TPLG_MAX_CHAN ||
 	    ec->num_channels > SND_SOC_TPLG_MAX_CHAN) {
 		SNDERR("enum: unexpected channel count %d", ec->num_channels);
@@ -1427,7 +1415,10 @@ next:
 		return -EINVAL;
 	}
 
-	err = tplg_decode_control_enum1(tplg, &heap, &et, pos, bin, size);
+	tplg_log(tplg, 'D', pos, "enum: size %d private size %d",
+		 ec->size, ec->priv.size);
+
+	err = tplg_decode_control_enum1(tplg, &heap, &et, pos, ec);
 	if (err >= 0) {
 		t.enum_ctl = &et;
 		err = snd_tplg_add_object(tplg, &t);
diff --git a/src/topology/dapm.c b/src/topology/dapm.c
index cd1a877..73a9390 100644
--- a/src/topology/dapm.c
+++ b/src/topology/dapm.c
@@ -972,8 +972,7 @@ next:
 				err = -EINVAL;
 				goto retval;
 			}
-			err = tplg_decode_control_enum1(tplg, &heap, et, pos,
-							bin, size2);
+			err = tplg_decode_control_enum1(tplg, &heap, et, pos, ec);
 			break;
 		case SND_SOC_TPLG_TYPE_BYTES:
 			bt = tplg_calloc(&heap, sizeof(*bt));
diff --git a/src/topology/tplg_local.h b/src/topology/tplg_local.h
index 5ace0d1..acb01a8 100644
--- a/src/topology/tplg_local.h
+++ b/src/topology/tplg_local.h
@@ -398,7 +398,7 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
 			      struct list_head *heap,
 			      struct snd_tplg_enum_template *et,
 			      size_t pos,
-			      void *bin, size_t size);
+			      struct snd_soc_tplg_enum_control *ec);
 int tplg_decode_control_enum(snd_tplg_t *tplg, size_t pos,
 			     struct snd_soc_tplg_hdr *hdr,
 			     void *bin, size_t size);
-- 
2.7.4

