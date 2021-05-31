Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AB395414
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 04:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEEE4166A;
	Mon, 31 May 2021 04:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEEE4166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622429664;
	bh=0GlxFRqTLbyfaaC/zhD7HGT85zSRrVW1/97TU+6JcV0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SgiocB2um9TW4/e5YzOlSm0NMWn4SfMKhqt/WutGX/pT0NkLiB4TxLkw1nbXnBQLO
	 e+NwAc+FD3UrqJDQs6XGl/5uQForV41PItA+7NFy/wkkZbvuQd1vDAKWzY7hqwIBdV
	 HdvPwZ314IGTh09rSPFh22dHeBUJI0V5rQ3QeCCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78CC7F804CC;
	Mon, 31 May 2021 04:51:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E328CF80275; Mon, 31 May 2021 04:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5446F80275
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 04:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5446F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="WtHOniqo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kCxSVoe2"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EE4F05C0087;
 Sun, 30 May 2021 22:51:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 30 May 2021 22:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=FAwxlH/7rDxL/
 CtKDL/wjAlOwAcGL+FmKsGy1L39wQk=; b=WtHOniqoqRO7jecxEy4odipXWxG7x
 a+WaZNATaNMF/wcWIMdNnoxi6FWkQSs9Ah5HByP+O4iApYtMYhuSRAbDoQPXizW+
 gNUCy+vZ2y2GhXH0RfEAnw+6vS5BtAU391z/Zetqd2uMynWleo8rDNk1rmIRcnCV
 eRsoe7ZeUUR0xppdveVMKkckYfRENQWSehraDA+pDLBzGmWU5RsLxDRtmzO6+A3R
 wm9335ZQEJWgs8LYBM1xQPEr0NT6vCk1ugV4xPSCkPq1EV7DT+CHUcsBR8t9gDk3
 iDVgKs7tzIyHo8e/3Pv0D6igAfqPT6GOOoPdJiuDWWazHf7GnlZp71lpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FAwxlH/7rDxL/CtKDL/wjAlOwAcGL+FmKsGy1L39wQk=; b=kCxSVoe2
 71LrleUmwTa1ypSahGDxKfFow+x8xCEhyqhK+1fe8wuy+T91Sro+mcEuGNS6f8hL
 /Lt9kkjRS4C0BD8Udb7yBpY5wWaghnD7yfdSpfdf0ow9uB3jVpP9Bdg+bSts+8SV
 MLQ2rxdvgQaF0uMbfaX9vFF+s92z4VPx3mmbPmTzKqfu7BJa/mMb9IlmZ7Y8asJn
 mizVjkrK/nPVrIrQt5OV61QL7AwgClbhyu64ofOiDivPWwepMKw2ljdAwEkghhib
 SeKjB2KqIwtZYFzh28dyhmRNdnVJe8+fr5PI/gvnDzOoM7C6Wg4Qgb7MhDE5wzQj
 tAzFEJNWz24VhA==
X-ME-Sender: <xms:Ik-0YObV_JojUcQhLGRWuULJhlVGr08m7voZaUfiQv73zohib0cPRQ>
 <xme:Ik-0YBbT0RFUOi4XGLkSCDefXPFJoLE6t-R8gntnFoc7mQd_CKL-HQ61QBkNZ-hKJ
 xRPyD0XaOsngk3cUG0>
X-ME-Received: <xmr:Ik-0YI_8pL2QpdoTb0Sz4HEISUCyptvSoXm1-M6Bcu06Fi2wNL9jp1BLAGtpkZrlwV8nNzSjg3LzR99XAAAi6w_K_ySggdM6LvGXCZVv8NydHvn00Al5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelvddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Ik-0YApv3xS5xIzjt0lttL026OskIyFQNrDOhfkQGNrVJns8XCvd_A>
 <xmx:Ik-0YJoHYeZLfEyCU7j6xwkXNCE19oC1qC0R4qLWORXzqPS06yGENA>
 <xmx:Ik-0YOQ0A1OBF2yYK_x3NAVynpxFg_SLLPUXuJtuTzTvGnKT-K47tg>
 <xmx:Ik-0YKCRjdRiziLBGzgE72qkpWR7qh_tyccY4BvJcf1XaSJmU_F44g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 May 2021 22:51:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 5/6] ALSA: firewire-tascam: perform sequence replay for media
 clock recovery
