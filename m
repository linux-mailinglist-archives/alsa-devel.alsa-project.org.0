Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A31A6AE6E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 20:20:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A8D1168E;
	Tue, 16 Jul 2019 20:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A8D1168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563301202;
	bh=yPmtTL1UhmiC+RJ9Q3Sp4rlV/CheM5JYw2o+OcF5SdU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RMGllvTJUFJPD8ZyObM5FDqfRe8fX0y0yZ5lJQmDD5nSP0EddUx/LqQKYE1VAe6AR
	 euXUEcR5Db3MEoQJOat8rRmoza2qK9DFQ/sv5NDPpQP1E2QRWY/kDJE1Ds1Xh1n5zh
	 XODnZ9WkPFOccMmcDfMpqc2SEzG0fT50p2DcIjpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B805FF80377;
	Tue, 16 Jul 2019 20:18:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81CECF80376; Tue, 16 Jul 2019 20:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 747D1F800C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 20:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 747D1F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="b7nQwLy5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=H1UujFH4GQLL9li8EFTa6SEu1d6exOs+RQ7H7qFaQh8=; b=b7nQwLy5sjd5
 pDN9XUmbj3+POkiO4/mktqZ07aynm0gOnSzy5t4dkPdtjRIMY0tcf0BPwxQmi4J5pMTlrQGriCaHk
 cmgqV89OrSzOjf+NuIFyO/QaUQWdMI2rBOSk66KnnEIZdI6T7ZjTCHQVY+fTtpsrSTGXrmbK5oOdD
 jyWng=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hnS1h-0005yf-NY; Tue, 16 Jul 2019 18:18:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F09B82742B61; Tue, 16 Jul 2019 19:18:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20190712112708.25327-1-hdegoede@redhat.com>
X-Patchwork-Hint: ignore
Message-Id: <20190716181807.F09B82742B61@ypsilon.sirena.org.uk>
Date: Tue, 16 Jul 2019 19:18:07 +0100 (BST)
Cc: alsa-devel@alsa-project.org, russianneuromancer@ya.ru,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: bytcht_es8316: Add quirk for
	Irbis NB41 netbook" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: bytcht_es8316: Add quirk for Irbis NB41 netbook

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From aa2ba991c4206d5b778dcaa7b4997396e79f8e90 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 12 Jul 2019 13:27:08 +0200
Subject: [PATCH] ASoC: Intel: bytcht_es8316: Add quirk for Irbis NB41 netbook

The Irbis NB41 netbook has its internal mic on IN2, inverted jack-detect
and stereo speakers, add a quirk for this.

Cc: russianneuromancer@ya.ru
Reported-and-tested-by: russianneuromancer@ya.ru
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20190712112708.25327-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/bytcht_es8316.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index fac09be3cade..46612331f5ea 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -437,6 +437,14 @@ static const struct acpi_gpio_mapping byt_cht_es8316_gpios[] = {
 
 /* Please keep this list alphabetically sorted */
 static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
+	{	/* Irbis NB41 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "IRBIS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "NB41"),
+		},
+		.driver_data = (void *)(BYT_CHT_ES8316_INTMIC_IN2_MAP
+					| BYT_CHT_ES8316_JD_INVERTED),
+	},
 	{	/* Teclast X98 Plus II */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "TECLAST"),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
