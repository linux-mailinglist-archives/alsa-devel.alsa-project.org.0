Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8E6C5650
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:04:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98423EEC;
	Wed, 22 Mar 2023 21:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98423EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515477;
	bh=dLsDh4xH4aiYf9EooKnyH/jGCc4mPbktyPp1EHowaeE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=opaPPO5D8v/QD+mlMO71i8vc/FNhmoMThuzsiZfQcfBix36W1Lv0X632J1VvvzNOP
	 VQ3cZEXWAbj6WkG0/OEXe4FuWN9HUa+ZEiYbMUTuH7zvvsrk/yhedxrBaEvi5LwYqU
	 hMbZWb1l5ENAemttE6z767/FbBvaNlBzFl1G5gXk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC814F805AA;
	Wed, 22 Mar 2023 21:00:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A050BF805CB; Wed, 22 Mar 2023 21:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FACDF8059F;
	Wed, 22 Mar 2023 21:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FACDF8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gQP5dhJf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8841B81DED;
	Wed, 22 Mar 2023 20:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E73C4339C;
	Wed, 22 Mar 2023 20:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515232;
	bh=dLsDh4xH4aiYf9EooKnyH/jGCc4mPbktyPp1EHowaeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQP5dhJfrtHNa+3bJQobL86WXXUvjFBi+om2RlTKm161do74E1D5l1KhtKdybayN/
	 aKcDrz4su5kSsUgw9/trNf4Z5X4b4j/SqFuU05CF4oTwL5mSa1xc5NKHrZFsfz2gTV
	 JH7fUHNfUCFLIhpU2daoEY50lb/kYOXkvHoAjF9WGO4qSjt7kAh/F1Hw0/u76D0v6M
	 ZRyjIa6PKHCu+iQGbBZEZi8zi7V4J5okwH4y70/hK7IRcxZb10vVNTDwtvsHvMSW+Q
	 HVugZ5w7vBALY4JV+s9Iu5NkKir9nKHq7cHK7TZx02eGGGMAXR64UZCdRyP3kAlEDI
	 tuBYFJXPusL9A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/34] ASoC: SOF: Intel: pci-tng: revert invalid
 bar size setting
Date: Wed, 22 Mar 2023 15:59:04 -0400
Message-Id: <20230322195926.1996699-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AU2SWOGMEMK7VHH4NLT5SZHL3KN67DFH
X-Message-ID-Hash: AU2SWOGMEMK7VHH4NLT5SZHL3KN67DFH
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ferry Toth <fntoth@gmail.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com,
 tiwai@suse.com, rander.wang@intel.com, zheyuma97@gmail.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AU2SWOGMEMK7VHH4NLT5SZHL3KN67DFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit ca09e2a351fbc7836ba9418304ff0c3e72addfe0 ]

The logic for the ioremap is to find the resource index 3 (IRAM) and
infer the BAR address by subtracting the IRAM offset. The BAR size
defined in hardware specifications is 2MB.

The commit 5947b2726beb6 ("ASoC: SOF: Intel: Check the bar size before
remapping") tried to find the BAR size by querying the resource length
instead of a pre-canned value, but by requesting the size for index 3
it only gets the size of the IRAM. That's obviously wrong and prevents
the probe from proceeding.

This commit attempted to fix an issue in a fuzzing/simulated
environment but created another on actual devices, so the best course
of action is to revert that change.

Reported-by: Ferry Toth <fntoth@gmail.com>
Tested-by: Ferry Toth <fntoth@gmail.com> (Intel Edison-Arduino)
Link: https://github.com/thesofproject/linux/issues/3901
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230307095341.3222-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/pci-tng.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index f0f6d9ba88037..0b17d1bb225e2 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -75,11 +75,7 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
 
 	/* LPE base */
 	base = pci_resource_start(pci, desc->resindex_lpe_base) - IRAM_OFFSET;
-	size = pci_resource_len(pci, desc->resindex_lpe_base);
-	if (size < PCI_BAR_SIZE) {
-		dev_err(sdev->dev, "error: I/O region is too small.\n");
-		return -ENODEV;
-	}
+	size = PCI_BAR_SIZE;
 
 	dev_dbg(sdev->dev, "LPE PHY base at 0x%x size 0x%x", base, size);
 	sdev->bar[DSP_BAR] = devm_ioremap(sdev->dev, base, size);
-- 
2.39.2

