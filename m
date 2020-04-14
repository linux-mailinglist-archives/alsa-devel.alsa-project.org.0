Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED5B1A8079
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC19516A3;
	Tue, 14 Apr 2020 16:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC19516A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876045;
	bh=a3RkKb/u04UWuvGn5eygMW3u/ygADBHMY/NXBwu+5xo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b8s2Sur6Shz5t4kY0AC6tcjhtqwMinruJGkh4nWRW5SMDD1JPeWpma+5cXg79/yTb
	 xQUFJUuQTHw6qf0e6wUkW9klJ43XXDhhdc6uYlc7vP2e02+vjYFrhkya3n0Zi5cujr
	 Hhz9ABbFORk/nSjYohGIelDN8VQrSwv7AG/iNdCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21BD2F80307;
	Tue, 14 Apr 2020 16:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E151F80315; Tue, 14 Apr 2020 16:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4456F80307
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4456F80307
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YaFwE7jT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD9BA20578;
 Tue, 14 Apr 2020 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875610;
 bh=a3RkKb/u04UWuvGn5eygMW3u/ygADBHMY/NXBwu+5xo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YaFwE7jTdjUa4RxoTxT8f0CFc9AkYKsfQf5myjbyeeBlp0atbCQdN9ORK4sJgQo2W
 TXtCbM59KTrZPwmha9g28Ecm8WzbyeAAwDgB6c8iZ7n6dzrO8B2n8HdvqmAGk4PSHv
 0QyY54Cgj02UpfGnM4vsh4zkvVG0Bx9M64TgctfQ=
Date: Tue, 14 Apr 2020 15:46:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "ASoC: intel: soc-acpi-intel-icl-match: remove useless
 'rt1308_2_adr'" to the asoc tree
In-Reply-To: <20200410081117.21319-1-yanaijie@huawei.com>
Message-Id: <applied-20200410081117.21319-1-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, yanaijie@huawei.com, tiwai@suse.com,
 yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, christophe.jaillet@wanadoo.fr,
 ranjani.sridharan@linux.intel.com, rander.wang@intel.com,
 yung-chuan.liao@linux.intel.com
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

The patch

   ASoC: intel: soc-acpi-intel-icl-match: remove useless 'rt1308_2_adr'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From acda42b30fa6b67f07b4560577418df5ada77b52 Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Fri, 10 Apr 2020 16:11:16 +0800
Subject: [PATCH] ASoC: intel: soc-acpi-intel-icl-match: remove useless
 'rt1308_2_adr'
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

sound/soc/intel/common/soc-acpi-intel-icl-match.c:90:45: warning:
‘rt1308_2_adr’ defined but not used [-Wunused-const-variable=]
 static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
                                             ^~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200410081117.21319-1-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-icl-match.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index ef8500349f2f..16ec9f382b0f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -87,14 +87,6 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
-	{
-		.adr = 0x000210025D130800,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
-	}
-};
-
 static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 	{
 		.adr = 0x000110025D130800,
-- 
2.20.1

