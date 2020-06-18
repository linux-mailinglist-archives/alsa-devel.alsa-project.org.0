Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE2A1FDE3C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148F616C9;
	Thu, 18 Jun 2020 03:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148F616C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443914;
	bh=BeQ0B2nTHtzYEGzPxvCGhPDOvHTxZ3OCCHHesvAzRys=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlKTlrhzX9rpj7M+zGvwE4YU3I0YxnIcugX11VDIRDWeHiyWcQUvQ75B2aCRRr/To
	 97NU0UmUpfQnl9+BDw0bRRklI7NxBhwnXgXuVXfhjdJ5XzlXb8EqdwGL7WacVtVwTC
	 1Sm9KBciEAmfcRB649mkRE+6Qxg2gig9MsMu4UmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E15F803EC;
	Thu, 18 Jun 2020 03:16:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F4EF803CE; Thu, 18 Jun 2020 03:16:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F309F802A8
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F309F802A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xpc5glJx"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C644B206F1;
 Thu, 18 Jun 2020 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442959;
 bh=BeQ0B2nTHtzYEGzPxvCGhPDOvHTxZ3OCCHHesvAzRys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xpc5glJxYzVrcWIqxb0WIEJHa3TJMFz41166ZNcGuMSTocqvGcRO0ldDNZ3xWkub7
 5B2/a2jHhqCWfQGcRzxYlxK2q1ZF/absqCDxcsolmsrJtQEEg+X/taFCGz0kU1QuHJ
 B0QA5L9E3irFQMdMf9LLw9Gy0zag2nRzAGbMLqSA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 366/388] ASoC: rt5645: Add platform-data for Asus
 T101HA
Date: Wed, 17 Jun 2020 21:07:43 -0400
Message-Id: <20200618010805.600873-366-sashal@kernel.org>
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

[ Upstream commit 79d4f823a06796656289f97b922493da5690e46c ]

The Asus T101HA uses the default jack-detect mode 3, but instead of
using an analog microphone it is using a DMIC on dmic-data-pin 1,
like the Asus T100HA. Note unlike the T100HA its jack-detect is not
inverted.

Add a DMI quirk with the correct settings for this model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200608204634.93407-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5645.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 6ba1849a77b0..e2e1d5b03b38 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3625,6 +3625,12 @@ static const struct rt5645_platform_data asus_t100ha_platform_data = {
 	.inv_jd1_1 = true,
 };
 
+static const struct rt5645_platform_data asus_t101ha_platform_data = {
+	.dmic1_data_pin = RT5645_DMIC_DATA_IN2N,
+	.dmic2_data_pin = RT5645_DMIC2_DISABLE,
+	.jd_mode = 3,
+};
+
 static const struct rt5645_platform_data lenovo_ideapad_miix_310_pdata = {
 	.jd_mode = 3,
 	.in2_diff = true,
@@ -3708,6 +3714,14 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&asus_t100ha_platform_data,
 	},
+	{
+		.ident = "ASUS T101HA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T101HA"),
+		},
+		.driver_data = (void *)&asus_t101ha_platform_data,
+	},
 	{
 		.ident = "MINIX Z83-4",
 		.matches = {
-- 
2.25.1

