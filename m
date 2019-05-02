Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3AD111B6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7131731;
	Thu,  2 May 2019 04:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7131731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556765016;
	bh=0R2MQfkEfpMg1Y0CtAWDi6IX+lQtr9TgWSUP+g7gYms=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=aReB5LuK1pZiEyQShbvxNxPCLX0/S1KYvyh5w/yqwG6Thoo+ApWAAQ/wRcsOszuBf
	 57VEVE4SK2rExsjBVLUiAVgMbRnwIq6FKexvTOT8YJEdDMMlUZ4HWx2xHbBAA4xJW0
	 KGiDoEmhQlPRnNbzRfqTuM3kSlXph3cDtkTql4k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08ED0F8972B;
	Thu,  2 May 2019 04:40:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04A0DF89724; Thu,  2 May 2019 04:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE490F8971A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE490F8971A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="e1pbVdgE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JN7gqK1hEyBWC3RVTCXJSHGvaVeJEoVFh7hE+J9TQhM=; b=e1pbVdgENglI
 xkK8GK3E+p45P+SMf/6RXdOIUuHhXw96o5lSF112mtJT++jrtNBLAi3W6ckfoT5W/FDD8aG0Kpo3G
 WiAXn9Qg0ZYNe8KCsBRqqFRwtclQijTiqmGSgXruu7o+4okJGnqrX6VIySXZo028dbw0rIfLTUBvK
 GtZvM=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1eD-000605-1p; Thu, 02 May 2019 02:40:33 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 09800441D3D; Thu,  2 May 2019 03:40:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20190429034407.8324-1-hui.wang@canonical.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502024028.09800441D3D@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:40:27 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: rt5645: Headphone Jack sense inverts on
	the LattePanda board" to the asoc tree
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

   ASoC: rt5645: Headphone Jack sense inverts on the LattePanda board

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 406dcbc55a0a20fd155be889a4a0c4b812f7c18e Mon Sep 17 00:00:00 2001
From: Hui Wang <hui.wang@canonical.com>
Date: Mon, 29 Apr 2019 11:44:07 +0800
Subject: [PATCH] ASoC: rt5645: Headphone Jack sense inverts on the LattePanda
 board

The LattePanda board has a sound card chtrt5645, when there is nothing
plugged in the headphone jack, the system thinks the headphone is
plugged in, while we plug a headphone in the jack, the system thinks
the headphone is unplugged.

If adding quirk=0x21 in the module parameter, the headphone jack can
work well. So let us fix it via platform_data.

https://bugs.launchpad.net/bugs/182459
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5645.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index f842775dbf2c..cd45d41df4ec 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3634,6 +3634,11 @@ static const struct rt5645_platform_data jd_mode3_platform_data = {
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
@@ -3731,6 +3736,15 @@ static const struct dmi_system_id dmi_platform_data[] = {
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
