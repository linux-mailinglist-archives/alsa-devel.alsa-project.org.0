Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 889BE2BB021
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:22:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBA616AD;
	Fri, 20 Nov 2020 17:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBA616AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889322;
	bh=SVTkXer6++N+JN1kO+v1cmoeZbcg8CF407Fu94SDoCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Om+MfEr7wqTR+qNgN8QAxmMw0WfDC5kOi1NCytrV2FWL+K6eXkZLDzrK547W06Skc
	 fDeKxKu7tN0vCEjyZLDOFGjXk7vSM/SCF4L0AX0D0RyKP0N/w9jSsROH3KOTakpgoz
	 Z8IUP4tccq/2d6iAO0SMjkkxT3YPxMDVSUPniX6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 031F0F804EC;
	Fri, 20 Nov 2020 17:18:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0809F804EB; Fri, 20 Nov 2020 17:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D560F804DF
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D560F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jtH9RgMS"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FD7F22269;
 Fri, 20 Nov 2020 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889094;
 bh=SVTkXer6++N+JN1kO+v1cmoeZbcg8CF407Fu94SDoCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jtH9RgMSF8NZ2dMy7kFcUemuXYl/0T5wMAN/eg7zn/CdCzMm1pET2dPDiJCx5dqBa
 SbJbT1H2G+I+kzk70Dv/mcBdQeyWSVAQ729HPXuGc73SF5kLcjH6+bzj8fDyPa+iA4
 DDbQFjvpkhoA0yT76SgMC6Ebb4Q6iqFZEH7DBt2w=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 08/38] ASoC: qcom: drop of_match_ptr from of_device_id table
Date: Fri, 20 Nov 2020 17:16:22 +0100
Message-Id: <20201120161653.445521-8-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).  This fixes
compile warning (!CONFIG_OF on x86_64):

  sound/soc/qcom/lpass-apq8016.c:294:34: warning: ‘apq8016_lpass_cpu_device_id’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/qcom/apq8016_sbc.c   | 2 +-
 sound/soc/qcom/lpass-apq8016.c | 2 +-
 sound/soc/qcom/lpass-ipq806x.c | 2 +-
 sound/soc/qcom/lpass-sc7180.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
index 575e2aefefe3..cc8c3f929683 100644
--- a/sound/soc/qcom/apq8016_sbc.c
+++ b/sound/soc/qcom/apq8016_sbc.c
@@ -176,7 +176,7 @@ MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
 static struct platform_driver apq8016_sbc_platform_driver = {
 	.driver = {
 		.name = "qcom-apq8016-sbc",
-		.of_match_table = of_match_ptr(apq8016_sbc_device_id),
+		.of_match_table = apq8016_sbc_device_id,
 	},
 	.probe = apq8016_sbc_platform_probe,
 };
diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 0aedb3a0a798..4ee1de6588bb 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -300,7 +300,7 @@ MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
 static struct platform_driver apq8016_lpass_cpu_platform_driver = {
 	.driver	= {
 		.name		= "apq8016-lpass-cpu",
-		.of_match_table	= of_match_ptr(apq8016_lpass_cpu_device_id),
+		.of_match_table	= apq8016_lpass_cpu_device_id,
 	},
 	.probe	= asoc_qcom_lpass_cpu_platform_probe,
 	.remove	= asoc_qcom_lpass_cpu_platform_remove,
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 832a9161484e..421d65a546f3 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -170,7 +170,7 @@ MODULE_DEVICE_TABLE(of, ipq806x_lpass_cpu_device_id);
 static struct platform_driver ipq806x_lpass_cpu_platform_driver = {
 	.driver	= {
 		.name		= "lpass-cpu",
-		.of_match_table	= of_match_ptr(ipq806x_lpass_cpu_device_id),
+		.of_match_table	= ipq806x_lpass_cpu_device_id,
 	},
 	.probe	= asoc_qcom_lpass_cpu_platform_probe,
 	.remove	= asoc_qcom_lpass_cpu_platform_remove,
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index bc998d501600..3f4efd050a29 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -293,7 +293,7 @@ MODULE_DEVICE_TABLE(of, sc7180_lpass_cpu_device_id);
 static struct platform_driver sc7180_lpass_cpu_platform_driver = {
 	.driver = {
 		.name = "sc7180-lpass-cpu",
-		.of_match_table = of_match_ptr(sc7180_lpass_cpu_device_id),
+		.of_match_table = sc7180_lpass_cpu_device_id,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
 	.remove = asoc_qcom_lpass_cpu_platform_remove,
-- 
2.25.1

