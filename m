Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964054A237
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B1F16DE;
	Tue, 18 Jun 2019 15:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B1F16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864744;
	bh=TyEeMGp2WNwgGhepCpcSucRa0z8Hp/ZH6L5ti76HEYw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCh3s+D1FYpImqwVAdV2P97pUwkO8DCn4Mf24bXAiLhI1Ne2SvtyzbOci56osFZZZ
	 5C1nZy2PzUPzMCEvSES9AwRRdb4NjyavYhRJ8aVTOLhekRRfPtUphfbMOMGGeHwdC2
	 xQrGbIhISAPwFQNk9ZM+LvEOsNvd+LnKZmMhiZyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D93F8974D;
	Tue, 18 Jun 2019 15:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D14F89732; Tue, 18 Jun 2019 15:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D4D3F8971F
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4D3F8971F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="p6z8xwZN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BcBYGx7S"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4798022337;
 Tue, 18 Jun 2019 09:26:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=o3FCRXdA6Njct
 Dboj46v2dk6w9NIM9zaVugZCmHKDLI=; b=p6z8xwZN1UAlzIHCDp0mIgGT1Um3b
 aN261ix8a9V9PUPgQqMAE8U70wSUwNYi2yKpgwS9zBaA1J/YrGcsPkv3cOmPyxiz
 TTynmRZHQC0GOFo7TwHcvjSW97qwtZnTaT74t72eOHF+iol5YwgbDpQzM4JH/eGx
 5T9GRNlXc+UxPWbo/xKfjfhWDDvnQnJ0tpOPl3WYoc1yRxf4pI7/b7zSIJbPnHq9
 Z1RyGUsziQJDKYoSAzgAOdrHpOFIuUybENmhSpyWDdiUamHhqFnfKzyf0RjHE5oy
 J3IN+cDRvUPTbBA3DemuLqkEYO9+XBSfyZcjl7H5Y5ECN7AHzpUY4XT5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=o3FCRXdA6NjctDboj46v2dk6w9NIM9zaVugZCmHKDLI=; b=BcBYGx7S
 PCUzrmT5JScGGcwjkAAIzt5vHNjdbhYoe374yqHOe9U5kuYl/6jJZmFnzkvUIOYn
 /VAPF7fc6dzSPoz6zFkdALzm1p+sqfWAH8i7RUSOc4qkmicFapcCAW5BGFSTw1Q3
 FT6rEPkiVswH5VVk3Y83KfEce1FQSQ8IBhe1rPAYkjtLo0EyrkGd9nzNhqeu2v5/
 UxRjdI8Om7ke8AqRFDIaoGW69P+vwK0fuqeXUEty4b+pHfn90DwI9PdP6BdzYV6N
 P654FgM5U9srhi9gDZ1V1Woql9rgUtNR7LvDs0NnwACHJ+S3y5oP3je4aMn4a8gO
 5d6ra63ReA8/Cw==
X-ME-Sender: <xms:jeYIXR0-dZ3HawhwB_xduPsfDrHKKd5CGCvAXgTnHHWQjYDJqjbs5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:jeYIXcV1mmpabfleSGBpPtfLWtAdDZuPSh8KZPhSajM0CeEinK9Zxg>
 <xmx:jeYIXc4P2lIja6IAUEii4alT_kAk0atdLuMdp-kQdVvbCyBaPxbHqQ>
 <xmx:jeYIXTLY8nW7PGupi3kybHGWi9IInMQSd_VC2pvaJHJ7vJZofLEAnA>
 <xmx:jeYIXRLK64aF8kWFdTDrTjHWEgbb_pFG8d6N75lDXPXRyCUDJ81qjg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CDC56380083;
 Tue, 18 Jun 2019 09:26:35 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:20 +0900
Message-Id: <20190618132622.32659-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 6/8] ALSA: bebob: ensure to release isochronous
	resources in pcm.hw_params callback
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
 sound/firewire/bebob/bebob_stream.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 1070a675179d..63e78fc8711d 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -571,6 +571,9 @@ int snd_bebob_stream_reserve_duplex(struct snd_bebob *bebob, unsigned int rate)
 		amdtp_stream_stop(&bebob->rx_stream);
 
 		break_both_connections(bebob);
+
+		cmp_connection_release(&bebob->out_conn);
+		cmp_connection_release(&bebob->in_conn);
 	}
 
 	if (bebob->substreams_counter == 0 || curr_rate != rate) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
