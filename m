Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C56FD42D806
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 13:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEA7166B;
	Thu, 14 Oct 2021 13:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEA7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634210363;
	bh=NyMb3WErlw1pvar4/J8xwhOgvcvbCNpz3QtDgT+4tnw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nlhnV97z0h0ev8BXqFztul4x5CAHFA27c620B7dWvYFdvNYa0lK2TeFIIf644itHE
	 MqrO6CDUCmmKTkQ6p9+cLfvSDEBfgE9HrHu11uXyS7eb+Ws1SIELSZOtC37j0cJ9KS
	 ZiOaWBPKxZPmROHecJNYDIV+0BBaK0WUAek0y8oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5EA3F801F7;
	Thu, 14 Oct 2021 13:18:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5571F80212; Thu, 14 Oct 2021 13:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C4EEF801D5
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 13:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4EEF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="ShNu7UuV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C865D610E7;
 Thu, 14 Oct 2021 11:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634210273;
 bh=NyMb3WErlw1pvar4/J8xwhOgvcvbCNpz3QtDgT+4tnw=;
 h=Date:From:To:Cc:Subject:From;
 b=ShNu7UuVKhKza2uqlxhPkmkf0jE5EB8xtFUwk0uSUFyt8mVp9lKR1kQhKBxgSiuxa
 1OrQDhAFfs29N6Dm+IXnTqJY6pzlv/JF1h+qo/+5mS0GBWivTj3DnuTZlwcLvckdGm
 CmJdHPmkvpisham1FOtvJW4yERs2CWrCeOd375r8=
Date: Thu, 14 Oct 2021 13:17:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: add Schiit Hel device to quirk table
Message-ID: <YWgR3nOI1osvr5Yo@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; h=from:subject;
 bh=NyMb3WErlw1pvar4/J8xwhOgvcvbCNpz3QtDgT+4tnw=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIkZgtO2dW66/u2Rc8rXpYGpe2fePve/c1tEjxyjtAWvcMc+
 4ylrO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiVocY5oc8YZggM+Puk/zapSzWl7
 Ydv+eSuZZhnsUKj5xbh0y3TXh1vI/3FttX7ZaiKAA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

The Shciit Hel device responds to the ctl message for the mic capture
switch with a timeout of -EPIPE:

	usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
	usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
	usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
	usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1

This seems safe to ignore as the device works properly with the control
message quirk, so add it to the quirk table so all is good.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6ee6d24c847f..ec11be366dc0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1884,6 +1884,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x30be, 0x0101, /* Schiit Hel */
+		   QUIRK_FLAG_IGNORE_CTL_ERROR),
 	DEVICE_FLG(0x413c, 0xa506, /* Dell AE515 sound bar */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
-- 
2.33.0

