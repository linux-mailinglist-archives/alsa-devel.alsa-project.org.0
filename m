Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E133805B1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E97371779;
	Fri, 14 May 2021 10:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E97371779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620982713;
	bh=1ZXdm8pTtC/nG10bdRLb3qC/4Zh/lLgPlX7pixpghCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGS+aTd4sjYHPOyCf/hwxaWMcYeq/j5swZ5BUDcAxQEqXfmW1sMcI9dgI6t7c8Kn2
	 /rsgzLIECuTTBbEVmGbCVxVe709rZmev0l8VxJqkELVGkG0HyDQmv04Yf3wiiVSoTM
	 6F+uKVKPG7Ku9bR3576dVlgMIuqb4OvDvpw4cUbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0280F804AD;
	Fri, 14 May 2021 10:55:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78F34F80425; Fri, 14 May 2021 10:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB22DF8012A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB22DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="vjqxkQiz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZPjrn0yd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 30BF45C00EB;
 Fri, 14 May 2021 04:54:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 14 May 2021 04:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Jy2LW2cr6vrv+
 89UR16uSzZjaYfzKGHKtULxRNu6xAw=; b=vjqxkQizxjUO3u90U3EOGdzEPhxHw
 TFeuuEQ9cgA2DchvOLOfspRF6/8uSVG7hwC+a6j8+PumKsSj/jZVHgJr7hQTFDX1
 P0i1NOwI1kJN8iA5xF0unLIzVRsrhMGCB4BEMaub6kB5RcZnF8KBmjijh4x83NHE
 Za0PF5vXrWqksSpaefbQjHoq1uLtawVPuVHaqDFvcRnqQcAfxsEY9lyfHOtfzOIT
 2miGVQOGZSzJGLYu9Rj+vixIlTdORZoBCvjm0ZzwhDQBpWDbiH1lxGFIhT491p9B
 JVgPyY8SIx4JcOT2ZD34GCTrvRlLG0Qe6MSfCpzPPJ6bY5FG+TTHzdcOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Jy2LW2cr6vrv+89UR16uSzZjaYfzKGHKtULxRNu6xAw=; b=ZPjrn0yd
 iTgxwzX4Hh7B+/nGoQDv2Qu85bwRq7sT622IEuZ6mYcf0SIDVQ0B7eT6hdjvv0zd
 TOxMbi/+Yu/WrjfFju2NzyzYagQZFUDIRNq84eRJ4N+a0pXF/NBCEUEqjXfsNJ3u
 KY/XVDDaTZM2J8UXYzNobtS1B/TOuOR9I6N9ZVP2qkmqXqCCNu36GHlmM9KF93St
 KKM1eIwMmqxSX9el7VOeLg7cTjGnh0n1u23GtbhGgzNvuJTvphCcmtpNi/lGmK59
 YP7upgRMVYlLBLk4E+Z+2WqDNhMIUNNpUczWtjz3x22AylF54j7lPOhNoxSVQJ4v
 8y3oEtnNEE283Q==
X-ME-Sender: <xms:2TqeYL5hZH2Lfk4XMIwe-V6txT5wbGl6QyfFZWQM2cAsd46c4KWeDg>
 <xme:2TqeYA5urLr8uEnVApCtlZZLuz-F86a6Ms4hfq3mREyMFqyKN6PV2_nlVGy8t8Emn
 SmnPcbWnVdkanAPjYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehhedgudefjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevfefffe
 ektefgveegfeelheffhfeujedtjeevtefhkeevkedtjeejvddtjefhjeenucfkphepudeg
 rdefrdeihedrudejheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:2TqeYCfIk_bb_HYDj3_W6M6QqHkoskMCGesJdqLBG8u0sY4p03F6yw>
 <xmx:2TqeYMKull3eXRVV2OBOvRnPwmttMliqx_OkrVioLlz4VXbE68AuDw>
 <xmx:2TqeYPJ4Rs1iPHDACfSmbYAdyJLHhS0gl7xb0mVOSot8tYCNljDhRg>
 <xmx:2TqeYBwjTeHN9ohPV9rSEo5aYM52aAz70bj2AuZAeB0W_gj3ON3YUA>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 14 May 2021 04:54:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 6/7] ALSA: firewire-lib: code refactoring for jumbo payload
 quirk
Date: Fri, 14 May 2021 17:54:34 +0900
Message-Id: <20210514085435.92807-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
References: <20210514085435.92807-1-o-takashi@sakamocchi.jp>
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

A new macro is added to describe the maximum number of cycles to accept
cycle skip by jumbo payload quirk.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index e0faa6601966..d78f86e12e76 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -64,6 +64,11 @@
 #define IT_PKT_HEADER_SIZE_CIP		8 // For 2 CIP header.
 #define IT_PKT_HEADER_SIZE_NO_CIP	0 // Nothing.
 
+// The initial firmware of OXFW970 can postpone transmission of packet during finishing
+// asynchronous transaction. This module accepts 5 cycles to skip as maximum to avoid buffer
+// overrun. Actual device can skip more, then this module stops the packet streaming.
+#define IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES	5
+
 static void pcm_period_work(struct work_struct *work);
 
 /**
@@ -316,7 +321,7 @@ unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s)
 	unsigned int cip_header_size = 0;
 
 	if (s->flags & CIP_JUMBO_PAYLOAD)
-		multiplier = 5;
+		multiplier = IR_JUMBO_PAYLOAD_MAX_SKIP_CYCLES;
 	if (!(s->flags & CIP_NO_HEADER))
 		cip_header_size = sizeof(__be32) * 2;
 
-- 
2.27.0

