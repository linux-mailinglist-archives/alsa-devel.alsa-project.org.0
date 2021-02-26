Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A6326438
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 15:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B1511C;
	Fri, 26 Feb 2021 15:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B1511C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614350517;
	bh=iiaHnM2MsTvXQ+Wq9X5W8+XjcwQNiYnDfDdF6lOpA+U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JcvdI8fs3SclU+z8X6XSDf7KOEPl2a1JHFYZsoNlKZKGjAjCGXtFSZRGB96F0T/NK
	 //uYJJWqZjS1M8+j1PJJwz+Pc8DGGVHmc9Vxu/S4RevPYe+gZQY9OCaE/b1GrWTn+i
	 JcMJvyvkYdqjUUnMeyTZicSG0bj3NQJiJcpzuA20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 040DCF80482;
	Fri, 26 Feb 2021 15:38:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99417F802E2; Fri, 26 Feb 2021 15:38:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0C4F802CA
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 15:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0C4F802CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GgZ0/BCH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614350317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KejlvcT1gOeSWvvdBwsaUIeKwwnwlqbeqQnR3mja/KA=;
 b=GgZ0/BCH15tODcnURp6C6hcOjFw3WbgxNjghk+Om1tTs+K8dEmsN0y0RI+4pAlGzShEJWi
 Pn8gcwDS7huEsCXkMW8aclAiOL5zNwdnecgoPm8QT6dHzBmMzOELRr5PQ0JMaxZajS9TSs
 uxLfALqpolgmbIOuOdw6tU0XMW2Zp1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-6dufz7FqNX-b-z9MV0qCUg-1; Fri, 26 Feb 2021 09:38:33 -0500
X-MC-Unique: 6dufz7FqNX-b-z9MV0qCUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFB2110066F2;
 Fri, 26 Feb 2021 14:38:31 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C9445D9E2;
 Fri, 26 Feb 2021 14:38:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add used AIF to the components
 string
Date: Fri, 26 Feb 2021 15:38:17 +0100
Message-Id: <20210226143817.84287-6-hdegoede@redhat.com>
In-Reply-To: <20210226143817.84287-1-hdegoede@redhat.com>
References: <20210226143817.84287-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org
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

