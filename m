Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FB80CB8E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:53:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B83B857;
	Mon, 11 Dec 2023 14:53:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B83B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702302790;
	bh=1u59eh4bKxf33FbVZ1kh21GRHDUPD+2OVnhJ0C5ORZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iui8F8uaWA3UwwgAi8gYT1JfvN6YM2K3IBNzatzbgYOEoddTexZBf6f/LYqvGOJYz
	 VZDt25UBF0cn2LxjSJabrhRPo+WiDqiuiMU0zLv1nPmQ2enjBZ1mxM93kHD1FuwB9E
	 YpsQcPhhLwos3r3UlXXuCHUW4aWZyHn2wCWde2bg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E250DF805CB; Mon, 11 Dec 2023 14:52:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B216F805B6;
	Mon, 11 Dec 2023 14:52:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1773DF805A1; Mon, 11 Dec 2023 14:52:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D7A3F8056F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D7A3F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hK9cNAYL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DF786B80E63;
	Mon, 11 Dec 2023 13:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E998BC433C9;
	Mon, 11 Dec 2023 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702302739;
	bh=1u59eh4bKxf33FbVZ1kh21GRHDUPD+2OVnhJ0C5ORZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hK9cNAYLum8eCuuV1OQl6775EqrPKL8qNi+TpOapPMKaOihjDn/qrkW8KmGGKG68F
	 it/YH1SxSc1zAEknqecfcDf/SEN1VSpL30kKQ4+ytVUNjD3ANqf0Y8HRVLPWhV5heS
	 EenQvZhAaVE+j3RoEka1EDsYQ9T6ybUUZkBBqhacBNV9j4j1bTQJVDIrFubFeFFq1q
	 9+ZVW9cts7nuBl8F0MdmM/6JTtk/5DnLL/AF+M0s8iRF6k+jaSLqZOkAu/FFvqajqu
	 d30L2H1gCQRnKXUO2VaWR/gD+849AN8Sei6iCBBLdRHn1h1U1t4bqbXtQej9qGvA6d
	 0BczA14QNzBuw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kamil Duljas <kamil.duljas@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	zhangyiqun@phytium.com.cn,
	suhui@nfschina.com,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 09/47] ASoC: Intel: Skylake: mem leak in skl
 register function
Date: Mon, 11 Dec 2023 08:50:10 -0500
Message-ID: <20231211135147.380223-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135147.380223-1-sashal@kernel.org>
References: <20231211135147.380223-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.5
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q2HABQRGGNE4VCWBJ2TP2D5R25HUBVVS
X-Message-ID-Hash: Q2HABQRGGNE4VCWBJ2TP2D5R25HUBVVS
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2HABQRGGNE4VCWBJ2TP2D5R25HUBVVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kamil Duljas <kamil.duljas@gmail.com>

[ Upstream commit f8ba14b780273fd290ddf7ee0d7d7decb44cc365 ]

skl_platform_register() uses krealloc. When krealloc is fail,
then previous memory is not freed. The leak is also when soc
component registration failed.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20231116224112.2209-2-kamil.duljas@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/skylake/skl-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 29a03ee3d7f73..c602275fcf717 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1473,6 +1473,7 @@ int skl_platform_register(struct device *dev)
 		dais = krealloc(skl->dais, sizeof(skl_fe_dai) +
 				sizeof(skl_platform_dai), GFP_KERNEL);
 		if (!dais) {
+			kfree(skl->dais);
 			ret = -ENOMEM;
 			goto err;
 		}
@@ -1485,8 +1486,10 @@ int skl_platform_register(struct device *dev)
 
 	ret = devm_snd_soc_register_component(dev, &skl_component,
 					 skl->dais, num_dais);
-	if (ret)
+	if (ret) {
+		kfree(skl->dais);
 		dev_err(dev, "soc component registration failed %d\n", ret);
+	}
 err:
 	return ret;
 }
-- 
2.42.0

