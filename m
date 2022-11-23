Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB51635D51
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A4181680;
	Wed, 23 Nov 2022 13:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A4181680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207435;
	bh=9eK/YfM8SsXmkglH0WxqzhlfaZd4V7b6t66rSlpQoZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iv6HWN7hzc31AEWcJZD3iRwdnpR30aEl8PWBBP7VXdoTZrYZdDXOGXGlim5mlsfny
	 BX/yxkM27QIH0OP/cTrf9K7npr+JR6vXjFSni6zTKjItUPmlVDso618BPgVIiW08ui
	 3QOvVyvsPOf54d2Nvi8D/7gDux+cmDk2NzQHCkJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E44BAF80589;
	Wed, 23 Nov 2022 13:41:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ADFDF80588; Wed, 23 Nov 2022 13:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A6ECF8057E
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6ECF8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ek8ZpV+p"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AADC61CB1;
 Wed, 23 Nov 2022 12:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2FC4347C;
 Wed, 23 Nov 2022 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207305;
 bh=9eK/YfM8SsXmkglH0WxqzhlfaZd4V7b6t66rSlpQoZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ek8ZpV+pNfmu3anjult1dt3yk4NRgA50qZr2oHN5EFOdr58OJPuSYQKtNBs2gBwUp
 n5kwNc+9B5hcXmtJGnkwHbGAmgx/DNuamkVV7h97nfbzjovI0zGkt6IXd9x07aAK7A
 53NBBttYJw6l7wfvP7IAqXjaJku8bvR1Fg9fI/X3pfjZrhYHl2BEg36QgLlMh9U1rM
 +gsGeGcHKAZw2G5scOou8Se5/xC8wnhFgxswaA99oE8Nlyhh/qDAyNxJ/KgIvSdjV1
 pG8G1NgnJSYewAFLUwKfBrlX5kA94+lLQyRH3zCPx7VNEr2zYAnxbJ9tUDVfU60RAP
 yyx59Y/hO53ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 19/44] ASoC: stm32: dfsdm: manage cb buffers
 cleanup
Date: Wed, 23 Nov 2022 07:40:28 -0500
Message-Id: <20221123124057.264822-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

[ Upstream commit 7d945b046be3d2605dbb1806e73095aadd7ae129 ]

Ensure that resources allocated by iio_channel_get_all_cb()
are released on driver unbind.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Link: https://lore.kernel.org/r/20221109170849.273719-1-olivier.moysan@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_adfsdm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 643fc8a17018..837c1848d9bf 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -304,6 +304,11 @@ static int stm32_adfsdm_dummy_cb(const void *data, void *private)
 	return 0;
 }
 
+static void stm32_adfsdm_cleanup(void *data)
+{
+	iio_channel_release_all_cb(data);
+}
+
 static struct snd_soc_component_driver stm32_adfsdm_soc_platform = {
 	.open		= stm32_adfsdm_pcm_open,
 	.close		= stm32_adfsdm_pcm_close,
@@ -350,6 +355,12 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->iio_cb))
 		return PTR_ERR(priv->iio_cb);
 
+	ret = devm_add_action_or_reset(&pdev->dev, stm32_adfsdm_cleanup, priv->iio_cb);
+	if (ret < 0)  {
+		dev_err(&pdev->dev, "Unable to add action\n");
+		return ret;
+	}
+
 	component = devm_kzalloc(&pdev->dev, sizeof(*component), GFP_KERNEL);
 	if (!component)
 		return -ENOMEM;
-- 
2.35.1

