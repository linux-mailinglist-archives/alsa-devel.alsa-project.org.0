Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74512344BD4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 17:39:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883CD1666;
	Mon, 22 Mar 2021 17:38:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883CD1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616431179;
	bh=uRxpWETB/mpDFe9RtdthYiJcp3fbVszmuvQjZmEYZ88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIK1mDzKzZo/XcOdLEt1MLpcgCE6Z1Ds6Dt4+oqzWuxYas0deBenDW4hJwbc5r4WA
	 L1FUj/DifZVRXERKlxvJzCkhA67ASYf9KrMOuBIRBJKgrB4HfkVtnUhl1yxOe0J0pY
	 I+m8Z+xNQCrnyWFXfd4uGcWDoUqvm9cPNBM0Gxq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12DA3F80156;
	Mon, 22 Mar 2021 17:38:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 943C7F8025F; Mon, 22 Mar 2021 17:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB63AF80156
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 17:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB63AF80156
IronPort-SDR: a1s/+m0Na+dPOeE9qyLg6xQVleJNRqLBAYZzYfGahpXoJZCCvrihmKFk5uhbzWFiwdonaEocPM
 tQz/KEqUYaOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210376600"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="210376600"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:41 -0700
IronPort-SDR: QXwpPRSZvMmc+io1FnIQ4fvdIEa/Uq+z/g2htAJpn9O+SjKZUkmmw86xIcuaLgOO6cFFp62UWu
 rlsRh3NAoqqQ==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407899057"
Received: from josemari-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.40.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/8] ASoC: SOF: Intel: HDA: fix core status verification
Date: Mon, 22 Mar 2021 11:37:21 -0500
Message-Id: <20210322163728.16616-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
References: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

When checking for enabled cores it isn't enough to check that
some of the requested cores are running, we have to check that
all of them are.

Fixes: 747503b1813a ("ASoC: SOF: Intel: Add Intel specific HDA DSP HW operations")
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 6e24e1cb13f9..1f1ce7036764 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -226,10 +226,17 @@ bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev,
 
 	val = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPCS);
 
-	is_enable = (val & HDA_DSP_ADSPCS_CPA_MASK(core_mask)) &&
-		    (val & HDA_DSP_ADSPCS_SPA_MASK(core_mask)) &&
-		    !(val & HDA_DSP_ADSPCS_CRST_MASK(core_mask)) &&
-		    !(val & HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
+#define MASK_IS_EQUAL(v, m, field) ({	\
+	u32 _m = field(m);		\
+	((v) & _m) == _m;		\
+})
+
+	is_enable = MASK_IS_EQUAL(val, core_mask, HDA_DSP_ADSPCS_CPA_MASK) &&
+		MASK_IS_EQUAL(val, core_mask, HDA_DSP_ADSPCS_SPA_MASK) &&
+		!(val & HDA_DSP_ADSPCS_CRST_MASK(core_mask)) &&
+		!(val & HDA_DSP_ADSPCS_CSTALL_MASK(core_mask));
+
+#undef MASK_IS_EQUAL
 
 	dev_dbg(sdev->dev, "DSP core(s) enabled? %d : core_mask %x\n",
 		is_enable, core_mask);
-- 
2.25.1

