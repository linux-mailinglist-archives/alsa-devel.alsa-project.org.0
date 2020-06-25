Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C983209E20
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 14:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E673418C9;
	Thu, 25 Jun 2020 14:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E673418C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593086914;
	bh=22e/obb5ShwM0dLH10zu4DerUoff0JgSOBne0CP8iCk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcdPTQQNFIN9wR3Xpa4CquqmPpSSSl408DF/gOgLLgOOQVwseQcfxuTWcEI47KAwy
	 FmnOH+aItb1tTW0MWBkc4HOJVxFZ5T1nyCxQhdQ80A/J2Ja5n2YDCZGCPIPkhdDLpr
	 /WmjAkKyBK+8D69w6kr5eQb3dpEmJSXs4PTRBza4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4952FF80234;
	Thu, 25 Jun 2020 14:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55781F802A8; Thu, 25 Jun 2020 14:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B626FF8023E
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 14:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B626FF8023E
IronPort-SDR: vKyC13sWMpdzRxf22YOwn75lEavN74vQigf2rSf5Zv39KwPYdSx1iPF0uCCE/osVJMivFfHzdC
 idP/2j9NwHgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="206389932"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="206389932"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 05:05:39 -0700
IronPort-SDR: OWGI6IkvYC6vFsFNzniIIo0sWEKSlIDlzsbc4PS25rQINq/5lz0Hj+bY4IXiXt1IzDxPwzHmh7
 pyRSkQtrqfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="354438957"
Received: from test-hp-compaq-8100-elite-cmt-pc.igk.intel.com ([10.237.149.93])
 by orsmga001.jf.intel.com with ESMTP; 25 Jun 2020 05:05:37 -0700
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 4/8] topology: decode: Change declaration of enum
 decoding function
Date: Thu, 25 Jun 2020 13:03:42 +0200
Message-Id: <1593083026-7501-4-git-send-email-piotrx.maziarz@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
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
index 24eadc8..b5e3e34 100644
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
@@ -1425,7 +1413,10 @@ next:
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

