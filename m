Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3AC614E5
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D141681;
	Sun,  7 Jul 2019 14:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D141681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501551;
	bh=DHm5alzzSH32DYz3L5xSAe+q48ee1vbEtZOSwXgTI3k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZF0Jnnwt0zpoQKrVrGPdl13MoG5upMuXbWgcKSo5ESQGCbp2oa8/3qey5PZmac2A
	 QQbvP3ew3xGioA2bwXkom0HJo/A2ULb1/88+yW/GxwawBwCrFS+HI+6GeVxbaQ3R3z
	 q3x1Tz1Uks2kk+lVF1O2e6zRhfUKTXzxbaOiOx0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F0BF80290;
	Sun,  7 Jul 2019 14:08:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96AE7F800E6; Sun,  7 Jul 2019 14:08:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABEFDF800E6
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABEFDF800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Ud3jsHxJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="j6ZXzYD0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F412642C;
 Sun,  7 Jul 2019 08:08:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=iP+83cXwzoOAk
 +50kfz7vBwHM0FWxM0h97VmpWDfHm0=; b=Ud3jsHxJlpwdjJJhE8+cPZTHfYiZZ
 f1PEu14g/27jiSBdznX18pfTXj+VxK4ZwrO27/IFRJJi1tM2s0l4v0voBC/KKc0d
 Yz9s++lGWe4Ygedbm6aAYZsPCoiWGfdcWunEX6GPLXB1rIkJkOqfMm+rBMSKuZb6
 RyQIvwSaNcwZ5OKQ/iSRNbK5DVBv349tRlI3cXUIbphxgq4iJ9uR0jN6X1A9V3QA
 fsOmPAhYh2NsgwT91E9axOdtpwpWS9C4NSRZIPN9w11Esrk/82IAf0iTWyZPnA6P
 03qk+B6nJtaD2MvYPNsop9hgxgbophX0jG2H3BMyG9oLh6+vJkj7MbW6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=iP+83cXwzoOAk+50kfz7vBwHM0FWxM0h97VmpWDfHm0=; b=j6ZXzYD0
 i24MS8KUiBc/IPBvsyMV9i+IrxEJ9z+sApmFP2udyq59BRtkvoikq+wu0+9+kHya
 YgFw0qYBlo3qby1cqoowZaQ29FY92JpEIbJqWTHK5y9qtCWr4PNBD6eqXBGg/yqB
 zuVW0R3AGqos9OBAFEBGEMwCrrobhECV+i6cOMtu3RfUmUgEYkkzEIx8ucgw1jCG
 rQEA/l/ycrrBt0rqq/8Q7UXAuFD2sF4fH2XVo5KVLYp4GKtCNNRivZTfBDWmaSmV
 8m28+nEDKQ3cp0O75lHchASuoet1m4HlYzQawqkw4JU2xsx6sjbmo1Iu213G9+9P
 Ve8/zwyK7rBW1Q==
X-ME-Sender: <xms:quAhXaUTN7j4FgmvwcblP-BsuypNO7rFqP5Vs0HZhuTtpXKkMhJvTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:quAhXe31mfCPjIQ1ljnJgJlJ_XysFtHGDS3evU6E0rYlukCHkfSCIw>
 <xmx:quAhXcMGZ4hSgAjwQdGMH36arg0txb4ZxQMyO8G1wk5R3CZt-F69-A>
 <xmx:quAhXWRXjk6mjMzY7YR2hhpM5IjUNS_FNZuzpehqh2eliGfAdDlHnQ>
 <xmx:quAhXXkmzM-VxMaqYzHsN4R623m1BU5vM2oU3FA0JoiI-9dwb8uLIw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 318C880059;
 Sun,  7 Jul 2019 08:08:08 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:56 +0900
Message-Id: <20190707120759.16371-5-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/7] ALSA: firewire-lib: fix different data
	block counter between probed event and transferred
	isochronous packet
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

For IT context, tracepoints event is probed after calculating next data
block counter. This brings difference of data block counter between
the probed event and actual isochronous packet.

This commit fixes it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c5daef7872a5..24cc8ce51e01 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -510,13 +510,13 @@ static void build_it_pkt_header(struct amdtp_stream *s, unsigned int cycle,
 		cip_header = NULL;
 	}
 
+	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
+			   index);
+
 	if (!(s->flags & CIP_DBC_IS_END_EVENT)) {
 		s->data_block_counter =
 				(s->data_block_counter + data_blocks) & 0xff;
 	}
-
-	trace_amdtp_packet(s, cycle, cip_header, payload_length, data_blocks,
-			   index);
 }
 
 static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
