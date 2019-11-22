Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9C106130
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 06:55:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1B9E17F1;
	Fri, 22 Nov 2019 06:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1B9E17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574402125;
	bh=Hnr4ZEh/RT3FWlmpjRKiLvVSvNF5liOSNzv/qoDP/T0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B3sNvyc+HuVpVrx+aYAERzXDIxJ+DKGuAF+OSch5tDR2FaRt+HT60sqzvpoa8/aA4
	 3iSCAKZ39V10pWlE7ZA+t1/d5chk6G5F6qgg0zOBSRtLAMSwq11YWPFMizB/9rHHJI
	 YuSR/U3mOIoueivRRrigo7TpBDRdKBcMk+RXEod8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 616D9F8015B;
	Fri, 22 Nov 2019 06:53:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C0C4F80159; Fri, 22 Nov 2019 06:53:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC58F800F0
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 06:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC58F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tsry0BzO"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03E60207FA;
 Fri, 22 Nov 2019 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401997;
 bh=pz78iwdXUENbZcbYUMALJIFQGQOKoTGxA9AdC7L3WZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tsry0BzOfr/ITWMcYzCLSjqO3Nel0KOHa6QWVsM+1FW6xC8ebcS6y7Ffd8gNcPAw4
 yF/G0oN5FehqIjZ5ofeuSKSj2jcbkJuyBykoBK3stQ7vStYfPj5ksYmtXgFMx611JY
 qQ/XRUZY+az3cRYkVu7Z5ubmbexZq8OB4VCG4wdY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 22 Nov 2019 00:49:06 -0500
Message-Id: <20191122054911.1750-207-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Hui Wang <hui.wang@canonical.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 215/219] ASoC: rt5645: Headphone
	Jack sense inverts on the LattePanda board
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Hui Wang <hui.wang@canonical.com>

[ Upstream commit 406dcbc55a0a20fd155be889a4a0c4b812f7c18e ]

The LattePanda board has a sound card chtrt5645, when there is nothing
plugged in the headphone jack, the system thinks the headphone is
plugged in, while we plug a headphone in the jack, the system thinks
the headphone is unplugged.

If adding quirk=0x21 in the module parameter, the headphone jack can
work well. So let us fix it via platform_data.

https://bugs.launchpad.net/bugs/182459
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5645.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 1dc70f452c1b9..f842db498c741 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3662,6 +3662,11 @@ static const struct rt5645_platform_data jd_mode3_platform_data = {
 	.jd_mode = 3,
 };
 
+static const struct rt5645_platform_data lattepanda_board_platform_data = {
+	.jd_mode = 2,
+	.inv_jd1_1 = true
+};
+
 static const struct dmi_system_id dmi_platform_data[] = {
 	{
 		.ident = "Chrome Buddy",
@@ -3759,6 +3764,15 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&intel_braswell_platform_data,
 	},
+	{
+		.ident = "LattePanda board",
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VERSION, "Default string"),
+		},
+		.driver_data = (void *)&lattepanda_board_platform_data,
+	},
 	{ }
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
