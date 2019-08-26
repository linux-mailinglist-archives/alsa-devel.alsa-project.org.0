Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49C9D127
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 15:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777671689;
	Mon, 26 Aug 2019 15:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777671689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566827775;
	bh=xxLBxVjZpWLYrmajF8MTQIGBRJqo7ZoTfTyXkMgdHcc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tgQVpmPEjN+pGECB4AcfP3GXTWwAZTfray3IxGO9vBKsDwpdExBihXmmL/0veYwHI
	 OG/qbr6XP3zSylvlDaGeMVltPZ38tZe7OoksB6SHB3Wac7/RdMpYx2rk5XVa7aPN3t
	 06OnQsMHkZiGjHBqkGelOvG/udIgDay0N9jZPOVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1AD9F80377;
	Mon, 26 Aug 2019 15:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C027F80362; Mon, 26 Aug 2019 15:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC078F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 15:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC078F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="p6BitfeX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hoN/7pOm"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 26FF8694;
 Mon, 26 Aug 2019 09:54:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 26 Aug 2019 09:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=klM7pAiV3Zcu3o68J/KcKJmngg
 UoenVHayzgwz0BtjI=; b=p6BitfeXjC1y61/61WzlmTphKlA2/gkSrM46oYrV7G
 VGyoYF/DLWtJ4ui1oBvgwc7DVXQ4I/nm8qOBuh2lTCWH40OJ1JXdTHe9kzYEm2pH
 ljNsJOwFnnBWYnhAue9PqHdzUQgtZA1cnzZYoN6ZfIF2EBWAqDmWHL/7Jz5jvIfE
 esmCoGeMFEgJRDZCf0SDVuZi7X3QIIv28/KoMQIU5+gJHkv4ci+uHqpc2Spi/15M
 6yjLKVJ8xhYqFP0ggSQnPUff2RMVUZ5BQxE9jKLVgHmmYpi0F4h2Gcob97Bh8oqo
 WkBw4T8GJrNOkjDSPY6ESloeQrA44RIfzING7adEfL6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=klM7pAiV3Zcu3o68J
 /KcKJmnggUoenVHayzgwz0BtjI=; b=hoN/7pOmZjbAQbLuDEO6HtjuwcP22HsQn
 ilj32aaGQdl93Utdzid9Xk8Q76r17vO56TSSp0xLyO93Z31fzCiuA+k0Y8NvNCFm
 GPGSkAqoE0cQepEAx1aLNeuPMdpTyqa1WbrjMcujcjhKMFBBqx0TRWkhTiqGU1yB
 cp1OkrWNL0sViMmxGAhBgmfRwoPue+kwEx698Sr57WKRwhA2UqcAsi5k7wPxh3Ou
 WSgRDzjxa4iDaP6SpCs+U6WhDV/Q5oKC7DZafAItcxBySK/J+VfzoDSnWDe2HWW8
 NsYxpWRvU/RGJ6kZrMNB21Xy8P7MUvBKgSeO/08Nike9vV4Z26qbQ==
X-ME-Sender: <xms:jORjXeXdVhsWa2Jqb9bMWoWBY5DLc5F4NfF0blHA5p-fL6yTSGjDIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdr
 jhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:jORjXeh_nqLcj9C_fYUax4M-0x2MQUQ57GAE5DlNZCpBKBqmS8py_g>
 <xmx:jORjXa4lBAe8tENg0wfmbR_PAaK4UZOfvuB15vDyuawK8tgCLv2LSw>
 <xmx:jORjXe5v4shx_Dxuqj1-7le01QD9t3nksFroaPfrS-gv3IGp9ZO4oQ>
 <xmx:jORjXbJ9xIdjhTMcuIzHT4C7_M7EW9xY-6wfC4TUI00WSFW1VT3UKA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id F068B8005A;
 Mon, 26 Aug 2019 09:54:18 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon, 26 Aug 2019 22:54:15 +0900
Message-Id: <20190826135415.27833-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] ALSA: oxfw: fix NULL pointer dereference to
	unused stream structure
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

ALSA oxfw driver supports Griffin FireWave. This device supports one
isochronous stream for PCM playback. Current driver executes code to
wait event for stream structure of opposite direction. This causes
NULL pointer dereference.

This commit fixes the bug.

Fixes: ac5d77864cfc ("ALSA: oxfw: support AMDTP domain")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw-stream.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw-stream.c b/sound/firewire/oxfw/oxfw-stream.c
index 0318dc4dcc55..3c9a796b6526 100644
--- a/sound/firewire/oxfw/oxfw-stream.c
+++ b/sound/firewire/oxfw/oxfw-stream.c
@@ -350,13 +350,18 @@ int snd_oxfw_stream_start_duplex(struct snd_oxfw *oxfw)
 
 		// Wait first packet.
 		if (!amdtp_stream_wait_callback(&oxfw->rx_stream,
-						CALLBACK_TIMEOUT) ||
-		    !amdtp_stream_wait_callback(&oxfw->tx_stream,
 						CALLBACK_TIMEOUT)) {
 			err = -ETIMEDOUT;
 			goto error;
 		}
 
+		if (oxfw->has_output) {
+			if (!amdtp_stream_wait_callback(&oxfw->tx_stream,
+							CALLBACK_TIMEOUT)) {
+				err = -ETIMEDOUT;
+				goto error;
+			}
+		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
