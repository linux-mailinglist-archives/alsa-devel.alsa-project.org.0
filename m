Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27FA613AB7
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:52:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D473168A;
	Mon, 31 Oct 2022 16:51:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D473168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667231523;
	bh=rgsxk/6r32PcnLFA3JXrkPIS2/t0MfvefVFGqwYtZGE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldqdsKe680cUVYYBuaZwUl0zTgl/lUCsLmSvvnLVAG93UGByx9Lq9MSYECFCZxYUU
	 9NH5vstxDPXJq4JpLIQL79db6W2A6FVJJxhKy5Cri/AgWFgH6BHhVZ6WWwD/Ibq8Z6
	 oAa2HAC9TQpaR620gRcmmYwxwh7aySwoQ7g/8leU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E1DF80570;
	Mon, 31 Oct 2022 16:50:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9EE2F8055C; Mon, 31 Oct 2022 16:50:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B1F0F8015B
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B1F0F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Bad1yQpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667231393; x=1698767393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rgsxk/6r32PcnLFA3JXrkPIS2/t0MfvefVFGqwYtZGE=;
 b=Bad1yQpz2Vro6/D2Dt2zjFhwca2MjrQs9jfPrOy8TvDVZeChjJxMCwK1
 iyTMTx//7dmzh70HVYwpnpgWrSE1NrdNS7Gx/BORrQmYhUs+pldLUq2bC
 DK5aSLhDhxi3D0yvxAhPrKceCU5o04oEujHTjr1iyETrwVggsW9HVakWF
 9f6aiNfJFhhYbGwCtAoTByfq6SM6/xPNGntAQeX015tC7EzMMjiioKGAS
 vAqIZinesm2JO1oATzg87JCwYR2xGEozAEtyR1mVnaUDmx20svUe+c0oF
 043Kn/Hx3Ni8rYsFEG9n0dSRt/3EgFBFGmzsoNFdVCOeqtXTZ/0JMqFvH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308929958"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="308929958"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 08:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776178930"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776178930"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 08:49:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/7] ASoC: amd: Drop da7219_aad_jack_det() usage
Date: Mon, 31 Oct 2022 17:02:25 +0100
Message-Id: <20221031160227.2352630-6-cezary.rojewski@intel.com>
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
 sound/soc/amd/acp-da7219-max98357a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index ef1b4cefc273..375417bd7d6e 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -21,7 +21,6 @@
 
 #include "acp.h"
 #include "../codecs/da7219.h"
-#include "../codecs/da7219-aad.h"
 #include "../codecs/rt5682.h"
 
 #define CZ_PLAT_CLK 48000000
@@ -82,7 +81,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
 	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
-	da7219_aad_jack_det(component, &cz_jack);
+	snd_soc_component_set_jack(component, &cz_jack, NULL);
 
 	return 0;
 }
-- 
2.25.1

