Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D06E91E2
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 13:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E781CEF5;
	Thu, 20 Apr 2023 13:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E781CEF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681988890;
	bh=9hBcseIcMFaVaM3/tJw5Vlsa6Zi+x20eVlBgfgJCC8c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uj2NAoHwWcJt4fFlH/vIdIGoUZp+qEUP7OO1N8lvoRjgGgwCQrTioZTl6ORpKVSFy
	 ktWtweh7y80CiJQvc0pqAL2afs2cyDKJC70rFYfYVyo+Wo1uqZABPn+MzWgrkLGU4e
	 +M4cVke5Vpm4z/X+47IxplJh8mzG8lrKnEyUrxR0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 248F1F80557;
	Thu, 20 Apr 2023 13:04:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEDADF805C1; Thu, 20 Apr 2023 13:03:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4832AF80212
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 13:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4832AF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PfCJ1JJg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9F94647C5;
	Thu, 20 Apr 2023 11:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1D6C4339B;
	Thu, 20 Apr 2023 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681988633;
	bh=9hBcseIcMFaVaM3/tJw5Vlsa6Zi+x20eVlBgfgJCC8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfCJ1JJgcJhMBeN/GPsk3RNDlRyL3j/grZDWJXXT2VgKxyOqpK7OtJS7fnEzkqwzC
	 y5gbqgnhUbOzUFR70rmL4gESEhRFCspFvVvzwXjcI6XhoAmZxLvzHUdHUZVgbX44ND
	 tMtmLrbrvkFRBOz8szkW6wWfGaR/+lIgPXnbAPHIekJBiQp7uYbfbBnt+sJ+ed0nEf
	 t1iLtM6HCpz3SStAps64pnqQQoeX5ThY794ycztCA1oW6XYFUvxr5aTMrj81q+JTvm
	 /i3wr/OxF47PsRcK2ReDrbA8XaxJtrMxpSlWTPrttenx73kXDT57wQQA3EZtH0JwCb
	 CSYJOPuvS6DNA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 2/2] ASoC: Intel: bytcr_rt5640: Add quirk for the
 Acer Iconia One 7 B1-750
Date: Thu, 20 Apr 2023 07:03:45 -0400
Message-Id: <20230420110347.506392-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420110347.506392-1-sashal@kernel.org>
References: <20230420110347.506392-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7XAGDNRRY65WCXWTAOOEK6XE45JCLQD5
X-Message-ID-Hash: 7XAGDNRRY65WCXWTAOOEK6XE45JCLQD5
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 tiwai@suse.com, andriy.shevchenko@linux.intel.com,
 ckeepax@opensource.cirrus.com, oder_chiou@realtek.com,
 moisesmcardona@gmail.com, amadeuszx.slawinski@linux.intel.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XAGDNRRY65WCXWTAOOEK6XE45JCLQD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit e38c5e80c3d293a883c6f1d553f2146ec0bda35e ]

The Acer Iconia One 7 B1-750 tablet mostly works fine with the defaults
for an Bay Trail CR tablet. Except for the internal mic, instead of
an analog mic on IN3 a digital mic on DMIC1 is uses.

Add a quirk with these settings for this tablet.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20230322145332.131525-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 2001bc774c643..d27dd170bedaf 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -400,6 +400,18 @@ static int byt_rt5640_aif1_hw_params(struct snd_pcm_substream *substream,
 
 /* Please keep this list alphabetically sorted */
 static const struct dmi_system_id byt_rt5640_quirk_table[] = {
+	{	/* Acer Iconia One 7 B1-750 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "VESPA2"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD1_IN4P |
+					BYT_RT5640_OVCD_TH_1500UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Acer Iconia Tab 8 W1-810 */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Acer"),
-- 
2.39.2

