Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E43947E3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 22:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1309016CF;
	Fri, 28 May 2021 22:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1309016CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622233290;
	bh=Y9voMhMz9B9g7rE3mo56opMWRPzgKY/nkyFObrkrKxo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EC6sFokBF3stUZZ5NVvX4L4Jmk8VfRKqM+9USCbmSe8mRwkbJUxc4ylvS+ANhLnTQ
	 0S6sh/UKcELCGDo3xwWtaeJdUaKsLW4t/ZZdAHH/WtHi2DTO/L+K98g7PZ5ovXZmVL
	 6sg9ojaaDtQ2bev7H4hAewKWZXsQe6cuNE8mtkLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79810F8013A;
	Fri, 28 May 2021 22:20:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A67EDF804AC; Fri, 28 May 2021 22:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4AF2F802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 22:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AF2F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KZ2BV87W"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D767C61176;
 Fri, 28 May 2021 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622233188;
 bh=Y9voMhMz9B9g7rE3mo56opMWRPzgKY/nkyFObrkrKxo=;
 h=Date:From:To:Cc:Subject:From;
 b=KZ2BV87WYsJTtRauCc++r0/aOROQxSs8aVlCe7KzMX1p/whR+2mMXvgH5y+cK/9wJ
 IcxqNOvbuKZoLSyxaHMGFhXOa4MIlF/IZP9U/63BC/6Dy5CZoJTYX/QDvEt/PSGNAK
 tUSdZr2L9iME15oBI3LVfTLXXpb2uCwr2skge90TjuiIsd3W1aM2j05VuE9VtIpD85
 bwWiAAlK/r5MKUHTHLCDrMYE3Wz4wcIXJx3P4hRRk7JD95id1oEHDIFJNr4w1SDi7R
 OGpcGJBx1mS03YPQu/vzadvK6ylJ582u4nh8MZ0/GCXdUhngLmwOyjGGt+1jE/jbjV
 e37pRB+xgjrjg==
Date: Fri, 28 May 2021 15:20:47 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH][next] ASoC: ti: davinci-mcasp: Fix fall-through warning for
 Clang
Message-ID: <20210528202047.GA39602@embeddedor>
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
by explicitly adding a goto statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
JFYI: We had thousands of these sorts of warnings and now we are down
      to just 25 in linux-next. This is one of those last remaining
      warnings.

 sound/soc/ti/davinci-mcasp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index b94220306d1a..587967720135 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2317,6 +2317,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		break;
 	default:
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
+		goto err;
 	case -EPROBE_DEFER:
 		goto err;
 	}
-- 
2.27.0