Date: Mon, 31 May 2021 11:51:02 +0900
Message-Id: <20210531025103.17880-6-o-takashi@sakamocchi.jp>
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

This commit takes ALSA firewire-tascam driver to perform sequence replay
for media clock recovery.

The protocol specific to Tascam FireWire series is not compliant to
IEC 61883-1/6 in terms of syt field of CIP. The protocol doesn't use
presentation time in received CIP for playback timing. The sequence of
the number of data blocks per packet is important for media clock
recovery.

Although the devices in Tascam FireWire series transfer packets
regardless of receiving packets, the tx packets includes no events
in the beginning of streaming. It takes so long to multiplex any event
into the packet after receiving the sequence of packets. As long as I
experienced, it takes several thousands of isochronous cycle. Furthermore,
just after changing sampling transmission frequency, it stops multiplexing
event at once, then starts multiplexing again.

The sequence replay is tested with below models:
 * FW-1884
 * FW-1804
 * FW-1082

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 21 +++++++++++++++++++--
 sound/firewire/tascam/tascam.h        |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 4811b60e5823..53e094cc411f 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -11,7 +11,7 @@
 #define CLOCK_STATUS_MASK      0xffff0000
 #define CLOCK_CONFIG_MASK      0x0000ffff
 
-#define READY_TIMEOUT_MS	500
+#define READY_TIMEOUT_MS	4000
 
 static int get_clock(struct snd_tscm *tscm, u32 *data)
 {
@@ -423,6 +423,8 @@ int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate,
 			fw_iso_resources_free(&tscm->rx_resources);
 			return err;
 		}
+
+		tscm->need_long_tx_init_skip = (rate != curr_rate);
 	}
 
 	return 0;
@@ -454,6 +456,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 
 	if (!amdtp_stream_running(&tscm->rx_stream)) {
 		int spd = fw_parent_device(tscm->unit)->max_speed;
+		unsigned int tx_init_skip_cycles;
 
 		err = set_stream_formats(tscm, rate);
 		if (err < 0)
@@ -473,7 +476,19 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		if (err < 0)
 			goto error;
 
-		err = amdtp_domain_start(&tscm->domain, 0, false, false);
+		if (tscm->need_long_tx_init_skip)
+			tx_init_skip_cycles = 16000;
+		else
+			tx_init_skip_cycles = 0;
+
+		// MEMO: Just after starting packet streaming, it transfers packets without any
+		// event. Enough after receiving the sequence of packets, it multiplexes events into
+		// the packet. However, just after changing sampling transfer frequency, it stops
+		// multiplexing during packet transmission. Enough after, it restarts multiplexing
+		// again. The device ignores presentation time expressed by the value of syt field
+		// of CIP header in received packets. The sequence of the number of data blocks per
+		// packet is important for media clock recovery.
+		err = amdtp_domain_start(&tscm->domain, tx_init_skip_cycles, true, true);
 		if (err < 0)
 			return err;
 
@@ -499,6 +514,8 @@ void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm)
 
 		fw_iso_resources_free(&tscm->tx_resources);
 		fw_iso_resources_free(&tscm->rx_resources);
+
+		tscm->need_long_tx_init_skip = false;
 	}
 }
 
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 78b7a08986a1..28dad4eae9c9 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -99,6 +99,7 @@ struct snd_tscm {
 	unsigned int push_pos;
 
 	struct amdtp_domain domain;
+	bool need_long_tx_init_skip;
 };
 
 #define TSCM_ADDR_BASE			0xffff00000000ull
-- 
2.27.0

