Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC0635D59
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 13:45:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8EFD168A;
	Wed, 23 Nov 2022 13:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8EFD168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669207505;
	bh=vxQEmq6QOTh8Aq/SoTk5RoDWRPXf0GWAr+VGwhZm6q8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVwZYp3oNYl1fxb/PbwDXwwV50skV6MzgEE1GMdmSWulc9htPWzdYkN3s1eKuTE4J
	 ZmcmNOj2j6eTgu62CRVpFJ8dy2tcnG/rHoXSxL9LNnwJlSozZNtGkUF+aJ9N7zzI0h
	 eoLT+jnDmy0o/L/biE7/pon8uT1YpAZ0gDPd9I2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE67F80580;
	Wed, 23 Nov 2022 13:43:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992E4F8055B; Wed, 23 Nov 2022 13:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE37AF8055B
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE37AF8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X3/kYt+O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC910B81F59;
 Wed, 23 Nov 2022 12:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425C8C43470;
 Wed, 23 Nov 2022 12:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669207386;
 bh=vxQEmq6QOTh8Aq/SoTk5RoDWRPXf0GWAr+VGwhZm6q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X3/kYt+OS8oTwo/YjiK0ya7PEfu2gQVhpMyTrVKcWe/2Iv6rCoBAfg06+kkdM/xg3
 m9NfMqCBvz8MRLRT31YXIT5axSeoJ8jXWgRixiD34ETDE2lfVdDVe0OY8EJjw+1M1t
 pTtOEOZVB9oG4MISw96P9EI3W5C+t5J3h0ag0Xl42g2RXJsxJgRit08Ijcs9ay0rj7
 4tNDSNWh5qcbtIZF8KXhR9Rnlfqf6AS22vqjKpN7dEXT2Xbfimp7M0EawVK6HLfEA3
 1FV5G4Qpx8sjqSpsuuVUx24xOAHuLaAwUuynPdmuLCC4KpnW8zwEbPN12I1p+4Gwvg
 /CcExY+1gqPwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 12/31] ASoC: stm32: dfsdm: manage cb buffers
 cleanup
Date: Wed, 23 Nov 2022 07:42:13 -0500
Message-Id: <20221123124234.265396-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124234.265396-1-sashal@kernel.org>
References: <20221123124234.265396-1-sashal@kernel.org>
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
index e6078f50e508..1e9b4b1df69e 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -303,6 +303,11 @@ static int stm32_adfsdm_dummy_cb(const void *data, void *private)
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
@@ -349,6 +354,12 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
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

