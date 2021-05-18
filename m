Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7807387976
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 15:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 628EA16EF;
	Tue, 18 May 2021 15:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 628EA16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621343007;
	bh=z+CvZjdBajX9m5+Z15+xFBzNbw/0ohx3UXffc0FcAW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+8IygTuwxvByk3DvMz4e7nnmn6X8MmRos+VKfiYx8OgpH750iusHX348k8Qhxgyp
	 mYSioh2zQk2gtc8pjrq/bzCiYRteN6lwshckgR4vlZ78XN84YC+GkCEr3f5lD48gZD
	 NpzFeUfNN2HYHYrtK5XKQ2TGtbOVZrGzRdNa+7AA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94402F802C8;
	Tue, 18 May 2021 15:01:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F8EF80482; Tue, 18 May 2021 15:01:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50ADCF8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50ADCF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="h4qi1qtx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="g4ifCJqd"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CD81A5C0217;
 Tue, 18 May 2021 09:00:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 18 May 2021 09:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=hW8aEP2R3GD5Z
 PM4D6zUZu+sNEI/6OiWu1LbEM9Pt+Q=; b=h4qi1qtxbszRm7RwJkkMkkqvPfG4f
 lf4DWKK9H6HtA4Cm67wc1P0sw06gLuefQDkhPL/H8kFNZCrHdt/H5K72N4wEQTyJ
 u7IPz2HnbmU3AhHdT5V5YSmqf5pgS1bB/F0g3wh+gNiBPfiY249Hb6VFGpgs4HjM
 Upyd8biEeXehP/jR04u3XWnO14Y0ZUDgiQkMkIs93vLHupTQPaYkYrso2iH458PO
 wj2Rl1dHMJJHex9h8P6xPmenSMI920hHu86fDfmMR5C8jl0A0VYjhBaxl5jNXKvL
 42DlkXjMblGNt1UJoyIebxCVZDI4xb2y0v4PxNveqyXhBxz7gDbhAx58A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hW8aEP2R3GD5ZPM4D6zUZu+sNEI/6OiWu1LbEM9Pt+Q=; b=g4ifCJqd
 4GpbpiE+qU3Q1NW+m0N1JehhDJWeZzXEnbF2tsQyrD1z9ZV/2sUDl18BBWlm78jl
 e4cooiC/4+ScKeXnDKn/tue5Oq+1/fz1bNl5rAkTrU+phzyDt2gyspW8fiJnNUlv
 FkuOxQlKRXq2PKgNZqJhDXqF0QzqfZEsp2uMXpY8f2hP1qH+pZKk/LFsN2pyubyD
 TCCVtdKpRSOj/j4FxEUJdVMR+c5Cxgy7U5ZYH51Vl6cSUw71BOKu/SiSZuU1GNnH
 Dmkh8tV6eNSfcqkul9g6bYdA8x3wO+Ax9Gg426idpHUZUyr1odM0unEQEu0ubzMr
 29SjxA2PHgu25w==
X-ME-Sender: <xms:iLqjYDH3ikzOA_3F66Srn858WjwbIWKrlGX_z6Y5NnQFOlZXNH5IZg>
 <xme:iLqjYAViYxhJFGF-L0M1r2svgShnoHRW80zU-BRf3ksNaTtDpAocQSRo5Mq3QWXia
 x0kVjIymKNX4u9gq3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:iLqjYFKSXVZEjEDNewwqCwQLxbyg98-ElWm56M7V9px6jtdYJXTygQ>
 <xmx:iLqjYBFlyBs02pXczr1DRW51HGhScE5CgOfDSlLPF-4yolftQdNjuQ>
 <xmx:iLqjYJUSEAVVs6Ld6oEKFx0B0tMcAJT7E2XlfvgETNlE02tw0v4n_A>
 <xmx:iLqjYKfnF3yCANELyyJnrluNKkDSEYlSTF4rANrt30krnarwNcskcg>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 09:00:55 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 2/8] ALSA: firewire-lib: handle the case that empty
 isochronous packet payload for CIP
Date: Tue, 18 May 2021 22:00:41 +0900
Message-Id: <20210518130048.146596-3-o-takashi@sakamocchi.jp>
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

Two quadlets are at least included in isochronous packet payload for
Common Isochronous Packet (CIP) format in IEC 61883-1. However, it's
better to equip ALSA IEC 61883-1/6 packet streaming engine for contrary
packet.

This commit handles isochronous cycle to process such packet so that the
cycle is skipped.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index ac37cd4c2b33..fcb70f349a2f 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -656,11 +656,18 @@ static int parse_ir_ctx_header(struct amdtp_stream *s, unsigned int cycle,
 	}
 
 	if (cip_header_size > 0) {
-		cip_header = ctx_header + 2;
-		err = check_cip_header(s, cip_header, *payload_length,
-				       data_blocks, data_block_counter, syt);
-		if (err < 0)
-			return err;
+		if (*payload_length >= cip_header_size) {
+			cip_header = ctx_header + 2;
+			err = check_cip_header(s, cip_header, *payload_length, data_blocks,
+					       data_block_counter, syt);
+			if (err < 0)
+				return err;
+		} else {
+			// Handle the cycle so that empty packet arrives.
+			cip_header = NULL;
+			*data_blocks = 0;
+			*syt = 0;
+		}
 	} else {
 		cip_header = NULL;
 		err = 0;
-- 
2.27.0

