Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAD88ED10
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73B5A2C77;
	Wed, 27 Mar 2024 18:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73B5A2C77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561745;
	bh=HJ+pITzNOF/Nh/aDDL4TK+BjymVwOnnMENKw9E4/elg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lFcVgug+6O7On8+/yz8swhhoN/WF7fdOuVmbEbgvMo/Of3msZFwQ/t9sMfm7RwgrK
	 vVHnqpMeKWacu40w/o1JKVfLwFhyn4Wq4TbOOfatIunuHKswaj5BpTU025xbLR2WP5
	 XmVkldicIkASjIR7EirOVvIf7UjQx0YsfqvEBhuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE52EF80794; Wed, 27 Mar 2024 18:46:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E674F80794;
	Wed, 27 Mar 2024 18:46:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2611F805D5; Wed, 27 Mar 2024 18:45:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A4C8FF805A0
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C8FF805A0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88C5661180;
	Wed, 27 Mar 2024 17:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93397C433F1;
	Wed, 27 Mar 2024 17:45:48 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:47 +0100
Subject: [PATCH 12/18] ASoC: rt711-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-12-86d5002ba6dc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=665;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HJ+pITzNOF/Nh/aDDL4TK+BjymVwOnnMENKw9E4/elg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsWhGvL8CxXm/7lx+WjlN5d+1T09rhdZMxrV
 +xamzvzOISJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbFgAKCRDBN2bmhouD
 1zN0D/9zcomOiqDpDCPOH1K1FvLS6W2WF8kLU6e9azsWAKxS3VOKDvUGot5uX9MDzMjGyBAnJOv
 +vpdhxfUw/xUSDWJN33nql3IgRPeK+ID3uUBI4NNzSxTmGwbdHfyBGUAo5Wk0KBWsiaEpTObQUf
 L6OAVstSK0viddJO54llBUHFzWaCyziiNuUoqHJwvB8LEF73Kip3uf2oL7tbXga+ptgIicVh1OT
 dDYBG4RkJN1V5yru9UzN9TC2Tqz7JxQjUTZgKI6Xhp2DGbB99Df0WNMIkStPdWBT6jdnMv5+hP1
 frcdF2KiQVA//JwSW/MT8/pekuwWUejefh7HF010s+bxij1oUcQdL4Xh7VrZ6SZdjbU45jSFHpj
 I/wpgAyoGLGFwMwmgNANJQ/2RhSXb4Hu7BAeUJbylrAt0OF5PAz2M5Z8A+05W6MHO4AuBIacQ+2
 VzdUgV0gsz/b3QG482lKkqbTvca74PRyZmJ3afJMM0zN13qHJMpO8BV6zF7AKssmHjSR9Z9V3DY
 qCNDRxzTW6Pjps/5a+8QgnfMMHYLEoFlEG8Qf0Uho9RfLuSz31HV2LwJUTZbAypA59pU1MTaOKn
 gcQJ/S0hYDAyN1xm2L7snykiq7LpPF8hxnWE9qGSEQC6ASaSNkRxQb6VYeyylbXVRxvB35pLiAw
 CTSrfBb4ehwgXrA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: KHHUOWGACAA23OYON6WSMTVAIUZUA64O
X-Message-ID-Hash: KHHUOWGACAA23OYON6WSMTVAIUZUA64O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHHUOWGACAA23OYON6WSMTVAIUZUA64O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in sdw_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt711-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 3f5773310ae8..0d587f48439a 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -569,7 +569,6 @@ static const struct dev_pm_ops rt711_pm = {
 static struct sdw_driver rt711_sdw_driver = {
 	.driver = {
 		.name = "rt711",
-		.owner = THIS_MODULE,
 		.pm = &rt711_pm,
 	},
 	.probe = rt711_sdw_probe,

-- 
2.34.1

