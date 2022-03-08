Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 537674D218F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE8A18ED;
	Tue,  8 Mar 2022 20:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE8A18ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767961;
	bh=e4RGIap9FKeqdqTtYjOiaEuoCSQStCo1CAVDG1lrGeg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEkbAOqJFjU8+Gh8ZNp5uoMEjgfd7DaNCEHKpqQ30TDxfJ+d4XXSKExCcwIbpChxc
	 1bMHNn9cIIf2MwGEJLbziK7/YBJm5aCQncF0Mlc47A3uVgFm2Mg4RI0kWI69ZLKlU1
	 IenB/7Bd8KzG5LiKFJ2rPxLfHCroG5aKgifCopHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCA7F8059F;
	Tue,  8 Mar 2022 20:27:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDABAF80520; Tue,  8 Mar 2022 20:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F306F8052E
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F306F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SiU5YaxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767615; x=1678303615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4RGIap9FKeqdqTtYjOiaEuoCSQStCo1CAVDG1lrGeg=;
 b=SiU5YaxXe7tWHbgOputRI3teXCqmNQnitd7H2VJXyzV780q3AUkIOglZ
 MKy1gJo0GrEJWYNRLxJpckCOK1jHqYWSNuIhqiGfAf4zhp/kBJGLfWxed
 6/SS0ltP2+ycDy4r8HFltERd9pLo02Ihjw3inUyhsiJvcN1A09TATn4SO
 g9iwOjab5oLjV5FI/49HJ3HhYnJRYgl4BwV99PIprdoc/hd4Ngd03TbBT
 ljasaHsx+15VjDD46XpZzd5JJozay/E8kcTkRNo5Gl4O0/tB46ik5nd/B
 KQjr+A8PJf3Niet6xnV0+0ZAVvG1cNJ/prziWcZF+8payOVe41n7VWbYL A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363762"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363762"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495574009"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 19/20] ASoC: Intel: sof_es8336: add cfg-dmics component for
 UCM support
Date: Tue,  8 Mar 2022 13:26:09 -0600
Message-Id: <20220308192610.392950-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The presence of DMICs needs to be signaled to UCM, follow the HDaudio
example and use the 'cfg-dmics' component string to report the number
of dmics present on the platform.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 32f5303041b8..5e0529aa4f1d 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -459,6 +459,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	return NULL;
 }
 
+static char soc_components[30];
+
  /* i2c-<HID>:00 with HID being 8 chars */
 static char codec_name[SND_ACPI_I2C_ID_LEN];
 
@@ -594,6 +596,12 @@ static int sof_es8336_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
+	if (mach->mach_params.dmic_num > 0) {
+		snprintf(soc_components, sizeof(soc_components),
+			 "cfg-dmics:%d", mach->mach_params.dmic_num);
+		card->components = soc_components;
+	}
+
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		gpiod_put(priv->gpio_pa);
-- 
2.30.2

