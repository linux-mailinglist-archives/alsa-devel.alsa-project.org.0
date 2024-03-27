Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5FF88ECF0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:46:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFA8D2C4B;
	Wed, 27 Mar 2024 18:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFA8D2C4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561585;
	bh=YsWuS/bN+ordVLNDDyUzgcWCwI9QLJJQ0tzgJwDTOpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kyeYs23vpS5NXvW4EZOydQB3Kr/qKLpIo2Au3C3UcDxO3cIHBuiYGGijSTPMshbrZ
	 xbNGeYKfBX/drYUJBsPmgoA4Uw6nhTeDyXBPCCiV4mVMbuuaHHej5Goi1++X519TOg
	 00HkMlqXRXBl/1Nehh+zUCi4t/FDTeCdN7/uKeiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3C7FF805F7; Wed, 27 Mar 2024 18:45:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C120F805E0;
	Wed, 27 Mar 2024 18:45:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62FA1F805B3; Wed, 27 Mar 2024 18:45:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8000FF801EB
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8000FF801EB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 695C5615E0;
	Wed, 27 Mar 2024 17:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F643C433C7;
	Wed, 27 Mar 2024 17:45:09 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:37 +0100
Subject: [PATCH 02/18] ASoC: tlv320aic32x4-spi: drop driver owner
 assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-2-86d5002ba6dc@linaro.org>
References: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
In-Reply-To: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=730;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YsWuS/bN+ordVLNDDyUzgcWCwI9QLJJQ0tzgJwDTOpA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsN6qyk31Kq51SDkb1+nr67wbSc1UZfPgCFC
 UQZKmSc+ZWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbDQAKCRDBN2bmhouD
 11ozEACRwJ27ei9Jb74W2gi2HWdW7qpjp6WxnRj8fNEeSYTu/bMA0ZZBIVNBmJKYeF/CU12J+sp
 p/umQxlWpZf6QO8cN8reIFlHEkxfKdkJsfOioBIB6SUUcQ6kMqd/B/cIZXnbT7Lt8sa5Vxx1kiK
 tRphy9ogSVX/lY3ckO7lcDtz2/V9YVJnLaKdvFCNme322Co+jmLC8n0R/EDWUJ/kwyE724fEbjc
 VctQ0CXYdaPlsLGAFtAooG2DDM/qY6wDVpXpPc46lsSzT91+T4hQxBaUqtNieGGn5KOEx32V7HX
 +f/vgmxkBY6m4aovqN5NCJQRU9CORKxGaiilmLzrUN5XhLznMMA+J9MVG9tTlEKZ4sHTmVfvYf8
 NgG23OcL/7I+Q631p/qz2DD04+fqAGcFElqSeRN0nQdYcE937KW55xqNnedhhXrqCc1Ul/yUBNn
 6XO2sV2EjbVzidK2wPblYVFXaB2wyv37RxpwJZ8raOaBenhAf1TCPdCrIUHCU9TlJC+S/AiAUpq
 i6kxuG2OsW0hzDD/v4Qvg+EwDuibmwOzAinAz7pbbJA5Dmgg9NdoCvEbKaUh2mqoO/F/SpXVQ9h
 HrygfNaaHfPZkZWvb2YQQ2t4CkTCqgcyTAtlSVYtVi1aSKxKLe+JIG0EPbqT11M9gsU3u2efOGQ
 0F2CMiFpPUtXQUg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 7DAKZ4YGKC2YXR7L5HAWL2KOEOQW6BAU
X-Message-ID-Hash: 7DAKZ4YGKC2YXR7L5HAWL2KOEOQW6BAU
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DAKZ4YGKC2YXR7L5HAWL2KOEOQW6BAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in spi_register_driver() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/tlv320aic32x4-spi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-spi.c b/sound/soc/codecs/tlv320aic32x4-spi.c
index d5976c91766e..92246243ff94 100644
--- a/sound/soc/codecs/tlv320aic32x4-spi.c
+++ b/sound/soc/codecs/tlv320aic32x4-spi.c
@@ -56,7 +56,6 @@ MODULE_DEVICE_TABLE(of, aic32x4_of_id);
 static struct spi_driver aic32x4_spi_driver = {
 	.driver = {
 		.name = "tlv320aic32x4",
-		.owner = THIS_MODULE,
 		.of_match_table = aic32x4_of_id,
 	},
 	.probe =    aic32x4_spi_probe,

-- 
2.34.1

