Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6EB53BA37
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6620417A5;
	Thu,  2 Jun 2022 15:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6620417A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178212;
	bh=HSjYW/Ue569WZ3BuYB2cymAs33fXhPkQX6QyYPRA2nc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bg8XCpS0JfoHBTn27cXTh0MwkIlf41oJHbVjpBSxPfocMapSLsV5uJT/Nfllcy2Up
	 cdemEEBzjzDvffxCKeOV7x5p98Rcx6fxYu430te9M5zivVJKJRvEUx1i5mzgzmdqHO
	 L8CiRVLeG9mQEGJbYLcqvK0rJoZgS1He8D0ZuvTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D6E6F8055B;
	Thu,  2 Jun 2022 15:53:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91FE7F80548; Thu,  2 Jun 2022 15:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D0EF80542
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D0EF80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mxqPna7T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0049AB81ED6;
 Thu,  2 Jun 2022 13:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01ADC34119;
 Thu,  2 Jun 2022 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178013;
 bh=HSjYW/Ue569WZ3BuYB2cymAs33fXhPkQX6QyYPRA2nc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mxqPna7Tk+OWBmVTip1ZboSRJmT8tz+CisPboc2h3tep4CsrfW36vceYwd24uwzRI
 lhosDe/5dheBcbby5KvxjYx7SzHdpiI1ey9hbhc4Ru4d1h3OIDfr9/KZWGFEC9+8gd
 0R//KW0yFgGnT+XkUqldl3RfbQKAkybDdLUphbIIa/Jol3MmjLWxXXLQvqSqXC8VII
 lzsEnXzvevgSHOcoit+V6lHlSZWRR+ETcryFf7+jO21KBiDgHejSunTuAWOFDyj1ES
 o5YqYrLH8HqAjVF8WfMeth3f+KJ5llUPCe1Q5PwAiJ2gWU8Gz96F2cY52ZvYEyNPo+
 4U8Z3iQtkrplQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 10/20] ASoC: tas5720: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:06 +0200
Message-Id: <20220602135316.3554400-11-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=908; h=from:subject;
 bh=HSjYW/Ue569WZ3BuYB2cymAs33fXhPkQX6QyYPRA2nc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCWL3aatMLfzNHABfhVrKY4Hy6BtQPG2SgyZ6+9
 aelBKT+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAlgAKCRAk1otyXVSH0M+gB/
 4v4VuAmbKpNOaI78oBnovSzDjcKxyqhovjCki08rdNgFJo9c/rcCfsR27fEOuBMHHAWXIZRzQyA0rR
 uawuG2zwNH32t9G+KHd7DaQRx/nS6Rh89+1NwtxVgjuM/RYgYF04kh2dpQ2mX7jABoT9oDVrfxP0vH
 iIlCay6joNcJbKt9ZwUB8BTmcslsQpPh+TCXi3fuIqkHk2nI+e+M/zTssZ7Ald28ExaubAlKdv9+Ld
 Jf+p7R4yaQJeo6Y9Y2snwpNCRt+tnLNt7ki+icvJrBhEz4Z+33qFXiYl65jYLB5U2Zxdc65IjCFLI/
 PPg+OPNj66Q/aN9C/MIEO3Z8eKe+Lf
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

As part of moving to remove the old style defines for the bus clocks update
the tas5720 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas5720.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 17034abef568..2ee06a95f3e4 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -89,8 +89,8 @@ static int tas5720_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u8 serial_format;
 	int ret;
 
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS) {
-		dev_vdbg(component->dev, "DAI Format master is not found\n");
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
+		dev_vdbg(component->dev, "DAI clocking invalid\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

