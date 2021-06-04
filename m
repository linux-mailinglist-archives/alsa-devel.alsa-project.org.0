Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBE39B3DD
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 09:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED9491700;
	Fri,  4 Jun 2021 09:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED9491700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622791660;
	bh=QL9r/k6OqX+R2Iy5czp6c6lWgpPMD31+LjAlGMhaXLE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ND3/kZ2g5QXFbzkERTlDHSuovJh1INPgh8H5poAUT7JrC0LdNKfhx99uUForpzgY5
	 GgGbD0aln3Nq0ZWjOX4IEcibqkEhIrUkAb17xhYTo58PM9n7/i0cYYX1DY/8NVfq7w
	 SyWV3pF68ONYT5IzWufZNviXcGFPcF9twUPKxIh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46379F80424;
	Fri,  4 Jun 2021 09:26:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93506F802C4; Fri,  4 Jun 2021 09:26:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7F1F80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 09:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7F1F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="coTXexxR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E10C661417;
 Fri,  4 Jun 2021 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622791564;
 bh=QL9r/k6OqX+R2Iy5czp6c6lWgpPMD31+LjAlGMhaXLE=;
 h=Date:From:To:Cc:Subject:From;
 b=coTXexxRGVD7ADaKTg82CksMLypwNkAWbSes/PqCs4C8nkDL8JWt1j6vDg9KulOlu
 ICBX+hWn4XCrDlksJM8IeNofWvYbWvDrmErCB1UhlRo1vU12jtYKjywtnAooTNdcI7
 e+N9Ba6esswRpayjU/gRcBgAcSQjNdDokp8l4V+3wSc30tQlLJNdR5hOJPLPKUw7CR
 i2e928PImS5GG6ccpBJcKxTCRbzmXi4GGDMY/l8cioogy5LzmEMYLS0i+k8ZhCH97W
 IFMhVf5jTt9lYhQew3h0y8cIRmPH6T515BFThbSHCEvgGuGyo0QzSQdT30ZTZhi96D
 G1ll5hreQcMyw==
Date: Fri, 4 Jun 2021 02:27:14 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2][next] ASoC: ti: davinci-mcasp: Fix fall-through warning
 for Clang
Message-ID: <20210604072714.GA244640@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a fallthrough; statement.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Use fallthrough; instead of break;
 - Update changelog text.
 Link: https://lore.kernel.org/linux-hardening/25941c37-6e38-88ae-3afe-4f5af44380d3@gmail.com/

 sound/soc/ti/davinci-mcasp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index b94220306d1a..017a5a5e56cd 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2317,6 +2317,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		break;
 	default:
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
+		fallthrough;
 	case -EPROBE_DEFER:
 		goto err;
 	}
-- 
2.27.0

