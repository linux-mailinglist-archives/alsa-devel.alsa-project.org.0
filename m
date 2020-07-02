Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4B212D35
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B0B16EE;
	Thu,  2 Jul 2020 21:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B0B16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718791;
	bh=hpi8YCd4iVDWdrKReLpATeQlaKtqRXJWJ/6k1g/Zq+k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpaZDeNl/AFwOLHux7+5LY+vPBkCIG0EqXPjNfcWMK0wveTLxOLMNxy01MXIn9LN+
	 7hfC9gi6AOQVatP75xq/GHRGBVs9/Anv7Yvs6gspk7qGL2d3A1yFNQ2Ro/b3QJoZxR
	 rWX/Tgv0xy+NXar52NUhtiwhbQxpY/i4luN/Rp5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3957F802E7;
	Thu,  2 Jul 2020 21:36:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BE69F802D2; Thu,  2 Jul 2020 21:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7F4F80247
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7F4F80247
IronPort-SDR: m+I9Y0FGGc+ropi6RQffelfdzr/WKvJcTp0RcHSr0R1kSWghcAONWr6aiAI3kCCb9khkk+1ck/
 HSpWm+R9yzOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549347"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549347"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:22 -0700
IronPort-SDR: Db+r2qITEEm+k5QorqHfNy0te2fx6KdFvzLJVbKMH0KehH6g/HRsm0EVUm16yETrI92bdi3MBS
 iMRVYoY4wICg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116371"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 07/23] ALSA: pci/aw2-saa7146: remove 'set but not used'
 warning
Date: Thu,  2 Jul 2020 14:35:48 -0500
Message-Id: <20200702193604.169059-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fix W=1 warning by nothing variable as always unused.

sound/pci/aw2/aw2-saa7146.c: In function ‘snd_aw2_saa7146_interrupt’:
sound/pci/aw2/aw2-saa7146.c:333:15: warning: variable ‘iicsta’ set but
not used [-Wunused-but-set-variable]
  333 |  unsigned int iicsta;
      |               ^~~~~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/aw2/aw2-saa7146.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/aw2/aw2-saa7146.c b/sound/pci/aw2/aw2-saa7146.c
index 4e64eb5d8f64..c84f1a45194f 100644
--- a/sound/pci/aw2/aw2-saa7146.c
+++ b/sound/pci/aw2/aw2-saa7146.c
@@ -330,7 +330,7 @@ void snd_aw2_saa7146_pcm_trigger_stop_capture(struct snd_aw2_saa7146 *chip,
 irqreturn_t snd_aw2_saa7146_interrupt(int irq, void *dev_id)
 {
 	unsigned int isr;
-	unsigned int iicsta;
+	__always_unused unsigned int iicsta;
 	struct snd_aw2_saa7146 *chip = dev_id;
 
 	isr = READREG(ISR);
-- 
2.25.1

