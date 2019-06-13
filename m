Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1744BD0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F0501867;
	Thu, 13 Jun 2019 21:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F0501867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453100;
	bh=2DOANJez1ei8Nr68q1BomA2okyI9YMAbl7OEWf9qKN8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FcBxeBpChvnznOYu/vuXGxwrA305cCxHxwhde0Y1+McGlavt8GiiBZBM/5W8oAJIF
	 e/HFKE2ScGnuCgtXrxDxBbG3d3BV0Ey67y67hJqVnaeePHaclMeFKh1ZN1wV/Qz5Jw
	 3DqdISWC9IIkij5ZCdMhF7kcs2kT2jNqt5RdeCNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0482F89754;
	Thu, 13 Jun 2019 21:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AAF9F8973D; Thu, 13 Jun 2019 21:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FEBDF89711
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FEBDF89711
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 12:05:36 -0700
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 12:05:34 -0700
From: cezary.rojewski@intel.com
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 21:04:36 +0200
Message-Id: <20190613190436.20156-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613190436.20156-1-cezary.rojewski@intel.com>
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, broonie@kernel.org, Kamil Lulko <kamilx.lulko@intel.com>
Subject: [alsa-devel] [PATCH 7/7] ASoC: Intel: Skylake: Strip T and L from
	TLV IPCs
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

From: Kamil Lulko <kamilx.lulko@intel.com>

cAVS modules do not require Type and Length header within the
set_module_params IPC. This is also true for Vendor modules. The
userspace (like tinymix) always appends this header to TLV controls
which are used for set_module_params. Simply assume this header is
always present in the payload and omit it from the IPC.

Signed-off-by: Kamil Lulko <kamilx.lulko@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-topology.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index c69d999d7bf1..76e971b8536a 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1492,22 +1492,18 @@ static int skl_tplg_tlv_control_set(struct snd_kcontrol *kcontrol,
 	struct skl *skl = get_skl_ctx(w->dapm->dev);
 
 	if (ac->params) {
+		/*
+		 * Widget data is expected to be stripped of T and L
+		 */
+		size -= 2 * sizeof(unsigned int);
+		data += 2;
+
 		if (size > ac->max)
 			return -EINVAL;
-
 		ac->size = size;
-		/*
-		 * if the param_is is of type Vendor, firmware expects actual
-		 * parameter id and size from the control.
-		 */
-		if (ac->param_id == SKL_PARAM_VENDOR_ID) {
-			if (copy_from_user(ac->params, data, size))
-				return -EFAULT;
-		} else {
-			if (copy_from_user(ac->params,
-					   data + 2, size))
-				return -EFAULT;
-		}
+
+		if (copy_from_user(ac->params, data, size))
+			return -EFAULT;
 
 		if (w->power)
 			return skl_set_module_params(skl->skl_sst,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
