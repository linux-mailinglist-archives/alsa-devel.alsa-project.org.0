Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993A3D760F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 15:23:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918111F04;
	Tue, 27 Jul 2021 15:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918111F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627392189;
	bh=u1luN1sMFI7o5STBnQbpqlrcozJB2enfmjp0qualJQw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/teNYFpBntneEUrvzfuaTIB+4vWrJzNWHLOaOCYE6vPZtTmdXQc1GNrDVsYlggQ6
	 rDl2FbeezQdHYAqI0hEb9fPfkLrPjwRJ3bJpdXPkRooSZ01c8qCSFja+xcmcu7Xwzc
	 FcbKX+CSWxJFwnEO1MFbcWrd3D0TTxVpnVONlKHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A6AF804FA;
	Tue, 27 Jul 2021 15:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A622F804F2; Tue, 27 Jul 2021 15:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 428CBF804ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 15:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 428CBF804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FpEv5SWo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37E68601FD;
 Tue, 27 Jul 2021 13:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391993;
 bh=u1luN1sMFI7o5STBnQbpqlrcozJB2enfmjp0qualJQw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FpEv5SWoQR0yY/0UOu82OFKaeLY/RiGzBp/8avXYzeVEZsmDUlSYBqO5tGAcSa7/h
 4y2aVKS83K45UHATAKsu6sTEWcAlLkMPF++UW3n1EnOuS1tvouFpDXHvsU3iXveDuB
 xOgv5kLRefu7MJImKfhLX4eEwYiV+aDC3eIOMZThb/OZonWA1+qobaQkEXKDQAV+gX
 IaemdnUbCHUgSbbD7tkxcYsTGD1Upf2c0abm8RAgrFJygfomQ/bck/HToeSS1oIoNb
 YoIs/uyEsuniL2bN0796KmRKKxFuqo4TVpVNELJWNt5ghXzdFrUO/8iFDGSrLc5ftW
 hID4EwQ7fALXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 12/17] ASoC: ti: j721e-evm: Check for not
 initialized parent_clk_id
Date: Tue, 27 Jul 2021 09:19:33 -0400
Message-Id: <20210727131938.834920-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131938.834920-1-sashal@kernel.org>
References: <20210727131938.834920-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>
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

From: Peter Ujfalusi <peter.ujfalusi@gmail.com>

[ Upstream commit 82d28b67f780910f816fe1cfb0f676fc38c4cbb3 ]

During probe the parent_clk_id is set to -1 which should not be used to
array index within hsdiv_rates[].

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Link: https://lore.kernel.org/r/20210717122820.1467-3-peter.ujfalusi@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/ti/j721e-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 017c4ad11ca6..265bbc5a2f96 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -197,7 +197,7 @@ static int j721e_configure_refclk(struct j721e_priv *priv,
 		return ret;
 	}
 
-	if (priv->hsdiv_rates[domain->parent_clk_id] != scki) {
+	if (domain->parent_clk_id == -1 || priv->hsdiv_rates[domain->parent_clk_id] != scki) {
 		dev_dbg(priv->dev,
 			"%s configuration for %u Hz: %s, %dxFS (SCKI: %u Hz)\n",
 			audio_domain == J721E_AUDIO_DOMAIN_CPB ? "CPB" : "IVI",
-- 
2.30.2

