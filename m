Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E752F502
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BD81728;
	Fri, 20 May 2022 23:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BD81728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081774;
	bh=fZ22OOMIfMyFZ5KWRGnZn+ZuVUzFmdFaw6mBXxN2b3c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dFbRWWAQ860XkBLoT+2KbUQ8/JV4/qELuPwAfbhtCQljJL/lucSWxl4tg5S7JdsgN
	 j4iafyrmmZ/lgM3v/tZFZ4fgEoHnia+2Fa1XM0rlnRKVTCTbYrurpl3KegBY2nQcIY
	 zDf1w2ZKKU8UqwCS8Jw3fXvEjqgARk0ehIt2mAoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A22BF80589;
	Fri, 20 May 2022 23:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 465FBF80551; Fri, 20 May 2022 23:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47CF2F80520
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CF2F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lAhO3I0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081467; x=1684617467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fZ22OOMIfMyFZ5KWRGnZn+ZuVUzFmdFaw6mBXxN2b3c=;
 b=lAhO3I0rpERFvPUstsNOqgOw34M6fYsK6vSExvV8CdLbhfV9+wjox2o0
 wFRpeswvFUFbGZm39dFopYd4D3KgGh0YkJ3ezlzdHV8pi9q352uJWmNos
 6Dv3nO9i/uunYfWZhAwJT0EvzPhQPgjdcMgV3wNVRTIjYrEyHC6N0CtmF
 j7Vjxd98D13+Uw1+2Cd9bu7UaI5G/edi0bduYrdqRE/HZmoIXGR/hBStK
 KIdOvEaUYzUCVuL5QdFMc/p1n4PK6BfuwgxB0n6cLv1S5rMGX/BNRypN+
 BuzB8ZyTZ+XbqTlMA7BFYZ4Gk2t+7lzaOyuggqdj7wCqUqQjcwnyb96h1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324251"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324251"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796051"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/16] ASoC: rockchip: simplify error handling
Date: Fri, 20 May 2022 16:17:17 -0500
Message-Id: <20220520211719.607543-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

sound/soc/rockchip/rk3288_hdmi_analog.c:256:9: warning: Identical
condition and return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/rockchip/rk3288_hdmi_analog.c:252:6: note: If condition
'ret' is true, the function will return/exit
 if (ret)
     ^
sound/soc/rockchip/rk3288_hdmi_analog.c:256:9: note: Returning
identical expression 'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/rockchip/rk3288_hdmi_analog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index bcdeddeba80c9..0c6bd9a019dbe 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -169,7 +169,7 @@ static struct snd_soc_card snd_soc_card_rk = {
 
 static int snd_rk_mc_probe(struct platform_device *pdev)
 {
-	int ret = 0;
+	int ret;
 	struct snd_soc_card *card = &snd_soc_card_rk;
 	struct device_node *np = pdev->dev.of_node;
 	struct rk_drvdata *machine;
@@ -253,7 +253,7 @@ static int snd_rk_mc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Soc register card failed\n");
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id rockchip_sound_of_match[] = {
-- 
2.30.2

