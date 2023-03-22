Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5616C55B1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1027EC9;
	Wed, 22 Mar 2023 20:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1027EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515226;
	bh=MjEEL8boqjlO56Osnd+473gjFPNIpRp9UcMS4Htxkr4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DOJlLyF/i0Cbkc7/y7GuuyJar//WgRlyFc+ZRbqH880idZoVW/sgsabTxAzHT4pNH
	 /YWGJ4QgP8A6SP2f1HZhYdwhchfx3MLCKrMZgURS1zJnl+WU1hkk/KcEUk5JvWotQC
	 yrwb4RHXEU8409gvprE2IRDpa2MNgtr09GsnlzpQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9A93F80571;
	Wed, 22 Mar 2023 20:58:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58278F80564; Wed, 22 Mar 2023 20:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08239F80549;
	Wed, 22 Mar 2023 20:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08239F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YYqIFnc/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 997D0B81DE8;
	Wed, 22 Mar 2023 19:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0F0C433EF;
	Wed, 22 Mar 2023 19:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515090;
	bh=MjEEL8boqjlO56Osnd+473gjFPNIpRp9UcMS4Htxkr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YYqIFnc/bzj8vkKkvZSdiL9vr/9OMxzNTMiX5g28DLP9PnTjDgwMPnovn0FjN7Ewi
	 uEkXF5MRSHPL45p52XeXfJOXXaBVN06PwVtjot+BMzp3G76DyA/T1BYdjwnjlkPhve
	 AwlpqMTMFg653T4UUETxfmeIcgJ/nDZ0NoBy9tokRorga1fH0eH19jcf4NBTmXMkh+
	 ANlzbS0ammPLIKq1J8NHkbPP3T+yiv8jmcgK3hwDMhiGU3HpEThmx9t/qdPl8nFza1
	 75bp7jbj87wM8hiIA/txqTno2tvafxPOvzKzXHYLoiprIBj4zNokWyerZjlfT6Fwnw
	 RfooXjwNbZNmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 16/45] ASoC: SOF: Intel: pci-tng: revert invalid
 bar size setting
Date: Wed, 22 Mar 2023 15:56:10 -0400
Message-Id: <20230322195639.1995821-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KVJBEG4ERKZFFQ33GVPK2EVL6IODO4N6
X-Message-ID-Hash: KVJBEG4ERKZFFQ33GVPK2EVL6IODO4N6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVJBEG4ERKZFFQ33GVPK2EVL6IODO4N6/>
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
index 5b2b409752c58..8c22a00266c06 100644
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

