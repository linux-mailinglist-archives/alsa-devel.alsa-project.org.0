Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215F93740E2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:39:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C165F16ED;
	Wed,  5 May 2021 18:38:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C165F16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232777;
	bh=CQDcJU3ZqcSKTRrBQ9LlwDUXFLIzAQWsCIa+ulVeLIU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JaRZQhTH2oJ/R5vHjExdz+dofKjzFksc7o/TNEntv16cjLLfW5Ke713wijCDLSOI3
	 3R8Vzs2jqCtnaR45SIaCFZ2UmmyjKlB/E6cL+4OS6O9Rbru8bzhn0EqxWkV1o2oAo1
	 g/3Hdb2cTUGMGPDuPmmLUsWbzo62iCIO5V8ewwbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03AF3F804AB;
	Wed,  5 May 2021 18:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C1F6F804AE; Wed,  5 May 2021 18:34:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5B05F804AA
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B05F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mon3IeoD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02B7961621;
 Wed,  5 May 2021 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232470;
 bh=CQDcJU3ZqcSKTRrBQ9LlwDUXFLIzAQWsCIa+ulVeLIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mon3IeoDV7AHKSNH7jTEcSZ9jy8oXOWx9Cu4oAxT5sEAVNTCY8GwvxSDi5utnykrz
 e66Cu5ruizBqUYhQOVJXgJc+5BzSvKx58o6UwZSqi+muIEpwpPHC5vqJP3KlETw9Ys
 DLUmaPOyemQlZUXA6CDS0Opy6ncQIZ+3/ojnf3Vy8cuC4SHfvtVB1iVXs2GgG9eYSa
 EHgaqxI8iaEaz195lfXuWJVrgSdzCbIRBOcopIwc14gaXc2i+tKCIhabqquhfW3iGB
 nMtCuO0KdxCXD+sgObXKvGkSp+68fPQc2Bmk8Ikn0uqqHpaqlkU2XjMn5r681ZBbZt
 clz/z77wXstSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 012/104] ASoC: Intel: bytcr_rt5640: Enable
 jack-detect support on Asus T100TAF
Date: Wed,  5 May 2021 12:32:41 -0400
Message-Id: <20210505163413.3461611-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
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

[ Upstream commit b7c7203a1f751348f35fc4bcb157572d303f7573 ]

The Asus T100TAF uses the same jack-detect settings as the T100TA,
this has been confirmed on actual hardware.

Add these settings to the T100TAF quirks to enable jack-detect support
on the T100TAF.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210312114850.13832-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 21d2e1cba380..07730ed7ab3c 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -478,6 +478,9 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TAF"),
 		},
 		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_JD2_IN4N |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
 					BYT_RT5640_MONO_SPEAKER |
 					BYT_RT5640_DIFF_MIC |
 					BYT_RT5640_SSP0_AIF2 |
-- 
2.30.2

