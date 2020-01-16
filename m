Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9C13E920
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:36:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D998617D3;
	Thu, 16 Jan 2020 18:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D998617D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579196204;
	bh=QGbybOKOwNV+rb9HGKVKUirHaZdd3NHWJwLJ1Ho2AGk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/A9l+tVoGVD7O6LpGYFfsHOeX1Vi+oO8Un6Sy/EorElwLn6clQZo5bMXrjgRarp3
	 j4MQxr//9BLTAJnkolMir1vUKVTv8zk+3b5+XpBPjYDm0bUdgXEPYT2ZLZKWgzqG/k
	 bXwjyycNlTLZ8MZ5TuKWm0jGUBSWj2jG/ckU6bGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC09F80086;
	Thu, 16 Jan 2020 18:35:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46158F80171; Thu, 16 Jan 2020 18:34:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46AF4F8014D
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46AF4F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZZT5dwMJ"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B7D9246DA;
 Thu, 16 Jan 2020 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196093;
 bh=OrMNX1uLlv82W6tGFkTa+kfFkYiYi9GgSKXUK6E0HIg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZZT5dwMJFJ6b3w5ER/IhXSo0ztGlKfBtV2hZyCWyWeQqIoqPbFkEy810NVZVLzoSb
 BwNS1RXv886/XSjV3lN28xPF2Kim8vGTF6+gNm96OtTd4mdVGnROg36ESsG6vDwdaE
 zTgsuPI9yoSLdVRwem2lRD08xRHxPg6BbfmeTWYc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:30:40 -0500
Message-Id: <20200116173445.21385-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116173445.21385-1-sashal@kernel.org>
References: <20200116173445.21385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Nicolas Huaman <nicolas@herochao.de>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Sasha Levin <sashal@kernel.org>
Subject: [alsa-devel] [PATCH AUTOSEL 4.9 006/251] ALSA: usb-audio: update
	quirk for B&W PX to remove microphone
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

From: Nicolas Huaman <nicolas@herochao.de>

[ Upstream commit c369c8db15d51fa175d2ba85928f79d16af6b562 ]

A quirk in snd-usb-audio was added to automate setting sample rate to
4800k and remove the previously exposed nonfunctional microphone for
the Bowers & Wilkins PX:
commit 240a8af929c7c57dcde28682725b29cf8474e8e5
https://lore.kernel.org/patchwork/patch/919689/

However the headphones where updated shortly after that to remove the
unintentional microphone functionality. I guess because of this the
headphones now crash when connecting them via USB while the quirk is
active. Dmesg:

snd-usb-audio: probe of 2-3:1.0 failed with error -22
usb 2-3: 2:1: cannot get min/max values for control 2 (id 2)

This patch removes the microfone and allows the headphones to connect
and work out of the box. It is based on the current mainline kernel
 and successfully applied an tested on my machine (4.18.10.arch1-1).

Fixes: 240a8af929c7 ("ALSA: usb-audio: Add a quirck for B&W PX headphones")
Signed-off-by: Nicolas Huaman <nicolas@herochao.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks-table.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index d32727c74a16..c892b4d1e733 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3293,19 +3293,14 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 				.ifnum = 0,
 				.type = QUIRK_AUDIO_STANDARD_MIXER,
 			},
-			/* Capture */
-			{
-				.ifnum = 1,
-				.type = QUIRK_IGNORE_INTERFACE,
-			},
 			/* Playback */
 			{
-				.ifnum = 2,
+				.ifnum = 1,
 				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
 				.data = &(const struct audioformat) {
 					.formats = SNDRV_PCM_FMTBIT_S16_LE,
 					.channels = 2,
-					.iface = 2,
+					.iface = 1,
 					.altsetting = 1,
 					.altset_idx = 1,
 					.attributes = UAC_EP_CS_ATTR_FILL_MAX |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
