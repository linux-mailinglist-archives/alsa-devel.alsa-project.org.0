Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C20E3BEBC6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8C9886;
	Wed,  7 Jul 2021 18:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8C9886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625674086;
	bh=mrBEhnwH8bYlcMhLBDU8YITzcTTVslIlm2Y8r7tMcEw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sZyAsn5S1sj+GACkFxT5ZnP87Ay7OcddzomJgesy6URi2y3OjzbZqx7853h8zUCG7
	 yuiLspVOr2OTf+h+ogbwGFbyT/qqPSnat5zQv6duBNvFbu8Skj6Ks8P4nT0QpZInDP
	 PnZwGPgO5wZwsFDk3FfoI3puj2gMGC9gkS8fSAu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D29F8025C;
	Wed,  7 Jul 2021 18:06:38 +0200 (CEST)
X-Original-To: alsa-devel@Alsa-project.org
Delivered-To: alsa-devel@Alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91A4CF80224; Wed,  7 Jul 2021 18:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2857DF8012A
 for <alsa-devel@Alsa-project.org>; Wed,  7 Jul 2021 18:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2857DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CxdMJHSA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1FC9619AC;
 Wed,  7 Jul 2021 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625673988;
 bh=mrBEhnwH8bYlcMhLBDU8YITzcTTVslIlm2Y8r7tMcEw=;
 h=From:To:Cc:Subject:Date:From;
 b=CxdMJHSANXma4me120jzn1+3N5fQInQxxJl9coVWw8gg+HoHu4EL19cJz2kL1Fi6C
 dOURlUkTiLsa+5pT0w1TVnGmEcVx3YpfLza+iR3Z8TMiM2HqUEBJxATDHarYU3M09L
 JDNCy7ERylapLPoUg4+rEO0chsTNelqiAuvzJKszoTO9yRA8c8K/b8bmsqYl3yf4Xg
 Bh7UW2lhaZ8l/2Ak6XrOyknRe7yVFm5KI7rNE+PqWix/ZE15G6gsFG/M8VM67fZtg/
 6p4xef2aoy9r4YEdHOo7hJ+L3dUFXcEOgmhcrCjLLqJBfNfi6ohzckNhmJ7RAo+/hg
 jGBIx//vdPHmA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: tlv320aic31xx: Make regmap cache only on probe()
Date: Wed,  7 Jul 2021 17:02:34 +0100
Message-Id: <20210707160234.16253-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; h=from:subject;
 bh=mrBEhnwH8bYlcMhLBDU8YITzcTTVslIlm2Y8r7tMcEw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBg5c8jHaAfbKOJvpRLMYB8rfd/6bltUxI29bdwSW0k
 SpTaKFSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYOXPIwAKCRAk1otyXVSH0I3nB/
 0VzLU/RPvzMJ+MOr+dRYH5/CCZrgg27ReP5nWXUDGU3SuQOaUqaWqvXfrcLxTAhJc7khhhlxpeSrtv
 /qm7dvOUdla76A1VMpLd25IHzKf0DUaSF7YJK0h5QWAScQuPDs3G0DWpAgbuCvCPIa9jqFdx4IIJYq
 tSSMS9LVazSc9ynopAsGBC/joksrQrUVYLbE+aMC0feTmV2iwNzdl6566fgqVCKyT/YDhLUmhmLcyJ
 dzI4VTljDUiM5toqthJl7K+bYU8GksUoNDz7Nqwmjhg/LPJ9pdyWyoLx7zal7siH3QKmYbHlNcN0za
 x6XTu1QVS4gf4hJr4wAgnypQRBnu0T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@Alsa-project.org, Mark Brown <broonie@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
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

Currently the tlv320aic31xx driver has regulator support but does not
enable the regulators during probe, deferring this until something causes
ASoC to make the card active. It does put the device into cache only mode
but only when the component level probe is called, however if interrupts
are in use the driver will access the regmap before then which if the
regulators are not powered on would cause I/O problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 51870d50f419..b504d63385b3 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1604,6 +1604,8 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
 			ret);
 		return ret;
 	}
+	regcache_cache_only(aic31xx->regmap, true);
+
 	aic31xx->dev = &i2c->dev;
 	aic31xx->irq = i2c->irq;
 
-- 
2.20.1

