Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123822177A9
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE241614;
	Tue,  7 Jul 2020 21:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE241614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149174;
	bh=4ADwPdcr/3Rj6WI8FhSMGgNK/y3jxNgp0pQ4YIvqhL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wm3DG/v4q0xr2g9C8jPIu3Ha7bolwa6DAvCGWosJwb8jzLisSJvHVoZpQ5C3OnxaA
	 32/saGKRlA1jmb6Du5kT+fO8KuEpH5M7yasTkDFxkpK8WnZCTUn898QWRK7d8oUcyE
	 HFlFSAi1GAxIDgOCRj2W47SoBlZJbmL1Nz44kRb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A88C4F80216;
	Tue,  7 Jul 2020 21:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B003F802FD; Tue,  7 Jul 2020 21:06:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80C38F802DD
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80C38F802DD
IronPort-SDR: Ed/ir11hN5+CYZ2LbByfOZ54qR3FgOPFPdlsUubGkU8PBGX0eNPwVbn2sJZp918GlOG6WNZcI+
 KmlvLO36HrCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202924"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202924"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:47 -0700
IronPort-SDR: np5h6z3uYM5ayhkdF+jDw9VOs2oMJMXG8Ow97LTi0iDGjwbWyuFe1MCE7Ift8BwN9owYOHxmc5
 F7aYlZdLp3Kw==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278616"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 09/13] ASoC: ti: omap-mcbsp-st: Remove set,
 but unused variable 'w'
Date: Tue,  7 Jul 2020 14:06:08 -0500
Message-Id: <20200707190612.97799-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Samuel Ortiz <samuel.ortiz@nokia.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 broonie@kernel.org, linux-omap@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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

From: Lee Jones <lee.jones@linaro.org>

Looks like 'w' has remained unchecked since the driver's inception.

Fixes the following W=1 kernel build warning(s):

 sound/soc/ti/omap-mcbsp-st.c: In function ‘omap_mcbsp_st_chgain’:
 sound/soc/ti/omap-mcbsp-st.c:145:6: warning: variable ‘w’ set but not used [-Wunused-but-set-variable]

Peter suggested that the whole read can be removed, so that's
been done too.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/ti/omap-mcbsp-st.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 5a32b54bbf3b..0bc7d26c660a 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -142,11 +142,8 @@ static void omap_mcbsp_st_fir_write(struct omap_mcbsp *mcbsp, s16 *fir)
 
 static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
 {
-	u16 w;
 	struct omap_mcbsp_st_data *st_data = mcbsp->st_data;
 
-	w = MCBSP_ST_READ(mcbsp, SSELCR);
-
 	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
 		       ST_CH1GAIN(st_data->ch1gain));
 }
-- 
2.25.1

