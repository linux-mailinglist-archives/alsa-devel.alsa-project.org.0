Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736CC574376
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14282190C;
	Thu, 14 Jul 2022 06:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14282190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773294;
	bh=ejnKotZB6Y2TMNzJtjiQwLLGKsKmTL1udkyokr7DcUk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bxn6/yPGQ2df7zvCA5PR1KYSnJWQHECDpmwxE3FyYOdNC1n3wbYXhW2rRg0Ya0YIm
	 is7STFKGpOEgSiTn5BbgydqmUmtoNYBQKEvmsjiRUOOWFf3oPZwt4RktvVWSXGYWdW
	 +liUJ8VPuPz6gywO9nyjB9gPodqbHieOMNG8MUQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E913F80642;
	Thu, 14 Jul 2022 06:25:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46A4BF80642; Thu, 14 Jul 2022 06:25:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1972DF8062D
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1972DF8062D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n2DDHHF6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 741C0B82384;
 Thu, 14 Jul 2022 04:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DA5C385A2;
 Thu, 14 Jul 2022 04:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772707;
 bh=ejnKotZB6Y2TMNzJtjiQwLLGKsKmTL1udkyokr7DcUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n2DDHHF6DCZIgkV3fmFo28HzgmokMQZRYSFC1pPbfBPSMxkQKe0a8bC5msrHK28ao
 ZL6RMS94pKx+R7MlgB5e6Xc8wjBDHi+0o1nSW1P5Ds65URxcStulqrbqesF+UL6Twr
 jKqUg7pFXRJRrBSghYzQQsgk8PI8MtxVidMkFW4tNMoLdn3eqpxYWuy/jSixEQCsqZ
 lBbBNohbRKtZoY3C2EIG+O7QO2xblYC45RaMxBbLDadXzdry3PoK/+F6FwIpacrMhe
 Kj5rbMP3UsCBTDsP8lBAE2HeWZhhuc7zN+34xjioq2LmAKagkvXryoum4FddNSTL+6
 10qwUKZY8lKcw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 15/28] ASoC: dapm: Initialise kcontrol data for
 mux/demux controls
Date: Thu, 14 Jul 2022 00:24:16 -0400
Message-Id: <20220714042429.281816-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 11d7a12f7f50baa5af9090b131c9b03af59503e7 ]

DAPM keeps a copy of the current value of mux/demux controls,
however this value is only initialised in the case of autodisable
controls. This leads to false notification events when first
modifying a DAPM kcontrol that has a non-zero default.

Autodisable controls are left as they are, since they already
initialise the value, and there would be more work required to
support autodisable muxes where the first option isn't disabled
and/or that isn't the default.

Technically this issue could affect mixer/switch elements as well,
although not on any of the devices I am currently running. There
is also a little more work to do to address the issue there due to
that side supporting stereo controls, so that has not been tackled
in this patch.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220623105120.1981154-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/soc-dapm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 47b85ba5b7d6..b957049bae33 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -62,6 +62,8 @@ struct snd_soc_dapm_widget *
 snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 			 const struct snd_soc_dapm_widget *widget);
 
+static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg);
+
 /* dapm power sequences - make this per codec in the future */
 static int dapm_up_seq[] = {
 	[snd_soc_dapm_pre] = 1,
@@ -442,6 +444,9 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 
 			snd_soc_dapm_add_path(widget->dapm, data->widget,
 					      widget, NULL, NULL);
+		} else if (e->reg != SND_SOC_NOPM) {
+			data->value = soc_dapm_read(widget->dapm, e->reg) &
+				      (e->mask << e->shift_l);
 		}
 		break;
 	default:
-- 
2.35.1

