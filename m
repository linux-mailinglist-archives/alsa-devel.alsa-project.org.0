Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4663C7DAFD7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 00:00:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B508A4D;
	Sun, 29 Oct 2023 23:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B508A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698620424;
	bh=I75dT+BpB934kNxmKXsCPFa+j1/Qlrodb8hUDyZG7FY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PPnz/L3WB+81tbeGZ7fjSKdT4U9bGyw10Pd2NyPA8YQiSm7Yl6ID0FeqaUJ9xhgNz
	 i14xYJ3wXctrgId2ITsfI7nVTx5D7ee/Kqxu0zBr39sUR9nVT4Zn6hCI5h0ygFqLa6
	 ks58AqyhiGYrqC8fQ+q730CmFczmtUajvTBptnAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2844F80578; Sun, 29 Oct 2023 23:59:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A16D6F80558;
	Sun, 29 Oct 2023 23:59:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02FB7F80564; Sun, 29 Oct 2023 23:58:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCFF7F80558
	for <alsa-devel@alsa-project.org>; Sun, 29 Oct 2023 23:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCFF7F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=io5y1OIF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 58A1BB8072F;
	Sun, 29 Oct 2023 22:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F1AC4167E;
	Sun, 29 Oct 2023 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698620291;
	bh=I75dT+BpB934kNxmKXsCPFa+j1/Qlrodb8hUDyZG7FY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=io5y1OIFonc7nUKhBg1jItAJVZbZxKdmegf7jb5Hm8bfM8qjk0gI9wP4w2WyJvftt
	 73HiRGbVan5xfv2mvLib0xxnoFfSC5sCdwq11F0IduxRh2QdI64lXj8OF4mJLi3hN7
	 UjVZnfKZ/qVhQw+IG8s4y5civ3XNMZviQ23rFA1tNIJ5WYChj2RzpDRXi+RNh0LUK9
	 WpTb5ootMnnflKvakQw1Fc12wdlP4v1tQFIZEqKtGn3e7A4puZI0rCdfaAnnCBTakT
	 tDx7NqGrxcmMUi36IPzZ1Ul0pGpNcjVg9N9qwsaXlA+Lib2bLkZ0pTIciSPzdmqDLA
	 aFpXtg/hfn+RA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Roy Chateau <roy.chateau@mep-info.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 21/39] ASoC: codecs: tas2780: Fix log of failed
 reset via I2C.
Date: Sun, 29 Oct 2023 18:56:53 -0400
Message-ID: <20231029225740.790936-21-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225740.790936-1-sashal@kernel.org>
References: <20231029225740.790936-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.60
Content-Transfer-Encoding: 8bit
Message-ID-Hash: COHMD6M4BAM5BOQFJMVY2T7CTUPYRHXJ
X-Message-ID-Hash: COHMD6M4BAM5BOQFJMVY2T7CTUPYRHXJ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/COHMD6M4BAM5BOQFJMVY2T7CTUPYRHXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Roy Chateau <roy.chateau@mep-info.com>

[ Upstream commit 4e9a429ae80657bdc502d3f5078e2073656ec5fd ]

Correctly log failures of reset via I2C.

Signed-off-by: Roy Chateau <roy.chateau@mep-info.com>
Link: https://lore.kernel.org/r/20231013110239.473123-1-roy.chateau@mep-info.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tas2780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index afdf0c863aa10..a2d27410bbefa 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -39,7 +39,7 @@ static void tas2780_reset(struct tas2780_priv *tas2780)
 		usleep_range(2000, 2050);
 	}
 
-	snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
+	ret = snd_soc_component_write(tas2780->component, TAS2780_SW_RST,
 				TAS2780_RST);
 	if (ret)
 		dev_err(tas2780->dev, "%s:errCode:0x%x Reset error!\n",
-- 
2.42.0

