Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348BE4B1144
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 16:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B939A16A9;
	Thu, 10 Feb 2022 16:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B939A16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644505643;
	bh=+resf7s8/0bfeptpaysoY6mJLYoPAYzroKommF5fV40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYPanlxgt3bBgiXkkaSkT1cx0UbUYpN0PC3H1373NXprye/EXKFLUtOCKpQAGnJYl
	 SZLEls21WNjT6vw6c4XjisxDFk9MbhZOlOC4NWUSdR3D/YpJOK0c/KRGQWpFTrcgrf
	 MGeBF/ToN/eMCI9CcCJVtExGfovUy0vmqBp0oeEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 221E1F8016C;
	Thu, 10 Feb 2022 16:05:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D85CF800A7; Thu, 10 Feb 2022 16:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C54F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 16:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C54F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XM7yRSAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644505538; x=1676041538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+resf7s8/0bfeptpaysoY6mJLYoPAYzroKommF5fV40=;
 b=XM7yRSASnhy3BJbgsCsGi5DlzpplKO3etosoir30QNs3G61tVq7WhXBn
 +S9F6/iy28HsAkrQay4Utg/p0cT4z7+Sckneyu8eETXEnbx/SHPzaeTbx
 +GB8ZCUwHE1NMpkMc2qMq7UnF0e4W66Rd7iw5Tn2VC2+wzypg9oDgbezL
 m1Pnt0qD+WQqyDKcYmd4lHesqTKXLFHymUS/MqTU0ive/h1cgSfr+HGMp
 rDeLc3v/HrAc5WRpQwYlEyToG5bOnx2C2EV7IQ0KnUPh3JHQTaSOuAK5c
 0QmlxbwSFROGztXkXDnRozAZgJwzzZRvOZFP6wICkjcFIxAgqZCWB7ujP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249714965"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249714965"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="500422594"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:33 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH v2 2/9] ASoC: SOF: Move the definition of enum
 sof_dsp_power_states to global header
Date: Thu, 10 Feb 2022 17:05:18 +0200
Message-Id: <20220210150525.30756-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
References: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Move the enum sof_dsp_power_states to include/sound/sof.h
to be accessible outside of the core SOF stack.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/sof.h      | 8 ++++++++
 sound/soc/sof/sof-priv.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 813680ab9aad..7cdfc954df12 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -39,6 +39,14 @@ enum sof_fw_state {
 	SOF_FW_CRASHED,
 };
 
+/* DSP power states */
+enum sof_dsp_power_states {
+	SOF_DSP_PM_D0,
+	SOF_DSP_PM_D1,
+	SOF_DSP_PM_D2,
+	SOF_DSP_PM_D3,
+};
+
 /*
  * SOF Platform data.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6358f8c84cce..2e474048d708 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -79,14 +79,6 @@ bool sof_debug_check_flag(int mask);
 /* max number of DSP cores */
 #define SOF_MAX_DSP_NUM_CORES 8
 
-/* DSP power state */
-enum sof_dsp_power_states {
-	SOF_DSP_PM_D0,
-	SOF_DSP_PM_D1,
-	SOF_DSP_PM_D2,
-	SOF_DSP_PM_D3,
-};
-
 struct sof_dsp_power_state {
 	u32 state;
 	u32 substate; /* platform-specific */
-- 
2.35.1

