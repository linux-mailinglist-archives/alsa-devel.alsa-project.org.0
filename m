Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F834A23F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:33:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A869816D4;
	Tue, 18 Jun 2019 15:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A869816D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864782;
	bh=JzsXCELlxeVjHf+AH2qaJAuIbQrWsZ9md9HO3pmpIXc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UebZPNDvBu+EXR8rfXxVQbjijEVdKP+SV3J2ngwnMPIyBf8Ds0XR9q9y2gaD+inv6
	 90oBx/V/Sk6s1z7NOLHloH030qT2USgWKzh78/qsUku0wlpJqs40gKbFEjoJdPwLp7
	 V9i7qcLl+d8PbKbzbzwTf18HiC2WiakbkKZXkJzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE99FF89752;
	Tue, 18 Jun 2019 15:26:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7AA3F89736; Tue, 18 Jun 2019 15:26:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5D21F8972F
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D21F8972F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="viA2gO+S"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="w/SmAsA2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DE3B6222B3;
 Tue, 18 Jun 2019 09:26:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=eL5bdHPMCjJti
 FpEh1pcQqyS22X+qAnP0MD9CL6uFW0=; b=viA2gO+S25burcQ93GDDUD0CDhjB9
 wKLOlRENjJP/qxZUeGvYjvEtIbCd2+PvlDc4s+sfeOL6lpYW4hZHqch2UG/Vj1vE
 Qt46EB6gmHC8bf1oIiFn4huuvSWTtyC3dwOB+BtHCdjsOn5IXMAgGmdQerYSjuu3
 1QL7v67Ek4phoh005tZxLl7qTOoya855aXQYJLjR8Rw9TD3opiV2pgqE18KFubRF
 TGQsO+llswcMOpdkDY1+2tDuQIRlySUtvVXLF2XzMuP7wBTVhf5uVfz2rAvt4qyN
 95aIkz5VgS5VXogP88uXfAxbhiw+9dN+HXg1gxZ8V1mPufGUfSZSLNyzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eL5bdHPMCjJtiFpEh1pcQqyS22X+qAnP0MD9CL6uFW0=; b=w/SmAsA2
 2O9HxRpnN64RJMuHfA2Y1b4Ma8o16wIFHOI4LallUBDOUURu9LbyXcjAWwyt0uDQ
 5+XBdHWnB9VWG1PskjhQ6MqyMB6gJe4yTMnQwxAB7w2PQtkVIIaSo3jtqaQSfG38
 oUoCE0hDkkBKhuNB8eCO1rPKFnrjuxsQcLzg+qKYeLOZKXq3hTaVIX51B2xKSg16
 xscyif0gsw6/3iti4TFOm24pGWtNRIigxZeeWZ7ZyI6maV7j7QV/hjVXaSllYlNw
 ByKsyZXQEa7uqvnh834HxsAQJ+9R4NCP2/GHNC2WYeV0pyhsUYu38iUmE+K/5VCT
 BdMcDA8RVG7SWg==
X-ME-Sender: <xms:juYIXVyixUuwEQxX99Uf-HRAGoTNnCOzIGGHMi4Q6LjcJWI4v18JQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:juYIXYjRUnwKRcKW2J3fw2YNxcHcz50tUwVFIGbhhNYmBUd-L3HHvQ>
 <xmx:juYIXYzqrVmfg8P67oPx0EWqSGqLtWD6jBtDbYvPin4_eJy23qhPXQ>
 <xmx:juYIXTIhOHuwPOqpGA1cZBzn096JdWBgq77DwYizQN5avUb2Csk-iQ>
 <xmx:juYIXetL0UaXQ3Eq8Ajf1NGRUjF0A5XjQe5jzGxFs4o2t6xT9Z7M5w>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6961D380083;
 Tue, 18 Jun 2019 09:26:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:21 +0900
Message-Id: <20190618132622.32659-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 7/8] ALSA: fireworks: ensure to release
	isochronous resources in pcm.hw_params callback
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

When stopping packet streaming in reserve function for duplex streams,
isochronous resources should be released.

Fixes: 7bc93821a70a ("ALSA: firewire-lib: split allocation of isochronous resources from establishment of connection")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 81c1bb209a89..16cf635a6f57 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -217,6 +217,9 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 	if (rate != curr_rate) {
 		stop_stream(efw, &efw->tx_stream);
 		stop_stream(efw, &efw->rx_stream);
+
+		cmp_connection_release(&efw->out_conn);
+		cmp_connection_release(&efw->in_conn);
 	}
 
 	if (efw->substreams_counter == 0 || rate != curr_rate) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
