Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73853BA3E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DEFF17E8;
	Thu,  2 Jun 2022 15:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DEFF17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178273;
	bh=4e6ZMjbNEdis1JPP1p3H7X7kke/Fq3tuMk9rPmksANg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tn3u/OVqD2xq+hYs6oPdPyNT4VhZ7ukTmKwrcUGqSIhYovW87lDfbW632FGv6ssvM
	 IQuhU3ycn780ogueZoSmzMgAUwNCz7Qj4mihYLU61OV162MYQc/F4v9SuwUSZkT9dZ
	 ecw6Orcngs3LxV/iphS6OVdLzC34oa6LhWSnsUSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EABECF8059F;
	Thu,  2 Jun 2022 15:53:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E5A1F8056F; Thu,  2 Jun 2022 15:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD9D8F80544
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD9D8F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D7mjKzhu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13BC8B81ED5;
 Thu,  2 Jun 2022 13:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F73BC3411D;
 Thu,  2 Jun 2022 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178014;
 bh=4e6ZMjbNEdis1JPP1p3H7X7kke/Fq3tuMk9rPmksANg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D7mjKzhusiT4yoQU0esfTSbYJw5sqc37zJVi1JRVc8dQUkmRjaYjwDkQr4nFpEURH
 8Oepfbxx/QMJHapxsJQ2ejX3iFUzUTVTGQ2AaXCNl9fZ00s5w9xRp+/GWhJYBc5iST
 t10gFp6o3I0ynQvr1Sr3Rsn+KIQJXdi4y+VeGAZOhvzPhWldQ8KoPJs6wAC8itSrQj
 ZhMckmnbINh+s+cWxZc9w2UohiV8wAMOlQ3pFUYykNgxSpJIoTax7sIo/dBsLpANP4
 SUkrHvn8ICdUVRPd18tdOa4wQi3hwrN9t11+x/Spll57W4mwJ7V1aINJnP9Wb98CPW
 Ya8PtYTE7opCg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 11/20] ASoC: tas6424: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:07 +0200
Message-Id: <20220602135316.3554400-12-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; h=from:subject;
 bh=4e6ZMjbNEdis1JPP1p3H7X7kke/Fq3tuMk9rPmksANg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCW3W9oBcBn9kFflsx5icQMv6D9vl6fGxu/7vZf
 6Ul1YLmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAlgAKCRAk1otyXVSH0MzxB/
 46zRJcMO9SAl6ft/Bc7SZRHEUUHZpg85Y2VvxkiWe5lZ07LOS2qvcAM2H1j402jtmnTvShohhOdszC
 t/pb9Le36p5RcszVcYFyipm9AsleVBdJwMDhr4E/6uAjFBRxUto/VwgwXDK/XG7vYhp72d6TmIcIK9
 xRid5Aqyh7LmjvZDb6xVV0ZYvthnZF8BTIsohsx6er1+WJKneZptE6a8JtKufMBXRuWb08qXpJX8FZ
 4hLlsI9T/+7DlHloX3SNn/An29iLU11s/7lAJW5BP7bbH+M1shD2u3MOKQECXWVA2c+V2uvEPCO7wB
 3GsONFVjXUVj+gC66DCF4MQc/FvBSh
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
the tas6424 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas6424.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index 22b53856e691..9c9a6ec4d977 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -160,11 +160,11 @@ static int tas6424_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	dev_dbg(component->dev, "%s() fmt=0x%0x\n", __func__, fmt);
 
 	/* clock masters */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
-		dev_err(component->dev, "Invalid DAI master/slave interface\n");
+		dev_err(component->dev, "Invalid DAI clocking\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

