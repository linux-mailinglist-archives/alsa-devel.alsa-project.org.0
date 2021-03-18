Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB63406C2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 14:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65DF6169A;
	Thu, 18 Mar 2021 14:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65DF6169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616073709;
	bh=MNGicR3pQBY+lqKuUwWVxIrwlJld1LsjIx7l83uKSng=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J7df/uBBTif76fUWAiq81zG7lI530zCwh0FwkK62hpFlEuWVqycwbbSAIGGv1MeT9
	 RTu40wTXwaMUiE/mMV9yPGVZnpgSUGneEyrHfRBjDUgLsOr0XmkW+xl9fboVx2yOKV
	 fzin8XwQqKG4Dmba4P6rfvq8clFWfZ93vjKKltlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7DAF80124;
	Thu, 18 Mar 2021 14:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD84BF80165; Thu, 18 Mar 2021 14:20:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B82F8F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 14:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B82F8F800E0
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lMsZN-0001kM-0q; Thu, 18 Mar 2021 13:20:09 +0000
From: Colin King <colin.king@canonical.com>
To: Olivia Mackintosh <livvy@base.nu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix unintentional sign extension issue
Date: Thu, 18 Mar 2021 13:20:08 +0000
Message-Id: <20210318132008.15266-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

The shifting of the u8 integer device by 24 bits to the left will
be promoted to a 32 bit signed int and then sign-extended to a
64 bit unsigned long. In the event that the top bit of device is
set then all then all the upper 32 bits of the unsigned long will
end up as also being set because of the sign-extension. Fix this
by casting device to an unsigned long before the shift.

Addresses-Coverity: ("Unintended sign extension")
Fixes: a07df82c7990 ("ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5b77e8140ba6..f13cdfd8bd20 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2926,7 +2926,7 @@ static int snd_djm_controls_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_v
 	u8 group = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
 	u16 value = elem->value.enumerated.item[0];
 
-	kctl->private_value = ((device << SND_DJM_DEVICE_SHIFT) |
+	kctl->private_value = (((unsigned long)device << SND_DJM_DEVICE_SHIFT) |
 			      (group << SND_DJM_GROUP_SHIFT) |
 			      value);
 
@@ -2964,7 +2964,7 @@ static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
 		value = device->controls[i].default_value;
 		knew.name = device->controls[i].name;
 		knew.private_value = (
-			(device_idx << SND_DJM_DEVICE_SHIFT) |
+			((unsigned long)device_idx << SND_DJM_DEVICE_SHIFT) |
 			(i << SND_DJM_GROUP_SHIFT) |
 			value);
 		err = snd_djm_controls_update(mixer, device_idx, i, value);
-- 
2.30.2

