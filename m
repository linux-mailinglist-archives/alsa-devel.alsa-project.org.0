Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CC638FB7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 19:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25801760;
	Fri, 25 Nov 2022 19:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25801760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669400747;
	bh=YYr68HhZ+L4FesseDLwEdDzpnAYwmqzen9qKgoG1iKs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFO3VKFLGnVl0NRy04gahWiOjGwoWqKw5ohJtkoeTbMcbIIHHwVYgyu1kn2/cWCqC
	 JCygD64bQDM2XBtFRZj6Kc7iLhzzYaFOHJ43pIl5WhUvoqlhCiBJae1/Ws4AWs8jZF
	 GCBGtssxYKL8HhZMQL1/+LJJbFUbLcHKvqIa/vxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF36F8057A;
	Fri, 25 Nov 2022 19:23:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D11FF80559; Fri, 25 Nov 2022 19:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8CDDF80533
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 19:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8CDDF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YBcM2jkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669400618; x=1700936618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYr68HhZ+L4FesseDLwEdDzpnAYwmqzen9qKgoG1iKs=;
 b=YBcM2jkO+KObCaNWt8eyFdj0I/s+yNnsXvEbhMaOb0y6Z67U/iHyo8Wo
 EV6JjmDXwXkIqgk6NXQ3NCT96Mz6phH3I3QizNjgajk+6E3lltZhSqxJS
 SkMWJsew6JGQZQVKreICxchTG8y/9YFcmV0cW+vBaeZmfYMeHkYsNQcLM
 uHsO+K0mhmVjOMuoU2vCTXDOKjVipQ314SiKJrukN9rkv63UIRfmj8SMN
 bzCnjhxDbfcLNu0XXmliX5Pn858wcXuVmA9SI+wimIgTJRsS8IgcW4bEO
 in7buXJy2vJresm6w64UgLmctGHSO3EXPVZ48rFUOMCRyUm0WTi92D7Kj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="294909221"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="294909221"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 10:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="785005526"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="785005526"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 10:23:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 04/11] ASoC: Intel: avs: rt274: Refer to DAI name through a
 constant
Date: Fri, 25 Nov 2022 19:40:25 +0100
Message-Id: <20221125184032.2565979-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125184032.2565979-1-cezary.rojewski@intel.com>
References: <20221125184032.2565979-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

There is existing define for codec DAI name, make use of it when setting
codec DAI name.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt274.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index afef5a3ca60b..9937cfe9996e 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -160,7 +160,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-INT34C2:00");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "rt274-aif1");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, RT274_CODEC_DAI);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
-- 
2.25.1

