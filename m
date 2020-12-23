Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC42E201B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:47:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98B1717C1;
	Wed, 23 Dec 2020 18:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98B1717C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745632;
	bh=tT+kaUYYyFJ2fcve7NDKH3cSAnRi5TZlnIt3GWB5WXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCSbQd0PyIidD8VxadLgdfm6tR0ZICGIgmB0Sac0zVoMEpyOnf1mySCU4oZjMJ7oD
	 Q87MIkpICfO49SkqUYTTZJpLj5Z17XGe6uk5rQMlmEcCBz/Sd2930hxpcOItcRBIyt
	 gebvKdznpKynmTH3J38B/7dlTujQIM8SS/KugHdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC34F8021C;
	Wed, 23 Dec 2020 18:44:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62CEEF804DF; Wed, 23 Dec 2020 18:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CBB1F801D5
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 18:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CBB1F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="L+xF5p/k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=s9rgC9sXQ+9rkZOqKnMTXbao0pZKDn6/mEWQH+x7Rx0=; b=L+xF5p/kVL/2v6HwoinzSnr24t
 Q7NFtH3p/Q0ylAi7qaIK8qEqVu270+x6L9Y3ilJDvt3X69h5Yn3tHpuN9a/YD6SlKWliRHcdwoHzt
 7dmLGMtxAbeX+Ax9j4Kcn05IT/tBcMNuntxkXgW9ReEoE9XcnK2Ad5BS19D4Xevlp2aqdzMGFpMoP
 SFzDN34iZfN68b43Urst0CRDjqbh0QGtDmZ14WV9D6tzMMH8jE2hO6YcKq8eDX1WzNg2WSNFDdgJW
 weWO0tTQ9S9v71VLVfEJZDNCV6BOlFKpXUntIhEttmda62elnihGIgI/srCGqgDG4ltlVqKU/R6aj
 myExuT0A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks8Ba-0001Ou-HG; Wed, 23 Dec 2020 18:44:30 +0100
Received: from [62.216.202.54] (helo=lars-desktop.fritz.box)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks7qo-000Crk-Kt; Wed, 23 Dec 2020 18:23:02 +0100
From: Lars-Peter Clausen <lars@metafoo.de>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 12/18] ALSA: vx: Use roundup() instead of open-coding it
Date: Wed, 23 Dec 2020 18:22:23 +0100
Message-Id: <20201223172229.781-12-lars@metafoo.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201223172229.781-1-lars@metafoo.de>
References: <20201223172229.781-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26026/Wed Dec 23 13:53:03 2020)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

Use roundup() instead of open-coding it. This documents intent
and makes it more clear what is going on for the casual reviewer.

Generated using the following the Coccinelle semantic patch.

// <smpl>
@@
expression x, y;
@@
-((((x) + (y) - 1) / (y)) * y)
+roundup(x, y)
// </smpl>

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 sound/drivers/vx/vx_pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index 3d2e3bcafca8..daffda99b4f7 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -1154,8 +1154,7 @@ static int vx_init_audio_io(struct vx_core *chip)
 	chip->ibl.size = 0;
 	vx_set_ibl(chip, &chip->ibl); /* query the info */
 	if (preferred > 0) {
-		chip->ibl.size = ((preferred + chip->ibl.granularity - 1) /
-				  chip->ibl.granularity) * chip->ibl.granularity;
+		chip->ibl.size = roundup(preferred, chip->ibl.granularity);
 		if (chip->ibl.size > chip->ibl.max_size)
 			chip->ibl.size = chip->ibl.max_size;
 	} else
-- 
2.20.1

