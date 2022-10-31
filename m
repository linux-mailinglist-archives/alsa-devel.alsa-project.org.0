Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FA613AB2
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 16:51:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DFC31678;
	Mon, 31 Oct 2022 16:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DFC31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667231472;
	bh=quE/JPurgz4Mzf+i5ERxx3tZHeSVqlNfHhCtD91heeA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHuJfX2KTyEdOpsHPRP0+m941uyW9hY7wdi7xbjMxwbKdJO1QQtikQfcsy82eyKy1
	 amzyepnTzmQWsr07fiM7roFx3B+4nyvXhwPlQ2eZ/qV/3xuoBxDbpEe9Idfs8Wdom+
	 2qnZYBEXnDLik7qGTGCByuez2K28GU/jlzSeOlqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A0CAF80552;
	Mon, 31 Oct 2022 16:49:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DA81F80256; Mon, 31 Oct 2022 16:49:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DDC3F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 16:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDC3F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cgRx2F7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667231389; x=1698767389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quE/JPurgz4Mzf+i5ERxx3tZHeSVqlNfHhCtD91heeA=;
 b=cgRx2F7bi2sxil9364Z4C0G+/gkGU+80i05+JPoDLpaJkpNvo9GN/Qgz
 sGAT08UaSJsLY0ZhDYByAE6wrb2ebJ7959jz0xhhymFdkmBtQhnPLa3xC
 wRjte3GA1Wkra9mWW74jT6bL4+2NGtrobHPI8yTppWTJ6uDb7w4S9lWmQ
 +s3QEWVwUZ+gj6EVW200dbfR0vJ6Z+KCNPxBzXBaUcylofdnBgHxhD0oy
 BxgAnRvMzcZEnAWGnCdr8ZQLMa3l5S8DAjj/uarUk1uH4HZvMcsih/PS2
 KS/e87zkfr4QDResRpUB/kbJaXYyUo2gMlbK4SfBYBx3pR9txL/mne+bU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="308929901"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="308929901"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 08:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="776178890"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="776178890"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 31 Oct 2022 08:49:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/7] ASoC: codecs: da7219: Introduce set_jack() callback
Date: Mon, 31 Oct 2022 17:02:21 +0100
Message-Id: <20221031160227.2352630-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031160227.2352630-1-cezary.rojewski@intel.com>
References: <20221031160227.2352630-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Codec driver for da7219 implements jack detect functionality, but does
not integrate it with the framework. Platform component drivers are
accessing the functionality through internal da7219_aad_jack_det()
instead.

Address this by implementing set_jack() for the codec.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/da7219.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 4746c8700451..7468ee4af2ea 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2633,11 +2633,20 @@ static int da7219_resume(struct snd_soc_component *component)
 #define da7219_resume NULL
 #endif
 
+static int da7219_set_jack(struct snd_soc_component *component, struct snd_soc_jack *jack,
+			   void *data)
+{
+	da7219_aad_jack_det(component, jack);
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_dev_da7219 = {
 	.probe			= da7219_probe,
 	.remove			= da7219_remove,
 	.suspend		= da7219_suspend,
 	.resume			= da7219_resume,
+	.set_jack		= da7219_set_jack,
 	.set_bias_level		= da7219_set_bias_level,
 	.controls		= da7219_snd_controls,
 	.num_controls		= ARRAY_SIZE(da7219_snd_controls),
-- 
2.25.1

