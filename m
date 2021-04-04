Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9B353715
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 08:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C8016C0;
	Sun,  4 Apr 2021 08:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C8016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617518538;
	bh=CvY/aveMKXvv2ZNGtaC9biIFy0i/CVgmBpAjC9aYB3Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p3t/wyrBZ0FwLoUiVrWUFzjriHgYH3d0u5R8OnICvQLcDUVA80EGkicMNEV3rinx+
	 sF8dGsWiGJMzLQUSMEN7kiMRQJD61QbWNceABy/XvWTotVLr9o9gAAZ0moC0pUNn3L
	 hYC7O/o2t8X5OH0sheAkRaimGUoRFmbMI3SBufpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 084D9F800F3;
	Sun,  4 Apr 2021 08:40:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26EC2F8020B; Sun,  4 Apr 2021 08:40:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 898BFF800F3
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 08:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 898BFF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="3Y4E/u2P"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ITnz5dx8"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3F7BF139C;
 Sun,  4 Apr 2021 02:40:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 04 Apr 2021 02:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=xJNreNlX7zIJlO8+DgDL6ZCtvY
 TVVTVGIzioKxhItXA=; b=3Y4E/u2PSjhK8aI+zcnHQ/XYwgHlBr/o8Bdeag/Bio
 YUoGA8rIk60uLExifJOEWaPxij1QiwegxY14NIF3Uhumsf2/FuCPM2wt+Vx6p6XD
 NJOcugO4kWM7UxE1wfszd77McANnUFTBdcvGA7MOZydR0LBcKZ3dphAsf358d9gI
 Kn04vDHqs33KrOadAWBpz1s6ul9Z0mxHIbkfxjBwNF5l1TVzNgAX6jb4ewBgZFqw
 GznIP8issuV1dyOYTo3qdKNt3Ihq1VxlGF6efBHZ6kfBBCc8Kgx9a6fe6GQWvfQ4
 MGZ5bD63VsAfAhKhAd/zgAi4RhR2SLw88muIOu7hqL7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xJNreNlX7zIJlO8+D
 gDL6ZCtvYTVVTVGIzioKxhItXA=; b=ITnz5dx8d+9lRQ6dImwGOHVsb2Q3fbKZY
 47Le33hTa/C0OjXN5MZcKcZPf+a4/s0aQHY3fVMRlfhidw7CuPyda3UjIOUn9l4v
 hMLI/KrFRV20YRtUTEyvzAJStbsZw6QVItgBr/my++LnvvlRPYSBfcApKErJqXkY
 O/irMl2Uv14Vi50juwhLaFml9bZKJYrOcoSOXi2Xqw0c759hw2pFUzMOfdhgANkp
 D+qIe16AyfqDYL1Me43jTRGKur6CqEoYZ5j2SCaA4b5G51gA6OsSjElJqAtxF+Kv
 Q7eeY+9wM1Mauz2SNFzlH9YV0++r5M3glxsdy8k3X6xOZzlXV7C7A==
X-ME-Sender: <xms:ZF9pYFjuCt1VvoNDCM8_us32urksLtUu_ruwifhaJwOELsjEfIrAmw>
 <xme:ZF9pYKCn4EBw8xu1QfFo-XHfuSrj3VW5IPJ4MKiZQ-EcDKPGXjHVc3wj4qKJqohTe
 JV3fJ8CHIlQ9WnLqQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeiledguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedujeetlefhtd
 dtkefgtdeuieelhffgteejjeehkeegveduvdevgeeiheeuueekjeenucfkphepudegrdef
 rdeihedrudejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ZF9pYFF3IbXHWB01G72dE3XtzBT9HoCp_xpYTRoSo4pRCSl-uERdMg>
 <xmx:ZF9pYKT_AbIo0N-491HlkMDhbvaZ-eaoLHBRBeeAfPDKdJK2TaWDOQ>
 <xmx:ZF9pYCz1-rXNCPbvS7wK8g3LSqtEJBi3h8RsN6_2RX6Gflm2zskBqg>
 <xmx:ZF9pYIbNbdhCpyflg8zmBijGubccU_pZKk_rw5FVKxLz7Sv_SHbudA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 673D1108005F;
 Sun,  4 Apr 2021 02:40:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH] ALSA: core: control_led: fix memory leak in
 snd_ctl_led_set_state()
Date: Sun,  4 Apr 2021 15:40:31 +0900
Message-Id: <20210404064031.48711-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

When inquired control element is not in led group, snd_ctl_led_set_state()
attempts to add the element into the group, according to function
arguments. Although an memory object is allocated for led instance, it's
left as is without being released.

This commit fixes the memory leak.

Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/core/control_led.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 788fd9e275e0..b97f118cd54e 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -161,6 +161,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 			list_add(&lctl->list, &led->controls);
 			UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 		}
+		kfree(lctl);
 	}
 	mutex_unlock(&snd_ctl_led_mutex);
 	switch (led->mode) {
-- 
2.27.0

