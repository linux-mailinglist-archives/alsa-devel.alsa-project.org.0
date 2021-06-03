Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECC39A80D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 19:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 284D71743;
	Thu,  3 Jun 2021 19:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 284D71743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622740475;
	bh=Nd/etA/J5uzn2LutOdimL2vHpcXgKu7gvxBA8qbrke0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKMjogox5roCsG0J0yIBDUygHMkH4FD7uVn89ZpT7rErWUcJGeeYL9+BshFm1J2wX
	 MX5HV+aIcSOv3FAsQ7r8Dl+4SNLjuBkDYjEe4uGa0c+/Jc9CFXzAGQAt4HjpE1/rmP
	 6n9SKrN6cYoqwUy27c4ujOL4xpeKIig4lxGyHq/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01506F804C1;
	Thu,  3 Jun 2021 19:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88CA7F80520; Thu,  3 Jun 2021 19:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828E0F8051A
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 19:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828E0F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qZKp7ZP9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 543CB613F8;
 Thu,  3 Jun 2021 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622740166;
 bh=Nd/etA/J5uzn2LutOdimL2vHpcXgKu7gvxBA8qbrke0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qZKp7ZP9bS81G3cEiJxJz3rRnBWV9DI6oJMTib09JyXUiCBVrN+OvTZHhyZGkMTRD
 RiGod0ZGTlvBObaNVDs/OlwrZDMtUElCKtScE5mfoUOOPAFJVS75k/OUIvJV99uB+Z
 ynkc8JIvWbNGbXIiQAT2/syS/xKPms96fcrv1y5b41+RDgH/6krCxeQ9ipCcVqBqQq
 TJTkpelxWTPiChxP1iyczjF+vawtKZLarqiCPbnxR/RDqJeIe+xfbCGYWipbdY1VSq
 2Al19jat3x4/zLlzTaW+owkUFdVAbYpIfseFYU9Q2awhs8jQq2TXVGWgmc7IVg2ryR
 kE/5UhxmMOgTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/31] ASoC: Intel: bytcr_rt5640: Add quirk for
 the Glavey TM800A550L tablet
Date: Thu,  3 Jun 2021 13:08:53 -0400
Message-Id: <20210603170919.3169112-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603170919.3169112-1-sashal@kernel.org>
References: <20210603170919.3169112-1-sashal@kernel.org>
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

[ Upstream commit 28c268d3acdd4cbcd2ac320b85609e77f84e74a7 ]

Add a quirk for the Glavey TM800A550L tablet, this BYTCR tablet has no CHAN
package in its ACPI tables and uses SSP0-AIF1 rather then SSP0-AIF2 which
is the default for BYTCR devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210508150146.28403-1-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 46a81d4f0b2d..1e6c86f2306f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -568,6 +568,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF1 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Glavey TM800A550L */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
+			/* Above strings are too generic, also match on BIOS version */
+			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-- 
2.30.2

