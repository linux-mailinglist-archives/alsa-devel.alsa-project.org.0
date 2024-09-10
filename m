Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2B973F48
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 19:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEF2882A;
	Tue, 10 Sep 2024 19:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEF2882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725989101;
	bh=UwzWWmAIpz/ajbTwiMwI7DKpHn4myn5KjbthwRGxsb8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GXoZTCkBLjmYJbQHmOnQjoWe90sK5xUWzONcX38qowOXYsrMP/HKVwUQQstSVCrIe
	 Uv0t9Aw3XBBm1xrv94t1PBHGBDl/OvakPb0UCwUFGIWzdVU5VSFIZoeC6mRLfyEyZA
	 qExcOCty7pE1N/SBYbOyNshyQOKOxFgMwVi7G9XI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52737F80607; Tue, 10 Sep 2024 19:24:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1C98F805D5;
	Tue, 10 Sep 2024 19:24:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70AFBF80272; Tue, 10 Sep 2024 19:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0389F8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 19:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0389F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SmYVYFh/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A46825C0347;
	Tue, 10 Sep 2024 17:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB353C4CEC3;
	Tue, 10 Sep 2024 17:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725989049;
	bh=UwzWWmAIpz/ajbTwiMwI7DKpHn4myn5KjbthwRGxsb8=;
	h=From:To:Cc:Subject:Date:From;
	b=SmYVYFh/j8PPXLLuo2jAZS39SRRnEi6h2JOj375FwhXQOB7kzftD7IXTtRMw7Bz0v
	 HIS9Sl/KQHcNghrS25PFfPzt4CY+OTDQnMb32vHqw+C1iKjoXA360McVNPWpEWSVpD
	 5jNRP0Vov4MKetkWgxhNyac6UhJbR+/zZJ5RlqhnUMw0QOfVqG6RxSSlpAr5vFORqq
	 GMt42VqDksb5QfWOV7MiKlwoUK7f1IBLlyGDXtIzHhKhQEvrsbGMw9uo+jjJpuRJSy
	 T7zysWyX834H/jMEBPk+dMNZCth+RAuDUPLAHfFt2vMa273Ymx2cQWDeulilxKwkgN
	 wKpISQmyk/f+w==
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
	kuninori.morimoto.gx@renesas.com,
	robh@kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/4] ASoC: intel: fix module autoloading
Date: Tue, 10 Sep 2024 13:24:00 -0400
Message-ID: <20240910172406.2416588-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.225
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DYEPWTIMQ5WEQNDPDHG3BDS3JK7LPCS2
X-Message-ID-Hash: DYEPWTIMQ5WEQNDPDHG3BDS3JK7LPCS2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYEPWTIMQ5WEQNDPDHG3BDS3JK7LPCS2/>
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
index 291a686568c2..c7b754034d24 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -634,6 +634,7 @@ static const struct of_device_id kmb_plat_of_match[] = {
 	{ .compatible = "intel,keembay-tdm", .data = &intel_kmb_tdm_dai},
 	{}
 };
+MODULE_DEVICE_TABLE(of, kmb_plat_of_match);
 
 static int kmb_plat_dai_probe(struct platform_device *pdev)
 {
-- 
2.43.0

