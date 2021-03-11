Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA33368DD
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BC71703;
	Thu, 11 Mar 2021 01:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BC71703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423040;
	bh=DVqUNCGx1y1R6BfcRf24ilQmIkgdAYT2WBHVe2PteYY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mf9Bbtqt0xkXMBoWOrYHlZwPosg8HctmYm/XyJrCy0K6mBmPx3pECu5XHTWJFX7Fa
	 DWP7yDrQrWn+Vqdt1JjTYYwGkzCqHZ/mGu3fpIoABLTE/beNH3mKUxTgtd/pWzbLjy
	 QUjkilGWauRE4aXtW18+VJaUThVPJTHlRp+/3Bwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F0CF80272;
	Thu, 11 Mar 2021 01:35:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4204F80272; Thu, 11 Mar 2021 01:35:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8ED0F8016C
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8ED0F8016C
IronPort-SDR: qgEh7jBBxE4Jq/klmboBY7OR4qEMXeGKS2QkXS8AIAxVmFUOoz08lsuWi7QZCSfWRz1/GDvctu
 4qCjN2VfO6wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="249957220"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="249957220"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:35:25 -0800
IronPort-SDR: sYLPrL7yZckuxKhDQANKqVHa4zpwtNKVbsbtKwHrNkQUQGsUVNn5zqdHYGKqFtg9lSMLX1E+qc
 yZAqzUD+z0tw==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="520919936"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:35:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/2] ASoC: samsung: tm2_wm5110: check of of_parse return
 value
Date: Wed, 10 Mar 2021 18:35:15 -0600
Message-Id: <20210311003516.120003-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, broonie@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
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

cppcheck warning:

sound/soc/samsung/tm2_wm5110.c:605:6: style: Variable 'ret' is
reassigned a value before the old one has been
used. [redundantAssignment]
 ret = devm_snd_soc_register_component(dev, &tm2_component,
     ^
sound/soc/samsung/tm2_wm5110.c:554:7: note: ret is assigned
  ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
      ^
sound/soc/samsung/tm2_wm5110.c:605:6: note: ret is overwritten
 ret = devm_snd_soc_register_component(dev, &tm2_component,
     ^

The args is a stack variable, so it could have junk (uninitialized)
therefore args.np could have a non-NULL and random value even though
property was missing. Later could trigger invalid pointer dereference.

There's no need to check for args.np because args.np won't be
initialized on errors.

Fixes: 8d1513cef51a ("ASoC: samsung: Add support for HDMI audio on TM2board")
Cc: <stable@vger.kernel.org>
Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/tm2_wm5110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 9300fef9bf26..125e07f65d2b 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -553,7 +553,7 @@ static int tm2_probe(struct platform_device *pdev)
 
 		ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
 						 cells_name, i, &args);
-		if (!args.np) {
+		if (ret) {
 			dev_err(dev, "i2s-controller property parse error: %d\n", i);
 			ret = -EINVAL;
 			goto dai_node_put;
-- 
2.25.1

