Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C26490D67
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FE5C18B4;
	Mon, 17 Jan 2022 18:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FE5C18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642438987;
	bh=ZyzMXIedkgTIw/WfYn0qeV0S+0BFxcF3RefNHmpwwok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IXIlxFvFfdVSNC7zkmrc40zq7BPNlsc7q78LEHU3j/FUTjaVRjDmhgHxJGTjyLGr+
	 i12urKt7aNxYmFs4EdhkpxEu470We1EA4skQOrsN2jlaM9W4fxE8ve3XUq5vICAMTS
	 Ww+i3txqzIkR1YDY+O5MY0pk1Bn9jxC8sY3hrFFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A6FF80254;
	Mon, 17 Jan 2022 18:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE3DF80511; Mon, 17 Jan 2022 18:01:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEBC1F8051D
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 18:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEBC1F8051D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fnGtADk7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B148B611C0;
 Mon, 17 Jan 2022 17:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D791C36AEC;
 Mon, 17 Jan 2022 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438881;
 bh=ZyzMXIedkgTIw/WfYn0qeV0S+0BFxcF3RefNHmpwwok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnGtADk7veEbbYkMmqqFprSl+5/DRIn8RshZ/+jpjczek8Cxq3gOei4Xr5B4rXfhD
 LwuQEE91QT/pBPwK6fJ36GNfUgw4RdvjvrQikS9jV+jAL2N8+kTxhTS19zY/7uTA3w
 CWpYFlBg6oaVapRzNvuYSyEFRlY0Q6kmxMmwiS24YF6agC2PK4YuNRZu4igUyVSirg
 whC0TQzouuQ9XdkJrewesnts9ddXuCtxPNcJ0DNRKW8f1a+wfl539Oq1jOJHE49RZC
 OdHb4PKVRKDdM5O75sekpxTSspjZFa98cy3SYqFfGJpMDpvcvHYsBCLj94yB4A7qpn
 ddTHT0ibqz0dA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 50/52] ASoC: amd: acp: acp-mach: Change default
 RT1019 amp dev id
Date: Mon, 17 Jan 2022 11:58:51 -0500
Message-Id: <20220117165853.1470420-50-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 vsujithkumar.reddy@amd.com
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

[ Upstream commit 7112550890d7e415188a3351ec0a140be60f6deb ]

RT1019 components was initially registered with i2c1 and i2c2 but
now changed to i2c0 and i2c1 in most of our AMD platforms. Change
default rt1019 components to 10EC1019:00 and 10EC1019:01 which is
aligned with most of AMD machines.

Any exception to rt1019 device ids in near future board design can
be handled using dmi based quirk for that machine.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Link: https://lore.kernel.org/r/20220106150525.396170-1-AjitKumar.Pandey@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/acp/acp-mach-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 7785f12aa0065..7386e5bb61b5e 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -268,8 +268,8 @@ static const struct snd_soc_ops acp_card_rt5682s_ops = {
 
 /* Declare RT1019 codec components */
 SND_SOC_DAILINK_DEF(rt1019,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:01", "rt1019-aif"),
-			  COMP_CODEC("i2c-10EC1019:02", "rt1019-aif")));
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1019:00", "rt1019-aif"),
+			  COMP_CODEC("i2c-10EC1019:01", "rt1019-aif")));
 
 static const struct snd_soc_dapm_route rt1019_map_lr[] = {
 	{ "Left Spk", NULL, "Left SPO" },
@@ -278,11 +278,11 @@ static const struct snd_soc_dapm_route rt1019_map_lr[] = {
 
 static struct snd_soc_codec_conf rt1019_conf[] = {
 	{
-		 .dlc = COMP_CODEC_CONF("i2c-10EC1019:01"),
+		 .dlc = COMP_CODEC_CONF("i2c-10EC1019:00"),
 		 .name_prefix = "Left",
 	},
 	{
-		 .dlc = COMP_CODEC_CONF("i2c-10EC1019:02"),
+		 .dlc = COMP_CODEC_CONF("i2c-10EC1019:01"),
 		 .name_prefix = "Right",
 	},
 };
-- 
2.34.1

