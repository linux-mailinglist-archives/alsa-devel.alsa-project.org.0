Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A94718FE
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 08:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7361938;
	Sun, 12 Dec 2021 08:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7361938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639292757;
	bh=o3eafrWNEYVOzyJngeclrCWED49H1bLWLlJr5zEoikA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hJUg50T8wOTe4HzeTP3QncFmOywtJF1G4huLiTn7mDHGH8HbTI2f6Qejy3ZM/P8/u
	 XvgMRP0aA9LSpcfKWnaxPXPMuVar/eQoluwoZ7uzDu0GNJPC9ma7xP66prUI7lWMix
	 ocrN8INKC1OronVP7HFHwV19UeSQaXr55F1qs9/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE6EF80249;
	Sun, 12 Dec 2021 08:04:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A49F800BC; Sun, 12 Dec 2021 08:04:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg587.qq.com (smtpbg128.qq.com [106.55.201.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B9B9F800BC
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 08:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B9B9F800BC
X-QQ-mid: bizesmtp51t1639292666tdc0063s
Received: from localhost.localdomain (unknown [182.132.179.213])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 12 Dec 2021 15:04:24 +0800 (CST)
X-QQ-SSF: 01000000002000D0I000B00A0000000
X-QQ-FEAT: NXXopmE8dHbdspMIfiXAad1qP2yuR39QVi2oeQSv3rBI97xxw1I0MtBjMjlyf
 MRiAnfVLGM6nJSVEwt8cBPMifHtaa0vmNkA1uTH2Mu2Kc1NrqN93Y5LMeqf5+lLSRUrHlsz
 CX/FBs3/s0+oDsZfpq0340fvGQ8HC+0BQXHHoUFEA/Nxb9Zqnj+diTjVYvAs9GHRxnMNh1M
 Lvm7WOPaIipL62z8eC7CM6Vu3M9lDBMxHa5ZcFODcairpJvgss8Hnc2shzhCQA9HiHS87qK
 XiAG65hzRWTiIanrdp/R+O+ANsIOczrzvnmvphx7JQh31AU/Vikm2YJDRPm1DswLcqn6uXs
 9YFY2a7QlT8qCDENnirsjYjpfOfAYGQKWRTY8kvKgaTzZ+kNGU=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: tiwai@suse.com
Subject: [PATCH] ALSA: sparc: no need to initialise statics to 0
Date: Sun, 12 Dec 2021 15:04:22 +0800
Message-Id: <20211212070422.281924-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam5
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 wangborong@cdjrlc.com, leon@kernel.org
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

Static variables do not need to be initialised to 0, because compiler
will initialise all uninitialised statics to 0. Thus, remove the
unneeded initializations.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 sound/sparc/dbri.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 6b84f66e4af4..3881e1c1b08a 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -688,7 +688,7 @@ static void dbri_cmdsend(struct snd_dbri *dbri, s32 *cmd, int len)
 {
 	u32 dvma_addr = (u32)dbri->dma_dvma;
 	s32 tmp, addr;
-	static int wait_id = 0;
+	static int wait_id;
 
 	wait_id++;
 	wait_id &= 0xffff;	/* restrict it to a 16 bit counter. */
@@ -1926,7 +1926,7 @@ static void dbri_process_interrupt_buffer(struct snd_dbri *dbri)
 static irqreturn_t snd_dbri_interrupt(int irq, void *dev_id)
 {
 	struct snd_dbri *dbri = dev_id;
-	static int errcnt = 0;
+	static int errcnt;
 	int x;
 
 	if (dbri == NULL)
@@ -2591,7 +2591,7 @@ static int dbri_probe(struct platform_device *op)
 	struct snd_dbri *dbri;
 	struct resource *rp;
 	struct snd_card *card;
-	static int dev = 0;
+	static int dev;
 	int irq;
 	int err;
 
-- 
2.34.1

