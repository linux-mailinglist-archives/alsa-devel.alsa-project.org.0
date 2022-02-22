Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF164C056A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:41:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174B418BF;
	Wed, 23 Feb 2022 00:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174B418BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573306;
	bh=r/brEUzJy5I6Xo3alAGUGuz0VXqCv0hf22/7mJ0r5jc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ld3G4Z0LvTom6Pb7N0AzTdcDtrX10cdY9hfNHum014TYfQbOaPmZJyCzxffx5fw3O
	 /sflRa04PT/bP9/nntd5aCzp/px0A3F/bk+ZMZYXtjO4PGIi98kzJmeoWErE6qCiNh
	 rbMFtG9rbAOmzxrggGRsKIdZuSngsYBBhWREeho0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AADEF80238;
	Wed, 23 Feb 2022 00:40:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 082E6F801EC; Wed, 23 Feb 2022 00:40:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F636F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F636F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BXk7NO1Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB39B60DE0;
 Tue, 22 Feb 2022 23:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CDCC340E8;
 Tue, 22 Feb 2022 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573232;
 bh=r/brEUzJy5I6Xo3alAGUGuz0VXqCv0hf22/7mJ0r5jc=;
 h=From:To:Cc:Subject:Date:From;
 b=BXk7NO1ZlcfmYkpINJwwnfeMStahNQTkXY1ale9G0MENmjOhUmfoNuS0eB9DRHnCf
 PIysjT42ETzWt9WmFRrDfjpZCbpTX79pL6m2cJdyP7W7NerqCZrD3pAzp/rRg0i0fw
 cjEQPBR6V4tKndT6q/GcNESDGtqlmLolb+pcPNmyDjMym8vEaBrI3D4O/vZt4xotCR
 aOzh+WWnaeMYmC0qHVIqMvGEK0gz+iUr2nEd5Ssx6JxijN+cb2q01hc6KGHcKMIv2J
 34g+c33ySCqVXl+0BOWTW2Xf3Tot5/o4yBDg1BA4Ixv3idftfhVI0ORkQNNWdg/jeG
 CkcejL9DTwoqw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 01/10] ASoC: max98088: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:17 +0000
Message-Id: <20220222234026.712070-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076; h=from:subject;
 bh=r/brEUzJy5I6Xo3alAGUGuz0VXqCv0hf22/7mJ0r5jc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQlmafLDQzjIwz+aKZg5KsfU1ooSEW7z8M2OEja
 7AAPkyiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0JQAKCRAk1otyXVSH0DbnCA
 CFiOqyQxbbF00NK9B79uRjVbuqHkYLnn04un4M1VaZAQtwNWMAjFtoXUUFTfCyZEBQ3vbLQvyA/7L5
 lpRv/qkswUauIy3WTAhNo91i7Buo9DdBPOdamfzYPE+4MADp0D9ISF64I9GJ4GFvOer4cH6Mui6dxA
 tZLNDjWR6ioKThjBTur9P4aNhvx5LObkGGUGmG0ihsG9uD3qicQFSsggOV03rHeeI2Kdv4UrpZBsZY
 jvW14wI5etWy9SxFhID4wxXfDpnibAflX0XUuxIMlkJWEVriIwPeMFhIMWHoQnuSbQj0lbYqMgyVFY
 7R91LRFK1MF9F0AgBZaMk7oM/E5nEU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Peter Rosin <peda@axentia.se>
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

As part of moving to remove the old style defines for the bus clocks update
the max98088 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98088.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index f8e49e45ce33..429717d4ac5a 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1156,20 +1156,18 @@ static int max98088_dai1_set_fmt(struct snd_soc_dai *codec_dai,
        if (fmt != cdata->fmt) {
                cdata->fmt = fmt;
 
-               switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-               case SND_SOC_DAIFMT_CBS_CFS:
-                       /* Slave mode PLL */
+               switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+               case SND_SOC_DAIFMT_CBC_CFC:
+                       /* Consumer mode PLL */
                        snd_soc_component_write(component, M98088_REG_12_DAI1_CLKCFG_HI,
                                0x80);
                        snd_soc_component_write(component, M98088_REG_13_DAI1_CLKCFG_LO,
                                0x00);
                        break;
-               case SND_SOC_DAIFMT_CBM_CFM:
-                       /* Set to master mode */
+               case SND_SOC_DAIFMT_CBP_CFP:
+                       /* Set to provider mode */
                        reg14val |= M98088_DAI_MAS;
                        break;
-               case SND_SOC_DAIFMT_CBS_CFM:
-               case SND_SOC_DAIFMT_CBM_CFS:
                default:
                        dev_err(component->dev, "Clock mode unsupported");
                        return -EINVAL;
@@ -1227,20 +1225,18 @@ static int max98088_dai2_set_fmt(struct snd_soc_dai *codec_dai,
        if (fmt != cdata->fmt) {
                cdata->fmt = fmt;
 
-               switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-               case SND_SOC_DAIFMT_CBS_CFS:
-                       /* Slave mode PLL */
+               switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+               case SND_SOC_DAIFMT_CBC_CFC:
+                       /* Consumer mode PLL */
                        snd_soc_component_write(component, M98088_REG_1A_DAI2_CLKCFG_HI,
                                0x80);
                        snd_soc_component_write(component, M98088_REG_1B_DAI2_CLKCFG_LO,
                                0x00);
                        break;
-               case SND_SOC_DAIFMT_CBM_CFM:
-                       /* Set to master mode */
+               case SND_SOC_DAIFMT_CBP_CFP:
+                       /* Set to provider mode */
                        reg1Cval |= M98088_DAI_MAS;
                        break;
-               case SND_SOC_DAIFMT_CBS_CFM:
-               case SND_SOC_DAIFMT_CBM_CFS:
                default:
                        dev_err(component->dev, "Clock mode unsupported");
                        return -EINVAL;
-- 
2.30.2

