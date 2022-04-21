Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B7A509FD0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 14:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D1818F2;
	Thu, 21 Apr 2022 14:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D1818F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650544836;
	bh=8YPHXaRtSEaf4QmzNC1DiRPUEOqPzBSOCJG4xUj/XNI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLeNqqudzKE6zNGFajUpvpDUj0bWetZugYfOfgtAwo4P78IjIPwZOEToFyblb6yUo
	 h+4sNtfi4x1Q9rsyxoXcu0tbp74Pc3iAHXk4jq5i27HdWR3i9wH7rgLAvgbYPpyt9p
	 Nj413XYldLVHCFi3Cyuv0ZjKZ9TW9cA9/WrtIJFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6AEF80506;
	Thu, 21 Apr 2022 14:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21F4DF804FD; Thu, 21 Apr 2022 14:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A44FF80279
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A44FF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aTFVI+mP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 986D061C19;
 Thu, 21 Apr 2022 12:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B60EC385A1;
 Thu, 21 Apr 2022 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544714;
 bh=8YPHXaRtSEaf4QmzNC1DiRPUEOqPzBSOCJG4xUj/XNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aTFVI+mPoPGYzrKcxRXCcedlMrolSF+EwWSMs9p4Q+uCNB51pttUbaIxxaMQtHP57
 WVvmnVF8Crai4UHIlsdmAeDJkClj3pdulFBgBrgjZ1U0Aq9WRaBx98qZ8CuYVy+3XU
 FBT5Dx5YlWqWV4ddvDYOKYgTZq3EUrOXHF9la6ZfgJjDQAaufmWNcVyz3QxgpxGIcz
 M4Uhg67QpQuPTgDw79Cvw/IT4He6nlSGBHPuR8TWFgcsXyaJeMn5esGtIp08U2NnAx
 NLfo8pzDJraYu5K76nijjg06qK+QVlXM8HHnXxOfxpTGLZasNb1faolQhF1cLCxn54
 r47weTklTzZMw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 3/3] ASoC: meson: Fix event generation for G12A tohdmi mux
Date: Thu, 21 Apr 2022 13:38:03 +0100
Message-Id: <20220421123803.292063-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; h=from:subject;
 bh=8YPHXaRtSEaf4QmzNC1DiRPUEOqPzBSOCJG4xUj/XNI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVAqrGKZDzol51LSW4SKkqGhg7ji4Y0a8cn4Kt6W
 IKhGBhuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQKgAKCRAk1otyXVSH0Fg0B/
 9v7Rf24dGzpVoJdodOBOPhdQXwfavmcTOTf0ns1kBUw/MnqXt//tXdxlhtG9gaWFsO3MKcXF4sPO3o
 7cRe/Yrb1ebF0j2iBT7JPkthvt6UnakayOUyvfhF3vtzLz5uCvgGw22qU/YUQT9XeB+xe2fqp91IyB
 8SROYXxK3XoEwsge95YlRxip2j+9Iukhp5vey9yVTgZwkAmgv0cYlEIYkZUhw26mxRtPHDZTByA7Df
 FnR/5+3dzHK1izoGzNrbxXQ9Ux2b5UJc5h9EAdmSg3aZe6BhoJtM9qxk8V8NhpvUBem3yURuklNvOI
 K4Hi5l1szFobj39+b0soTpFY5MtE27
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

The G12A tohdmi has a custom put() operation which returns 0 when the value
of the mux changes, meaning that events are not generated for userspace.
Change to return 1 in this case, the function returns early in the case
where there is no change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 9b2b59536ced..6c99052feafd 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -67,7 +67,7 @@ static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_i2s_mux_enum, TOHDMITX_CTRL0,
-- 
2.30.2

