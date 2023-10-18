Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843C7CDEE4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:15:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03EDDDE5;
	Wed, 18 Oct 2023 16:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03EDDDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638503;
	bh=nVcIiEHY2EosQ4wSCJl9q/5UDKUS1EHQmF9SC/TidPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CFaIv3P6izqTcyZKX48lyHU6OCUtWuGHZyLPo4MAS4LAkIBOtAbFz/5wxTGIlCzY6
	 7L2DuTkfalUr3nVhxtUyOUDZjaelGepeNkIt8y+T7djF/WZPTGkRcyBAZOH47+Ct0Y
	 Lyx8BQJHpNgtKh8kCGycWXn7HPXajD1m9Zo4n0ts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DADF805C2; Wed, 18 Oct 2023 16:12:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A4FF805BB;
	Wed, 18 Oct 2023 16:12:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BFCEF805BD; Wed, 18 Oct 2023 16:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90566F805AA
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90566F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bIJ4RtcE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0C7C0CE2549;
	Wed, 18 Oct 2023 14:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23010C433C7;
	Wed, 18 Oct 2023 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638344;
	bh=nVcIiEHY2EosQ4wSCJl9q/5UDKUS1EHQmF9SC/TidPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bIJ4RtcE1qELN0rYpCIuDXseEA1cDWp+1dhsMmyeKjrmFgJnPbvsCiSuqPtdSAeVo
	 KIhpY5K0Lw445U5eWJCxi3iy5vG6BT4Y4+78NHNN8lZ7OCI7sySLxjK3D1rI6CI1NU
	 wcdHwEYvmtbfvjHCFOmsyq6M9CUDEvZpbsj5spv0wbrMmYAB7kV7k7qZ23AdsEQGUt
	 oKVGWHzHOOQseRYHsPA1hqacZik+9+S7UTgAXM+mR/PyHRBkm/AtPaoBfJplI0Vvpz
	 S+dKebD0ysus8lKFHo05H5vZ3snOZFYG16IxCYBxMQLmhrhS843yX6AeB/PtRgk5j4
	 Rpau3RBYaUwZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: WhaleChang <whalechang@google.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	jussi@sonarnerd.net,
	john@keeping.me.uk,
	ltyl@hem-e.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.5 13/31] ALSA: usb-audio: Fix microphone sound on
 Opencomm2 Headset
Date: Wed, 18 Oct 2023 10:11:30 -0400
Message-Id: <20231018141151.1334501-13-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141151.1334501-1-sashal@kernel.org>
References: <20231018141151.1334501-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.7
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EWGTCN2EF2HJJHZY4DX3BADDUFVEQBQJ
X-Message-ID-Hash: EWGTCN2EF2HJJHZY4DX3BADDUFVEQBQJ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWGTCN2EF2HJJHZY4DX3BADDUFVEQBQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: WhaleChang <whalechang@google.com>

[ Upstream commit 6a83d6f3bb3c329a73e3483651fb77b78bac1878 ]

When a Opencomm2 Headset is connected to a Bluetooth USB dongle,
the audio playback functions properly, but the microphone does not work.

In the dmesg logs, there are messages indicating that the init_pitch
function fails when the capture process begins.

The microphone only functions when the ep pitch control is not set.

Toggling the pitch control off bypasses the init_piatch function
and allows the microphone to work.

Signed-off-by: WhaleChang <whalechang@google.com>
Link: https://lore.kernel.org/r/20231006044852.4181022-1-whalechang@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 598659d761cc9..d4bbef70d2f7b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1994,7 +1994,11 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		/* mic works only when ep packet size is set to wMaxPacketSize */
 		fp->attributes |= UAC_EP_CS_ATTR_FILL_MAX;
 		break;
-
+	case USB_ID(0x3511, 0x2b1e): /* Opencomm2 UC USB Bluetooth dongle */
+		/* mic works only when ep pitch control is not set */
+		if (stream == SNDRV_PCM_STREAM_CAPTURE)
+			fp->attributes &= ~UAC_EP_CS_ATTR_PITCH_CONTROL;
+		break;
 	}
 }
 
-- 
2.40.1

