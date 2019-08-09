Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74EA874ED
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 11:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4202F1663;
	Fri,  9 Aug 2019 11:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4202F1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565341979;
	bh=57HdWpGWAV8nTFRlA2tXZ8MZ6kocIF8zOEk8Doe8fJY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iLNJwi3PomQkUSPfR2LYj8aDEx/Wx6759PkPgWeu1XUxB94gamw0QZEXxxLro0KmG
	 YV1mhvVwp5msSIBPBkswRZUEgcd+pRZtBVoBi7/KfW5pAFAUcOZLDjWEd+9RAfOHos
	 6pe5PqQKmSuFuSH2i35nx1TavnXxufrYUUhMG7mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F32F8036B;
	Fri,  9 Aug 2019 11:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6B79F803F3; Fri,  9 Aug 2019 11:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D7B8F8036B
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 11:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7B8F8036B
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3196522D7CAED50D4FE6;
 Fri,  9 Aug 2019 17:11:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 9 Aug 2019
 17:10:56 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <broonie@kernel.org>,
 <rfontana@redhat.com>, <kstewart@linuxfoundation.org>, <allison@lohutok.net>, 
 <armijn@tjaldur.nl>
Date: Fri, 9 Aug 2019 17:06:20 +0800
Message-ID: <20190809090620.70496-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ALSA: Au88x0 - remove some unused const
	variables
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

sound/pci/au88x0/au88x0_xtalk.c:121:28: warning: asXtalkWideCoefsRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:152:28: warning: asXtalkNarrowCoefsRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:175:28: warning: asXtalkCoefsNegPipe defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:183:28: warning: asXtalkCoefsNumTest defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:191:28: warning: asXtalkCoefsDenTest defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:199:28: warning: asXtalkOutStateTest defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:20:20: warning: sXtalkWideKRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:231:28: warning: asDiamondCoefsRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:24:20: warning: sXtalkWideShiftRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:30:20: warning: sXtalkNarrowKRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:34:20: warning: sXtalkNarrowShiftRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:38:28: warning: asXtalkGainsDefault defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:43:28: warning: asXtalkGainsTest defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:48:28: warning: asXtalkGains1Chan defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:67:28: warning: alXtalkDlineTest defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:77:30: warning: asXtalkInStateTest defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:92:20: warning: sDiamondKRightXt defined but not used [-Wunused-const-variable=]
sound/pci/au88x0/au88x0_xtalk.c:96:20: warning: sDiamondShiftRightXt defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/pci/au88x0/au88x0_xtalk.c | 85 -----------------------------------------
 1 file changed, 85 deletions(-)

diff --git a/sound/pci/au88x0/au88x0_xtalk.c b/sound/pci/au88x0/au88x0_xtalk.c
index 084fcbf..143646c 100644
--- a/sound/pci/au88x0/au88x0_xtalk.c
+++ b/sound/pci/au88x0/au88x0_xtalk.c
@@ -17,39 +17,20 @@
 static short const sXtalkWideKLeftEq = 0x269C;
 static short const sXtalkWideKRightEq = 0x269C;
 static short const sXtalkWideKLeftXt = 0xF25E;
-static short const sXtalkWideKRightXt = 0xF25E;
 static short const sXtalkWideShiftLeftEq = 1;
 static short const sXtalkWideShiftRightEq = 1;
 static short const sXtalkWideShiftLeftXt = 0;
-static short const sXtalkWideShiftRightXt = 0;
 static unsigned short const wXtalkWideLeftDelay = 0xd;
 static unsigned short const wXtalkWideRightDelay = 0xd;
 static short const sXtalkNarrowKLeftEq = 0x468D;
 static short const sXtalkNarrowKRightEq = 0x468D;
 static short const sXtalkNarrowKLeftXt = 0xF82E;
-static short const sXtalkNarrowKRightXt = 0xF82E;
 static short const sXtalkNarrowShiftLeftEq = 0x3;
 static short const sXtalkNarrowShiftRightEq = 0x3;
 static short const sXtalkNarrowShiftLeftXt = 0;
-static short const sXtalkNarrowShiftRightXt = 0;
 static unsigned short const wXtalkNarrowLeftDelay = 0x7;
 static unsigned short const wXtalkNarrowRightDelay = 0x7;
 
-static xtalk_gains_t const asXtalkGainsDefault = {
-	0x4000, 0x4000, 0x4000, 0x4000, 0x4000,
-	0x4000, 0x4000, 0x4000, 0x4000,	0x4000
-};
-
-static xtalk_gains_t const asXtalkGainsTest = {
-	0x7fff, 0x8000, 0x0000, 0x0000, 0x0001,
-	0xffff, 0x4000, 0xc000, 0x0002, 0xfffe
-};
-
-static xtalk_gains_t const asXtalkGains1Chan = {
-	0x7FFF, 0, 0, 0, 0,
-	0x7FFF, 0, 0, 0, 0,
-};
-
 // Input gain for 4 A3D slices. One possible input pair is left zero.
 static xtalk_gains_t const asXtalkGainsAllChan = {
 	0x7FFF, 0x7FFF, 0x7FFF, 0x7FFF, 0,
@@ -64,20 +45,11 @@ static xtalk_dline_t const alXtalkDlineZeros = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 };
-static xtalk_dline_t const alXtalkDlineTest = {
-	0x0000fc18, 0xfff03e8, 0x000186a0, 0xfffe7960, 1, 0xffffffff, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
-	0, 0, 0, 0, 0, 0, 0, 0
-};
 
 static xtalk_instate_t const asXtalkInStateZeros = {
 	0, 0, 0, 0
 };
 
