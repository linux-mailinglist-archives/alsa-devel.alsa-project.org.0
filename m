Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6F7973F2E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 19:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B382BB65;
	Tue, 10 Sep 2024 19:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B382BB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725988998;
	bh=raDMnFp+N3hv/o1TlM4If1mKOgWKbnER8dzm/gLbS94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/ImJIYzd9g+7Wr7lj9Qf3ub2ZiWBcQcAt+1arQza6wUdesw0ROnJGwYD6QOdivSu
	 wNROL19jShTZVFuyZRqpZSGdynSSvwil8NKOJGinJ/MkfOiYbt6kRxlwpc0icw13r8
	 Hhtdrp8UCVsAOqtxeSs2RLlwPwXii3oVx7waozQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0A73F805D2; Tue, 10 Sep 2024 19:22:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 307CDF805C3;
	Tue, 10 Sep 2024 19:22:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30119F801F5; Tue, 10 Sep 2024 19:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 221DAF80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 19:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 221DAF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GkbsCnCn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E099D5C0508;
	Tue, 10 Sep 2024 17:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504E9C4CECD;
	Tue, 10 Sep 2024 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725988945;
	bh=raDMnFp+N3hv/o1TlM4If1mKOgWKbnER8dzm/gLbS94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkbsCnCnOOgcoVS5n4mh17bqTb81wl12VfwZVaMafckxjn/didbdOeMZ+pQ47nivj
	 J8UKcD+1SEqvwOwOPdyqXFGcmCpFOjLuhtdCK0bRdIaiamtvRqgZOZ5CXGgv57Q7/C
	 HiuMHyQZMIWeGnlqLfYdUP4/fNWUd18vxXm5spbaJmz+D/UpC6cvbjMFvEOqSIlMZE
	 7LcunHFHXyd6tFZ0oZMvZu7nQmSMmGrorLB5jh2IcT6u0ZRYcEglB5Yuh8fQZaP8qE
	 XjHK7FE//aZ1ghukCnCrd365Xi1JuI6MeZYpXCJFLhOrmytpgIrf3xUVB05LTmoO74
	 QXhtOV8391XoQ==
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
Subject: [PATCH AUTOSEL 6.10 04/18] ASoC: intel: fix module autoloading
Date: Tue, 10 Sep 2024 13:21:49 -0400
Message-ID: <20240910172214.2415568-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240910172214.2415568-1-sashal@kernel.org>
References: <20240910172214.2415568-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J65YMSTTA7S4Z2G7SCQ7OZHFAKHZNLJC
X-Message-ID-Hash: J65YMSTTA7S4Z2G7SCQ7OZHFAKHZNLJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J65YMSTTA7S4Z2G7SCQ7OZHFAKHZNLJC/>
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
index 37ea2e1d2e92..aa5de167e790 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -814,6 +814,7 @@ static const struct of_device_id kmb_plat_of_match[] = {
 	{ .compatible = "intel,keembay-tdm", .data = &intel_kmb_tdm_dai},
 	{}
 };
+MODULE_DEVICE_TABLE(of, kmb_plat_of_match);
 
 static int kmb_plat_dai_probe(struct platform_device *pdev)
 {
-- 
2.43.0

