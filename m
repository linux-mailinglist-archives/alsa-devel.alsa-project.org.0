Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E54614E3
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jul 2019 14:11:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E634B1669;
	Sun,  7 Jul 2019 14:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E634B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562501509;
	bh=G8XkgZRRcB7wNlZ/UIxPg2pFMn4jLCmVwPeBMyywrFQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=laU1ZQGBs0tyCcq4fJwtSojymNGZWQ+6QR5CLwyWvdL/2uDSKO5qajoPHBupDPbj2
	 kjjeZzG/qGHypJJy6unpVCENCI9PZ8M8TSKmmnJ89f/iPs/PwEelVM2JKRMnkIHLeZ
	 P8qC5kANHZj0qLISuRvHvirL/bGYF0vjcghRqows=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 725A3F80212;
	Sun,  7 Jul 2019 14:08:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C13DF80213; Sun,  7 Jul 2019 14:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D476F801A4
 for <alsa-devel@alsa-project.org>; Sun,  7 Jul 2019 14:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D476F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="C1xo6gQY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rCJbKNSK"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 69AD642E;
 Sun,  7 Jul 2019 08:08:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 07 Jul 2019 08:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lE94dfmX+BJUi
 lhJXPxXatIi4EMyV4XBDxacyHxjl2c=; b=C1xo6gQYyjsjArxJ9HrhQSrkH3A+C
 hiX2/vw96rZGmX0bv0kgE/DqHb5JnGlHLhhDXqsaIgHIbubpSpXMo3svtdkN33fD
 qEP1Gvmp6ygzamKMgnWdY0Fuqc1Ux8SU0qEzG7L4VRVkGK2Hhrt0ddaxSoJSAWGt
 3qhrnE7AriCNffCV1vgKKN25W+EihuuG5iadWlueGOLP52U4AALWGPKNkY8YF4ot
 PSF70R97eT2yC4JskS8sg2ak89MCYwac06PH/WxzCpEA3t0+zz0SgyGem9RzOG4y
 TbqZLbXTW0cL/FiLQRbFLcFX/q1cziRIa86nsnvsc+Td5F964JyynwNDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lE94dfmX+BJUilhJXPxXatIi4EMyV4XBDxacyHxjl2c=; b=rCJbKNSK
 AqE0bqJD0/TzruYrNWQYEOrYfN6FiYg5ovFU+vtsi2F0qJ/TB4jXxOPINU9kFTl5
 PChYFvLPJaqEcz3uQboc64wulKDVIMqoKIZXn8NPJihlzIC9cly9gXstzzcfwhJv
 IrzjZzzmv/0h3tAizycBlyx8Yc+zOXLXUuSQwdXIAPYGEClCr3f/s5YPADmUD4D2
 muFGlTvDloYSo/eZ9ot7Ugnu+7R1Zb6e3dpOkNOLjnSczPOL7QoSblTjwuOI1JDU
 D4Pb/4PcS6TE0zhojuPILVZzyOtWZZAMYLZYxOLNlBHJYkI6XCqzQYc3+urpr3Od
 eFrCd9B9YfyZvQ==
X-ME-Sender: <xms:qOAhXecw6x9x6Qo_RCtmKoaYucWKZ8Rrn9bpR9EEV_CYdJeoQP--vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrfeekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:qOAhXfIW3E11RAtAPDkzy_HW29gd8e_wGm2d-61hL_lfew4M6WgT1g>
 <xmx:qOAhXYdm3rBdOWC-evcSuPXtTxIfLcRA93iwElirU2fc-a3bwhNgEQ>
 <xmx:qOAhXTzpEBLt0kyfCt1npR7xUNKKSRIxV_pArjex-cWWf1pBNZB3Bw>
 <xmx:qeAhXapKV4EH1Jm_GCyTfo4oECbGlQm6a5Z1X-St8V5M7Z5LzYjBdA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 918EE80062;
 Sun,  7 Jul 2019 08:08:07 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  7 Jul 2019 21:07:55 +0900
Message-Id: <20190707120759.16371-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
References: <20190707120759.16371-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 3/7] ALSA: firewire-lib: fix initial value of
	data block count for IR context without CIP_DBC_IS_END_EVENT
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

For IR context, ALSA IEC 61883-1/6 engine uses initial value of data
block counter as UINT_MAX, to detect first isochronous packet in the
middle of packet streaming.

At present, when CIP_DBC_IS_END_EVENT is not used (i.e. for drivers except
for ALSA fireworks driver), the initial value is used as is for
tracepoints event. However, the engine can detect the value of dbc field
in the payload of first isochronous packet and the value should be assigned
to the event.

This commit fixes the bug.

Fixes: 76864868dbab ("ALSA: firewire-lib: cache next data_block_counter after probing tracepoints event for IR context")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index c8d77bb05798..c5daef7872a5 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -654,8 +654,10 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 			*dbc = 0;
 	}
 
-	if (err >= 0 && s->flags & CIP_DBC_IS_END_EVENT)
-		s->data_block_counter = *dbc;
+	if (err < 0)
+		return err;
+
+	s->data_block_counter = *dbc;
 
 	trace_amdtp_packet(s, cycle, cip_header, *payload_length, *data_blocks,
 			   index);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
