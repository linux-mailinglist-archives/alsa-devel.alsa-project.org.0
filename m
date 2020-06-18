Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D341FDD85
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69D11687;
	Thu, 18 Jun 2020 03:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69D11687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443622;
	bh=braRisYA7BC03UNVu0t84Cw27DSx09Kk4dPa9Xogqag=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3+exRxpwP+fQr2IKjtBtyX/Ll2q4pdw8wqbC4ALLIAUbLrCivYyKEjlzzPUGl87J
	 D44TuqnuPhGKLkEE1tHPdm87fAOp6uEiihkRbekK317d8qH1ziZDvRMemIbeKeGY8O
	 3V2nmAk0DhhEkT+WskpGlORChDMNgXlKAtPe5l+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D254F803A6;
	Thu, 18 Jun 2020 03:13:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E37F1F803AD; Thu, 18 Jun 2020 03:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60849F8025F
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60849F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p55+PBup"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20B7920EDD;
 Thu, 18 Jun 2020 01:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442788;
 bh=braRisYA7BC03UNVu0t84Cw27DSx09Kk4dPa9Xogqag=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p55+PBupvS+nA6pphfFJNpojB7bOrgMSJg3LmCAne8hjOtMgWqbr4axUHnpNVZc49
 +dBsI6G+C9QBLuETw1vWw5XqjUq1NJ2hs1QtGZIPoWNYaOA2K965e1cdW20HYU1g8b
 kypSah9MPbfTGdxQfZ48QVl3phS+xwCz7SSHkPEU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 232/388] ASoC: Intel: bytcr_rt5640: Add quirk for
 Toshiba Encore WT8-A tablet
Date: Wed, 17 Jun 2020 21:05:29 -0400
Message-Id: <20200618010805.600873-232-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 0e0e10fde0e9808d1991268f5dca69fb36c025f7 ]

The Toshiba Encore WT8-A tablet almost fully works with the default
settings for non-CR Bay Trail devices. The only problem is that its
jack-detect switch is not inverted (it is active high instead of
the normal active low).

Add a quirk for this model using the default settings +
BYT_RT5640_JD_NOT_INV.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200518072416.5348-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 08f4ae964b02..fbfd53874b47 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -742,6 +742,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Toshiba Encore WT8-A */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "TOSHIBA WT8-A"),
+		},
+		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_JD_NOT_INV |
+					BYT_RT5640_MCLK_EN),
+	},
 	{	/* Catch-all for generic Insyde tablets, must be last */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
-- 
2.25.1

