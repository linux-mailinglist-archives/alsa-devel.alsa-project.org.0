Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F262395416
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 04:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097AD15DC;
	Mon, 31 May 2021 04:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097AD15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622429706;
	bh=boBH9WsI7hmc1+ijKStD5zQ5z0QKHPZFea9bdxIzy7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLskywISJiPcp//ZCQfSoMhZ3L+ILWyiyqleaR9TK+G1xuMIKgzQnDVubywH/tIxG
	 bRTTITciDTdDCp13ZLv2Mw1Z0zcdjRLVBujiJ5YPYja47PnSATSgjnLIROf+o7dVJb
	 FuyGNdFa2buaEdIuWAUtacXaPE+WMGZJ1BD1LIts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCBFF804DA;
	Mon, 31 May 2021 04:51:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4CD8F80277; Mon, 31 May 2021 04:51:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D66F80273
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D66F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="d82qMPAs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="iJIB08Bp"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AA445C00B6;
 Sun, 30 May 2021 22:51:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 30 May 2021 22:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=2hzF/R1alxRrT
 h49h6vI6VQSzdV9SXjC5f999BrxEWU=; b=d82qMPAsUV93r5B9g4AMMuBpeSmao
 sHlRovuI0ppiJmf52YQ55EcPDh/RsFj5Gh3koB3dNo/OYff24iQVWc3s4a+B4P7F
 ksbamRbVOkRl0HPxpcEMkQGbJcI1bINFJKyAw1bJ1q4eP53ElA1Jm+NvZMNbo67o
 c5HkWcKatdUrG6D/BSi1crXk4VmAU2E7RhkSHy8J8xNK+BRQr2IHAUpx+qN15ouo
 PXtVCAXo385dZUV3yTe8r+fAqJBwy2WmsPQJDkxJWMNH/UhhaVVd9jUe41MWVG6X
 dMif0mdAPzTehjLrIz85LqU5YU+wzINkJX4HurKhdx4cH02gw+XDNMpNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2hzF/R1alxRrTh49h6vI6VQSzdV9SXjC5f999BrxEWU=; b=iJIB08Bp
 y+UMbrPENsW9rM/HuBx5FbqAmk1FLtBuGHFptq13MFAAbnMdgK0St6Sl9LGEHR+s
 /W0ydq/O3vmSZ0ROqay/Fivia1DLAkQyhGtGsu3Xkv8BtOhoh9uhHQobBFjKfaIe
 5Hifs6qu6JG4MUuiJrecvG8jnLNSf9NnCmaJLq0xi6Lk+Wfc0T2pG7N5mRCjvkb8
 Qha5wkpWr9FTBqBQ682v5T8/6GnCeLXeCldKaVn9fTaGSKUdZwZi4bjlSWnzd+T1
 2HbUfExxvvD7+4TGFZDB8d/dkTXS37foNFrPAESZWzBqAikEUKA+oFU+CHCUgQFh
 raVe/Hd8V5TbWQ==
X-ME-Sender: <xms:IE-0YNzqq6ZoH1mesEtVfoAUHXb8sGTPEXycpX9BtFerXishWocYFw>
 <xme:IE-0YNTD-v7F5yLxzjvCeVf37Lm48KO8kKEEUKyqc2SxdhChdUsue6gPDzduUTort
 BY6XDwJqiPJwbaUdCI>
X-ME-Received: <xmr:IE-0YHUxhjPko7ydBZZWWexurnKXDKQOn0lzapXWfgJmpoqRwzvt1n_n2InrjbYxkQ2BGk-44-3mZxaiKOF-Fu_lK4-fO9mlIXNLbpW4JGfAFNziQjTf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:IE-0YPiYUdPFY7YfPjv1sdGd-l9wBQ5tUgOiqHOJVEUASbI09mffqg>
 <xmx:IE-0YPC1EJrXWKW-xUI6QHn3G52Z1LA4xJfRcRLQu-iYQvZ6j1gQYQ>
 <xmx:IE-0YIKzufZzU2K8LvwNAPXGc7hF4NhytRjPKi4G1DxL0fMdwg5-ZA>
 <xmx:IE-0YE7LtSpYRU7H_7oOZ9xl-7O5FY2t2EdEfrGph0QBsu9mrU1Brw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 May 2021 22:51:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 3/6] ALSA: oxfw: perform sequence replay for media clock
 recovery
Date: Mon, 31 May 2021 11:51:00 +0900
Message-Id: <20210531025103.17880-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
References: <20210531025103.17880-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

This commit takes ALSA oxfw driver to perform sequence replay for media
clock recovery. Unfortunately, OXFW970 ASIC and its firmware has a quirk
called jumbo payload which skips several isochronous cycles for packet
transmission, thus the sequence replay is just adopted to OXFW971 ASIC.
As well as Fireworks, OXFW ASICs also ignores presentation time against
the way in IEC 61883-1/6.

The sequence replay is tested with below models:
 * Tascam FireOne
 * Stanton Magnetics SCS.1m
 * Apogee Duet FireWire

For below models, the sequence replay is tested to be disabled:

 * Griffin FireWave
 * Behringer F-Control Audio 202
 * Loud Technology Tapco Link.FireWire 4x6
 * Loud Technology Mackie Onyx Satellite

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 9792d4b4373c..0ef242fdd3bc 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -153,13 +153,13 @@ static int init_stream(struct snd_oxfw *oxfw, struct amdtp_stream *stream)
 	struct cmp_connection *conn;
 	enum cmp_direction c_dir;
 	enum amdtp_stream_direction s_dir;
-	unsigned int flags;
+	unsigned int flags = CIP_UNAWARE_SYT;
 	int err;
 
 	if (!(oxfw->quirks & SND_OXFW_QUIRK_BLOCKING_TRANSMISSION))
-		flags = CIP_NONBLOCKING;
+		flags |= CIP_NONBLOCKING;
 	else
-		flags = CIP_BLOCKING;
+		flags |= CIP_BLOCKING;
 
 	if (stream == &oxfw->tx_stream) {
 		conn = &oxfw->out_conn;
@@ -337,6 +337,9 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 	}
 
 	if (!amdtp_stream_running(&oxfw->rx_stream)) {
+		unsigned int tx_init_skip_cycles = 0;
+		bool replay_seq = false;
+
 		err = start_stream(oxfw, &oxfw->rx_stream);
 		if (err < 0) {
 			dev_err(&oxfw->unit->device,
@@ -352,9 +355,20 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 					"fail to prepare tx stream: %d\n", err);
 				goto error;
 			}
+
+			if (oxfw->quirks & SND_OXFW_QUIRK_JUMBO_PAYLOAD) {
+				// Just after changing sampling transfer frequency, many cycles are
+				// skipped for packet transmission.
+				tx_init_skip_cycles = 400;
+			} else {
+				replay_seq = true;
+			}
 		}
 
-		err = amdtp_domain_start(&oxfw->domain, 0, false, false);
+		// NOTE: The device ignores presentation time expressed by the value of syt field
+		// of CIP header in received packets. The sequence of the number of data blocks per
+		// packet is important for media clock recovery.
+		err = amdtp_domain_start(&oxfw->domain, tx_init_skip_cycles, replay_seq, false);
 		if (err < 0)
 			goto error;
 
-- 
2.27.0

