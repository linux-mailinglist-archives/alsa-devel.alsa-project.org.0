Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D30496309A9
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 03:15:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F01216C6;
	Sat, 19 Nov 2022 03:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F01216C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668824153;
	bh=OSKBnjS0CLNwFCl54XfBSFAtollL0k1rDe7M1vayXpA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aopjPozsFpcEB/bOxOB4m3YIPFpfwL8xYzHpW2/v1BbYkOq/wHWOvPBok1J+Dxuod
	 JwzCS1fSZS8FOQmvDJPu+I1Axylv/zZi96htARx5QQp2SWhe5HB6L+gQNPTkbBhFuH
	 95j+2ALyDF+Ah8qHhqHnEV6AXf5/tjjRT1+pq/BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 555FEF8020D;
	Sat, 19 Nov 2022 03:14:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED78CF801D8; Sat, 19 Nov 2022 03:14:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE3D1F8016E
 for <alsa-devel@alsa-project.org>; Sat, 19 Nov 2022 03:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE3D1F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bV2R90QR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D5D362831;
 Sat, 19 Nov 2022 02:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F54FC433D6;
 Sat, 19 Nov 2022 02:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668824087;
 bh=OSKBnjS0CLNwFCl54XfBSFAtollL0k1rDe7M1vayXpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bV2R90QR7lWuiQx88SZ2vVzJxx/m3EkloZJESC5OGkASocjUS8mBqtSPVuB59aiNw
 NrgoFBBrzvBbzeHwfQccxqvSrUmGXo76kqhgZd/6eOaCdeLwl2yBizKBCaz4R74im0
 JlevvOlJ3ZXJfBt0iMdB7YhODWKCHFTiMN1g6JNwHGJtPCsWjNMlqu8XhHFZwkBxqn
 dQt53hjv1BQK/m1q6iIJHq7yITd4/11Yx7IJXULgsDm0dbdXltxfi6jiLCMjQzP3iz
 v/WX+0AUQu9aK4V8wD59F9v/NH2TYfkazjSRAWmaJmjK5ZWt6WL1KwyyNv3ICvhKq5
 lEOPHDtrKPNvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 25/27] ALSA: usb-audio: add quirk to fix Hamedal
 C20 disconnect issue
Date: Fri, 18 Nov 2022 21:13:50 -0500
Message-Id: <20221119021352.1774592-25-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021352.1774592-1-sashal@kernel.org>
References: <20221119021352.1774592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, jussi@sonarnerd.net, wanjiabing@vivo.com,
 john-linux@pelago.org.uk, connerknoxpublic@gmail.com,
 Takashi Iwai <tiwai@suse.de>, Ai Chao <aichao@kylinos.cn>, sdoregor@sdore.me,
 ubizjak@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 cyrozap@gmail.com, bp@suse.de
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

From: Ai Chao <aichao@kylinos.cn>

[ Upstream commit bf990c10231937c0f51e5da5558e08cf5adc6a78 ]

For Hamedal C20, the current rate is different from the runtime rate,
snd_usb_endpoint stop and close endpoint to resetting rate.
if snd_usb_endpoint close the endpoint, sometimes usb will
disconnect the device.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
Link: https://lore.kernel.org/r/20221110063452.295110-1-aichao@kylinos.cn
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/endpoint.c | 3 ++-
 sound/usb/quirks.c   | 2 ++
 sound/usb/usbaudio.h | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 3bbc227769d0..092350eb5f4e 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -887,7 +887,8 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "Closing EP 0x%x (count %d)\n",
 		      ep->ep_num, ep->opened);
 
-	if (!--ep->iface_ref->opened)
+	if (!--ep->iface_ref->opened &&
+		!(chip->quirk_flags & QUIRK_FLAG_IFACE_SKIP_CLOSE))
 		endpoint_set_interface(chip, ep, false);
 
 	if (!--ep->opened) {
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 879d8b1f301c..2ae9ad993ff4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1884,6 +1884,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x2b53, 0x0031, /* Fiero SC-01 (firmware v1.1.0) */
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
+	DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
+		   QUIRK_FLAG_IFACE_SKIP_CLOSE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 39c3c61a7e49..ec06f441e890 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -169,6 +169,8 @@ extern bool snd_usb_skip_validation;
  *  Apply the generic implicit feedback sync mode (same as implicit_fb=1 option)
  * QUIRK_FLAG_SKIP_IMPLICIT_FB
  *  Don't apply implicit feedback sync mode
+ * QUIRK_FLAG_IFACE_SKIP_CLOSE
+ *  Don't closed interface during setting sample rate
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -190,5 +192,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_SET_IFACE_FIRST	(1U << 16)
 #define QUIRK_FLAG_GENERIC_IMPLICIT_FB	(1U << 17)
 #define QUIRK_FLAG_SKIP_IMPLICIT_FB	(1U << 18)
+#define QUIRK_FLAG_IFACE_SKIP_CLOSE	(1U << 19)
 
 #endif /* __USBAUDIO_H */
-- 
2.35.1

