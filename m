Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD040DDE7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F7618C5;
	Thu, 16 Sep 2021 17:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F7618C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805740;
	bh=eDXzELLedHL1Rq69xdJyLrhmmCJYQrmfdmd4yJBB9LE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DL/WE3+FynA0R9hSxVACWaz5thHOD7frdCVF1o2mLzI/8d+SX4ckuYRJdGn4pZ0qB
	 Zc8CSpa7HTAu7ArFrPw3B41mcKpOr7D4CYf4HgkK3hrJk5mNnCkOyxeOpPKlrSwiFn
	 C1R52c6W/lG0fzdfbrcVbNZGNaJxb7Q+F3egz+l8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FD7F804FB;
	Thu, 16 Sep 2021 17:19:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14600F804FB; Thu, 16 Sep 2021 17:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D94F804FB
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D94F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B8qqIRyR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FCD761248;
 Thu, 16 Sep 2021 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805544;
 bh=eDXzELLedHL1Rq69xdJyLrhmmCJYQrmfdmd4yJBB9LE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B8qqIRyRkswmmaTgHEEd/uDlXHFabOsTC7yjpuP9ibwswyecHLOBYBnJpKwpxve9C
 JkuxKqQNsXPMvQWJg//ak1TPGVuc+Sjxf+c8oNZht8vHhrsWZ3cBdh2GufwxRq9pSR
 BLKs7IQfYqbaAcY/bzHuo4TALT5GcfLg3AMX9W0ASjRGQIAVG90U/+z7hNl3FJnsKU
 h9Tri2vDRKnVC2sT1Yoel6qNLY3bpsYj8FgNQo4rIVE+XgFmiqe6DzK1hV4naafwDR
 gDNi9JAGAVXufrIWcOxVXWtI87Yq4y4HZ1g5JY1dxrRkUwkLF26taVL37wIn9XY5K6
 dzwvELQRofVfw==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 6/6] ASoC: adav80x: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 16:18:06 +0100
Message-Id: <20210916151806.20756-6-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916151806.20756-1-broonie@kernel.org>
References: <20210916151806.20756-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; h=from:subject;
 bh=eDXzELLedHL1Rq69xdJyLrhmmCJYQrmfdmd4yJBB9LE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1+sjWzsvq4K2hc77B5GuMyqH52WZBlRqQaNGil6
 ZWNtt36JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNfrAAKCRAk1otyXVSH0EbAB/
 9XoaRelhc2L3sQQWyAqfId+VaAG5XEtVtzVkYiIs/6HKsWQL9Frnl2D28XWJPiy3Muhdo5Xef9mqFN
 fNf4+GO/ItDBBBtPBk5O7wEbmhjj+hJo6PEpxBPpstQtU2dyCPrfw5rYabRs6F2llCXl4YZ/IJKIqd
 8LyYL7t61bwsH/3o5p0zkh/j1tCAjbkx7365c85cr8jU4oQnDZCJcD5/iu7hezgow0sShBIcDTa/+z
 TO/213oiY5UfAIOA4fUG7D8GNc10wFy4WVvrbC7vlimoOrlHHaUWFPoTh8KqnTHSQf26j1PPVD2yel
 SFGVdNeydQmfx7Sg/Ao7OZ9V79v2xC
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
the adav80x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/adav80x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 75a649108106..90f3a5e9e31f 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -369,12 +369,12 @@ static int adav80x_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int capture = 0x00;
 	unsigned int playback = 0x00;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		capture |= ADAV80X_CAPTURE_MODE_MASTER;
 		playback |= ADAV80X_PLAYBACK_MODE_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

