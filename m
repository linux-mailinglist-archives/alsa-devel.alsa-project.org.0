Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF93B417BED
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Sep 2021 21:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F6981654;
	Fri, 24 Sep 2021 21:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F6981654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632513071;
	bh=v7ieSj0Y85uULigQ/mnWZxrU+Mlx1o2M/QOrkRUBwhE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U+1Bk2QhXw1hgqc0QMsbm5CFlmgzGut6l/EZIMmDp//b15em/184+EKC8PGdOJujY
	 EZyy2NcL9fPZmX/HoDFslk3Ifkw4BFbM/wpJ/AVSYefaa59EDn/t//8+YQf4qQVihO
	 pzpr0FwGZBdYpQo1dz8khOY248Yz3WhNjdYjsV2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D95F800BC;
	Fri, 24 Sep 2021 21:49:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F4A9F802A0; Fri, 24 Sep 2021 21:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A191F8013F
 for <alsa-devel@alsa-project.org>; Fri, 24 Sep 2021 21:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A191F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y/DTRmM0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9038B61039;
 Fri, 24 Sep 2021 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632512981;
 bh=v7ieSj0Y85uULigQ/mnWZxrU+Mlx1o2M/QOrkRUBwhE=;
 h=From:To:Cc:Subject:Date:From;
 b=Y/DTRmM0jOidhevzuMO1/4oyJvPqSQ+sfBV734LDALJy6CFQ0ck7SbMtaRc2Ngmu8
 CXljZKeJnG8R/4+qluSGTkdycDpH5AgzRUwoSwVf1UitWUekc+BaNsI4ggi0s1W5uZ
 nddO0M0Yy/mmXURKif8T2emNns2aST5r72vf1EAVSTZn9H4Hk9rSYdQkMpjQGWv1um
 lUKLj4tq6eQQ2kTozhbs4QNtpoln5h591Zm0QcrLem2RcNLU+YJm15XMje7WntAia0
 kYw1bbnKkwvh78CNUOZl5WyLMElZCbf6Yb/SdwzSXqNNgoEEcnBvbSsM8nNTBcr2Ei
 70KLyYDtH2iPg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: cs4341: Add SPI device ID table
Date: Fri, 24 Sep 2021 20:48:44 +0100
Message-Id: <20210924194844.45974-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1212; h=from:subject;
 bh=v7ieSj0Y85uULigQ/mnWZxrU+Mlx1o2M/QOrkRUBwhE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhTiuBuXHW4oPS7HZ93B8oyCJe10b2q8eeDkL19D5E
 4R0UwKiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYU4rgQAKCRAk1otyXVSH0IJDB/
 4un4Hv/9i6ecZaxI0rft0ewSrIfkPtG4UG3VwlzQcS6awXBZ8QLCpEz67getA4fsX1s7laLkDfXCxW
 7yvc99OG4yu+9M2ibctrZUeOy9lI2YdIdvG/xqBGoN6pDnR9neZQXKKcvDbHozbR45b5E2Hyo/t/bc
 CZ9U1Sx7FUFudkRWmAUDfHzNleSYEUUoS2C77eRFfQdMFaUNgRnwcnfvDytfhwvlZlyFLJvgSN9rYH
 PwR/r0Y6UwDw3kvoh0XUuTReKkJlv1S8JdZ3FTA9MaoCEY/B6uk1AB/ARzNJsNQQI9HHqUQof60QNN
 dKwHWib7l7v1pgQ/xLce4n/vcQRv4J
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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
Cc: patches@opensource.cirrus.com
---
 sound/soc/codecs/cs4341.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index 7d3e54d8eef3..29d05e32d341 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -305,12 +305,19 @@ static int cs4341_spi_probe(struct spi_device *spi)
 	return cs4341_probe(&spi->dev);
 }
 
+static const struct spi_device_id cs4341_spi_ids[] = {
+	{ "cs4341a" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, cs4341_spi_ids);
+
 static struct spi_driver cs4341_spi_driver = {
 	.driver = {
 		.name = "cs4341-spi",
 		.of_match_table = of_match_ptr(cs4341_dt_ids),
 	},
 	.probe = cs4341_spi_probe,
+	.id_table = cs4341_spi_ids,
 };
 #endif
 
-- 
2.20.1

