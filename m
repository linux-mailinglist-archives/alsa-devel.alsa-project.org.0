Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE8323C68
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 13:55:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A960A16A2;
	Wed, 24 Feb 2021 13:54:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A960A16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614171329;
	bh=UB5q9IAcDdMSWjh4EFhxCNJCK5xOdAJ9bVGA11etiyI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6Qb69ClxM6MWT+oSFVyzLhzWmtjuL3ox5NPoGWNHtZzVyy5l3oUDZQxdRLxS5+1m
	 369cDfvSeEOJUgIVMcCNd3xULJsZr1zFV29qxsFVreqpWjuJulr07Q9yrZwcq1o1YB
	 OsxgjAmNBXNPJuR503BWP1ApkvvaQcgNA8HS8OAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B68F804B1;
	Wed, 24 Feb 2021 13:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C7A9F804B1; Wed, 24 Feb 2021 13:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_141,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 966D3F804AD
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 13:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 966D3F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eXQTzcAl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA13F64F37;
 Wed, 24 Feb 2021 12:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171112;
 bh=UB5q9IAcDdMSWjh4EFhxCNJCK5xOdAJ9bVGA11etiyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eXQTzcAlCRN/f5ZGUbx+c69DZh4IbAGnxxXUlGAmiUopjdD3ZWErUG3Kj110fuy2c
 FKOJohNsLmF1yWtF5zRjv5/KVwJUNhApyTilXZBft9zzX3j3GgK6Xp1a2HAXPjaBaE
 bwVoqnvqL9eh81Qyka2fn+3GSg1eim2DmxHJldXkQI5ZMXIpXWDzJme75XW2lbtSIG
 BEJxsjYWwvGRlMyU8H4ogJXPlYyGZtf9sgMZOWSbVh1BLJuPzXug+DTYNgQ+oaeytb
 VrAUZp7eTb5t1X3nQv49kMYV0yzuAPhHJaxxO2zfl1eumPDs4kKGfkTEjUAjaT9z5d
 aoBmW616f4yCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 64/67] ASoC: Intel: bytcr_rt5640: Add quirk for
 the Estar Beauty HD MID 7316R tablet
Date: Wed, 24 Feb 2021 07:50:22 -0500
Message-Id: <20210224125026.481804-64-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125026.481804-1-sashal@kernel.org>
References: <20210224125026.481804-1-sashal@kernel.org>
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

[ Upstream commit bdea43fc0436c9e98fdfe151c2ed8a3fc7277404 ]

The Estar Beauty HD MID 7316R tablet almost fully works with out default
settings. The only problem is that it has only 1 speaker so any sounds
only playing on the right channel get lost.

Add a quirk for this model using the default settings + MONO_SPEAKER.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210216213555.36555-2-hdegoede@redhat.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index dce2df30d4c5b..ee41f41c8184e 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -527,6 +527,16 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_MONO_SPEAKER |
 					BYT_RT5640_MCLK_EN),
 	},
+	{	/* Estar Beauty HD MID 7316R */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Estar"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
+		},
+		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
+					BYT_RT5640_MONO_SPEAKER |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN),
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-- 
2.27.0

