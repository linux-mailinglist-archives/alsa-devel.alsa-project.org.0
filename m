Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F1E99B373
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Oct 2024 13:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3CCAE8;
	Sat, 12 Oct 2024 13:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3CCAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728732436;
	bh=/bj2+BYAwK4IHYuyn/t/cCq7lHeoaQ8woj3Rk8/wplQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HZwYNlSWpjQ/Ze5AVQiKQxWV44qfW5zRk/aJeur9GJY0n2D4dUirNEpbHJLVn6F8b
	 H937eQrSXNsRf90LC1tHUfmSrcu3fQeyRzNDF3roYllrFmIGs0+4HAh2CNvrOc7ijA
	 yWzC3GKzgc2qDaClVX2Zk1XI5+uGnF7P00KE4Ujk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23F4CF805AB; Sat, 12 Oct 2024 13:26:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C11F805B0;
	Sat, 12 Oct 2024 13:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A898F80496; Sat, 12 Oct 2024 13:26:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64F0AF80496
	for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2024 13:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64F0AF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g+p/9AQU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40681A40588;
	Sat, 12 Oct 2024 11:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08154C4CEC7;
	Sat, 12 Oct 2024 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728732387;
	bh=/bj2+BYAwK4IHYuyn/t/cCq7lHeoaQ8woj3Rk8/wplQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g+p/9AQUrKPRW4NZcLWtgAkH6odAA63cuv2lIrGsiFS7CWSQODPDiGlfs4gG7XrBQ
	 OKwupSQLtazOV+17SUzMMl9FrwQhWb2wyItguz4IFZNOxEC/NVda/8Ly4p5Q+Vxdco
	 ipcaFdFdcbaWHp4TQ6q+kqwQCMS2lqOlxBEj8Dm8N2qBgytMqygB74lKHHxYkKxRA1
	 NbSCofcSJDe5H5W0WM3zkKNwgA323r4yT2suTIItHYQMiyXVn7h+YXUVruu3ctiAWQ
	 kSiG52ooggr7vavc11egcVKVMX41D4a98k1Y91ZohgsbkIdK1HeiW0h/SCop8o3Z2I
	 A5iCcYiVJNtMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 03/16] ASoC: codecs: lpass-rx-macro: add missing
 CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
Date: Sat, 12 Oct 2024 07:25:59 -0400
Message-ID: <20241012112619.1762860-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241012112619.1762860-1-sashal@kernel.org>
References: <20241012112619.1762860-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.3
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZ5CQ3AV6CZQFYD7NNRKZR7J7NE3EABK
X-Message-ID-Hash: DZ5CQ3AV6CZQFYD7NNRKZR7J7NE3EABK
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZ5CQ3AV6CZQFYD7NNRKZR7J7NE3EABK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit e249786b2188107a7c50e7174d35f955a60988a1 ]

CDC_RX_BCL_VBAT_RF_PROC1 is listed twice and its default value
is 0x2a which is overwriten by its next occurence in rx_defaults[].
The second one should be missing CDC_RX_BCL_VBAT_RF_PROC2 instead
and its default value is expected 0x0.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20240925043823.520218-2-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ce42749660c87..ac759f4a880d0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -958,7 +958,7 @@ static const struct reg_default rx_defaults[] = {
 	{ CDC_RX_BCL_VBAT_PK_EST2, 0x01 },
 	{ CDC_RX_BCL_VBAT_PK_EST3, 0x40 },
 	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x2A },
-	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_RF_PROC2, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC1, 0x00 },
 	{ CDC_RX_BCL_VBAT_TAC2, 0x18 },
 	{ CDC_RX_BCL_VBAT_TAC3, 0x18 },
-- 
2.43.0

