Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FA25762B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF611731;
	Mon, 31 Aug 2020 11:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF611731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598865142;
	bh=aM11ciCeIs5wcpLDnfPDUnJUi6z7A4cBRtOd3Ix61Dw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ozH4XM2KSphdIxfscyc+fwpSDpan9WOhY775GqeqdgXLfkYfISyzIPwDtB/yaNZOc
	 EIK/6oIC22dkGX/TA7Fb8TnNXRCHExBdZhqcxTcX9qpxhPybyOu4gGjPOh7YA6Nkcw
	 OxcVQ6V+BGMkLymfihWWRO8QRxtxZY4Po6bRTIio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BC81F802E8;
	Mon, 31 Aug 2020 11:08:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B69A3F80257; Mon, 31 Aug 2020 11:08:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBFBFF80257
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 11:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFBFF80257
IronPort-SDR: uriUJvDlBRKD57f6pvMFBs93Jhz7XyuewfWbsmVlrRGmzViGGPgaevS61Wi2jdkTPMiFX7TnzA
 RQ/68Fgkx6gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="136466765"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="136466765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 02:08:12 -0700
IronPort-SDR: x48NpKKF30kTAHhKMxBwdlVLSUsggnfXDDGcXqYnsxVKMMLCuuKvNlnDAeThPkKqY0agjSBfTY
 BHddfYc3B2sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; d="scan'208";a="314286896"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga002.jf.intel.com with ESMTP; 31 Aug 2020 02:08:11 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 06/10] topology: decode: Change declaration of enum
 decoding function
Date: Mon, 31 Aug 2020 11:08:59 +0200
Message-Id: <1598864943-22883-7-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

