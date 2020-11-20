Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C62BB05A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:28:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139AF17D4;
	Fri, 20 Nov 2020 17:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139AF17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605889722;
	bh=zDxcfDBYmjuuUTiiRpHLHOCTf/WPUkT0pv5HqP59xZI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFs9FU7AsdAGXfsj4tQTmJhw0kFX/dPDhJBHVaMVXTk7nIEuoe2pD2cAX2HSpfKzV
	 GlFkR0d5VMb4MLXYECCAGzto4wemzYM5cdiKtuNqiItK7JAWjpsorKX5DhRrYl54m6
	 7y914D+/V8cS/6tFhNQPem3OKSIojfetbkYW0rik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0633BF8057C;
	Fri, 20 Nov 2020 17:19:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E30BF8057C; Fri, 20 Nov 2020 17:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD7D4F80567
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:19:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD7D4F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yPPxhSwa"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A92D5223FD;
 Fri, 20 Nov 2020 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605889153;
 bh=zDxcfDBYmjuuUTiiRpHLHOCTf/WPUkT0pv5HqP59xZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yPPxhSwai7i1F+5ncbhIDRNTitTO/NOTd2/opdYmdz15Wg+plVdw39EpKMZc8bYbv
 VXO5CkglPIGsjfNo7QgfH2qePjM431XOSLCAPKQICgvYF1vd5CDRJQpToFLKFWkZTY
 PFGGwvU85sLZ/JzaRhPq1w5AMdPiUJCVIAzUwD7Q=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: [PATCH 25/38] ASoC: max98926: skip of_device_id table when !CONFIG_OF
Date: Fri, 20 Nov 2020 17:16:39 +0100
Message-Id: <20201120161653.445521-25-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120161653.445521-1-krzk@kernel.org>
References: <20201120161653.445521-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
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

  sound/soc/codecs/max98926.c:574:34: warning: ‘max98926_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/max98926.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index c4dfa8ab1d49..0977e541326d 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -571,11 +571,13 @@ static const struct i2c_device_id max98926_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max98926_i2c_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id max98926_of_match[] = {
 	{ .compatible = "maxim,max98926", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, max98926_of_match);
+#endif
 
 static struct i2c_driver max98926_i2c_driver = {
 	.driver = {
-- 
2.25.1

