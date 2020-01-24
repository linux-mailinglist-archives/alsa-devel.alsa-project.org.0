Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A49147667
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 02:19:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3F541698;
	Fri, 24 Jan 2020 02:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3F541698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579828791;
	bh=lNI4N6ykVItiCOXAM4tjMlXQxvYvEMyBVgxUY7bZs88=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8VL8FuSSxEhFcR6xjoJv/POUYCXZbjUVdky3JO40NKkFnxmTWoIkqn+XT5wIpA6A
	 wmO3HpzSJlimh2vDHGYqzd2P8/eFyDLRpp2hS91jv8z1K8CCC0gguBmkVG8DTgFSet
	 0kV/YPYbcZ6VYpQUzNkDVE/jsfdSLAJH61C35qjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F3FDF8026F;
	Fri, 24 Jan 2020 02:17:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC42F8021C; Fri, 24 Jan 2020 02:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B12F80112
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 02:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B12F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G/wLQSCo"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1224C22464;
 Fri, 24 Jan 2020 01:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579828658;
 bh=Pt57xNn7PwEg7RGA+JlsfMYabBJJPJkE2lr3e5SGsSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G/wLQSCoMWcFD6yqaQ5VUH4v4QQwUqUGXHtwSfBa05oI2ceBdeTQPVb+c2PjiF1ox
 nXwe1BGOS120pRGWqGZN6wNJ7gkOFwb0JJLqHAboqMK3OGPm3usUPBdRHLyxSbv0Z3
 imAmxH8wRe1v6Yf715mt22x9g4M/mm5Q8leFay2Y=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 23 Jan 2020 20:17:01 -0500
Message-Id: <20200124011708.18232-26-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124011708.18232-1-sashal@kernel.org>
References: <20200124011708.18232-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Hui Wang <hui.wang@canonical.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Sasha Levin <sashal@kernel.org>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 26/33] ALSA: hda/realtek - Move
	some alc236 pintbls to fallback table
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

From: Hui Wang <hui.wang@canonical.com>

[ Upstream commit d64ebdbfd4f71406f58210f5ccb16977b4cd31d2 ]

We have a new Dell machine which needs to apply the quirk
ALC255_FIXUP_DELL1_MIC_NO_PRESENCE, try to use the fallback table
to fix it this time. And we could remove all pintbls of alc236
for applying DELL1_MIC_NO_PRESENCE on Dell machines.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
Link: https://lore.kernel.org/r/20191121022644.8078-2-hui.wang@canonical.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d293488dc3dd3..68832f52c1ad2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7563,20 +7563,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x19, 0x02a11020},
 		{0x1a, 0x02a11030},
 		{0x21, 0x0221101f}),
-	SND_HDA_PIN_QUIRK(0x10ec0236, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60140},
-		{0x14, 0x90170110},
-		{0x21, 0x02211020}),
-	SND_HDA_PIN_QUIRK(0x10ec0236, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x90a60140},
-		{0x14, 0x90170150},
-		{0x21, 0x02211020}),
-	SND_HDA_PIN_QUIRK(0x10ec0236, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x21, 0x02211020}),
-	SND_HDA_PIN_QUIRK(0x10ec0236, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
-		{0x12, 0x40000000},
-		{0x14, 0x90170110},
-		{0x21, 0x02211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0255, 0x1028, "Dell", ALC255_FIXUP_DELL2_MIC_NO_PRESENCE,
 		{0x14, 0x90170110},
 		{0x21, 0x02211020}),
@@ -7901,6 +7887,9 @@ static const struct snd_hda_pin_quirk alc269_fallback_pin_fixup_tbl[] = {
 	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1028, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
 		{0x19, 0x40000000},
 		{0x1a, 0x40000000}),
+	SND_HDA_PIN_QUIRK(0x10ec0236, 0x1028, "Dell", ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
+		{0x19, 0x40000000},
+		{0x1a, 0x40000000}),
 	{}
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
