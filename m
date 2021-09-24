Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC22417BEE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 21:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354481663;
	Fri, 24 Sep 2021 21:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354481663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632513107;
	bh=pBEvSuuLtFgtDgTr9dVvAijq52uGJSQVXlIX5mf1P68=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FcchChATPy+AwtZyCLGZd7HajMk3v8mn7kgn9VIHN0UNyQssL+EZRdrH6RevKEADG
	 XGh2ETzbiK3AnILuo++X5plQhZiaeGwwGWQk+rsRxsEpBdfHT3BPDkrfiXXdupUJew
	 BsnuUG5yUCcwxPsJ4rQCgmSdsc6TF68SlzSYYdQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E93F804BB;
	Fri, 24 Sep 2021 21:50:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2895FF804BB; Fri, 24 Sep 2021 21:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D9D7F8013F
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 21:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D9D7F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZIH7lLcW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BA5661029;
 Fri, 24 Sep 2021 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632513045;
 bh=pBEvSuuLtFgtDgTr9dVvAijq52uGJSQVXlIX5mf1P68=;
 h=From:To:Cc:Subject:Date:From;
 b=ZIH7lLcWn6OFNIIh6hN1aALgzuhuZPXFycjdDvcbGMElU6a02mGbE+pb5HZo6UKt3
 l2YsvyA4aiUrUK3RNdla9zl38oClUSCfIZF7Cf3wiFH/me2kNBEbGmQGtrKwdr9Ry/
 FN7ONp35bPQhgD/QB7txHnPfw4/nIqAgvBXDmQNDjeuPWyaTY2C57sTPdSJabAS2KL
 OqdY4/BgUvE4nTapyJWceK4d8FE+a2PzZVqMW5uLkcyWOe3mst8n5DFzL6WAZbnj7J
 rLcKgSMG16fOVAIfgAs/Yas7ItoANkTQmmZBKgNQDmVrwVL1i1ijAvaGCDFDc7o8yN
 henqxabKFkjkw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: pcm179x: Add missing entries SPI to device ID table
Date: Fri, 24 Sep 2021 20:49:56 +0100
Message-Id: <20210924194956.46079-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=956; h=from:subject;
 bh=pBEvSuuLtFgtDgTr9dVvAijq52uGJSQVXlIX5mf1P68=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTivIk9g+VOZNJbXfhHA7MVLxcb1nV5r5cwnr6CTy
 4fb56RSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYU4ryAAKCRAk1otyXVSH0HfvB/
 40p+AYMBl46+oHnzw7ytNtVI/BuT/BpuL1hexUfMIQmLF5J4iMHocmBJ/3dg9dgjRLAJKuTrlHxaI9
 I1ZO4uE0mfrs/qC7xTxBQxpqMoUJ3dY1FGG5zWHVVcy6IxIaAQ37nQTDu4BLcmtMejR/m9YVfPfUg7
 okWyy5JpuT88Px/LlWpc8v2cpixjT8miBptwUUdYYvCbd8Bxr00ZSu9zArpwgIEhh41i+8w+sYtRX8
 873U5vEGwDJ4Febv34yjTH9H19gyx3RTE0M9HqYJNKakrqM4bIbMeIIVy4IwRv7UMx7lgnjMAtCChc
 01vjBgNyP7AbWHXOsn59ODHOPtc+XO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by adding SPI IDs for parts that
only have a compatible listed.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm179x-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 0a542924ec5f..ebf63ea90a1c 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -36,6 +36,7 @@ static const struct of_device_id pcm179x_of_match[] = {
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 
 static const struct spi_device_id pcm179x_spi_ids[] = {
+	{ "pcm1792a", 0 },
 	{ "pcm179x", 0 },
 	{ },
 };
-- 
2.20.1

