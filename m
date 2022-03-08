Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0C4D219C
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:33:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F5018D6;
	Tue,  8 Mar 2022 20:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F5018D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646768022;
	bh=RdMhIS9OX2pWkr/tA78XLygIrcEeyT8yZaulTvEZ8EE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZXeElxGbamamD1h0fUIlaU6sRe591IgbpNhRz8alkO+2aO2PbEs63UPlDFofLZef
	 +aAMR2nukvhjXdEYwTGr0U9hofSAIt3p039GbLrwh+CJ/B0gHJQpMtQo0Qpw3fwj4O
	 2PuSWgEi9FX7lYQZ+NcY8K3bPo4n89tMYpkmMOdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1714DF805C2;
	Tue,  8 Mar 2022 20:27:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32C3F80578; Tue,  8 Mar 2022 20:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED659F80516
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED659F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hC3l1p3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767617; x=1678303617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RdMhIS9OX2pWkr/tA78XLygIrcEeyT8yZaulTvEZ8EE=;
 b=hC3l1p3S57F6/R373XmEGeYdtNo/2fWPIj+3CTY8zzQKJPG8c3HdV65V
 /3W+dEiB4KVHefH0ByhgR2+vNGCKUAobX5DBFfWq8oV1Nr7cloboQcPGW
 gdkN0/DQUUIXBQ/bnqW36TvpjRUy5DlqGEO80GWQy5ndGgr4hkt+EbjmU
 TiMJ0u9WXg/kkUolM6d3z1JhqUSnQ3soyUYRc597l7pNQjh4H4E8TCP7O
 m2R79ZeQc8a7vXWqSsHTgzO4bAM/Efc579Xsr2s5TSBhn/M6L2SljvZcU
 kf3y6hH6tqu/FNuOhDddG8hqUYsZxPm7XVT6JCplQbpxB/ePT4sfJjbIr g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363768"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363768"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495574019"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/20] ASoC: Intel: bytcht_es8316: move comment to the right
 place
Date: Tue,  8 Mar 2022 13:26:10 -0600
Message-Id: <20220308192610.392950-21-pierre-louis.bossart@linux.intel.com>
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

Additional code was added and the comment on the speaker GPIO needs to
be moved before we actually try to get the GPIO.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index f4bf26e802a2..e18371b5a771 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -535,7 +535,6 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->mclk))
 		return dev_err_probe(dev, PTR_ERR(priv->mclk), "clk_get pmc_plt_clk_3 failed\n");
 
-	/* get speaker enable GPIO */
 	codec_dev = acpi_get_first_physical_node(adev);
 	if (!codec_dev)
 		return -EPROBE_DEFER;
@@ -561,6 +560,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* get speaker enable GPIO */
 	devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
 	priv->speaker_en_gpio =
 		gpiod_get_optional(codec_dev, "speaker-enable",
-- 
2.30.2

