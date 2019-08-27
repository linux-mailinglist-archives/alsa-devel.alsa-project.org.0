Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A29E049
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 10:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EB61670;
	Tue, 27 Aug 2019 10:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EB61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566892936;
	bh=Csda0PlsVXJCVNp7FQa7J6OYAKl6Gsm0168nrZcADQU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3qjrmxXp8l3pU41iCs0knTXqpUSwbF5OWaInalvyK5YWZrDc3WnHXleL6eYuSFWt
	 hBt8adfcFsEIJqxZGB8R1OPSpm7K7xs+zNkpon/wgmb7AckEywyBswfFyZkm900/Yl
	 2t1nLi0kzP5WaEMRk5xEclMMd6LvpCXg1LHbDD5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAAD9F805A0;
	Tue, 27 Aug 2019 10:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74317F80444; Tue, 27 Aug 2019 10:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 938A2F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 10:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 938A2F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FOk9lpc+"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48E98206BF;
 Tue, 27 Aug 2019 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566892800;
 bh=/hUz0QHXM4fVdpZ2JqX3CUAwKTuN+Sp2nfxIucumXWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FOk9lpc+kWZqmZuvbA0NCG77cnpb8eVZXlhaNMPa4kcAoHiDh9vw7h2iobuH8K+Tm
 aps4L6hNykzHknjpEykLt3Kr/vf9dPMuYE5hTTsmNIS+TCSzqmmIFsdZMv169UtiiB
 k7HXQN8FrUe2l2LKw1cG1Y977tJIo8DX2jBSu/kM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 27 Aug 2019 09:48:57 +0200
Message-Id: <20190827072738.668230721@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190827072738.093683223@linuxfoundation.org>
References: <20190827072738.093683223@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH 5.2 009/162] ASoC: samsung: odroid: fix an
	use-after-free issue for codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

[ Upstream commit 9b6d104a6b150bd4d3e5b039340e1f6b20c2e3c1 ]

The codec variable is still being used after the of_node_put() call,
which may result in use-after-free.

Fixes: bc3cf17b575a ("ASoC: samsung: odroid: Add support for secondary CPU DAI")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/r/1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/samsung/odroid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index e688169ff12ab..95c35e3ff3303 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -275,9 +275,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	}
 
 	of_node_put(cpu);
-	of_node_put(codec);
 	if (ret < 0)
-		return ret;
+		goto err_put_node;
 
 	ret = snd_soc_of_get_dai_link_codecs(dev, codec, codec_link);
 	if (ret < 0)
@@ -308,6 +307,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		goto err_put_clk_i2s;
 	}
 
+	of_node_put(codec);
 	return 0;
 
 err_put_clk_i2s:
@@ -317,6 +317,8 @@ err_put_sclk:
 err_put_cpu_dai:
 	of_node_put(cpu_dai);
 	snd_soc_of_put_dai_link_codecs(codec_link);
+err_put_node:
+	of_node_put(codec);
 	return ret;
 }
 
-- 
2.20.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
