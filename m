Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768C88ECE7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:46:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF032C35;
	Wed, 27 Mar 2024 18:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF032C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561563;
	bh=8b3Oy1fGfAEMtFCQt+ck7h5hi5WBMlup1AiHI6uEuQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=efo4lxeLw90GKXqog2nlrT3G8jcdt10axz6MezMF0/D1RHt4PB7iXeWZfPIbiRCfZ
	 B5H2va+x+7ev4uXMZvYgxSaBzu+tJ8CIK+Q40pRREYrJy7wjFw5T1A1XhPwSO/PmY8
	 qp0hbWh3FMOIjR9sWy5gQ0xEbgtCycrX7rHAGd+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E0BFF80570; Wed, 27 Mar 2024 18:45:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF474F80570;
	Wed, 27 Mar 2024 18:45:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20539F802DB; Wed, 27 Mar 2024 18:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECE5EF80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECE5EF80093
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 306B5615E0;
	Wed, 27 Mar 2024 17:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91458C43390;
	Wed, 27 Mar 2024 17:45:05 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:36 +0100
Subject: [PATCH 01/18] ASoC: loongson: i2s/pci: drop driver owner
 assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-1-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8b3Oy1fGfAEMtFCQt+ck7h5hi5WBMlup1AiHI6uEuQ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsMq9waK3sUmApxn+Pgq3ozM4SqdJZCNR3FX
 t3rRSdTYGOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbDAAKCRDBN2bmhouD
 15ekD/9bc/yZSAYOk/0Nmx+0MO0UQCrNTW36lgpNGGKKUf7T3sdicWoMqT8jtzS8prS+C3QQTgG
 ubA+I0/Cq1JxJgIXabJviAq3usM9snUQR9irTHDD3nMsK30gO168uahyl6IdOIGTlRCW+DTlpVP
 c3bibtrQ2oKkJsFZ0KWpbpLO1CTKkk3U5OwOcsjIusOoF0pcPX5Dfdwp2hAWtrRrsFGphjB+mQB
 INQODSP/Lfaa7zdVmvgOO4xEpVuLY6IXoDrSwGAwAVFs5qJl1k8MAhFGteD/dDSr4f/b1CkDNZk
 jTsWoOagqfIh/t9dc3gACFWdCw7/fcC6UnDEo5QY77gz1BgCYDv+iyjyHhcmg0xqbBejzBcDYqa
 NyW3NFj+rsugCL2MTCPVWEHqCoe73VoOmuX/reiQDfcmpz0V5sYAFjjQIVc2mNTUJJZCi+oVsfW
 4OJn2hIk6uGI2qBQG9GP5Z5ci44YWKfIyaX/Fa3//OpUzLOtW0XUD6jDuoeS3swcjUQBL6cj9S+
 4RAAfw3JiRMoVIieXcDFZmzzMIquqPpx0zRx2h+qvmj6ahTeeLDSZEgR6PHA6rOqO9KQtaCL18l
 rX9KFllJr6Lc4lZ+BggQXXhSHNA1nLxGnaIEOa6TajyJrl4kjaHX9eUIV2kWkZLL+QqShRdZWs0
 4IMJIRDjrnVkY1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: QEQSUISWIUEJCPB4N6HTWVQEFLEBPHVW
X-Message-ID-Hash: QEQSUISWIUEJCPB4N6HTWVQEFLEBPHVW
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PCI core in pci_register_driver() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/loongson/loongson_i2s_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index fa90361865c6..ec18b122cd79 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -160,7 +160,6 @@ static struct pci_driver loongson_i2s_driver = {
 	.id_table = loongson_i2s_ids,
 	.probe = loongson_i2s_pci_probe,
 	.driver = {
-		.owner = THIS_MODULE,
 		.pm = pm_sleep_ptr(&loongson_i2s_pm),
 	},
 };

-- 
2.34.1

