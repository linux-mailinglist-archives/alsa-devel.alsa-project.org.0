Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D789FD93
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 19:02:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BFAC2408;
	Wed, 10 Apr 2024 19:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BFAC2408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712768540;
	bh=X8O8ZYOPEK1I4odZztBRGcqlUHQFHy0MNOIA0Ihlr0s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p2YsFovfWjAWt2xJQ0lD7Gd4sFjyAtMRFUPc028yxKRGY88ja8nWXHtiVt7Zyi2B7
	 AT4e88TwH+tngUxJpVZI8FmJI2dQZB7tnDcamVeLLg3xIgh9EQppJ0uyiThTDpPwq3
	 /53RSmxOx7g6r8yb4z3BKEeSaFsyfNCf9dyr9U6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69C56F805A0; Wed, 10 Apr 2024 19:01:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B752CF8059F;
	Wed, 10 Apr 2024 19:01:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7031AF8026D; Wed, 10 Apr 2024 19:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F1CCF800C9
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 19:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F1CCF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IffJcqNA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 396D261B97;
	Wed, 10 Apr 2024 17:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69955C433F1;
	Wed, 10 Apr 2024 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712768495;
	bh=X8O8ZYOPEK1I4odZztBRGcqlUHQFHy0MNOIA0Ihlr0s=;
	h=From:To:Cc:Subject:Date:From;
	b=IffJcqNAhM+kVjSTdplcrBLLNcc8cXZypFxabEQ98E7+rVo20+OCmJaO2cByt8Cmi
	 /nsspM5BMmy9RQ/dzi9I8Nn7cl313DY311YzXNguGoi5MV5/66nXxFBhMCSkit1HUg
	 6Zd4a4wxFzPHnVab4j2ygr2vi7GuLHxIoueg1n06J1TiWbXKQiXIDOQRwWetWf9mxO
	 3EYE5k6sLEkQN2Ozhm27eqKxUxRc3S8NonLGQInAekssn3F7kDMP6KG9lt7qc5XqJQ
	 fcym1pUTVc7IPOSwjrt4pIdBTN5qLr3oBa++HUsEUCs/xOFzdKK7ZGAvxfmnreWqzT
	 eZ3GM4/p0uJ+Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] slimbus: qcom-ctrl: fix module autoloading
Date: Wed, 10 Apr 2024 19:01:29 +0200
Message-Id: <20240410170129.248361-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22YLEZHDNHUZ6PEHQZPYCZB44GFMBMNX
X-Message-ID-Hash: 22YLEZHDNHUZ6PEHQZPYCZB44GFMBMNX
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22YLEZHDNHUZ6PEHQZPYCZB44GFMBMNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
based on the alias from of_device_id table.  Pin controllers are
considered core components, so usually they are built-in, however these

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/slimbus/qcom-ctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 400b7b385a44..f7d04b50c973 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -718,6 +718,7 @@ static const struct of_device_id qcom_slim_dt_match[] = {
 	{ .compatible = "qcom,slim", },
 	{}
 };
+MODULE_DEVICE_TABLE(of, qcom_slim_dt_match);
 
 static struct platform_driver qcom_slim_driver = {
 	.probe = qcom_slim_probe,
-- 
2.34.1

