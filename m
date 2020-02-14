Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9315E0DE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 17:15:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4075C16A8;
	Fri, 14 Feb 2020 17:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4075C16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581696952;
	bh=0SWgQkJQOKWSPBkmd87aRoK032f+Kv+nm8qzQkOZh2w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V1bYF3c5mfFZo9+pvwxdCeuu2Fwlv6pZS0KCUHCAh0WsYNJiIGWDUcMp6YRiiuZGu
	 7m7Fi0hOCU/7rd1Wlh/80Et045d/JOkN+H0cXFptGPxaCuKwFW/d4SMt60TyDmwDKt
	 8ZSwZvV9GTCB9NxyzC83smyDY3FMCm2uhl9MnpW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D50FF8028E;
	Fri, 14 Feb 2020 17:09:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5944F8027D; Fri, 14 Feb 2020 17:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86F25F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 17:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F25F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k+cSaa6W"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AC3A22314;
 Fri, 14 Feb 2020 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696534;
 bh=smEs9DZXB4IjMLlUyI3DmUCZLnk/s0uOHhPvWXcrfnE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k+cSaa6WIGy+Gx2SUQ1YVWI2nFZMBobgWyIM/nM2e6/s1v2kbyUOokKI7cUmVat42
 oe58hBeJWlIWZq3FEC6HKc7ijgz+4JOwyDvhNCAwWZs8K8Es3cA0Wrn4GfGL9/ZWTh
 GYHHgocGwvYMSjDB6O2xntRde/yGGapAsyNnpmOY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:59:41 -0500
Message-Id: <20200214160149.11681-331-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 331/459] ALSA: usb-audio: add
	implicit fb quirk for MOTU M Series
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

From: Alexander Tsoy <alexander@tsoy.me>

[ Upstream commit c249177944b650816069f6c49b769baaa94339dc ]

This fixes crackling sound during playback.

Further note: MOTU is known for reusing Product IDs for different
devices or different generations of the device (e.g. MicroBook
I/II/IIc shares a single Product ID). This patch was only tested with
M4 audio interface, but the same Product ID is also used by M2. Hope
it will work for M2 as well.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
Link: https://lore.kernel.org/r/20200115151358.56672-1-alexander@tsoy.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index fa24bd491cf6a..ad8f38380aa3e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -348,6 +348,10 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ep = 0x84;
 		ifnum = 0;
 		goto add_sync_ep_from_ifnum;
+	case USB_ID(0x07fd, 0x0008): /* MOTU M Series */
+		ep = 0x81;
+		ifnum = 2;
+		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
 		/* BOSS Katana amplifiers do not need quirks */
 		return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
