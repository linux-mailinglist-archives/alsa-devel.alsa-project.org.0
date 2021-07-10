Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82F3C321A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD1DC1772;
	Sat, 10 Jul 2021 04:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD1DC1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885863;
	bh=JbCjgc8ev0nZxAc//eKoDLMYRNLvBgKM6lXAiMftk6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AilDrHHNbyX6T0GDMKCNS6sgeoI9YmaEblk1dbZFqSrGNFpS50m6UgcJn8i0aKwx6
	 /g9ixeLv1ZOy26sg9aRh9C6G0BrKGzRmm4iiaWnbhs6uTO2D4DCYPQPbJikDKcBHCz
	 5UEu/JYqP4grbuy6hXFfh45rdUXugKYI5p88eH3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB53FF80600;
	Sat, 10 Jul 2021 04:26:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96A83F804EC; Sat, 10 Jul 2021 04:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0347FF804E5
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0347FF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dZOCvpqA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 171DA613CC;
 Sat, 10 Jul 2021 02:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884000;
 bh=JbCjgc8ev0nZxAc//eKoDLMYRNLvBgKM6lXAiMftk6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dZOCvpqAuSDe2S2bqt0gP3rTypJoqvFc/y2NWY903Zf9Zwa9K9OXCEyM9Kl/QdY7U
 VOybHB3jCWHEIMvID/dgW+IHv+8VLAYcDePt1f6t53YKNyPimBu4iQYuQgHiejIg+W
 v/1YjKRGIqr2zvP7XtF9c7lgtV81w55PSS7a1R7v1YV++VdpZJRLhvY5qjc6p9OJdI
 cmUeQeK91auL0S+l6vsmB6qyLUqPc1ImIXYsynsFUyhdvSbeXrGO0yolQSbe6OAzgv
 IuZqOMpbUkSv+MlUFYmLr0iO7SgQLtUOwobAUqY91rg5Ngc5V8LGMK7rodxxNRXN+I
 8el5OGIQbC0yA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 75/93] ALSA: usb-audio: scarlett2: Fix 18i8 Gen 2
 PCM Input count
Date: Fri,  9 Jul 2021 22:24:09 -0400
Message-Id: <20210710022428.3169839-75-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022428.3169839-1-sashal@kernel.org>
References: <20210710022428.3169839-1-sashal@kernel.org>
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
index 9a98b0c048e3..e605ec5a91ba 100644
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

