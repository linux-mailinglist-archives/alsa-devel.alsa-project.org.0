Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3D43262
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 05:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E20717DA;
	Thu, 13 Jun 2019 05:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E20717DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560397042;
	bh=poNfP6IrwJLmKTF11NSi25EcKBOsKIvhJ3SaKg9ukts=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kTvLIXX6MFkx+vYhsGrbqkY+LN0cEdd1fxz9sozFGaEsMfWbeJkF7yTqqFOQACa2l
	 zKIZ1O7ffsyIlMiXThZFa9gJWETwcjVr4gwfxk1qSLRj75VFAdFsu7CZSc0nk7OpeE
	 F261LTcRzkYkohBtvaU8gxh0RfTuX++VFa0v0IVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5B71F89703;
	Thu, 13 Jun 2019 05:35:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33936F89703; Thu, 13 Jun 2019 05:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16FCCF80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 05:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16FCCF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="apdoHXQB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PdXDztAb"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2B4547C4;
 Wed, 12 Jun 2019 23:35:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 23:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=ihQS99fUKAvVCNBxTZbvc2vL9X
 grS0UVmX5zprKJIBk=; b=apdoHXQBTy+RhflUeHMRThjBda5aTfiWSn99VHyewz
 K2tMmXvbJjr79yfSuF7DJzmOL4XpztIajG8fXyDhHy8FVE0p4EZlfG4osJLcb1fa
 3rpujlNUM7++zYaOn2DG9hElEAd+ik5AHP0BYUSIG7moH5cLEBILrw+duB7h8A/+
 Y+rxM/Jn+7DnqjI92THnPpM2g+1VSTDfx0WrW84PNam/eDO1TNBn1+UOhihap73c
 bJW3trtins5GW1FhRv6Fm44U3SLa69qTzJvTewwVhd177GJXv8ctwpeveZOOkHE+
 GgfOSITbTnPdDqMBqNs+4PH0FvAR2frvMmwjWa36qymQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ihQS99fUKAvVCNBxT
 Zbvc2vL9XgrS0UVmX5zprKJIBk=; b=PdXDztAb2rNhNJo/g1iaIo01EvK/0bHMH
 xT25EcbgornW7IBFRuOj5WvKS2YZBmuOuaEO9rFMERN/JJpxUmIKRa+0EIGdPYJN
 cMxSDQcsDs4SSsHw8EHcVTCOzfPXwF1iIsWMoSI/gxAWuJxXLGqB4h9pRQYbpS2M
 HhC4ApBwDXgZlOmb7gdh2i3ClWHkeue4yf21E8/UMYgy2Zci275V+eaFXDsuLuo1
 N1nqnQplVdQym34s3DU9SgTZuMLNDIwy0hv6Rt7TJiQhiDLKiUGwOjEwkHDfvJ4/
 9cKaN4iXZIKVouYlVegRK/uymFW2LnMV1Ke7Zy0787kC1UagLgamA==
X-ME-Sender: <xms:f8QBXWoaoiAZWv8AGqbEqcNY5M2CqrBpAoK7mQFM34-JHXetYLkJjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehkedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:f8QBXQ9oI5C5_y5pK6jjK9NHRpQsUOcsFxqykKVuX5GcOrCuY-RZCQ>
 <xmx:f8QBXd_RYy08vNquy4B5XiOveywrFaOyWxFFZ30p4AfXAvB1HU66pQ>
 <xmx:f8QBXXtVNrbGyr_RreGw5geEqOqDaG-z1M-4VeD9OjYRuV5F-c4pEA>
 <xmx:gMQBXb6I7wydfx7Z_RwaGTfOMPRNbsjrsvZdXx9fVwPeJA0VXGYpnw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7913380085;
 Wed, 12 Jun 2019 23:35:25 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Thu, 13 Jun 2019 12:35:22 +0900
Message-Id: <20190613033522.20856-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>
Subject: [alsa-devel] [PATCH] ALSA: dice: fix compiler warning due to
	returning uninitialized value
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

This commit fixes the warning due to returning uninitialized value
from start_streams() helper function.

   sound/firewire/dice/dice-stream.c: In function 'start_streams.isra.0':
>> sound/firewire/dice/dice-stream.c:350:6: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
     int err;
         ^~~

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 3cd2c2d780a2 ("ALSA: dice: reserve/release isochronous resources in pcm.hw_params/hw_free callbacks")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/dice/dice-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/dice/dice-stream.c b/sound/firewire/dice/dice-stream.c
index f61b99a72655..e9e5c5fffb70 100644
--- a/sound/firewire/dice/dice-stream.c
+++ b/sound/firewire/dice/dice-stream.c
@@ -389,7 +389,7 @@ static int start_streams(struct snd_dice *dice, enum amdtp_stream_direction dir,
 			return err;
 	}
 
-	return err;
+	return 0;
 }
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
