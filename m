Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841431BAEF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0740166F;
	Mon, 15 Feb 2021 15:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0740166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399027;
	bh=SHuGNF9gz4NxFjeFiYk6WikXqWC+9o0JC6+jLRZLAb0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCjQGHIfIA1H8yBxHiEKv5VhYH4c4F1nju5FnE0FHySzLMDJSnCauAWDXE21j5dO+
	 oymb1yF3EwpyFxAsJqwjgTpMu0CjyVfsDF/PEYEzmgxLX6iSBcmYa17xR2hpyXx0ti
	 d09dj+ZC3AVlkMP4an54pXokX+1f8XWW3ypwmpI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 861BAF80271;
	Mon, 15 Feb 2021 15:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8538F8025B; Mon, 15 Feb 2021 15:21:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77EB8F800C1
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77EB8F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IZTWUv3n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCGoFElCqgrWWHTxArqYRp3QKoWJFBWKxDqjg5uUpns=;
 b=IZTWUv3nADMOls7qZ5+2xu3tIlbsVRZWZQWrzigTN+G5i5BRzMIFkFAridDoKjKGD2GKkR
 JoCUsVjoo4kYfGt+FZqtU9uaUWDjX1ZPjvugYGUE1W2vqrsMeGebNwCr37+071JqzKOskp
 WbhLWh2d6pQpPRKNltALm8SVynlv+C8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-OTlkoNgmNUaPKRXQKiIGKg-1; Mon, 15 Feb 2021 09:21:26 -0500
X-MC-Unique: OTlkoNgmNUaPKRXQKiIGKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64CDD6EE20;
 Mon, 15 Feb 2021 14:21:24 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAD6C5D9CD;
 Mon, 15 Feb 2021 14:21:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 1/4] ASoC: rt5670: Remove 'OUT Channel Switch' control
Date: Mon, 15 Feb 2021 15:21:15 +0100
Message-Id: <20210215142118.308516-2-hdegoede@redhat.com>
In-Reply-To: <20210215142118.308516-1-hdegoede@redhat.com>
References: <20210215142118.308516-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <bard.liao@intel.com>
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

The "OUT Channel Switch" control is a left over from code copied from
thr rt5640 codec driver.

With the rt5640 codec driver the output volume controls have 2 pairs of
mute bits:
bit 7, 15: Mute Control for Spk/Headphone/Line Output Port
bit 6, 14: Mute Control for Spk/Headphone/Line Volume Channel

Bits 7 and 15 are normal mute bits on the rt5670/5672 which are
controlled by 2 dapm widgets:
	SND_SOC_DAPM_SWITCH("LOUT L Playback", SND_SOC_NOPM, 0, 0,
			    &lout_l_enable_control),
	SND_SOC_DAPM_SWITCH("LOUT R Playback", SND_SOC_NOPM, 0, 0,
			    &lout_r_enable_control),

But on the 5670/5672 bit 6 is always reserved, where as bit 14 is
"LOUT Differential Mode" on the 5670 and also reserved on the 5672.

So the "OUT Channel Switch" control which is controlling bits 6+14
of the "LINE Output Control" register is bogus -> remove it.

This should not cause any issues for userspace. AFAICT the rt567x codecs
are only used on x86/ACPI devices and the UCM profiles used there do not
use the "OUT Channel Switch" control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 2 --
 sound/soc/codecs/rt5670.h | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index a0c8f58d729b..b13d9e0e0e61 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -637,8 +637,6 @@ static const struct snd_kcontrol_new rt5670_snd_controls[] = {
 		RT5670_L_VOL_SFT, RT5670_R_VOL_SFT,
 		39, 1, out_vol_tlv),
 	/* OUTPUT Control */
-	SOC_DOUBLE("OUT Channel Switch", RT5670_LOUT1,
-		RT5670_VOL_L_SFT, RT5670_VOL_R_SFT, 1, 1),
 	SOC_DOUBLE_TLV("OUT Playback Volume", RT5670_LOUT1,
 		RT5670_L_VOL_SFT, RT5670_R_VOL_SFT, 39, 1, out_vol_tlv),
 	/* DAC Digital Volume */
diff --git a/sound/soc/codecs/rt5670.h b/sound/soc/codecs/rt5670.h
index 56b13fe6bd3c..f9c4db156c80 100644
--- a/sound/soc/codecs/rt5670.h
+++ b/sound/soc/codecs/rt5670.h
@@ -212,12 +212,8 @@
 /* global definition */
 #define RT5670_L_MUTE				(0x1 << 15)
 #define RT5670_L_MUTE_SFT			15
-#define RT5670_VOL_L_MUTE			(0x1 << 14)
-#define RT5670_VOL_L_SFT			14
 #define RT5670_R_MUTE				(0x1 << 7)
 #define RT5670_R_MUTE_SFT			7
-#define RT5670_VOL_R_MUTE			(0x1 << 6)
-#define RT5670_VOL_R_SFT			6
 #define RT5670_L_VOL_MASK			(0x3f << 8)
 #define RT5670_L_VOL_SFT			8
 #define RT5670_R_VOL_MASK			(0x3f)
-- 
2.30.1

