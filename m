Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3F1F24A1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 01:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F25D1675;
	Tue,  9 Jun 2020 01:23:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F25D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591658664;
	bh=sKZcWyp++va0RYlP8fE5B/2tUxL5JWyf+WqesDEiMhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8yJSPYUf2D+LCSzNFFlJSGMd8p6up6rQjWtMqrgQnGnq90JEXcGNF0XfLWwBPJW4
	 w8fyGslwDbI4rwl56MDHCElsdmIAQoETDjjA2uo3fXR7aJONpRBxR1pwDYMF+F7wMD
	 rUJqo8+l8Fs/ZCrmugG2kf0J9nTtY9JU2/2fE8LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49ED2F802DC;
	Tue,  9 Jun 2020 01:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4CD7F802DC; Tue,  9 Jun 2020 01:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D244F801EB
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 01:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D244F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uCYi31k4"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DD2420814;
 Mon,  8 Jun 2020 23:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658320;
 bh=sKZcWyp++va0RYlP8fE5B/2tUxL5JWyf+WqesDEiMhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uCYi31k4uBbxOVf+hC3aDZFjMjUcFn31D5K2np5nYvolR+V+IEEyxFLFBj+WiO43D
 FGXHFNdQqO8gdazk3eyER8PZJ5y9J0tVPC9KwyHwAlTZr3UpyZTydbDSqiHM3q9pMb
 Wy8jkAPL+YezWk09vmM1+IGC59Hihq6HLPzPjtHg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 320/606] ALSA: usb-audio: mixer: volume quirk for
 ESS Technology Asus USB DAC
Date: Mon,  8 Jun 2020 19:07:25 -0400
Message-Id: <20200608231211.3363633-320-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessm.com>
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

From: Chris Chiu <chiu@endlessm.com>

[ Upstream commit 4020d1ccbe55bdf67b31d718d2400506eaf4b43f ]

The Asus USB DAC is a USB type-C audio dongle for connecting to
the headset and headphone. The volume minimum value -23040 which
is 0xa600 in hexadecimal with the resolution value 1 indicates
this should be endianness issue caused by the firmware bug. Add
a volume quirk to fix the volume control problem.

Also fixes this warning:
  Warning! Unlikely big volume range (=23040), cval->res is probably wrong.
  [5] FU [Headset Capture Volume] ch = 1, val = -23040/0/1
  Warning! Unlikely big volume range (=23040), cval->res is probably wrong.
  [7] FU [Headset Playback Volume] ch = 1, val = -23040/0/1

Signed-off-by: Chris Chiu <chiu@endlessm.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20200526062613.55401-1-chiu@endlessm.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 7a2961ad60de..68fefe55e5c0 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1171,6 +1171,14 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 			cval->res = 384;
 		}
 		break;
+	case USB_ID(0x0495, 0x3042): /* ESS Technology Asus USB DAC */
+		if ((strstr(kctl->id.name, "Playback Volume") != NULL) ||
+			strstr(kctl->id.name, "Capture Volume") != NULL) {
+			cval->min >>= 8;
+			cval->max = 0;
+			cval->res = 1;
+		}
+		break;
 	}
 }
 
-- 
2.25.1

