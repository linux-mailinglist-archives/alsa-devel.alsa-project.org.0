Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A27A164FFED
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Dec 2022 17:07:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B63A27B9;
	Sun, 18 Dec 2022 17:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B63A27B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671379626;
	bh=hT2opjcJ3EtQG+hfhaekVL/4QBKSyY0p5MkotzEjS/c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EBu6S2vQL7hgEdZL+n4mfiXWNvARQYW6RC22FXdc9z7WY1sgbOB5+cPFkqGk9CUWP
	 SYQdvlrkDWu8llJv0ZJTxqyCcA6DZ7lZ6MdGuL3b0Eg91zxY2VbCjsNByepPYsxRGU
	 F5ftJGXPVgAlZGvoo1jsnxYAwMsHtxER3XuwSqr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C594AF8025E;
	Sun, 18 Dec 2022 17:06:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6279FF80496; Sun, 18 Dec 2022 17:06:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688A5F8025E
 for <alsa-devel@alsa-project.org>; Sun, 18 Dec 2022 17:06:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688A5F8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uyKM5NYf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8B5F60DB4;
 Sun, 18 Dec 2022 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6A7C433D2;
 Sun, 18 Dec 2022 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671379562;
 bh=hT2opjcJ3EtQG+hfhaekVL/4QBKSyY0p5MkotzEjS/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uyKM5NYfA0MsY6Da0EQQeCnnEPK3Bm4XvsUAqwbbooRZvJRSIwo+AP1VmkdiKfFUr
 cUaS6nNJe68iqx0vsftLpIk8xTDQoatlfPGic9sYuuSZlcUeCSO6ITYJRutRx7D0ue
 +0IH7hXFK78UD0bKH8vt9SCRibKw8zd/uL8lZGulVSJnMTbRoYphzc+Mx5LQoSMxoG
 /D43Zl+BI44Pro2I/P7/y6xBV3IAeQdqchc0ZzvnGOZrxVzw0I1v5RhmlzMEXyQR8K
 Ey9bSTsx7iIkx/g7VrXpe++R7PRrNJEcVQP4L6dFCBVrW+hJgb+KNNAuVgp8fIrkvh
 BbW36VsrvcBnw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 63/85] ALSA: usb-audio: Add quirk for Tascam Model
 12
Date: Sun, 18 Dec 2022 11:01:20 -0500
Message-Id: <20221218160142.925394-63-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 wanjiabing@vivo.com, john-linux@pelago.org.uk, connerknoxpublic@gmail.com,
 Takashi Iwai <tiwai@suse.de>, ubizjak@gmail.com, sdoregor@sdore.me,
 aichao@kylinos.cn, tiwai@suse.com, John Keeping <john@metanate.com>,
 cyrozap@gmail.com, bp@suse.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: John Keeping <john@metanate.com>

[ Upstream commit 67df411db3f0209e4bb5227d4dd9d41b21368b9d ]

Tascam's Model 12 is a mixer which can also operate as a USB audio
interface.  The audio interface uses explicit feedback but it seems that
it does not correctly handle missing isochronous frames.

When injecting an xrun (or doing anything else that pauses the playback
stream) the feedback rate climbs (for example, at 44,100Hz nominal, I
see a stable rate around 44,099 but xrun injection sees this peak at
around 44,135 in most cases) and glitches are heard in the audio stream
for several seconds - this is significantly worse than the single glitch
expected for an underrun.

While the stream does normally recover and the feedback rate returns to
a stable value, I have seen some occurrences where this does not happen
and the rate continues to increase while no audio is heard from the
output.  I have not found a solid reproduction for this.

This misbehaviour can be avoided by totally resetting the stream state
by switching the interface to alt 0 and back before restarting the
playback stream.

Add a new quirk flag which forces the endpoint and interface to be
reconfigured whenever the stream is stopped, and use this for the Tascam
Model 12.

Separate interfaces are used for the playback and capture endpoints, so
resetting the playback interface here will not affect the capture stream
if it is running.  While there are two endpoints on the interface,
these are the OUT data endpoint and the IN explicit feedback endpoint
corresponding to it and these are always stopped and started together.

Signed-off-by: John Keeping <john@metanate.com>
Link: https://lore.kernel.org/r/20221129130100.1257904-1-john@metanate.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/endpoint.c | 7 +++++++
 sound/usb/quirks.c   | 2 ++
 sound/usb/usbaudio.h | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 310cd6fb0038..4aaf0784940b 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1673,6 +1673,13 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep, bool keep_pending)
 		stop_urbs(ep, false, keep_pending);
 		if (ep->clock_ref)
 			atomic_dec(&ep->clock_ref->locked);
+
+		if (ep->chip->quirk_flags & QUIRK_FLAG_FORCE_IFACE_RESET &&
+		    usb_pipeout(ep->pipe)) {
+			ep->need_prepare = true;
+			if (ep->iface_ref)
+				ep->iface_ref->need_setup = true;
+		}
 	}
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 0f4dd3503a6a..58b37bfc885c 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2044,6 +2044,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	DEVICE_FLG(0x0644, 0x804a, /* TEAC UD-301 */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY |
 		   QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x0644, 0x805f, /* TEAC Model 12 */
+		   QUIRK_FLAG_FORCE_IFACE_RESET),
 	DEVICE_FLG(0x06f8, 0xb000, /* Hercules DJ Console (Windows Edition) */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x06f8, 0xd002, /* Hercules DJ Console (Macintosh Edition) */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index e97141ef730a..2aba508a4831 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -172,6 +172,9 @@ extern bool snd_usb_skip_validation;
  *  Don't apply implicit feedback sync mode
  * QUIRK_FLAG_IFACE_SKIP_CLOSE
  *  Don't closed interface during setting sample rate
+ * QUIRK_FLAG_FORCE_IFACE_RESET
+ *  Force an interface reset whenever stopping & restarting a stream
+ *  (e.g. after xrun)
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -194,5 +197,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_GENERIC_IMPLICIT_FB	(1U << 17)
 #define QUIRK_FLAG_SKIP_IMPLICIT_FB	(1U << 18)
 #define QUIRK_FLAG_IFACE_SKIP_CLOSE	(1U << 19)
+#define QUIRK_FLAG_FORCE_IFACE_RESET	(1U << 20)
 
 #endif /* __USBAUDIO_H */
-- 
2.35.1

