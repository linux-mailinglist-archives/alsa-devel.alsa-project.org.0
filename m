Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0E1FDF44
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C0A1696;
	Thu, 18 Jun 2020 03:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C0A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592444469;
	bh=kUGcVXRVxnsE4PRZ85J75kYg4bxTrLdCNBvOPXpXS+4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rTAiEMp2T0HKtutz3T6Mf39yHD0mQBtjQC6Q3R3F+/Kbsg3D0LqmmMOVyfEbPIkGg
	 Mj2+Mj38NjqrBo/4cQhTsxl5p1JqSbs/kyp7/YYok8vMQKAgMTEPOLUOn07BlD/wRH
	 9XyOE2O2RCKptvuqO2/Y3RsN6BURhj8VvNZEx7mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34591F8029B;
	Thu, 18 Jun 2020 03:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C75BF8047E; Thu, 18 Jun 2020 03:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D507F8033F
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D507F8033F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ve3ILFa3"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6891221D7E;
 Thu, 18 Jun 2020 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443161;
 bh=kUGcVXRVxnsE4PRZ85J75kYg4bxTrLdCNBvOPXpXS+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ve3ILFa37zhWTHeOkMPAyznMcleaCjbSI+Uuzl3g2+c6lZmLLD+lcpKS3WqWgPSUs
 +CkX87ik4cDlr9MvDvOuBXtiFSbXwV2eAD2+VVfzqgxSChkS9IW3ZyMzEk7dklptKR
 3ZDGxHhQYzSa+2DQHiInCdTdAzEKmeLQDexviUy0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 127/266] ALSA: firewire-lib: fix invalid
 assignment to union data for directional parameter
Date: Wed, 17 Jun 2020 21:14:12 -0400
Message-Id: <20200618011631.604574-127-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit 8304cf77c92038cd1c50c27b69d30be695cc8003 ]

Although the value of FDF is used just for outgoing stream, the assignment
to union member is done for both directions of stream. At present this
causes no issue because the value of same position is reassigned later for
opposite stream. However, it's better to add if statement.

Fixes: d3d10a4a1b19 ("ALSA: firewire-lib: use union for directional parameters")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20200508043635.349339-2-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/amdtp-am824.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/amdtp-am824.c b/sound/firewire/amdtp-am824.c
index 67d735e9a6a4..fea92e148790 100644
--- a/sound/firewire/amdtp-am824.c
+++ b/sound/firewire/amdtp-am824.c
@@ -82,7 +82,8 @@ int amdtp_am824_set_parameters(struct amdtp_stream *s, unsigned int rate,
 	if (err < 0)
 		return err;
 
-	s->ctx_data.rx.fdf = AMDTP_FDF_AM824 | s->sfc;
+	if (s->direction == AMDTP_OUT_STREAM)
+		s->ctx_data.rx.fdf = AMDTP_FDF_AM824 | s->sfc;
 
 	p->pcm_channels = pcm_channels;
 	p->midi_ports = midi_ports;
-- 
2.25.1

