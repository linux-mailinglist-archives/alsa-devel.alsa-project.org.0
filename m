Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E83C300F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C234B172D;
	Sat, 10 Jul 2021 04:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C234B172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885172;
	bh=PkSew/L7a5CZA8pzZm2Fs4l+YfiSZQ4+TPIomgX1wAI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4pRKBll3T9DwzPIKcKwY5eZVStwwuke91RP9n32hixsOVIBmO6zu4/98exwYMve+
	 x1khdvP6XZVQEUjo3gZlJLHhi2AEAmO5MmzExD7PT9hByTYDBrCdp4QIu6lOMwsH80
	 I+rybkHm+mr4XhlKdiCb+rJIvNGp9K+qRcCEtwAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E517F80524;
	Sat, 10 Jul 2021 04:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5198EF80524; Sat, 10 Jul 2021 04:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A05FF80518
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A05FF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JFy0Uah2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18D35613DF;
 Sat, 10 Jul 2021 02:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884304;
 bh=PkSew/L7a5CZA8pzZm2Fs4l+YfiSZQ4+TPIomgX1wAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JFy0Uah2L8bNoBhbhX5HTeK90ezKHbLBnjsAcCEIhskUYpio7p5GOPgBxgAHfdBCV
 0Znud8SqFX5Q67v3xktRUkleVz8hXjiMXA2Vq+j1fD76Tw9S78YmsmlGe9H/b2nrXJ
 VolA652xdflNrTpoTmj745V9Mu6WVVfn//bTFCluHTRFpGNUTY+U/K46eonv3kmWWO
 zH1/deTigOIn7SGewCuW85fmSACTUIjGc9KCMon1HSCF2V3BAWROMzeYHjyFyR7OFt
 sn9aMd8uZe9lQQbY79S6r/+iX1XvNmthOvgpieVsTAe9tLm8lXeb7QTkZ6Ei+kbnig
 gFpa9kiV3bQYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 49/63] ALSA: usb-audio: scarlett2: Fix 18i8 Gen 2
 PCM Input count
Date: Fri,  9 Jul 2021 22:26:55 -0400
Message-Id: <20210710022709.3170675-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022709.3170675-1-sashal@kernel.org>
References: <20210710022709.3170675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, "Geoffrey D. Bennett" <g@b4.vu>
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

From: "Geoffrey D. Bennett" <g@b4.vu>

[ Upstream commit c5210f213456383482b4a77c5310282a89a106b5 ]

The 18i8 Gen 2 has 8 PCM Inputs, not 20. Fix the ports entry in
s18i8_gen2_info.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Link: https://lore.kernel.org/r/20210620164625.GA9165@m.b4.vu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_scarlett_gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 7a10c9e22c46..a1f1ff72be4f 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -356,7 +356,7 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 		},
 		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
-			.num = { 20, 18, 18, 14, 10 },
+			.num = { 8, 18, 18, 14, 10 },
 			.src_descr = "PCM %d",
 			.src_num_offset = 1,
 			.dst_descr = "PCM %02d Capture"
-- 
2.30.2

