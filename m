Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A5034B1E9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1269168C;
	Fri, 26 Mar 2021 23:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1269168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796438;
	bh=dAVFJogPIJXKgJL9SlsRkCGWJnG7A3rYA9ySB8nBLXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XG+WHOZELwPRqRwRQBiACanJUKyHp22hVaBEczmt2WFMDDZkyQHwHGePrHgbau3I9
	 DsnZygqxr/5sQImnGiEyESYD345isNFlBclKA9IOb0XisQk94QLNSNf4ydR+Rn0YoM
	 ur1sejU4rbzzSEQCMkHuIxVuVqpSAwBKLVZ4Dngw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58163F80517;
	Fri, 26 Mar 2021 23:00:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4132F804C1; Fri, 26 Mar 2021 23:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91AB2F80424
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AB2F80424
IronPort-SDR: 39nVy8efzfBUblzaO9iu2V1ZsRLQUKxePUSZRDjwhk7AM4dst9FdarvHrYrpAQ17NKmJDG+J2S
 WccfpfUOo1Gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396774"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396774"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:20 -0700
IronPort-SDR: nPJ8jPadMkVbnv7xLbDyKf9HG38G13QAZWtGuntDeJsDiX+xso8g0kvCTDrgIjKW4N4XYVcpI6
 /MGS1CplOobA==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706959"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/17] ASoC: ux500: mop500: rename shadowing variable
Date: Fri, 26 Mar 2021 16:59:26 -0500
Message-Id: <20210326215927.936377-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
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

cppcheck warning:

sound/soc/ux500/mop500.c:143:23: style: Local variable 'mop500_card'
shadows outer variable [shadowVariable]

 struct snd_soc_card *mop500_card = platform_get_drvdata(pdev);
                      ^
sound/soc/ux500/mop500.c:54:28: note: Shadowed declaration
static struct snd_soc_card mop500_card = {
                           ^
sound/soc/ux500/mop500.c:143:23: note: Shadow variable
 struct snd_soc_card *mop500_card = platform_get_drvdata(pdev);
                      ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/ux500/mop500.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index cdae1190b930..4f41bb0ab2b0 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -140,12 +140,12 @@ static int mop500_probe(struct platform_device *pdev)
 
 static int mop500_remove(struct platform_device *pdev)
 {
-	struct snd_soc_card *mop500_card = platform_get_drvdata(pdev);
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	pr_debug("%s: Enter.\n", __func__);
 
-	snd_soc_unregister_card(mop500_card);
-	mop500_ab8500_remove(mop500_card);
+	snd_soc_unregister_card(card);
+	mop500_ab8500_remove(card);
 	mop500_of_node_put();
 
 	return 0;
-- 
2.25.1

