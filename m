Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BC330274
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 16:07:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A641F19;
	Sun,  7 Mar 2021 16:06:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A641F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615129663;
	bh=iiaHnM2MsTvXQ+Wq9X5W8+XjcwQNiYnDfDdF6lOpA+U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m42GrkyAYQGh8EVFbDLqAz+EN3kWogVV++Rbvi+JqcDV00DqDF4+2/ifE4cb+1Oqn
	 x7/ESohDaoUgUT5jxSZ6PujpEbhvgDvFv7ZpIdHXjXwfe/KiOqalJpbCG9hHjroG9l
	 9NknADiJVB/gbgdX0SeCKd5Kdj8hYol2Bior8nMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D48F8032B;
	Sun,  7 Mar 2021 16:05:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D8E6F8028B; Sun,  7 Mar 2021 16:05:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C58BF800ED
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 16:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C58BF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ZgJd17Mg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615129514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KejlvcT1gOeSWvvdBwsaUIeKwwnwlqbeqQnR3mja/KA=;
 b=ZgJd17Mgv382+shxa4PxHPeyGjqQZPb8QnngrzY8R/l7E1G9Fxz+J9pTSIc5D3v9IU3ufq
 dUZir9Qje+rz6NHSpdMz9fz+fzI6U+qT+vYd5bzPYxxKCzf/mR33IPtVU0uSUYv+YuBeu4
 IqOAU38oPZgpEOTyiO/XIlHdAvcVM0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-E9JrxxXIPxyA0wkiirVgcQ-1; Sun, 07 Mar 2021 10:05:12 -0500
X-MC-Unique: E9JrxxXIPxyA0wkiirVgcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 347F0804330;
 Sun,  7 Mar 2021 15:05:11 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71D7E19D7C;
 Sun,  7 Mar 2021 15:05:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH resend 2/2] ASoC: Intel: bytcr_rt5640: Add used AIF to the
 components string
Date: Sun,  7 Mar 2021 16:05:03 +0100
Message-Id: <20210307150503.34906-3-hdegoede@redhat.com>
In-Reply-To: <20210307150503.34906-1-hdegoede@redhat.com>
References: <20210307150503.34906-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

Depending on which AIF is used the UCM profile needs to setup
a different path through the rt5640's "Digital Mixer Path" graph.

ATM the UCM profiles solve this by just enabling paths to the outputs /
from the input from both AIF1 and AIF2 and then relying on the DAPM
framework to power-down the parts of the graph connected to the
unused AIF.

But in order to be able to use hardware-volumecontrol and to use
the hardware mute controls, which are necessary for mute LED control,
the UCM profiles need to know which AIF is actually being used.

Add a new "aif:1" or "aif:2" part to the component string to provide
info about the used AIF to userspace / to the UCM profiles.

Note the size of byt_rt5640_components is not increased because the
size of 32 chars already is big enough.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 5d48cc359c3d..1f6a636571c2 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1252,6 +1252,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	int ret_val = 0;
 	int dai_index = 0;
 	int i, cfg_spk;
+	int aif;
 
 	is_bytcr = false;
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -1363,8 +1364,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	log_quirks(&pdev->dev);
 
 	if ((byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) ||
-	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
+	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
 		byt_rt5640_dais[dai_index].codecs->dai_name = "rt5640-aif2";
+		aif = 2;
+	} else {
+		aif = 1;
+	}
 
 	if ((byt_rt5640_quirk & BYT_RT5640_SSP0_AIF1) ||
 	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2))
@@ -1402,8 +1407,8 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	}
 
 	snprintf(byt_rt5640_components, sizeof(byt_rt5640_components),
-		 "cfg-spk:%d cfg-mic:%s", cfg_spk,
-		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)]);
+		 "cfg-spk:%d cfg-mic:%s aif:%d", cfg_spk,
+		 map_name[BYT_RT5640_MAP(byt_rt5640_quirk)], aif);
 	byt_rt5640_card.components = byt_rt5640_components;
 #if !IS_ENABLED(CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES)
 	snprintf(byt_rt5640_long_name, sizeof(byt_rt5640_long_name),
-- 
2.30.1

