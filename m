Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2F4C05E7
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:26:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CB7618A9;
	Wed, 23 Feb 2022 01:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CB7618A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645575978;
	bh=1/jOGoy+diyvvwZWr/nDEGCTtVEiUN94u6uqV+I2ooU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rXMoVjTndBRpQanJlVG4TggOKICIMP6AcsLUlrm6ZxgkjI5C8RmN7409V2pCyBgox
	 VABYwcfogbYQMuYT1ZKBdXlyOEJ8A8wmU0dYYNDj8D6GB8P59RDMzbwHeHt3yHP9qj
	 crh+K6qc2cOqjxplXWNOm7HQf2fhcPfF5BTYoRCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B05F801F5;
	Wed, 23 Feb 2022 01:25:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECC94F801EC; Wed, 23 Feb 2022 01:25:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF207F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF207F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="exfDLMZS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 782CEB81B87;
 Wed, 23 Feb 2022 00:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61380C340E8;
 Wed, 23 Feb 2022 00:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645575906;
 bh=1/jOGoy+diyvvwZWr/nDEGCTtVEiUN94u6uqV+I2ooU=;
 h=From:To:Cc:Subject:Date:From;
 b=exfDLMZS7LTdS3SE8l9Pf+mvW7PF52RPDRpIlDaiuInTrVjdw58HUqcmHUQRY25bI
 3+DhUzvrauyvOCydxrRbchBAN9zXtlH9EKxbz/JazL2YpIcYUHc5QrYSBglGdP4wad
 MkNdX4sbOahLmFrRkNhWEMrApHNIgy/SMrKnVBZ9Kd8LzP3BK0WAMkhAzksPq3KO/d
 VTmQJe0NPdEJUpqS+wFoRrA4+eMyPsfpXhKvl7ExR/wAvdhvy+hJOYyvjPYV2rAUU3
 TPQYTq812X8G+7IA/VIQ/pQXT0Lf2ODebZdFBrqjK30AgSEM7TY9KMxpWyyNnSIGEz
 XJVJs22qNsxgw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: sti-sas: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:25:02 +0000
Message-Id: <20220223002502.1451015-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; h=from:subject;
 bh=1/jOGoy+diyvvwZWr/nDEGCTtVEiUN94u6uqV+I2ooU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFX7MbaIGw9ifjb2F4KklBp1mwKpbj8lWlCjX++4C
 fIKAV5OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV+zAAKCRAk1otyXVSH0FFnB/
 45+F2giMJS2dmFb0Kuefu/BiI90+T/wrUM7DNpSlJxbGT6fJmGSTvop81wSI2iQgFKiy7gLgTMjIQd
 Gh/kCxdsixV8IJFBn2rH1HVxLn9cd2sjrqb7oBQB3/zpEHdLklUOp88gFpssc1j0aH9lWWPBWz80lB
 xtB+Ze9riJBTOEtRT8BXCFqQ8qbtNxh0BZuxF3Uq0YjLocOL4ztxUxcDrt2LHG8O6kpNGuyTgC8zfk
 3iVbrY5Jy4rKCfCuqcqRG+tJYwFYSJFQ3m7TyxxX+N2J746rYSBwZTbrEoRBwWzl89rKgtUds+z+Rm
 4m5a3J5IK3rCBAMBJW0En4jXpfPtiY
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
the sti-sas driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/sti-sas.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sti-sas.c b/sound/soc/codecs/sti-sas.c
index 82a24e330065..3be4940e3c77 100644
--- a/sound/soc/codecs/sti-sas.c
+++ b/sound/soc/codecs/sti-sas.c
@@ -154,10 +154,10 @@ static int  sti_sas_init_sas_registers(struct snd_soc_component *component,
 static int sti_sas_dac_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	/* Sanity check only */
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS) {
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC) {
 		dev_err(dai->component->dev,
-			"%s: ERROR: Unsupporter master mask 0x%x\n",
-			__func__, fmt & SND_SOC_DAIFMT_MASTER_MASK);
+			"%s: ERROR: Unsupported clocking 0x%x\n",
+			__func__, fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 		return -EINVAL;
 	}
 
-- 
2.30.2

