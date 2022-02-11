Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABFC4B2B20
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 17:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5605F191B;
	Fri, 11 Feb 2022 17:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5605F191B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644598792;
	bh=kcascgmrZLysKpi6HM+Z8y67brqdTYtutuVMh4BIJv4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kfkhnZB4V1sZsBp2I85dQUQbTIhLb0BAST6Yxx3M3NS2M8zcWhLlNSFRw6xHGFmJ1
	 rXF1tOHE0dfccbnMmShRajaa0bMcIiwNq+rSPnI57eWTWui6iq3YQ/dNqA29weNKly
	 Rr266sB1fJRqHvqvKGE0i+I6URuiLQY+Ow6pOCzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF644F80125;
	Fri, 11 Feb 2022 17:58:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3503F80139; Fri, 11 Feb 2022 17:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30846F800B0
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 17:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30846F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IaSJVi2e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A05FA616C0;
 Fri, 11 Feb 2022 16:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A68C340ED;
 Fri, 11 Feb 2022 16:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644598718;
 bh=kcascgmrZLysKpi6HM+Z8y67brqdTYtutuVMh4BIJv4=;
 h=From:To:Cc:Subject:Date:From;
 b=IaSJVi2ehUN2vIqQ6UdvKG6lkZui2TdZXknB6xn8+x4DjxUHvzttbCHieOQ7U5hhl
 qDp8g/3Ib5wSelgSN4Q/LZJz97likemr9pO1YeaO6a5AIlRLh1oGi/t/sqnaH//BaA
 heBwwim23lWnGXDFHMR5N1KZjgiZ0UcG0fZqE21CCtJBN6L39QkRj+BdNguH3YxSLG
 0VZIas01YDsrVmNwn4FeoBn8b4aSvvPqv8FKaJ6Qhl6gggIZwxP71kEmcP5diHaYaW
 FTZu9MCK3sFsoIEUvmBxQXvfYvjM4OjZWjVuCK2hugNXccHoMl+oAiFsdWi+0Oku17
 m2zUQ7t4pK+qQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: wm8731: Delete empty remove() function
Date: Fri, 11 Feb 2022 16:58:11 +0000
Message-Id: <20220211165811.1176005-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; h=from:subject;
 bh=kcascgmrZLysKpi6HM+Z8y67brqdTYtutuVMh4BIJv4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiBpVEmv0mOHhwYCNcSqgrgHamWYstuH+FTzBi31BU
 cGJj1/WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYgaVRAAKCRAk1otyXVSH0GnYB/
 wKlsV7FE6G7yMPo440iD2lUxJ5TwehL5Oh6F/XhJpjaBLq2MoWCJVzzXJ6jsW0tcbdCmkYCjLKx2aS
 ICI1PPLISfCYoojNHcX6oRw4aeSnr2t/OjCT25lwkMBobnRMbt3malnqzm82wIekDoBZgooJec+oC0
 RreomwrckvRsDyryUxFKIw0NBAhD6MxXb7XM2ElFkY0NGm7KtTFgMvkonZF8x6KzaisJJIeA2fjbrW
 PzFDR59eVYJww8EpHoInRUsPM/DG9jc8C2Re83Bwfl+4XrwCflL5u0XlncQCsJ5lQnBpuOZ44q+6wo
 yaTNzLKjNk8uH9iXzwEtp19RY5BVZS
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

The I2C remove function is empty for the wm8731 driver, it can just be
deleted.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 86b1f6eaa599..5d4949c2ec9b 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -777,11 +777,6 @@ static int wm8731_i2c_probe(struct i2c_client *i2c,
 	return 0;
 }
 
-static int wm8731_i2c_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static const struct i2c_device_id wm8731_i2c_id[] = {
 	{ "wm8731", 0 },
 	{ }
@@ -794,7 +789,6 @@ static struct i2c_driver wm8731_i2c_driver = {
 		.of_match_table = wm8731_of_match,
 	},
 	.probe =    wm8731_i2c_probe,
-	.remove =   wm8731_i2c_remove,
 	.id_table = wm8731_i2c_id,
 };
 #endif
-- 
2.30.2