-static xtalk_instate_t const asXtalkInStateTest = {
-	0x0080, 0xff80, 0x0001, 0xffff
-};
-
 static xtalk_state_t const asXtalkOutStateZeros = {
 	{0, 0, 0, 0},
 	{0, 0, 0, 0},
@@ -89,11 +61,9 @@ static xtalk_state_t const asXtalkOutStateZeros = {
 static short const sDiamondKLeftEq = 0x401d;
 static short const sDiamondKRightEq = 0x401d;
 static short const sDiamondKLeftXt = 0xF90E;
-static short const sDiamondKRightXt = 0xF90E;
 static short const sDiamondShiftLeftEq = 1;
 static short const sDiamondShiftRightEq = 1;
 static short const sDiamondShiftLeftXt = 0;
-static short const sDiamondShiftRightXt = 0;
 static unsigned short const wDiamondLeftDelay = 0xb;
 static unsigned short const wDiamondRightDelay = 0xb;
 
@@ -118,13 +88,6 @@ static xtalk_coefs_t const asXtalkWideCoefsLeftXt = {
 	{0x77dc, 0xc79e, 0xffb8, 0x000a, 0},
 	{0, 0, 0, 0, 0}
 };
-static xtalk_coefs_t const asXtalkWideCoefsRightXt = {
-	{0x55c6, 0xc97b, 0x005b, 0x0047, 0},
-	{0x6a60, 0xca20, 0xffc6, 0x0040, 0},
-	{0x6411, 0xd711, 0xfca1, 0x0190, 0},
-	{0x77dc, 0xc79e, 0xffb8, 0x000a, 0},
-	{0, 0, 0, 0, 0}
-};
 static xtalk_coefs_t const asXtalkNarrowCoefsLeftEq = {
 	{0x50B5, 0xD07C, 0x026D, 0xFD21, 0},
 	{0x460F, 0xE44F, 0xF75E, 0xEFA6, 0},
@@ -149,14 +112,6 @@ static xtalk_coefs_t const asXtalkNarrowCoefsLeftXt = {
 	{0, 0, 0, 0, 0}
 };
 
-static xtalk_coefs_t const asXtalkNarrowCoefsRightXt = {
-	{0x3CB2, 0xDF49, 0xF6EA, 0x095B, 0},
-	{0x6777, 0xC915, 0xFEAF, 0x00B1, 0},
-	{0x7762, 0xC7D9, 0x025B, 0xFDA6, 0},
-	{0x6B7A, 0xD2AA, 0xF2FB, 0x0B64, 0},
-	{0, 0, 0, 0, 0}
-};
-
 static xtalk_coefs_t const asXtalkCoefsZeros = {
 	{0, 0, 0, 0, 0},
 	{0, 0, 0, 0, 0},
@@ -172,37 +127,6 @@ static xtalk_coefs_t const asXtalkCoefsPipe = {
 	{0, 0, 0x0FA0, 0, 0},
 	{0, 0, 0x1180, 0, 0},
 };
-static xtalk_coefs_t const asXtalkCoefsNegPipe = {
-	{0, 0, 0xF380, 0, 0},
-	{0, 0, 0xF380, 0, 0},
-	{0, 0, 0xF380, 0, 0},
-	{0, 0, 0xF380, 0, 0},
-	{0, 0, 0xF200, 0, 0}
-};
-
-static xtalk_coefs_t const asXtalkCoefsNumTest = {
-	{0, 0, 0xF380, 0x8000, 0x6D60},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0}
-};
-
-static xtalk_coefs_t const asXtalkCoefsDenTest = {
-	{0xC000, 0x2000, 0x4000, 0, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0}
-};
-
-static xtalk_state_t const asXtalkOutStateTest = {
-	{0x7FFF, 0x0004, 0xFFFC, 0},
-	{0xFE00, 0x0008, 0xFFF8, 0x4000},
-	{0x0200, 0x0010, 0xFFF0, 0xC000},
-	{0x8000, 0x0020, 0xFFE0, 0},
-	{0, 0, 0, 0}
-};
 
 static xtalk_coefs_t const asDiamondCoefsLeftEq = {
 	{0x0F1E, 0x2D05, 0xF8E3, 0x07C8, 0},
@@ -228,15 +152,6 @@ static xtalk_coefs_t const asDiamondCoefsLeftXt = {
 	{0, 0, 0, 0, 0}
 };
 
-static xtalk_coefs_t const asDiamondCoefsRightXt = {
-	{0x3B50, 0xFE08, 0xF959, 0x0060, 0},
-	{0x9FCB, 0xD8F1, 0x00A2, 0x003A, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0},
-	{0, 0, 0, 0, 0}
-};
-
- /**/
 /* XTalk EQ and XT */
 static void
 vortex_XtalkHw_SetLeftEQ(vortex_t * vortex, short arg_0, short arg_4,
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
