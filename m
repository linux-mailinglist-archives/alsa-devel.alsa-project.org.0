Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE944C0638
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:34:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D13C1908;
	Wed, 23 Feb 2022 01:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D13C1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576456;
	bh=2l+obSbHMR3UQkqEfyI82RvVKgispW3AeOTrHATKWIE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q3QjxULbSCVfWATcEJOpFaGhoa/w7hG5TyKPLIMCytZmZzRcAUBXs0eBNHGv1tDRb
	 yej0xyUmX833iX6z1y8lm2VqrGGpBAVu0MyC52IsuZVIELkbNhGxxHIIptnG8vnIZK
	 kILOfOV2F/ha4ZRoOaAlyBFN5p/9iq3kScgpn5Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09830F801F5;
	Wed, 23 Feb 2022 01:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C46CF801EC; Wed, 23 Feb 2022 01:33:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AAD9F800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAD9F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ye6PgDC9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDE27B81B87;
 Wed, 23 Feb 2022 00:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54B8C340EB;
 Wed, 23 Feb 2022 00:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645576382;
 bh=2l+obSbHMR3UQkqEfyI82RvVKgispW3AeOTrHATKWIE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ye6PgDC9k8JVEnYsI1VNkjUPikcWUetN7ZrvedR8Uy6vV5uCuCTMM6KgOHisiXhVG
 53+Eh1ru95ZAMxGbqb1UbDp6TNaeqoATN9G7I7FmqopK/6YT7zZVZRnqYLlvMp07d6
 c3SHeyzCOm4Wx/9WMt0JDI/eNdiTjG6RKitIBLF/Gqkfv+stalnw0CW7Timl535ZOu
 6UC31LBEFSEUacqINlhFN3YYiIwAwOlRhHo1gnSn/UxjpX9Z/o0s0l6wwDSBSBUds3
 F7YjEwr/YzxBT5w/vwvFyFtn8oezxpxFIV8JEpYvufb/oulzKPKP8ym0JODS9kURqG
 z3Utk9zmDJmXw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: uda1334: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:32:07 +0000
Message-Id: <20220223003207.1748248-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; h=from:subject;
 bh=2l+obSbHMR3UQkqEfyI82RvVKgispW3AeOTrHATKWIE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFYB1vx0MhUIWkmB/R9AJh1X4JLwng/o7zCnwyAdy
 QQVBb6aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWAdQAKCRAk1otyXVSH0BooB/
 9G/JMMq7lRrXR+f7xBDOaBzx4kREszqI9MbF3ZCsFJnKEflxxw4OUPkhPTVPWG/T8MxHCveKKKomEm
 QNaE9im1vG13uBlr26CtYgTE6tQV/+Mvh3LquO9Rg3V/n85MoL3RIS+IAS8dyYj1jpAa8qnTWlJYbL
 TOBUFoqIM1QQXAK8BPrdS/1ofMScqY93wW5ZO0TS+tA5i3mhQ8Q6dfJMgrwjFQQz0pusdlH1XhANy5
 xkWGRCAiq9BsugJ67NJjwRfPPq5Mnm/HJy0PGL/WSlwJwmOpSxG1hkbrasuUuR4G7m2QErHMG70xm6
 JZzf0jmzOH2vmKXe+W+CVo4TpyNkFn
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
the uda1334 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/uda1334.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index 21ab8c5487ba..8670a2a05a56 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -172,7 +172,7 @@ static int uda1334_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		SND_SOC_DAIFMT_MASTER_MASK);
 
 	if (fmt != (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		    SND_SOC_DAIFMT_CBS_CFS)) {
+		    SND_SOC_DAIFMT_CBC_CFC)) {
 		dev_err(codec_dai->dev, "Invalid DAI format\n");
 		return -EINVAL;
 	}
-- 
2.30.2

