Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C35973F41
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 19:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13BE5A4A;
	Tue, 10 Sep 2024 19:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13BE5A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725989064;
	bh=6Iv7JVQx9bVwxMpEDS5nzTO1tdlTzFidyglg+NVlm8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0bnjJPql1LnZCmBuSd6i+npbTSr5UVxhFO+0FJ10PCdodevq2sUrdUeLbiuiRx+6
	 Bq4/+l6SLIWPRI9tLRvVpheQ+aVNyXKTl1/ATO55IXDo8/FtFX4lfkG5n+K9HsoLXw
	 dXG+Q+txI7dFD4UTqV+Iqj75BczJ/tB2Ncpt5Cls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AFDFF805F2; Tue, 10 Sep 2024 19:23:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 383D8F805F4;
	Tue, 10 Sep 2024 19:23:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD8F7F801F5; Tue, 10 Sep 2024 19:23:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0770CF80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 19:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0770CF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AZNH7bQq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 632B95C01C5;
	Tue, 10 Sep 2024 17:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FF1C4CEC4;
	Tue, 10 Sep 2024 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725989020;
	bh=6Iv7JVQx9bVwxMpEDS5nzTO1tdlTzFidyglg+NVlm8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZNH7bQqj5gNK9K4ZCXlh954Uo/EC4kkphna+yA2i/K6EWfaKEPnolAjXDurKcBoe
	 8LrHL4CDcXvqqrL42N6MWOk0VPeo42sFON0DjGu1keHZWgpyGqZY3mjkCA+reJ8Yxr
	 pUv1broLNCEI2rByIgjm0uqErwrlZevbw3NFlhHLhOt1r2sMhl7NVfSvvu6dWZ2D9d
	 PKdHhvDuUDKwQmbeFnu01C7M7Rt0iR7CkCItkfX6n4TDFhoULHYV+jxZJxbIVPuzlH
	 wRn+LX2dH72ktiDC44zqMONnwyacd7OBxQ3aorT2N0cSb0u8cNaRfZ6REA241eKwIq
	 Jrf6vqQicNyhQ==
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
Subject: [PATCH AUTOSEL 6.1 3/8] ASoC: intel: fix module autoloading
Date: Tue, 10 Sep 2024 13:23:23 -0400
Message-ID: <20240910172332.2416254-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910172332.2416254-1-sashal@kernel.org>
References: <20240910172332.2416254-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.109
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S7IQCQAVYFUECCJLVLI5TKLV2WT2ISPC
X-Message-ID-Hash: S7IQCQAVYFUECCJLVLI5TKLV2WT2ISPC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7IQCQAVYFUECCJLVLI5TKLV2WT2ISPC/>
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
index b4893365d01d..d5c48bed7a25 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -817,6 +817,7 @@ static const struct of_device_id kmb_plat_of_match[] = {
 	{ .compatible = "intel,keembay-tdm", .data = &intel_kmb_tdm_dai},
 	{}
 };
+MODULE_DEVICE_TABLE(of, kmb_plat_of_match);
 
 static int kmb_plat_dai_probe(struct platform_device *pdev)
 {
-- 
2.43.0

