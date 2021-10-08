Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C0426739
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 11:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCEF168A;
	Fri,  8 Oct 2021 11:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCEF168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633686982;
	bh=1cS/S5o/lId8K+s57+fpRpFRXJdHSb4vEvjOxUn1X3c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=klbPWOJ5uWg62SD5mXkrQjbb67R/j//4xy3ZD/URdNWVd08ao4ENga59duqZFR+U0
	 ozkQMVioQr3yjZ1Ap7WgcNBVOIEt6+7Fh6xT5ARR8fzR9J87LTIHAtiZwhcuKRlbgl
	 prV4Py0ZroXvp17jI0X7lwW7Pi4AsFAz5rmFRmQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 804C1F804E7;
	Fri,  8 Oct 2021 11:54:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37ECEF80240; Fri,  8 Oct 2021 11:54:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27C8BF80240
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 11:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C8BF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="g6Fx4ISK"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 56EFB40008; 
 Fri,  8 Oct 2021 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633686871;
 bh=TuVTrdle0GA/hj731likpqii9Ao75WSiuD/GlabjbTI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=g6Fx4ISKggvBOHcX7uB9bC9mN2rP9e5a7wkPU48MaqVKI1Fnfy8mY+o0cYPtpntzL
 vUSL67MOgzuz8Y0ljrv2meRl2KB/BhnsGvb4zCtmD3lONj3WmjPUh0haHOfyteEHkO
 YTiJBXTvaK+DFBV73JxoeXGdD1VGv4lyu4q6rYDRug0LHUmzNreRv1xARdNY9Rh5H0
 jC1V4o7N7AJDrNvFB8suk2YDml4zT+PUhincACr/EN/YdhMFljHzClBjacAVG34+YK
 7IYdkjuYzUUJTdRcKLuksRqq4gOQAS+Ub5kOF5ovbLBzL0801qHLTumG5SnT9ZGGcc
 YAwUTHyEP1B6w==
From: Colin King <colin.king@canonical.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2][next] ASoC: rockchip: i2s-tdm: Fix error handling on
 i2s_tdm_prepare_enable_mclk failure
Date: Fri,  8 Oct 2021 10:54:30 +0100
Message-Id: <20211008095430.62680-2-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008095430.62680-1-colin.king@canonical.com>
References: <20211008095430.62680-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

In the case where the call to i2s_tdm_prepare_enable_mclk fails the
function returns before the error handling goto is executed. Fix this
by removing the return do perform the intended error handling exit.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Addresses-Coverity: ("Structurally dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index cc5a2f9d3948..396277eaa417 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1736,8 +1736,8 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 
 	ret = i2s_tdm_prepare_enable_mclk(i2s_tdm);
 	if (ret) {
-		return dev_err_probe(i2s_tdm->dev, ret,
-				     "Failed to enable one or more mclks\n");
+		ret = dev_err_probe(i2s_tdm->dev, ret,
+				    "Failed to enable one or more mclks\n");
 		goto err_disable_hclk;
 	}
 
-- 
2.32.0

