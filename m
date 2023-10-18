Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43BD7CDEFC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F331DEE;
	Wed, 18 Oct 2023 16:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F331DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638554;
	bh=tlLALlZc8lRhCcdrr02v5GI29jD6SXikxOtIkZKF5ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m7Qv/kc0ylwvScLXZkQ67yC28cHUShPd0hn2jN2fzOM+gOslu/KB+gAAc4rzXlmXY
	 O1Fo7Vv9PQ2SbMGOrJ8ih4waYRSz/hw4nEEvF+pX8dKnGAoBsgXRdeLOGZx5uM8NWj
	 MzPFZwa8GOgKk2sjyKP9Yz2qVdsfunvgqZKNVJkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E74C1F805D6; Wed, 18 Oct 2023 16:13:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E0EF805D2;
	Wed, 18 Oct 2023 16:13:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97D35F805D3; Wed, 18 Oct 2023 16:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9422CF805CA
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9422CF805CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hnnh/WsV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43DB961291;
	Wed, 18 Oct 2023 14:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F08EC433CC;
	Wed, 18 Oct 2023 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638424;
	bh=tlLALlZc8lRhCcdrr02v5GI29jD6SXikxOtIkZKF5ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hnnh/WsVc+gpmr6pfPxfxkwjE8A2RzHuNE3wAcTUGd+Qwc/fPCGCgXTxYKRYqSAEd
	 KY5CHzChFQK2ao0u7Xyia5ty0fxYj1Z+I0CY4RKtjGJpTAsVzmnNZePZL2S9qw67Lx
	 FtqXn+r5SAt5kkC8OLh12FDqFIgiFtkPV0ON+b1LJ7j96rFoB57Pi6f/xgsP0uh120
	 zx9IxaGkogshP6GjHRQJ4xBnTDvb7ctkNS4aSu1NDjt7zS5emxTMVSq8kG4Z7fvoDq
	 ND3h7hMLcQAwvbffAXdbqLbioycC3i24AVrMUrzAKxpMiv/IYvJ8jia7SY8FKsm9gQ
	 GXJm+npYiiwdQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: WhaleChang <whalechang@google.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	jussi@sonarnerd.net,
	aichao@kylinos.cn,
	john@keeping.me.uk,
	ltyl@hem-e.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 09/19] ALSA: usb-audio: Fix microphone sound on
 Opencomm2 Headset
Date: Wed, 18 Oct 2023 10:13:11 -0400
Message-Id: <20231018141323.1334898-9-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018141323.1334898-1-sashal@kernel.org>
References: <20231018141323.1334898-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.58
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UC5WS2TSZR2VTELHPULOTA42MNEE5WVS
X-Message-ID-Hash: UC5WS2TSZR2VTELHPULOTA42MNEE5WVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UC5WS2TSZR2VTELHPULOTA42MNEE5WVS/>
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
index 4667d543f7481..80ee3b54bfe9c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1992,7 +1992,11 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
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

