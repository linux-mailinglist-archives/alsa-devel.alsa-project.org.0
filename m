Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72A60CC33
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7485345;
	Tue, 25 Oct 2022 14:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7485345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666701822;
	bh=2Q8TDh32BX9UJNQr/ncPOw2u8NHCVodCWabBOfRM2x4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIGXMlKxedm1O68sNzmXmGxARN9JlWYIGTcsb9Klq5I/YkOULUf6kb9CvbT7pFcoZ
	 Ad/CzcMZT67tPdKz0QsyognOhLLdASsab/Emh2GTM/ijUnMHBPO7PRVD22KLf9shbA
	 IWUWUe6HR1BQm/sY2/C4YyZxgEg49rSzUC9p3v6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF32EF80563;
	Tue, 25 Oct 2022 14:42:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0780F80557; Tue, 25 Oct 2022 14:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BEA2F80557
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BEA2F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KKMGuE4/"
Received: by mail-wr1-x432.google.com with SMTP id k8so11961624wrh.1
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KZM0T9VAIhDH8MlN6WTNKMHChs2UsyWeC4jS+W4xqgE=;
 b=KKMGuE4/SZ26vZUsXFESU9bVBmQJ/U9oz2QjLdmDj6petr7Z0fUlZubuhdLhvEHci5
 NKRFIbeUyziptVGfh3p/uVfPCIQyrHUuKO5Qlc2RR/bNaUvRQHI6pnNX9R4FEBl6PjYD
 6mWRvQQIfpy7O/C5VnXdugs6rY/7p+VQPqmphCuqAVwJpcPGG5PqRqrPO5Zhh1yeaNJy
 9wnklj2raQkZPW+/B0fbHfSxoPtdzucnF3Fn58vb2YsvsXViLeErmNpBsxvYCy25J9Ur
 glBOkXDAOSNthoVwGPXzCa5jRxghjJ4x7toQbOtgT1kjjHVrzNMFVACINvHPlyhT1NOJ
 JevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KZM0T9VAIhDH8MlN6WTNKMHChs2UsyWeC4jS+W4xqgE=;
 b=2axym02puvZY0ZbLErgBsXnowQhIK31aoxW/TfE7mFLTncevak+/b2jOv7GWA2Ngzy
 EudZTEsv9pOup7W/9q1EwLjH4XaL23h948rcvMnlnU+CFt/jaoarr+TOAJd+vbD4nIYX
 29WtbI3GZ+76GjRy6WC544r7yKsR1Kx5X3IrTThPdrl7mReDGzIjMTRXgoCb/yO386Cp
 f2oR4hPzBIEOXSWD3iLNP1kdV3ZcQcXZTshjkqhji9Z3bR3aWynFhhoOoGTPoLbDUYLw
 luKuL8nzoX9eowyZLIzlBpvfSxICyicbdusgHrf4jVfEVx76vSn9fllHNctqrjwZifRO
 W/Eg==
X-Gm-Message-State: ACrzQf0jjyBGxVRq6DClh885o0fZvuSb4XgJ/a0N7dhHaijDDRpIzoVl
 JfQRaoqSI4dvgPTfFJ7Hct6EtSdHGPM=
X-Google-Smtp-Source: AMsMyM7qGiPSr6jS0SrVQrVe6ZNaIcaZ3Pzpjqm4tGdeQk37enhjvFMn62fA5LjFriOIMhSj/XcqVA==
X-Received: by 2002:a1c:ed0b:0:b0:3c1:d16e:a827 with SMTP id
 l11-20020a1ced0b000000b003c1d16ea827mr25702572wmh.127.1666701723192; 
 Tue, 25 Oct 2022 05:42:03 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm11250664wmb.47.2022.10.25.05.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:42:02 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 4/4] ASoC: rockchip: i2s_tdm: Add support for RK3588
Date: Tue, 25 Oct 2022 14:41:32 +0200
Message-Id: <20221025124132.399729-5-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

This adds support for the RK3588 SoC to the I2S/TDM driver.
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 917f17107891..08b90ec5cc80 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1318,6 +1318,7 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 	{ .compatible = "rockchip,rk1808-i2s-tdm", .data = &rk1808_i2s_soc_data },
 	{ .compatible = "rockchip,rk3308-i2s-tdm", .data = &rk3308_i2s_soc_data },
 	{ .compatible = "rockchip,rk3568-i2s-tdm", .data = &rk3568_i2s_soc_data },
+	{ .compatible = "rockchip,rk3588-i2s-tdm" },
 	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
 	{},
 };
@@ -1556,7 +1557,7 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	i2s_tdm->dev = &pdev->dev;
 
 	of_id = of_match_device(rockchip_i2s_tdm_match, &pdev->dev);
-	if (!of_id || !of_id->data)
+	if (!of_id)
 		return -EINVAL;
 
 	spin_lock_init(&i2s_tdm->lock);
-- 
2.38.1

