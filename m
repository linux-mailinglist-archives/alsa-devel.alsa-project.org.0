Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D234FA248
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 06:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E411B185E;
	Sat,  9 Apr 2022 06:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E411B185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649477676;
	bh=0/CPK/H2RTYy5s+DLAifXqhsWtxAnjVgile7uTdD58I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vd8Xc6ksZnJXnVoHW2B+K/USDSeug+0iXT5lUoDYq0Vep4PsH7P5m/2JtCvA85Jzo
	 oveYpH2iMvZ/GeCVHdlGUplwH8i4khb/iirHg1cSrtYZuAZWykOv0GuJTNtNhdM+Hq
	 bf1fRsQbZ/hvcsqgg0kCVbeMNKaK7ScpBIdaX23A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0FE3F804E6;
	Sat,  9 Apr 2022 06:13:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B88F804E6; Sat,  9 Apr 2022 06:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1500F80155
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 06:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1500F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bD8J+yA2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OE7mjufO"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 71E765C0182;
 Sat,  9 Apr 2022 00:12:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 09 Apr 2022 00:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=5zDwX/FbrOkRF0
 QjGNj6f8q83zazNceR19vDeBTMloA=; b=bD8J+yA2MnFyFascHFQBhJq72a4Ttb
 ++tMUV4n4/zWS5PQflzU2vCJKwKGkhrfJ66UZRY/wJdkhL7a7tglOdQFZx4tsTUC
 FI45oQNrnPCV+Pa3cl+sHhsoMiyb37jfs1b2pGAohaj2OcqFf/nbDBFu58TyvvQS
 oIQGF1e11Ar6SyXG+aRV79V/HZ2p2UHLCi9N4naWfGoOSRjFlr09pkDG5ELL71bP
 yk4nYAIBr26r2obTzLzUjMfjnsFRxi7DTtiB6b6710gy5R0JbZL1sk6fYUw1afmV
 W0LSPiOW73qSBzSBYcDQAeRP45J68+B/JTY0aZgjCcNK/lqkzvMAXb8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5zDwX/
 FbrOkRF0QjGNj6f8q83zazNceR19vDeBTMloA=; b=OE7mjufOKEVscu+dEgNdo8
 2WVCKnKAXRL1RJq7wDGLCGmjqlF0OrV9m5mQ6O6ECkTf5G5D6qvnwqR2Az8sM3xt
 tMLp3utiLopMWwpA8O9m5whrabomlG64K1PbZlTNK4uOP9ppOrWsXcKCI8PJCZ8Q
 9RxBfa7dHuHnucuz3UGZ0r6XL9O0MomyAt1KHtHeiZE9Ri9ARuE8h9dsi/sumkco
 1GXAeTDP78ON+bJqz5w14Qp+fwsknAEIMI3BTVdoTVOgZvDrnJy37zEHx4yjcBxC
 jj6dngzYCTuHenp0SNcyvidG5Pp28qTSQkZrWlv8sIHrodLbIb4Mm2P8KBAy1tHg
 ==
X-ME-Sender: <xms:wwdRYuvLCwbgouwG_HQx7apxXeemNA3_1WGGY2tsT_3svMielII-aw>
 <xme:wwdRYjcR1TpQHmXoE9mFQ-LxFYDDy_dpaGyfNPNHcStNsOu4myXo7J6D0TrU143DE
 zbbrkE-YHRyMZIexko>
X-ME-Received: <xmr:wwdRYpwWRALSpS9xZoTElVzjpafXPhHWvLZdX2V3yKx5uRNXYZfJxV7ua3YMw_UTaPYUxNQ1Y5pwDuhSRIUoQu_pTdQ7kQK55nJoRtkhO6BpS8oAJD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekuddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:wwdRYpM0AYh3iwSAGY0RznMhCtHqdiDMMlLdUeEKkLodJVjEHVDarQ>
 <xmx:wwdRYu84hytIuXksNyPAkAjRQeM8HMhbuCzfiVncbuGOAr-aF4hAtA>
 <xmx:wwdRYhWU9ER_my29_F7wur7h2ut_yHSPPXC_WQHDVi5wytJhLTAYjA>
 <xmx:wwdRYiaDiavC3MzNHMp9scYr3_GadaLl6ANlzNXxdfHx1cCIyVB6Hg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Apr 2022 00:12:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] firewire: fix potential uaf in
 outbound_phy_packet_callback()
Date: Sat,  9 Apr 2022 13:12:41 +0900
Message-Id: <20220409041243.603210-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220409041243.603210-1-o-takashi@sakamocchi.jp>
References: <20220409041243.603210-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Chengfeng Ye <cyeaa@connect.ust.hk>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

From: Chengfeng Ye <cyeaa@connect.ust.hk>

&e->event and e point to the same address, and &e->event could
be freed in queue_event. So there is a potential uaf issue if
we dereference e after calling queue_event(). Fix this by adding
a temporary variable to maintain e->client in advance, this can
avoid the potential uaf issue.

Cc: <stable@vger.kernel.org>
Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 9f89c17730b1..708e417200f4 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1500,6 +1500,7 @@ static void outbound_phy_packet_callback(struct fw_packet *packet,
 {
 	struct outbound_phy_packet_event *e =
 		container_of(packet, struct outbound_phy_packet_event, p);
+	struct client *e_client;
 
 	switch (status) {
 	/* expected: */
@@ -1516,9 +1517,10 @@ static void outbound_phy_packet_callback(struct fw_packet *packet,
 	}
 	e->phy_packet.data[0] = packet->timestamp;
 
+	e_client = e->client;
 	queue_event(e->client, &e->event, &e->phy_packet,
 		    sizeof(e->phy_packet) + e->phy_packet.length, NULL, 0);
-	client_put(e->client);
+	client_put(e_client);
 }
 
 static int ioctl_send_phy_packet(struct client *client, union ioctl_arg *arg)
-- 
2.34.1

