Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA90973F46
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 19:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B613C836;
	Tue, 10 Sep 2024 19:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B613C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725989085;
	bh=hkwRpH1tL1PFIOxTO9aR4Vq5sOYyIJDhKWEBLiehR3I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CGpaOWowv3ntav1Fhb5vGP6EigfeEClPCa3ClCl9iJxEOJe3o899uNAbQCNWQq3Id
	 gDO2KtOmV7yJ6U7L7NYrNii69Bntsk9FA/ADccS4N/s+4u5a/VkNUKqbFQ6XgfXiS0
	 LjpjwMD3abryHZpCfx/n9iFzUOeTXLmcbaApMsis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24BFAF80603; Tue, 10 Sep 2024 19:24:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9833F80603;
	Tue, 10 Sep 2024 19:24:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF3D7F805C8; Tue, 10 Sep 2024 19:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11AB2F805C2
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 19:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AB2F805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LJ/9pUz4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DC2CA44B0F;
	Tue, 10 Sep 2024 17:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3252C4CECC;
	Tue, 10 Sep 2024 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725989035;
	bh=hkwRpH1tL1PFIOxTO9aR4Vq5sOYyIJDhKWEBLiehR3I=;
	h=From:To:Cc:Subject:Date:From;
	b=LJ/9pUz4T64FN3bLaNy/2FoMrTvvl/7poK3c5y+x2rFxQLKCsZCN7wLWTJCo/4pse
	 d7SaJgmw9gwcrCsMjWgq+j1m4e+vxkE8FcczxhMLvoX7XaXq+JNSaeC9yIaNixstSV
	 G2n0ivEEhKysM8/Sf8g5U7Kelo/e1h7sNch0bDwCXqSyt9BGwMZVDrvhkzp8GnwbDX
	 SZaAv48P3fjUrqU4s3X70PMvIWt5GkGfu1nR3KZjHdXY24tckM8b7xXsMKb79sHnpq
	 gLP2jdrNiBdRUcf7uJ2J6bCn7zBS8SUWTep/sBguaOuFPdx7VTbX3+F6wBlLPu6zbq
	 oijp26iYeKvVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Liao Chen <liaochen4@huawei.com>,
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
	robh@kernel.org,
	kuninori.morimoto.gx@renesas.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/5] ASoC: intel: fix module autoloading
Date: Tue, 10 Sep 2024 13:23:45 -0400
Message-ID: <20240910172352.2416462-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.166
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GEQAA5ENQMOZPJ3UXRVIY62NR2FC2O35
X-Message-ID-Hash: GEQAA5ENQMOZPJ3UXRVIY62NR2FC2O35
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEQAA5ENQMOZPJ3UXRVIY62NR2FC2O35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Liao Chen <liaochen4@huawei.com>

[ Upstream commit ae61a3391088d29aa8605c9f2db84295ab993a49 ]

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
Link: https://patch.msgid.link/20240826084924.368387-2-liaochen4@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/keembay/kmb_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index a6fb74ba1c42..86a4c32686e7 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -815,6 +815,7 @@ static const struct of_device_id kmb_plat_of_match[] = {
 	{ .compatible = "intel,keembay-tdm", .data = &intel_kmb_tdm_dai},
 	{}
 };
+MODULE_DEVICE_TABLE(of, kmb_plat_of_match);
 
 static int kmb_plat_dai_probe(struct platform_device *pdev)
 {
-- 
2.43.0

