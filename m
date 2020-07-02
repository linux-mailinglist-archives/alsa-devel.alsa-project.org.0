Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8833212D62
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DAEB1705;
	Thu,  2 Jul 2020 21:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DAEB1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719477;
	bh=SIEI/SU8H3N6fgNJxxklNtGeL+4UYeYf1wcV6+qRdyo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H6BlENUkICGNWDwMq8kNQ7j+i3eqPQN3eR+KYBB17HkUthRqdhRlXMXHgrxvkDIta
	 lZmJxCa3qww2jS7HB7npVcNipmAz9c8Spl42Z9hff7ekStcuLb62PKpcv9r6UvatIW
	 znD6kNcYd/ZEMdYBq3JApuSsiZzgTvlz3SZ6ODfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 705A5F8038C;
	Thu,  2 Jul 2020 21:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4025DF80328; Thu,  2 Jul 2020 21:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69462F80308
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69462F80308
IronPort-SDR: JBBb859j2E2yBTheLOmSYGoNSWUyLxnCiTptKhZ7tEksC5pwZl3EACZaEaxGpRBLCtWF4exgzM
 XZc8WAyjixDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549369"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549369"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:33 -0700
IronPort-SDR: wyT0Wl/xHqzh3N//0II9xFDyi9PCC2ME14NUctFPmm9OaK0/8doLwCbMA4u8e8Mkkd5OoMjLBW
 gTTxrSw9MQJw==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116419"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 23/23] ALSA: pci/au88x0: remove "defined but not used"
 warnings
Date: Thu,  2 Jul 2020 14:36:04 -0500
Message-Id: <20200702193604.169059-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. Mark all unused tables with __maybe_unused.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/au88x0/au88x0_a3ddata.c |  8 +++----
 sound/pci/au88x0/au88x0_xtalk.c   | 36 +++++++++++++++----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_a3ddata.c b/sound/pci/au88x0/au88x0_a3ddata.c
index 18623cb6bc52..a5da3b3a546a 100644
--- a/sound/pci/au88x0/au88x0_a3ddata.c
+++ b/sound/pci/au88x0/au88x0_a3ddata.c
@@ -21,7 +21,7 @@ static const a3d_Hrtf_t A3dHrirZeros = {
 	0, 0, 0
 };
 
