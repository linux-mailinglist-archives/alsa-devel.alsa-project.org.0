Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C89EC38C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 14:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11761217A;
	Fri,  1 Nov 2019 14:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11761217A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572614171;
	bh=fokyf7KQEMMzH/XwA2Tvk6TOdYL9Vty8TxzfsPSraeU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r1e+NHHbTdaMD6lO9YQIux7le3YhEq2Fd4MtjSd2M3/s0RMrOzhSChb3bgbcnnV2X
	 AqM6Dn0KBrlPKhUmb/eIxwuD+L9s4ZMgW5QqxK787C4wT+roXvezxZQka1DZZdCMl+
	 PrZ6yb6d78FqKskQiloF1L2xn0bVd4qVyKgeBSiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8139F805FE;
	Fri,  1 Nov 2019 14:13:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9746F80120; Fri,  1 Nov 2019 14:13:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A25E1F80120
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 14:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25E1F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="R42TaIFB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CL+ioZG0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 75CCD5B1;
 Fri,  1 Nov 2019 09:13:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 01 Nov 2019 09:13:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=WHyKWXobZuX8t
 vqw34vRlKPWgKIcrLVnJLgeng7GMys=; b=R42TaIFBjmP1m6cU1dnkWSquiNFaC
 mjMFrI/vcsU93lneUwZ8kGf98ZAFB1SIHetXcW/T0vZ+5ctoe6zmAqoMODTixXTj
 lKtzDkwJsiEF1rsOSyAldEvKQk5ab3is0T8DxEwTStNbfMNxft2yHcT22+XuPi1K
 qRw9g/ACPpA8IzRJOHFIvdrTgGnrSmavRSwlY6Fam7Y6ZNBz1mzK2DTvj2HHYeDm
 FF3z1xSiEjxQsK3YTvk8gdx8PRSWxZy0aHWf91ytksSvSpsVgznxJ+/gc3ICRxQh
 IffyrQA13ICy+7xN7o4QKK9UKNnc/WeRH+zI+OkYCK09jpqdsEa4ctSCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=WHyKWXobZuX8tvqw34vRlKPWgKIcrLVnJLgeng7GMys=; b=CL+ioZG0
 ss1hlNn9s9YEkN1Eack6+p8SHNsUFW0L2H9V+UR7M/Yv253LSfYSSfjLWA+8S3ao
 hnI/IqLOyznSeM3FGe/yxHnP6exvkrqfYarp6T3gxuWtgQS2cw45C4srYaVV8o4Z
 E9auX4BHsYrGyIwQo0Ix2+12Bl9zmYZkQLlI4wDKc+IXt0tKahkUL6y7hitIPegK
 ecuPPZBJw0dygXMcR6vuX1lZtDt9CTU9VvZkj2Oun8RF3//T3SW8Sop9TNMTkg86
 xYvHNUktdGq3Ag4YZ5W7a1Y+JCErRc+HYDzEx7eCjzsr8URzSnPJ7btbXgF87rj+
 5Q9DAEgL8jA9Aw==
X-ME-Sender: <xms:ei-8XQfu1_h5TBVzNPSCJKGvjSZkcHbpHmMoAJ1tJcbKTXxUvFiwZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtjedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ei-8XeiP6TVN84TnAqnJoRCHQRUJUxSPRJRSFOOXJ53_YC-TlZCRdQ>
 <xmx:ei-8XUS_m7Q9GWYkby55qdbnwGdzIXoL_DBagCnBNAKAcAbptnR3JA>
 <xmx:ei-8XXwna_eHx_A1-jJ5wAb2h40PDpVQN3aVj634dSjWp9mfsV9Mbw>
 <xmx:ey-8XaPWrG8nPLWknxR-Bb6JiCLn_aJSX60DgpIWjoETmYxEFdAsDw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id CC450306005B;
 Fri,  1 Nov 2019 09:13:29 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Fri,  1 Nov 2019 22:13:22 +0900
Message-Id: <20191101131323.17300-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
References: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/3] ALSA: bebob: expand delay of start for IR
	context just for version 3 firmware
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

As long as I investigated, there's some cases about the delay for device
between establishing OUTPUT_PLUG and transmitting first isoc packet. For
devices which support BeBoB protocol version 1 can transmit the packet
within several hundred milliseconds, while for devices which support
BeBoB protocol version 3 can transmit the packet within 2 seconds.

Devices with protocol version 1:
 * Edirol FA-66
 * Yamaha GO46
 * Terratec Phase x24 FW
 * M-Audio FireWire AudioPhile
 * M-Audio FireWire Solo
 * M-Audio FireWire 1814
 * M-Audio FireWire 410
 * Focusrite Saffire Pro 26 I/O

Devices with protocol version 3:
 * M-Audio Profire Lightbridge
 * Behringer FCA610
 * Phonic Firefly 202

At present ALSA bebob driver postpones starting IR context during
1.5 sec for all of supported devices. The delay is too long for
devices with protocol version 1, while it's not enough for devices with
protocol version 3.

This commit improves the delay for these protocols.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_stream.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
index 1b264d0d63eb..895a113635af 100644
--- a/sound/firewire/bebob/bebob_stream.c
+++ b/sound/firewire/bebob/bebob_stream.c
@@ -7,7 +7,7 @@
 
 #include "./bebob.h"
 
-#define CALLBACK_TIMEOUT	2000
+#define CALLBACK_TIMEOUT	2500
 #define FW_ISO_RESOURCE_DELAY	1000
 
 /*
@@ -639,6 +639,7 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 
 	if (!amdtp_stream_running(&bebob->rx_stream)) {
 		unsigned int curr_rate;
+		unsigned int ir_delay_cycle;
 
 		if (bebob->maudio_special_quirk) {
 			err = bebob->spec->rate->get(bebob, &curr_rate);
@@ -660,13 +661,18 @@ int snd_bebob_stream_start_duplex(struct snd_bebob *bebob)
 
 		// The device postpones start of transmission mostly for 1 sec
 		// after receives packets firstly. For safe, IR context starts
-		// 1.5 sec (=12000 cycles) later. This is within 2.0 sec
-		// (=CALLBACK_TIMEOUT).
+		// 0.4 sec (=3200 cycles) later to version 1 or 2 firmware,
+		// 2.0 sec (=16000 cycles) for version 3 firmware. This is
+		// within 2.5 sec (=CALLBACK_TIMEOUT).
 		// Furthermore, some devices transfer isoc packets with
 		// discontinuous counter in the beginning of packet streaming.
 		// The delay has an effect to avoid detection of this
 		// discontinuity.
-		err = amdtp_domain_start(&bebob->domain, 12000);
+		if (bebob->version < 2)
+			ir_delay_cycle = 3200;
+		else
+			ir_delay_cycle = 16000;
+		err = amdtp_domain_start(&bebob->domain, ir_delay_cycle);
 		if (err < 0)
 			goto error;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
