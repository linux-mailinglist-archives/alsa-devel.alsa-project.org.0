Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493B2BB039
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:26:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08B417D1;
	Fri, 20 Nov 2020 17:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08B417D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889578;
	bh=P+vy5VoZ2F85soXfnFUh9AixDyXElRDgch2cjs4F6Is=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eFcSnJqcosmztzqZYwlAoPddmuPapXMePq20a8d1TFVHRTRakrM32Rkd1Xxj5gao5
	 WYdEwtZP04TI3a7MEKEj5ZQWmRTyT/RysiThrlRO2h/yhdEtQDNoMcODzZ2WrZ6RH+
	 nWHQEqn8/QBrc3pa9OL6KbPejr21ZtS2cj8Q+BYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D09DF8055C;
	Fri, 20 Nov 2020 17:18:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4784F8055B; Fri, 20 Nov 2020 17:18:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D41FF80543
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D41FF80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WFPHGAxv"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB4A422D0A;
 Fri, 20 Nov 2020 16:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889130;
 bh=P+vy5VoZ2F85soXfnFUh9AixDyXElRDgch2cjs4F6Is=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFPHGAxvywvtyjufvhmejf5xCuap0U8vCCa/Y4kerIpsTO8ZY/XvScJ547FdtxtCt
 LXqgDgKvolHqpRKgG4rTndeNpG8QMcc9Ro05s3bcV0l4L55904q2uBJrd6ryHjGbTE
 3HbDxUUr98DoD4tmFJN0X5NM0a17JsBONFGrSxcM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 19/38] ASoC: es8316: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:33 +0100
Message-Id: <20201120161653.445521-19-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
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

The driver can match by multiple methods.  Its of_device_id table is
referenced via of_match_ptr() so it will be unused for !CONFIG_OF
builds:

  sound/soc/codecs/es8316.c:837:34: warning: ‘es8316_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/es8316.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index bd5d230c5df2..f9ec5cf82599 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -834,11 +834,13 @@ static const struct i2c_device_id es8316_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, es8316_i2c_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id es8316_of_match[] = {
 	{ .compatible = "everest,es8316", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, es8316_of_match);
+#endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id es8316_acpi_match[] = {
-- 
2.25.1

