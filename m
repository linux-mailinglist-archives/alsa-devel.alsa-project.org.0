Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63FA1ED9
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:22:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A72A416D3;
	Thu, 29 Aug 2019 17:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A72A416D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567092158;
	bh=tr5lGM7K2u6oxT8Is+fKUp5cVnCD/r4OQ4+0zKcvUo4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOb6+i5pTTHWmn9l+1T/N8hg7twTgaDx/bnMu7GJtcv9hC7JSFG0QScrxxsCthY6e
	 hJdCLFst7VxOFbmOsLQlreG0ruQqF7Oa+PYyIRsqXYJTKS0GMx5muyEf7JBskRewrX
	 /30UDPIgWnErOpXYlOTFqz/c6960+Re+Y2yfBtp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36147F8067C;
	Thu, 29 Aug 2019 16:38:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D92F805F6; Thu, 29 Aug 2019 16:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AD34F802A1
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 16:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD34F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="rriLjP94"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KWanCoM4"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 487A521B03;
 Thu, 29 Aug 2019 10:38:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 29 Aug 2019 10:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=iNo9l+T/ZNWG3yDAshIYfVCHJd
 5Qqks7z//OZUcSq1s=; b=rriLjP94yai2IwT9TFs69dKn2/XuSmtGPDi06BaTcO
 Er4KUDw9yhfpuKYgE+ZvtCsx1LKxfY76Kz8O5YuHMsK2zgPpgo08tCPq5hQUuFo/
 yFfT14bkeuOMSb7kucj168++s0edlF6qzlpuRq2fM3YjpkAM4ISwk2Qn7BNsUmf3
 NrCziLlc3qfvlqL+XrnRSZg16/d6qlsS5V8P4dbdON/rGbE+ySO+ZNyoBzgqopsq
 Xab2Klkh7W5QAKhZ7M47X1+UeZWCE8zaakWTXuGUTn7OIKJUtyG8bID+KQMTJiRB
 7FAYP3SpvhbhyuNMw/wsfc5uIZXkoTb8uovLLVu6BU1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iNo9l+T/ZNWG3yDAs
 hIYfVCHJd5Qqks7z//OZUcSq1s=; b=KWanCoM4FPJ6tdnga91fO7bCPd3zpxS19
 obJZOBaK2Xm/4wfw6xUzpiqrGtJV3aH2aOe3AEifKWzyCYVrgJg7Vu7AZRJJ5S57
 Z9Bt5f3ddQWXDxjEkeEsOTzHKchSr8wQN4d33znaAzr2RO8q0+JbqaOxD4kbmRV4
 R4jRyOU0EK3QhYREsA53vNwt5fZ9P2EXp9f1wA+L/JEBl9f6zGfK/ql6eOa+uGCv
 BKStPd7uPDrLD2vReUWlw15q59q2alhqF9Vkc786WM59dEpDRXnXYdxIFnFAj9rI
 9tIlGZDZS1sLPczcX60mZDSDamGqaS+pE7BxRCmjxX7hsl1kiJSOg==
X-ME-Sender: <xms:VONnXY0EreDIddFY37DTwPHZgUbvDIP_OlFGlzI1ZPRdX0hH4DEwaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeivddgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:VONnXfEnsMBUwwHgSCu-uw6aeUlwXB34lvVCXu3aAvVKeHMKVQUwKA>
 <xmx:VONnXThLwz9rd9RBoB-M9yiGzApv-Sglbi3ccZ_z05JtMBkZAPmWKg>
 <xmx:VONnXQAfnbSSK5R9r41Pb1M43YMqJPwYSqnvhONlRYOk5w0j7m1hbA>
 <xmx:VeNnXTyZmX939DAkNQNWAfdSh_wUatXzv1LzRcVACXA9XCl1i1s3oA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 756708005B;
 Thu, 29 Aug 2019 10:38:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Thu, 29 Aug 2019 23:38:08 +0900
Message-Id: <20190829143808.8131-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: firewire-lib: fix isoc cycle count to
	which rx packet is scheduled
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

When introducing the list of packet descriptor, for rx packet, the
calculation of scheduled isoc cycle is omitted. This commit fixes the
bug.

Fixes: f4f6ae7b7c1f ("ALSA: firewire-lib: use packet descriptor for IT context")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 1a92855c7647..88270257e896 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -732,7 +732,7 @@ static void generate_ideal_pkt_descs(struct amdtp_stream *s,
 		struct pkt_desc *desc = descs + i;
 		unsigned int index = (s->packet_index + i) % QUEUE_LENGTH;
 
-		desc->cycle = compute_cycle_count(*ctx_header);
+		desc->cycle = compute_it_cycle(*ctx_header);
 		desc->syt = calculate_syt(s, desc->cycle);
 		desc->data_blocks = calculate_data_blocks(s, desc->syt);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
