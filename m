Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F162F4A242
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 15:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F7A516EC;
	Tue, 18 Jun 2019 15:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F7A516EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560864821;
	bh=nkzh5BUDoKEmim8Klx8z+W90wWDCg4zDIjsF3LP7Abo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TlxZHbtyjuPHBtu44i7k/jQQkiRMihWVAWGoJSYSDXxw/PlxCZ2tyI7B0JcfPxuOA
	 y1p6fDHT5HMyP+PL4YoXPtqxnN5knAJIXoFyEWAVXtOz69SN38vzxD2GG2OvdemgsY
	 Iv+IQa9J5nnHiP3Xd+1PZf4MZ/OwA6hO4EZp4DHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB0CF89754;
	Tue, 18 Jun 2019 15:26:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EDD1F8973A; Tue, 18 Jun 2019 15:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 495B2F89732
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 15:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 495B2F89732
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Uvwg7yFQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iLXo61NI"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 70FC022201;
 Tue, 18 Jun 2019 09:26:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 18 Jun 2019 09:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=XcJuu0yIYhTZ2
 ARU4mxufPmxgfNHZiDt7U/grRJHqFU=; b=Uvwg7yFQcfUGbcN5KJJJW7POc9aCm
 VedECMogzWZcl5DmyCsP4+RU4v70ioo8zO55QVtE1uWbpLsTdcyAahQkhmHeryED
 tqXIz2Btr6Q4HB7CzQ94+NLY1hXfYfmUZa5J/jnCE9a96BH9SEwDHcWbesQ/SdH1
 ZinpX57YNDP0VeiaTcHHwnrRmXF+hp4iO2p8RY+TJnd1uV9PbIiL8NwSPw5povQc
 37Hy3zobHAZTSBiAPZNoDgFhrD10hpT6gq4A0TB/oIzzMasfzQKsAZQrSDzDAD5/
 iuP20dlu48dKek5g3Ja62vx5t87eotaIZTm+6SAIdduT8Zc/5lLj1mP8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=XcJuu0yIYhTZ2ARU4mxufPmxgfNHZiDt7U/grRJHqFU=; b=iLXo61NI
 4WoeGy0JiRiIfRfMqiy68bGlbY6dtj6xuZ2r9Mhq6EoaYHa011gLlgZRCs8Jb2JN
 /+OCVF/2sJJRTO5IK9nB6hCohN03uTTwStyrUTKG+U8GCeGsTD59lL7CMEWn44gX
 FXcj+gKWVu4uTCh1IQHT1ki5NSAoO7NHmfeZzUxfcPYhRLZQXy2+WynCe+HXlBru
 ZJWDEO8GXA4P0iqDwMGf0cw8AN8FN+V+QB6OXlSidQHfeEj4iD08Cr+vegV1xTsr
 y3muyPyqXkMCLSmebOmNvOuybH9P2yHFAfIzBwEZ8GEGPu4zzfSIPQbkQrTIeJhW
 Wk/Jd/8laYeeXA==
X-ME-Sender: <xms:kOYIXcJSoRRxJD58oPJgW0LHboChQxUrQ9g_vbREfzbjjIdF21z9CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeej
X-ME-Proxy: <xmx:kOYIXTrg2fdUMD5UeJTTRGnfuOmoniun1qfzOwRq2-YWnd1TD3vxmA>
 <xmx:kOYIXSyrVNLXh5XuJOqmMxH5ky285UPySfOU0pGDZxnJMPfSH8XA5w>
 <xmx:kOYIXXdzF-RClHW8wVRkY5V6lBtGh7sBO99fi9LHffYpFEM_VX_-Dg>
 <xmx:kOYIXSXNgFxkWb4l4fwsV_q2ihzZRosPmvKGZn5d5m1s0xNxRf0G3g>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0395A380083;
 Tue, 18 Jun 2019 09:26:38 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 22:26:22 +0900
Message-Id: <20190618132622.32659-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
References: <20190618132622.32659-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 8/8] ALSA: oxfw: ensure to release isochronous
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
 sound/firewire/oxfw/oxfw-stream.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index a8bc798731ff..a7502810a3ad 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -283,10 +283,12 @@ int snd_oxfw_stream_reserve_duplex(struct snd_oxfw *oxfw,
 	if (formation.rate != rate || formation.pcm != pcm_channels) {
 		amdtp_stream_stop(&oxfw->rx_stream);
 		cmp_connection_break(&oxfw->in_conn);
+		cmp_connection_release(&oxfw->in_conn);
 
 		if (oxfw->has_output) {
 			amdtp_stream_stop(&oxfw->tx_stream);
 			cmp_connection_break(&oxfw->out_conn);
+			cmp_connection_release(&oxfw->out_conn);
 		}
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
