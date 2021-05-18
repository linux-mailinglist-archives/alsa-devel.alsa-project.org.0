Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D838797C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04AB1710;
	Tue, 18 May 2021 15:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04AB1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343061;
	bh=4ZthGqZeKTaIjIG5CBCaIAbLmtMGABwrRUrG+YZheWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksyAv2/rP+OtkP45Y6REwfnneZyffacQNi1pmbI1nFbfgzd6swtWFtubWM15kcqiz
	 GkwSjaNFUsxOuYDnC3HX0ydI8wvHvqw+0NkgpE8cNO79ENoKH2X97pPC3lkZ0C/zMq
	 eeA3HXnZJ6KUYtGx5l+IjEAz0Vg2yVkytLlKc3j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 803EBF804AE;
	Tue, 18 May 2021 15:01:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C3C5F8042F; Tue, 18 May 2021 15:01:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 947BBF80229
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 947BBF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qbX0Jit4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pqmtcYk6"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id AF2015C0036;
 Tue, 18 May 2021 09:01:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 May 2021 09:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=KmvqkE0omOlH5
 WFCl9vbPkS/ACyDpzuwKRVOiti1Hn0=; b=qbX0Jit48/b1DM3pOaFRyuhXEdbnW
 62MyM4L4z/mzoJcqVnDVH42hTCEAYoR+XzTCvqsUYgWa3YxbtsQJUuVObmdpgiZh
 qROcyrkOFT/k1GFfebVvM6s5qAvsD2+xFpfDdGNxWqH1BlvXuVBmCeCS0HR23GTK
 eZ71IQCN8l7JolTyTT+qxbrMti0VmEL1CjOY7jMke8jZT0peEj3OPZwNamllO4Sx
 u0170/Z+RXSXEp99bzwdjRZ6yrTSXJzPK2opaXgrYZDOau91LXj2POI2MWX+2BX4
 XfnOVtA3RZleTPv0MR3IXYlBE39sJ7Hi1sbN8LdzuUVJMGECtcQ+LPHSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=KmvqkE0omOlH5WFCl9vbPkS/ACyDpzuwKRVOiti1Hn0=; b=pqmtcYk6
 sqyLwAJ1T0+ZU4af2vI8jkv0nIS0hldW6dXD6lofNyMPgOza1e8DBO5OYr2mvKjm
 8Q5OzYoU6E3FLBsyEIbMebWa/9xdvPISLSvNrTGN7N8y+eg4KKLqHsZinge+erNj
 42KhaeNMmZykQYouF2zbdiN6eScmP5Noyc/TeKVtVB9+YJ7nDyeEu7Gzx34aM7QS
 QEkMcbNYbOIwdqtfMDEQyu4vq2snkXUBvQBlRa8PbY9hpoYHjRQuFOHRwIJI4ez1
 Xw4oRhc7g0hWPKUBddwuFKmB5K9Xsk1aDmcrN8PaTWG4M7Zy/gHiiJKkUOuUVmJ/
 DfjLkfvwjktweQ==
X-ME-Sender: <xms:j7qjYJ3w_By1ebwsSkIgkDC6oRzdd02ycMc-f6J-H47H1vYFW-FZyQ>
 <xme:j7qjYAGdkdaelTrtpFwrlBssph5N5E9Q1KQx4u4B0YbPvGvMVZRiWGo0FX0jRvdNp
 GkXYgG5ZrGFKSt3Is4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:j7qjYJ4XW8HuU_RGkCJ0q2dPCUgD3bv9xSdn9Dhxed69kdP5ghHk7w>
 <xmx:j7qjYG1ujDmBwj6hA8Y_ZiLZivdKC9KFCnAe3RE5ouzWW4RdFhBLkQ>
 <xmx:j7qjYMG2wDqXKj8ozfVgGShH2jrLgM0wQ2kV9t2CEvVJ8eq0qKcbUQ>
 <xmx:j7qjYHNKjDTUWqKd-wnWDA4WEM_nG3jpbH0gHpk7rSJWERrFIbn29A>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:01:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/8] ALSA: firewire-lib: code refactoring for check of CIP
 header about payload size
Date: Tue, 18 May 2021 22:00:45 +0900
Message-Id: <20210518130048.146596-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
References: <20210518130048.146596-1-o-takashi@sakamocchi.jp>
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

The size of CIP payload is now passed to helper function to parse CIP
header.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 1c530678e56a..1ff25e6b0c78 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -574,8 +574,7 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 
 	/* Calculate data blocks */
 	fdf = (cip_header[1] & CIP_FDF_MASK) >> CIP_FDF_SHIFT;
-	if (payload_length < sizeof(__be32) * 2 ||
-	    (fmt == CIP_FMT_AM && fdf == AMDTP_FDF_NO_DATA)) {
+	if (payload_length == 0 || (fmt == CIP_FMT_AM && fdf == AMDTP_FDF_NO_DATA)) {
 		*data_blocks = 0;
 	} else {
 		unsigned int data_block_quadlets =
@@ -590,8 +589,7 @@ static int check_cip_header(struct amdtp_stream *s, const __be32 *buf,
 		if (s->flags & CIP_WRONG_DBS)
 			data_block_quadlets = s->data_block_quadlets;
 
-		*data_blocks = (payload_length / sizeof(__be32) - 2) /
-							data_block_quadlets;
+		*data_blocks = payload_length / sizeof(__be32) / data_block_quadlets;
 	}
 
 	/* Check data block counter continuity */
@@ -658,8 +656,8 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	if (cip_header_size > 0) {
 		if (payload_length >= cip_header_size) {
 			cip_header = ctx_header + 2;
-			err = check_cip_header(s, cip_header, payload_length, data_blocks,
-					       data_block_counter, syt);
+			err = check_cip_header(s, cip_header, payload_length - cip_header_size,
+					       data_blocks, data_block_counter, syt);
 			if (err < 0)
 				return err;
 		} else {
-- 
2.27.0

