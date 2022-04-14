Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 209B150080A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 10:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD90E16EE;
	Thu, 14 Apr 2022 10:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD90E16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649923972;
	bh=hGKvDj+WRw+EKZDBXy8aKcHRRsFCkEsMSRnOVHlBv6s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dZN+nynH1Ev/C/8+QqagjQINOCVylZ13fKrizJuDntTOT/NFYc77i1nOt8C21KsEp
	 I2vJkEWeC1svzR2xPYFo1rY5Kj2TW+RfVBRVbLwA1wZVSrkCB2ZZ4R4YJhr880ICAu
	 3e57sXCcdvk2bPLqspGV1YhuCvpIAWpCkn5gPrEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21EEDF801F7;
	Thu, 14 Apr 2022 10:11:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6E7F80162; Thu, 14 Apr 2022 10:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF778F80124
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 10:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF778F80124
X-UUID: cc846f08a8b14c8188298998acd3a84c-20220414
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4c515ac7-047f-47eb-a159-2ab1329cdf3b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:54
X-CID-INFO: VERSION:1.1.4, REQID:4c515ac7-047f-47eb-a159-2ab1329cdf3b, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_UHam,ACTI
 ON:release,TS:54
X-CID-META: VersionHash:faefae9, CLOUDID:197720a9-d103-4e36-82b9-b0e86991b3df,
 C
 OID:10fbb2c55067,Recheck:0,SF:13|15|28|100|16|19|48|101,TC:nil,Content:0,E
 DM:-3,File:nil,QS:0,BEC:nil
X-UUID: cc846f08a8b14c8188298998acd3a84c-20220414
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 450445553; Thu, 14 Apr 2022 16:11:33 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 16:11:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 16:11:32 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH -next] sound/oss/dmasound: fix 'dmasound_setup' defined but
 not used
Date: Thu, 14 Apr 2022 16:11:18 +0800
Message-ID: <20220414081119.30851-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

We observed: 'dmasound_setup' defined but not used error with
COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.

__setup() does not work if MODULE is defined.
Fix it by warpping dmasound_setup with #ifndef MODULES.

Error(s):
sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 sound/oss/dmasound/dmasound_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index 9c48f3a9e3d1..a1b3e71beadf 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1428,6 +1428,7 @@ void dmasound_deinit(void)
 		unregister_sound_dsp(sq_unit);
 }
 
+#ifndef MODULE
 static int dmasound_setup(char *str)
 {
 	int ints[6], size;
@@ -1470,6 +1471,7 @@ static int dmasound_setup(char *str)
 }
 
 __setup("dmasound=", dmasound_setup);
+#endif
 
     /*
      *  Conversion tables
-- 
2.18.0

