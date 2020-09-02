Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AC25B5DD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA94D1897;
	Wed,  2 Sep 2020 23:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA94D1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599082270;
	bh=STL72+vaR3DvuXyR7x0NTMIOEw+sS1SURLZdAkvUyNw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeryttXB7YkHeRGBByPMqH7rH43Mgc1HdgYWgQY2PrmYUUle0u3R85bQzFslL6FRp
	 fLJXagp3K981Ud8uwIh/J+aW+NaSKpexmTdeolSS9bfegcct7yEZ4ECKqZRwy/ER7H
	 RvhoFCT4ofVOtWfIDjEnak1nT9TIIyd8HBLgDCuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5160AF8033F;
	Wed,  2 Sep 2020 23:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8B2F80307; Wed,  2 Sep 2020 23:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C56D9F802E3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C56D9F802E3
IronPort-SDR: JniAJygQzO+YBu/tC4dIU/XQqg5qBdhWhbWAswMK1Q/tmL8ErBOWKCYzIj0h87fWSWWldeU8rG
 shk4JZOUp94w==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482887"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482887"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:10 -0700
IronPort-SDR: a6eWwE0Uwx7y8/ODhLdlYDAbjq4Y23VZO9y/PlsO+R2XPnfHOljGq6LdxDNnXyqByj1GVrPwle
 fGbOMLFaO0ug==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798293"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/18] ALSA: atmel: ac97: clarify operator precedence
Date: Wed,  2 Sep 2020 16:21:29 -0500
Message-Id: <20200902212133.30964-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warnings:

sound/atmel/ac97c.c:478:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    casr & AC97C_CSR_OVRUN   ? " OVRUN"   : "",
                             ^
sound/atmel/ac97c.c:479:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    casr & AC97C_CSR_RXRDY   ? " RXRDY"   : "",
                             ^
sound/atmel/ac97c.c:480:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    casr & AC97C_CSR_UNRUN   ? " UNRUN"   : "",
                             ^
sound/atmel/ac97c.c:481:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    casr & AC97C_CSR_TXEMPTY ? " TXEMPTY" : "",
                             ^
sound/atmel/ac97c.c:482:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    casr & AC97C_CSR_TXRDY   ? " TXRDY"   : "",
                             ^
sound/atmel/ac97c.c:524:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    cosr & AC97C_CSR_OVRUN   ? " OVRUN"   : "",
                             ^
sound/atmel/ac97c.c:525:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    cosr & AC97C_CSR_RXRDY   ? " RXRDY"   : "",
                             ^
sound/atmel/ac97c.c:526:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    cosr & AC97C_CSR_TXEMPTY ? " TXEMPTY" : "",
                             ^
sound/atmel/ac97c.c:527:30: style: Clarify calculation precedence for
'&' and '?'. [clarifyCalculation]
    cosr & AC97C_CSR_TXRDY   ? " TXRDY"   : "",
                             ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/atmel/ac97c.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 1006458f7f85..66ecbd4d034e 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -475,12 +475,12 @@ static irqreturn_t atmel_ac97c_interrupt(int irq, void *dev)
 		struct snd_pcm_runtime *runtime;
 		int offset, next_period, block_size;
 		dev_dbg(&chip->pdev->dev, "channel A event%s%s%s%s%s%s\n",
-				casr & AC97C_CSR_OVRUN   ? " OVRUN"   : "",
-				casr & AC97C_CSR_RXRDY   ? " RXRDY"   : "",
-				casr & AC97C_CSR_UNRUN   ? " UNRUN"   : "",
-				casr & AC97C_CSR_TXEMPTY ? " TXEMPTY" : "",
-				casr & AC97C_CSR_TXRDY   ? " TXRDY"   : "",
-				!casr                    ? " NONE"    : "");
+			(casr & AC97C_CSR_OVRUN)   ? " OVRUN"   : "",
+			(casr & AC97C_CSR_RXRDY)   ? " RXRDY"   : "",
+			(casr & AC97C_CSR_UNRUN)   ? " UNRUN"   : "",
+			(casr & AC97C_CSR_TXEMPTY) ? " TXEMPTY" : "",
+			(casr & AC97C_CSR_TXRDY)   ? " TXRDY"   : "",
+			!casr                      ? " NONE"    : "");
 		if ((casr & camr) & AC97C_CSR_ENDTX) {
 			runtime = chip->playback_substream->runtime;
 			block_size = frames_to_bytes(runtime, runtime->period_size);
@@ -521,11 +521,11 @@ static irqreturn_t atmel_ac97c_interrupt(int irq, void *dev)
 
 	if (sr & AC97C_SR_COEVT) {
 		dev_info(&chip->pdev->dev, "codec channel event%s%s%s%s%s\n",
-				cosr & AC97C_CSR_OVRUN   ? " OVRUN"   : "",
-				cosr & AC97C_CSR_RXRDY   ? " RXRDY"   : "",
-				cosr & AC97C_CSR_TXEMPTY ? " TXEMPTY" : "",
-				cosr & AC97C_CSR_TXRDY   ? " TXRDY"   : "",
-				!cosr                    ? " NONE"    : "");
+			 (cosr & AC97C_CSR_OVRUN)   ? " OVRUN"   : "",
+			 (cosr & AC97C_CSR_RXRDY)   ? " RXRDY"   : "",
+			 (cosr & AC97C_CSR_TXEMPTY) ? " TXEMPTY" : "",
+			 (cosr & AC97C_CSR_TXRDY)   ? " TXRDY"   : "",
+			 !cosr                      ? " NONE"    : "");
 		retval = IRQ_HANDLED;
 	}
 
-- 
2.25.1

