Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C62B1823
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 10:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06022187A;
	Fri, 13 Nov 2020 10:21:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06022187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605259352;
	bh=0cUVRVg0C5LODO0A/5gkegFdXxxyBw1QabEoBCfR2fo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GeD5/RfBqZDkq8z6eWVKVqmz8QmGGCD0O/IV7AxJJTgQ9sdLmw0EVTbl4DL+LvnTW
	 FYUKj/NXvKsBfWVUTKdgPYJOZRSAWcdJDSCIoHMydr0yHjW0gwVnIkKpJmdnd1u3u7
	 1SFTORxgPN+ey3YiJDbRNNfnXw1Alcc8htd+c0fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26941F8022B;
	Fri, 13 Nov 2020 10:20:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66290F800E9; Fri, 13 Nov 2020 10:20:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CA92F800E9
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 10:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA92F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SX7pIIQR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iTx3UkfP"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A9D75C00AA;
 Fri, 13 Nov 2020 04:20:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 13 Nov 2020 04:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=JH0Zw1m/P1vJ8jE5L5LU7f6T5N
 wpkPgNZm4zieFMjY8=; b=SX7pIIQRTPEEJ04MIzAcwZguY7fxZyZ7wkFP3q6cOT
 Wd+9pfilbY+tcfws5getbzzSykxeLqIq6Hw6nZufwzHg9nz9dtDXXWIv+cTIZcNg
 ZkUyFZU5mf3PIF24MLHPgvQdeGp8Q8I1YtgyWAe3UhE/RGbcnOn2FWtKCjhpKU5Y
 Y7Rqovm9fjdy9pKwm+KfnyVPVYQxllrnkSOwJTgzOD5ReT9O4hyz+p9H5evRLGHj
 nGi4+auOdxIZt8N2Coaszmigiu1Ogb7jMDyy4FyMZsTpS1jq5pjzXHgRXL01HoLp
 ldglOEx9RcGta8MCjW6AMKt/bt26+XeZB+vMKmKSw2vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JH0Zw1m/P1vJ8jE5L
 5LU7f6T5NwpkPgNZm4zieFMjY8=; b=iTx3UkfP5S1HjccJrgJpvpN5uZ/tm+nkV
 Vuo4boE0uFqdrZQ+mmaYP8ND07Uy/csHeyQwk+m2UJgfKf690Gu7w2PKTboMJZla
 NVScqrJ0VbBhjyNInyNXsOAzFOLvSqVs1puoBWm5BvxFSe4ClgNQw8SJE3N6usPS
 +SN+/gFE3jDOEek43UJMNAdF2f2by2hss9vTk5SNQJwrx/kyDFJowbEJZb+6nueS
 dw5Ykf7IDDZE8ouVqMjvJweZN6k88/QqhNNEBQSQh6hagrF3jCFkRubIjoWZOxPu
 neJSA2C6mclBur4wOWFOBeKViHO4w/0p55OyA2Y5vZuBiNo/0njig==
X-ME-Sender: <xms:7k-uXzm7LIX-Bns1IbZjHkIJZe5A5NMwkyzJwUuM_6C91VF91X_Kpg>
 <xme:7k-uX20JwzIZOcSlsiy_MyBQHwLP8_mgaE3u4fh9baLjut5y-XaqGyIDgJD_iflSc
 hfo8Zn3WwBcKOquVFk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecukfhppedugedrfedr
 ieegrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:7k-uX5pJXwXRJSDRN4jpZqpP-tKzWUsNmX-67j1CGxUmqjB7JhlOMA>
 <xmx:7k-uX7kejpCCrq7Sxli-8ddRAn6ig7EUP1uS3AMHzYdXZyRfY22mzA>
 <xmx:7k-uXx0P7TiTz5pfohXtwVhTFdo74AS1AXaAcL0bxam9ZK8rUc7aIQ>
 <xmx:70-uXy_oeloho6E6O--IdVPM_bI5kpBSgRgar588VztTW1CN96FPdA>
Received: from workstation.flets-east.jp (ae064207.dynamic.ppp.asahi-net.or.jp
 [14.3.64.207])
 by mail.messagingengine.com (Postfix) with ESMTPA id C56603064AA6;
 Fri, 13 Nov 2020 04:20:45 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH] ALSA: ctl: fix error path at adding user-defined element set
Date: Fri, 13 Nov 2020 18:20:43 +0900
Message-Id: <20201113092043.16148-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

When processing request to add/replace user-defined element set, check
of given element identifier and decision of numeric identifier is done
in "__snd_ctl_add_replace()" helper function. When the result of check
is wrong, the helper function returns error code. The error code shall
be returned to userspace application.

Current implementation includes bug to return zero to userspace application
regardless of the result. This commit fixes the bug.

Cc: <stable@vger.kernel.org>
Fixes: e1a7bfe38079 ("ALSA: control: Fix race between adding and removing a user element")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 421ddc7..f341fc4 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1539,7 +1539,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
 
  unlock:
 	up_write(&card->controls_rwsem);
-	return 0;
+	return err;
 }
 
 static int snd_ctl_elem_add_user(struct snd_ctl_file *file,
-- 
2.25.1

