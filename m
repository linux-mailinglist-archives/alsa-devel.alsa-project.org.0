Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A544B638
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDBF1661;
	Tue,  9 Nov 2021 23:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDBF1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496585;
	bh=d1FIuv/dVVxW19ZgxtqFuPC8CVQXUTdfjD91zC5VN2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUArODzGHOEC7I/5Qan0ZjJWF2idB7hSToJYZPVUef4URyxWJ3jgau64YKcoHvBel
	 WiOUuQZMgBKnfOva8W6GFIP+0fWWZa+hjYxmDpRLeKy7bpF1uWC19q85SEEqeRo1M8
	 aFOrqdlmtuqnjpvbR+CSAuodWvEqx5Z9d51rFzHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 648E8F804D0;
	Tue,  9 Nov 2021 23:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0A7FF802E3; Tue,  9 Nov 2021 23:19:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88FDDF80425
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88FDDF80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DLBGruY4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8FBA61211;
 Tue,  9 Nov 2021 22:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496335;
 bh=d1FIuv/dVVxW19ZgxtqFuPC8CVQXUTdfjD91zC5VN2w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DLBGruY4GntLaDxwkqGidoZGNE6VAeL+3qfzgTdZGx19pEaXrxYJDASe8FuBR/Tkr
 mjzC3KzFUNMLzgmc0AoKQwkTV6GDk4LhC9ORl9RCPU1+aBVVt9XPCsGfZNzpnbkc1k
 SOVeEFAn0N04qfGH5RE+dmAbhuTyuv9JQHC1roJ003xbIYp7YTguicpwgj1VwdNKQa
 FcrbjJMwB6bmeWPTphc7686Tu+bXJZ/rhGltV4ERPPIvVYZURXpXFCNNrzdM2RcABB
 X80uvdsE2ksieUrqixRzl1L/AC73kKtF9jaVqCG9QuvG+GdaWWY19hxRHq07rX9Ru9
 ySuPsdQy0qQyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 77/82] ALSA: usb-audio: fix null pointer
 dereference on pointer cs_desc
Date: Tue,  9 Nov 2021 17:16:35 -0500
Message-Id: <20211109221641.1233217-77-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221641.1233217-1-sashal@kernel.org>
References: <20211109221641.1233217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Chengfeng Ye <cyeaa@connect.ust.hk>
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

From: Chengfeng Ye <cyeaa@connect.ust.hk>

[ Upstream commit b97053df0f04747c3c1e021ecbe99db675342954 ]

The pointer cs_desc return from snd_usb_find_clock_source could
be null, so there is a potential null pointer dereference issue.
Fix this by adding a null check before dereference.

Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
Link: https://lore.kernel.org/r/20211024111736.11342-1-cyeaa@connect.ust.hk
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/clock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 81d5ce07d548b..98345a695dccb 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -496,6 +496,10 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 	union uac23_clock_source_desc *cs_desc;
 
 	cs_desc = snd_usb_find_clock_source(chip, clock, fmt->protocol);
+
+	if (!cs_desc)
+		return 0;
+
 	if (fmt->protocol == UAC_VERSION_3)
 		bmControls = le32_to_cpu(cs_desc->v3.bmControls);
 	else
-- 
2.33.0

