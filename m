Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E3613AB4
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:51:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3041686;
	Mon, 31 Oct 2022 16:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3041686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667231500;
	bh=PPsobXz7PwRLli089/iR1UgdapPNYt2Ba6WY9lRPD5w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhQPak9l3qmxHpt/U5z72ZLfna5GsIkBf3XQ9MvK42OylC93gVx2l33zsFCAUtfhm
	 MWifxy852xtMce0kOKOyFbEq/RN0Ib184YIHEGteWNs9mfcN1sv8xIFPvpNrUo9ypP
	 wzSfayKAFtvcVB0K3ED/mNSokkJi2R3A0NA8FOsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9018F8055A;
	Mon, 31 Oct 2022 16:50:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D5FF80557; Mon, 31 Oct 2022 16:49:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2939DF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2939DF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iCq0tQBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667231391; x=1698767391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PPsobXz7PwRLli089/iR1UgdapPNYt2Ba6WY9lRPD5w=;
 b=iCq0tQBtSvLlDWOzK/U03C+UfehYYv9iAovYn6U1zm+/8xhtQYh/4zyN
 T5IAnuDPb46P9yh0AFzdilGOkh5N2SMr07qwD+O/gdbNLP+7+uovZBS0F
 yx8W+2xcWSoGHOkNrLsaHqRH/ULj1xS1YkoroAQFLxuWV6HVDWStZR+Eq
 KSTWVhb0i/eGORYhUUHuJC7UMzqBN5Mss4VpBLxDQDkxY6PKmqaWPIIlH
 nhNH9TbTYD5yr56YLnjcQOdZTl3C5XyhR/MF+ptyTh3IOmck2j0Vz0kUc
 CqxXELHmuAn8KyhkgT5FQs6/lLxVUo/Nvqx6waq2tiGLgZqRqFSomnoBF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308929928"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="308929928"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 08:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776178907"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776178907"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 08:49:42 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/7] ASoC: mediatek: Drop da7219_aad_jack_det() usage
Date: Mon, 31 Oct 2022 17:02:23 +0100
Message-Id: <20221031160227.2352630-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031160227.2352630-1-cezary.rojewski@intel.com>
References: <20221031160227.2352630-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Vijendar.Mukunda@amd.com,
 heiko@sntech.de, AjitKumar.Pandey@amd.com, linux-rockchip@lists.infradead.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, jiaxin.yu@mediatek.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, Syed.SabaKareem@amd.com,
 amadeuszx.slawinski@linux.intel.com, trevor.wu@mediatek.com
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

Do not access the internal function directly, do so through
component->set_jack() instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c        | 3 +--
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 9f22d3939818..97dbb31c412e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -14,7 +14,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-#include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
 #include "../../codecs/rt1015.h"
 #include "../common/mtk-afe-platform-driver.h"
@@ -592,7 +591,7 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 	snd_jack_set_key(
 		priv->headset_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
-	da7219_aad_jack_det(component, &priv->headset_jack);
+	snd_soc_component_set_jack(component, &priv->headset_jack, NULL);
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index cfca6bdee834..db5d2bec7a95 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -11,10 +11,10 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-#include "../../codecs/da7219-aad.h"
 #include "../../codecs/da7219.h"
 #include "../../codecs/mt6358.h"
 #include "../common/mtk-afe-platform-driver.h"
@@ -100,7 +100,7 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
-	da7219_aad_jack_det(cmpnt_codec, &priv->headset_jack);
+	snd_soc_component_set_jack(cmpnt_codec, &priv->headset_jack, NULL);
 
 	return 0;
 }
-- 
2.25.1

