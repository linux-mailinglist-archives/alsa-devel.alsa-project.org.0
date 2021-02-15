Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 890EB31BAF0
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 15:24:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB6B1675;
	Mon, 15 Feb 2021 15:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB6B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613399066;
	bh=oi0RhY/Bk6SJp/zjhS0yhFbq5dMRJObR6CPvpg/z50I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpM4c5L3pPlPX7wnAsvvKBApTga7zeqX/FoKvw9dDFI0N4L2035oAKBZyc18N4cW5
	 ckS/tnQJCxzBTp17JKnMvMgp+bWtW4lF1FUe3q94o3tPtkdK4SIOfcwui27PoY+awN
	 nhfU0gYimn9hPeOStUMfnlGMNdXOIDIOhM3NFKo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73E25F80276;
	Mon, 15 Feb 2021 15:22:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 172ABF800C1; Mon, 15 Feb 2021 15:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D231AF80258
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 15:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D231AF80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="AEaCI7mE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613398889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TbQIb71PkCE19iRUmQGkxzPhZjg1ovtsTxQ8qZ8RDc=;
 b=AEaCI7mElE0klNe8M5Jnpqd+oIAtyPr+fGgu74TZAfplIhsCv9a82fTrM+KtGbCg4kDn2W
 SFBf2VKZY5yrfhPGZbXSYD+tsXhD0p6TWKQgNkTXlBCPyX5ymAit9SstUK6zwJ/A0b+2d+
 sL+6tikmanOW13DMxgvz8uFg6Qjb0vM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ghoYfua7PhqqRpHSaDoyWQ-1; Mon, 15 Feb 2021 09:21:27 -0500
X-MC-Unique: ghoYfua7PhqqRpHSaDoyWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4346E107ACE3;
 Mon, 15 Feb 2021 14:21:26 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC6395D9CC;
 Mon, 15 Feb 2021 14:21:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 2/4] ASoC: rt5670: Remove 'HP Playback Switch' control
Date: Mon, 15 Feb 2021 15:21:16 +0100
Message-Id: <20210215142118.308516-3-hdegoede@redhat.com>
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

The RT5670_L_MUTE_SFT and RT5670_R_MUTE_SFT bits (bits 15 and 7) of the
RT5670_HP_VOL register are set / unset by the headphones deplop code
run by rt5670_hp_event() on SND_SOC_DAPM_POST_PMU / SND_SOC_DAPM_PRE_PMD.

So we should not also export a control to userspace which toggles these
same bits.

This should not cause any issues for userspace. AFAICT the rt567x codecs
are only used on x86/ACPI devices and the UCM profiles used there do not
use the "HP Playback Switch" control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index b13d9e0e0e61..0f372a748b0e 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -631,8 +631,6 @@ static SOC_ENUM_SINGLE_DECL(rt5670_if2_adc_enum, RT5670_DIG_INF1_DATA,
 
 static const struct snd_kcontrol_new rt5670_snd_controls[] = {
 	/* Headphone Output Volume */
-	SOC_DOUBLE("HP Playback Switch", RT5670_HP_VOL,
-		RT5670_L_MUTE_SFT, RT5670_R_MUTE_SFT, 1, 1),
 	SOC_DOUBLE_TLV("HP Playback Volume", RT5670_HP_VOL,
 		RT5670_L_VOL_SFT, RT5670_R_VOL_SFT,
 		39, 1, out_vol_tlv),
-- 
2.30.1

