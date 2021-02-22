Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2FD322185
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 22:36:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 840461679;
	Mon, 22 Feb 2021 22:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 840461679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614029795;
	bh=092HQubRTh1/Qm0PVFdvKZfQFIYEQ5uhygMv+DOC8U8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pT9ZmrUG0RMLUCHaW4VLr4k4m198RKrdt/g+I/shnQ5iqxxwKecFBgFNW2KiSsllq
	 Pll5Tr55k8NiQBLW9swOAkgQf/iv1Al7i5+8IpzD3fZ65O48vRdtznUnzjn918iJcp
	 PRHYS1zerQkw5ddAErqK2KIo19nKxtHXVp7fdrJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A749F8042F;
	Mon, 22 Feb 2021 22:33:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EFCFF8022D; Mon, 22 Feb 2021 22:33:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66BB1F8022D
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 22:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66BB1F8022D
IronPort-SDR: x5/bmmwKlCh0VEbitp7HrsFC1qcJBXIkFYBD1ibsgGQvO60vBMYQyB47WyDCETSzGGMoYpRPF6
 Jn1o0dLLnXgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="171740005"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="171740005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:22 -0800
IronPort-SDR: zZ7ZZi/pHAZXzGt66yZpyTzCWFkIAIiCYwOYRM0Jnen2wGu5n6vOU23clCslvjiFdKHIQ/EE6h
 iQnSamyi4pOQ==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="423270708"
Received: from sspurohi-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.136])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:17 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/6] ASoC: samsung: s3c24xx_simtec: add missing error check
Date: Mon, 22 Feb 2021 15:33:03 -0600
Message-Id: <20210222213306.22654-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
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

sound/soc/samsung/s3c24xx_simtec.c:191:7: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
  ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_PRESCALER,
      ^

Looking at the code, it's not clear why the return value is checked in
the two other cases but not here, so mirror the behavior and add a
check.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/s3c24xx_simtec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/samsung/s3c24xx_simtec.c b/sound/soc/samsung/s3c24xx_simtec.c
index 3cddd11344ac..81a29d12c57d 100644
--- a/sound/soc/samsung/s3c24xx_simtec.c
+++ b/sound/soc/samsung/s3c24xx_simtec.c
@@ -190,6 +190,11 @@ static int simtec_hw_params(struct snd_pcm_substream *substream,
 
 		ret = snd_soc_dai_set_clkdiv(cpu_dai, S3C24XX_DIV_PRESCALER,
 					     cdclk_scale);
+		if (ret) {
+			pr_err("%s: failed to set clock div\n",
+			       __func__);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.25.1