-static const a3d_Hrtf_t A3dHrirImpulse = {
+static __maybe_unused const a3d_Hrtf_t A3dHrirImpulse = {
 	0x7fff, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 	0, 0, 0,
 	0, 0, 0, 0,
@@ -30,7 +30,7 @@ static const a3d_Hrtf_t A3dHrirImpulse = {
 	0, 0, 0
 };
 
-static const a3d_Hrtf_t A3dHrirOnes = {
+static __maybe_unused const a3d_Hrtf_t A3dHrirOnes = {
 	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
 	0x7fff,
 	0x7fff,
@@ -47,7 +47,7 @@ static const a3d_Hrtf_t A3dHrirOnes = {
 	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff
 };
 
-static const a3d_Hrtf_t A3dHrirSatTest = {
+static __maybe_unused const a3d_Hrtf_t A3dHrirSatTest = {
 	0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff, 0x7fff,
 	0x7fff,
 	0x7fff,
@@ -59,7 +59,7 @@ static const a3d_Hrtf_t A3dHrirSatTest = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 };
 
-static const a3d_Hrtf_t A3dHrirDImpulse = {
+static __maybe_unused const a3d_Hrtf_t A3dHrirDImpulse = {
 	0, 0x7fff, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 	0, 0, 0,
 	0, 0, 0, 0,
diff --git a/sound/pci/au88x0/au88x0_xtalk.c b/sound/pci/au88x0/au88x0_xtalk.c
index 084fcbf8ae80..27859536d7c0 100644
--- a/sound/pci/au88x0/au88x0_xtalk.c
+++ b/sound/pci/au88x0/au88x0_xtalk.c
@@ -17,35 +17,35 @@
 static short const sXtalkWideKLeftEq = 0x269C;
 static short const sXtalkWideKRightEq = 0x269C;
 static short const sXtalkWideKLeftXt = 0xF25E;
-static short const sXtalkWideKRightXt = 0xF25E;
+static __maybe_unused short const sXtalkWideKRightXt = 0xF25E;
 static short const sXtalkWideShiftLeftEq = 1;
 static short const sXtalkWideShiftRightEq = 1;
 static short const sXtalkWideShiftLeftXt = 0;
-static short const sXtalkWideShiftRightXt = 0;
+static __maybe_unused short const sXtalkWideShiftRightXt = 0;
 static unsigned short const wXtalkWideLeftDelay = 0xd;
 static unsigned short const wXtalkWideRightDelay = 0xd;
 static short const sXtalkNarrowKLeftEq = 0x468D;
 static short const sXtalkNarrowKRightEq = 0x468D;
 static short const sXtalkNarrowKLeftXt = 0xF82E;
-static short const sXtalkNarrowKRightXt = 0xF82E;
+static __maybe_unused short const sXtalkNarrowKRightXt = 0xF82E;
 static short const sXtalkNarrowShiftLeftEq = 0x3;
 static short const sXtalkNarrowShiftRightEq = 0x3;
 static short const sXtalkNarrowShiftLeftXt = 0;
-static short const sXtalkNarrowShiftRightXt = 0;
+static __maybe_unused short const sXtalkNarrowShiftRightXt = 0;
 static unsigned short const wXtalkNarrowLeftDelay = 0x7;
 static unsigned short const wXtalkNarrowRightDelay = 0x7;
 
-static xtalk_gains_t const asXtalkGainsDefault = {
+static __maybe_unused xtalk_gains_t const asXtalkGainsDefault = {
 	0x4000, 0x4000, 0x4000, 0x4000, 0x4000,
 	0x4000, 0x4000, 0x4000, 0x4000,	0x4000
 };
 
-static xtalk_gains_t const asXtalkGainsTest = {
+static __maybe_unused xtalk_gains_t const asXtalkGainsTest = {
 	0x7fff, 0x8000, 0x0000, 0x0000, 0x0001,
 	0xffff, 0x4000, 0xc000, 0x0002, 0xfffe
 };
 
-static xtalk_gains_t const asXtalkGains1Chan = {
+static __maybe_unused xtalk_gains_t const asXtalkGains1Chan = {
 	0x7FFF, 0, 0, 0, 0,
 	0x7FFF, 0, 0, 0, 0,
 };
@@ -64,7 +64,7 @@ static xtalk_dline_t const alXtalkDlineZeros = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 };
-static xtalk_dline_t const alXtalkDlineTest = {
+static __maybe_unused xtalk_dline_t const alXtalkDlineTest = {
 	0x0000fc18, 0xfff03e8, 0x000186a0, 0xfffe7960, 1, 0xffffffff, 0, 0,
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 	0, 0, 0, 0, 0, 0, 0, 0
@@ -74,7 +74,7 @@ static xtalk_instate_t const asXtalkInStateZeros = {
 	0, 0, 0, 0
 };
 
-static xtalk_instate_t const asXtalkInStateTest = {
+static __maybe_unused xtalk_instate_t const asXtalkInStateTest = {
 	0x0080, 0xff80, 0x0001, 0xffff
 };
 
@@ -89,11 +89,11 @@ static xtalk_state_t const asXtalkOutStateZeros = {
 static short const sDiamondKLeftEq = 0x401d;
 static short const sDiamondKRightEq = 0x401d;
 static short const sDiamondKLeftXt = 0xF90E;
-static short const sDiamondKRightXt = 0xF90E;
+static __maybe_unused short const sDiamondKRightXt = 0xF90E;
 static short const sDiamondShiftLeftEq = 1;
 static short const sDiamondShiftRightEq = 1;
 static short const sDiamondShiftLeftXt = 0;
-static short const sDiamondShiftRightXt = 0;
+static __maybe_unused short const sDiamondShiftRightXt = 0;
 static unsigned short const wDiamondLeftDelay = 0xb;
 static unsigned short const wDiamondRightDelay = 0xb;
 
@@ -118,7 +118,7 @@ static xtalk_coefs_t const asXtalkWideCoefsLeftXt = {
 	{0x77dc, 0xc79e, 0xffb8, 0x000a, 0},
 	{0, 0, 0, 0, 0}
 };
-static xtalk_coefs_t const asXtalkWideCoefsRightXt = {
+static __maybe_unused xtalk_coefs_t const asXtalkWideCoefsRightXt = {
 	{0x55c6, 0xc97b, 0x005b, 0x0047, 0},
 	{0x6a60, 0xca20, 0xffc6, 0x0040, 0},
 	{0x6411, 0xd711, 0xfca1, 0x0190, 0},
@@ -149,7 +149,7 @@ static xtalk_coefs_t const asXtalkNarrowCoefsLeftXt = {
 	{0, 0, 0, 0, 0}
 };
 
-static xtalk_coefs_t const asXtalkNarrowCoefsRightXt = {
+static __maybe_unused xtalk_coefs_t const asXtalkNarrowCoefsRightXt = {
 	{0x3CB2, 0xDF49, 0xF6EA, 0x095B, 0},
 	{0x6777, 0xC915, 0xFEAF, 0x00B1, 0},
 	{0x7762, 0xC7D9, 0x025B, 0xFDA6, 0},
@@ -172,7 +172,7 @@ static xtalk_coefs_t const asXtalkCoefsPipe = {
 	{0, 0, 0x0FA0, 0, 0},
 	{0, 0, 0x1180, 0, 0},
 };
-static xtalk_coefs_t const asXtalkCoefsNegPipe = {
+static __maybe_unused xtalk_coefs_t const asXtalkCoefsNegPipe = {
 	{0, 0, 0xF380, 0, 0},
 	{0, 0, 0xF380, 0, 0},
 	{0, 0, 0xF380, 0, 0},
@@ -180,7 +180,7 @@ static xtalk_coefs_t const asXtalkCoefsNegPipe = {
 	{0, 0, 0xF200, 0, 0}
 };
 
-static xtalk_coefs_t const asXtalkCoefsNumTest = {
+static __maybe_unused xtalk_coefs_t const asXtalkCoefsNumTest = {
 	{0, 0, 0xF380, 0x8000, 0x6D60},
 	{0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0},
@@ -188,7 +188,7 @@ static xtalk_coefs_t const asXtalkCoefsNumTest = {
 	{0, 0, 0, 0, 0}
 };
 
-static xtalk_coefs_t const asXtalkCoefsDenTest = {
+static __maybe_unused xtalk_coefs_t const asXtalkCoefsDenTest = {
 	{0xC000, 0x2000, 0x4000, 0, 0},
 	{0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0},
@@ -196,7 +196,7 @@ static xtalk_coefs_t const asXtalkCoefsDenTest = {
 	{0, 0, 0, 0, 0}
 };
 
-static xtalk_state_t const asXtalkOutStateTest = {
+static __maybe_unused xtalk_state_t const asXtalkOutStateTest = {
 	{0x7FFF, 0x0004, 0xFFFC, 0},
 	{0xFE00, 0x0008, 0xFFF8, 0x4000},
 	{0x0200, 0x0010, 0xFFF0, 0xC000},
@@ -228,7 +228,7 @@ static xtalk_coefs_t const asDiamondCoefsLeftXt = {
 	{0, 0, 0, 0, 0}
 };
 
-static xtalk_coefs_t const asDiamondCoefsRightXt = {
+static __maybe_unused xtalk_coefs_t const asDiamondCoefsRightXt = {
 	{0x3B50, 0xFE08, 0xF959, 0x0060, 0},
 	{0x9FCB, 0xD8F1, 0x00A2, 0x003A, 0},
 	{0, 0, 0, 0, 0},
-- 
2.25.1

