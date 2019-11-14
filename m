Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8496FCB33
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 17:58:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0861655;
	Thu, 14 Nov 2019 17:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0861655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573750685;
	bh=Aag1H8c+Jhn5OWOETJ/ydraSht8V78XX8ZYWmpW+frA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TXxSDKbVMIdlKk1J4w1AGwWZjOd7iviC5Qkr1BdmPZUBkGgsIJaIlm/j4bhT4cMtI
	 4shXtadlPGLtKllvAFrFeSv/j3qAi0FadtKKx11PbvJtuLbWKASNfO5v6P3kpmmRRS
	 MmRR+ngrsv86WY3CCPC4e5gFgjV0iRRC5Y2j3lNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0CCFF800CC;
	Thu, 14 Nov 2019 17:56:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0415F800E9; Thu, 14 Nov 2019 17:56:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7A63F80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 17:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A63F80084
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5538AACD9
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 16:56:15 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 17:56:12 +0100
Message-Id: <20191114165613.7422-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH 1/2] ALSA: usb-audio: Fix incorrect size check
	for processing/extension units
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

The recently introduced unit descriptor validation had some bug for
processing and extension units, it counts a bControlSize byte twice so
it expected a bigger size than it should have been.  This seems
resulting in a probe error on a few devices.

Fix the calculation for proper checks of PU and EU.

Fixes: 57f8770620e9 ("ALSA: usb-audio: More validations of descriptor units")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/validate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/validate.c b/sound/usb/validate.c
index a5e584b60dcd..389e8657434a 100644
--- a/sound/usb/validate.c
+++ b/sound/usb/validate.c
@@ -81,9 +81,9 @@ static bool validate_processing_unit(const void *p,
 	switch (v->protocol) {
 	case UAC_VERSION_1:
 	default:
-		/* bNrChannels, wChannelConfig, iChannelNames, bControlSize */
-		len += 1 + 2 + 1 + 1;
-		if (d->bLength < len) /* bControlSize */
+		/* bNrChannels, wChannelConfig, iChannelNames */
+		len += 1 + 2 + 1;
+		if (d->bLength < len + 1) /* bControlSize */
 			return false;
 		m = hdr[len];
 		len += 1 + m + 1; /* bControlSize, bmControls, iProcessing */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
