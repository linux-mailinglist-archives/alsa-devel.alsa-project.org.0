Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E744C0578
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 00:44:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0379518EB;
	Wed, 23 Feb 2022 00:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0379518EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645573468;
	bh=iCszTHGxpI51noI6M65U/9xAqXAzUJaAtrgHe0XlHyc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aL++nAxqGprHDWJ1i1+avnScfToWCwnAWv6BQ6BgohQDvbhUcLIQ2phNnx4pbZS+R
	 1S6RszwLMHD7GeI1/P8UR/7xJtfBLWWrOzvRgF8ZXD/IPodLspmWtw2cBSAPAPl2FZ
	 aGY2DJcXVA25pbjbik8Gm/o0z5azk1qnVtntTesA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83608F8053E;
	Wed, 23 Feb 2022 00:40:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52041F80539; Wed, 23 Feb 2022 00:40:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 073B1F8052D
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 00:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073B1F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gw5QxmSX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1BE461137;
 Tue, 22 Feb 2022 23:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299D3C340F0;
 Tue, 22 Feb 2022 23:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645573244;
 bh=iCszTHGxpI51noI6M65U/9xAqXAzUJaAtrgHe0XlHyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gw5QxmSX9gpwi5nRpV+7esKAgO5bwkFJ70RwbUyk/PIza8ksuzbtfysrbQkq5+yvm
 bbRRX4kzgdhp2FFFHzx8Sku7RB7RYB8xOBvQqhSfeQBc44/AEz5zzMq/Pt2ER2FwG8
 TY53O9wYJfwSqCVt1X6ucWCduQeyPZ9ysV7k2EIx/743LrZFq2hHRqxacOkjQRGYAm
 2Xmiqwgd15WVll4YE+q0J6JbjMjnaYHUXu88rmLatmZJtb5RH9QdozBEsHiVN52e2H
 eQISZHR8X13158yBbjDuQoAj5ZRIoNtr/RHdnxJwXoLYVMzhb/FJlKdtPxtf/Ehq8G
 wOA/nfaMvTS6Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 09/10] ASoC: max98926: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 23:40:25 +0000
Message-Id: <20220222234026.712070-9-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222234026.712070-1-broonie@kernel.org>
References: <20220222234026.712070-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; h=from:subject;
 bh=iCszTHGxpI51noI6M65U/9xAqXAzUJaAtrgHe0XlHyc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFXQruZ/7v4W29QhAIf9Y/Vdp2my3jdUV6Xhh2yE4
 kL9nO4KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV0KwAKCRAk1otyXVSH0AIxB/
 47kJ86G7wuaAsrHc1BZZ2Fh/A4wB3/MzR20EQxs92UYlMz+a71A03qniczKGNAie338RJ4PMf2XSKP
 4nHoMIY58xXZo/ASVOzqbiMOa8a/0rrjvKQgwthMWbaxPKYdZ9+raeQIFABwxwGk6gkm5n0Lp80JBt
 T35cGe4952uPcUEwn/FQXm9YDyWaMLVlT1VeFMyapD48MYWQrZ4iIJcLNmo8odeTvAVBDMuvZyNSxq
 bkz9cJXqaEemmUBNvUh2BTm+o1LHWTQx8aLTEDZYCRa4ApA44Upb9nivLw8+kfAXR+sCkRA8AqpKId
 LxTh6RJR8hyUW77+1PSd9tgVw4MDsI
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
the max98926 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98926.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index f286e572263e..1fbbc62bb0a2 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -331,8 +331,8 @@ static int max98926_dai_set_fmt(struct snd_soc_dai *codec_dai,
 
 	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		max98926_set_sense_data(max98926);
 		break;
 	default:
-- 
2.30.2

