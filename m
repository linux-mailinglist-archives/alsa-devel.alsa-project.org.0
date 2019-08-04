Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F3809A9
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030B01686;
	Sun,  4 Aug 2019 08:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030B01686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900060;
	bh=20FzyaLXMZ7P40U6csVf8ZE0kV4gBtNPyfcmPRArtyU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pce/U7BbjowNez3zEHrJKnsu1DIbffB5PfrIEoZqOQG34AqFQDfiJquxO847MR4uA
	 VdPCmy7Z+QW+MluMeszDW/ToTBVkI6B2t17FYd4a0PdYyrXQn2sVPO5+k8h1+KIZvs
	 OqZv1nMbFV1RoZWssQVz4tMKhPlHOH1/NIyo6ITE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2872AF80611;
	Sun,  4 Aug 2019 08:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6281DF805A1; Sun,  4 Aug 2019 08:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC6B5F800F3
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6B5F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PPDt46im"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="h+G/qry5"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D0B3321550;
 Sun,  4 Aug 2019 02:21:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3pio9eSFpPHT3
 t5OcZMDw9RC71u7C6z+HFZqUiJKkCs=; b=PPDt46imr135yD7Oryv6eJlntR0Dq
 itPlbUKtrA797ZHOR8rTHhiPp1qc9vVE7ZabzKNpApoP1Ug6P/kb3p5+15XJpMKT
 3CYWgllK0h3dLWmI9ooHDutf+jmOKn8Vi6Wf1OSXAzXvYEKtpv6y3PR7uIIG4WFq
 YWBqfMwCL5LwteGoEbPAZSQSFRMczMhWKN+RW/FooZL6OvVdS2s55lc9Q+Junmrn
 sEHoDZWZ3Fwqi9SWlzgxaoFvVXzQpQ1VFwzshcAfB/6775K8BnDWGQiO+XSd80i9
 x25OrYcOHmvcvU6Tw3VTK9goQ1tkACTLtF3n+wnDRV0/dd3D7reiOAUfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3pio9eSFpPHT3t5OcZMDw9RC71u7C6z+HFZqUiJKkCs=; b=h+G/qry5
 2eCdbMuHW+RGZBRu1bZqUN9WHACoWM90kOn6sIMietQdQDRMSgGPpAkuYNcOuVz/
 M10IBKCU4UaIF09FmJj+XKsxNkVn8OOd91UIMYxz7LpFvgVkL+huQTmL5AeWl4Ca
 mbwyW6f8+jwpuB5U4XR/J38pmlf4thMXG/n8bjZFXxc4/muMlcD7JiKkFhm89JWB
 WWNzX1LIaSD1imtxVVbfUaNKE+oK194w+w9Oy0pdJUvgRt7AMEhu/Nb52+5UbgWt
 0ompGYgnsfBpf/vQCFgRYUlAwLrxE/2G93lnwP5E9qnpSDjtNdzR1jSWEs4EzLd6
 NSHDoTST+RLMjw==
X-ME-Sender: <xms:f3lGXa8ZW0esKB_N9k0IE83pZtBhwOKAznu13V7t5tLriFY3j-MBdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:f3lGXe8eVks2IVTmQrxVEAtmpPiZc9zOWr7ca_GS04Zx4BiRP8b32w>
 <xmx:f3lGXbDSdPsNZj1_HnMFlatw25rJMfDz6GkwFpCo_KUUNCU8fqsDKQ>
 <xmx:f3lGXWzeRu9VpVEWKFHwNYVrOm7h4HALm_k0dTvwLoA31hl24aHQwQ>
 <xmx:f3lGXXyuP5bMWFRjtw6T-dCRLaDsbwFYYy8DUz5slntux8dNDccgAQ>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A834380083;
 Sun,  4 Aug 2019 02:21:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:25 +0900
Message-Id: <20190804062138.1217-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/19] ALSA: fireworks: code refactoring for
	bus reset handler
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

This commit is a preparation to support AMDTP domain.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_stream.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index 0f62c50055e9..af340491dc43 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -299,14 +299,11 @@ void snd_efw_stream_stop_duplex(struct snd_efw *efw)
 
 void snd_efw_stream_update_duplex(struct snd_efw *efw)
 {
-	if (cmp_connection_update(&efw->out_conn) < 0 ||
-	    cmp_connection_update(&efw->in_conn) < 0) {
-		stop_stream(efw, &efw->rx_stream);
-		stop_stream(efw, &efw->tx_stream);
-	} else {
-		amdtp_stream_update(&efw->rx_stream);
-		amdtp_stream_update(&efw->tx_stream);
-	}
+	stop_stream(efw, &efw->rx_stream);
+	stop_stream(efw, &efw->tx_stream);
+
+	amdtp_stream_pcm_abort(&efw->rx_stream);
+	amdtp_stream_pcm_abort(&efw->tx_stream);
 }
 
 void snd_efw_stream_destroy_duplex(struct snd_efw *efw)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
