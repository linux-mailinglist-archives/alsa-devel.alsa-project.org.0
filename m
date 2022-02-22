Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91B4C04E6
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84DC418AB;
	Tue, 22 Feb 2022 23:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84DC418AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645570293;
	bh=H4B2NLCJJkO8qA/CBTL7vy5ppmtHQi3zDQJwZDrHaGE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VEoHFawBksZx3dW5MD159Xu4/hxCK8LUi1U7simeUnxPkp4GP4i6h2cCnoA2m/JcF
	 O7/LqNyZstHMg+YZC5vzpkpzSJvUphEEhW5NxrEkwgyPNTFAUXhlAb1/XtjZMwUaRf
	 j/+g5NOF6WmrzmR/mmLf+Z050MheTvaZ/9q36DVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17940F800D1;
	Tue, 22 Feb 2022 23:50:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7EC7F801EC; Tue, 22 Feb 2022 23:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5710DF80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5710DF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IP+hxv2J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C37CB60B65;
 Tue, 22 Feb 2022 22:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE772C340E8;
 Tue, 22 Feb 2022 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645570219;
 bh=H4B2NLCJJkO8qA/CBTL7vy5ppmtHQi3zDQJwZDrHaGE=;
 h=From:To:Cc:Subject:Date:From;
 b=IP+hxv2J1TihP8E9o6FdHVHeP6Y6MQmc5HzKCKQi2DNfkdjntp9SQbmxonXM9MOQU
 x/84BcrGLUwiSnTBOiwPh4t7xDIIPXYe0zg33D5e9uvjW958WbNFbRfIAykzkJaTPe
 13O9qLvL0yB/tfi3+P03/ghrnnciPc0eUWfMp7chKFnyHGZB4407iom0mnBBDlIGUm
 HYU6mip7Q5LnEbnF10dDJugiNLWEjQm3NSbRZdJT+aK+hLTgo4Tnx0JqMd7btb0z9W
 HBQ+8kE+TZBzVF0EiTHyTlUdQgsVwL8GGGgjJvC/gJUAKRbjIaTkeE9ApewvkBOCpa
 Clk7gxf+6HrqA==
From: Mark Brown <broonie@kernel.org>
To: M R Swami Reddy <mr.swami.reddy@ti.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: isabelle: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:50:14 +0000
Message-Id: <20220222225014.3691208-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; h=from:subject;
 bh=H4B2NLCJJkO8qA/CBTL7vy5ppmtHQi3zDQJwZDrHaGE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFWh8g02hqg8Q7tARCuV8jn2tbXIJuwjpkhxsAPVb
 eW0WZ9+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhVofAAKCRAk1otyXVSH0If6CA
 CBI8iYqVFjY4gGN+uYvFPcyAOucuExOmoQxqu/M1dwAVmvasgqif2Ob4nRyzqUyD9aW71w/iLzNqt2
 iiBWlfpzsX8wg8QDrg9hwBY24Nhv1mkq/zRFW77wxmzzUJrikE7YtWj1b+1rq92oa54tDkxOLTaKpX
 vC/6eN3IMasgucpXwcluzoL86ytNpTgwBWlYOOSFVZRw0hsHjRedmKalXWx0p8hHiYpvg1dQv9fjWn
 do9lmEhYYZVYJH6SvYiEkvq1I/X8N6SmwXaFk6oCbtDvPVPnU9vR3MBtLllzAXyB+alQCClpywpmqo
 7ZdY68lSCWM3tglG+dqNqXJ2Yzp9Jd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
the isabelle driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/isabelle.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/isabelle.c b/sound/soc/codecs/isabelle.c
index 79afced75d76..1d86b6a0eb9d 100644
--- a/sound/soc/codecs/isabelle.c
+++ b/sound/soc/codecs/isabelle.c
@@ -973,11 +973,11 @@ static int isabelle_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	struct snd_soc_component *component = codec_dai->component;
 	unsigned int aif_val = 0;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		aif_val &= ~ISABELLE_AIF_MS;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif_val |= ISABELLE_AIF_MS;
 		break;
 	default:
-- 
2.30.2

