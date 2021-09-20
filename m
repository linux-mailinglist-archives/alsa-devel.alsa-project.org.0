Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47254411A01
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 18:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC11016C6;
	Mon, 20 Sep 2021 18:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC11016C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632156178;
	bh=aVl+NbEMmJVNnO17s3LthMneV4uJAT+YB0L0mfCgaa8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pV9LBkpLTb9IqPcceqQxCuyOi9pKCB7U9+GLjIySTxucTyBWRmgxxmH0sIcPFaMpz
	 rKNaHSmVe3oGUWVCRcmnurVJw/iHHKGSf/pv3n9Dd+j+yTXguiWfYNFlYX0GpIfjfT
	 dSf2cAvGCvwBNaHHmD9VvYSi9evxPFCeZk25WNfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 430E0F80279;
	Mon, 20 Sep 2021 18:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E76C2F80152; Mon, 20 Sep 2021 18:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D61F80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 18:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D61F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jFN2IvxM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AAAF61177;
 Mon, 20 Sep 2021 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632156086;
 bh=aVl+NbEMmJVNnO17s3LthMneV4uJAT+YB0L0mfCgaa8=;
 h=From:To:Cc:Subject:Date:From;
 b=jFN2IvxMFi8V6hMZDTcH09SaX/Elg77lZ89idE83ohl+aR6ksbWnohvwfPzZBWa9L
 iBuJ3IbbFqB3KzTPZFy7JxvVrv18YSAC1ggididA/9DAz2K1tuw9F0K3gTHpFDSqIC
 NY51sdfaG6uCydeP3MHZtqCEq6UQ4O2vqyxIm+Vy5ePAww23jylHrV737+gPqoZHqU
 P//xcDFtqd++LWshS2Xp+PMmZcIfVSzhXGaR+dCL9V6WO1TtNzG1ExgW6K9C716Ry2
 mu90xMZP0sB0GgE9/Qghob9wMf95gH6tiK2Y4oinITGK9YSx5TlrxUN1nA8kUWvgUD
 zwLNcC8bTviCw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ak4642: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 17:40:42 +0100
Message-Id: <20210920164042.16624-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; h=from:subject;
 bh=aVl+NbEMmJVNnO17s3LthMneV4uJAT+YB0L0mfCgaa8=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhkSPnWUPaux1p051TBBcXcpUPUNux8LuWf09kcVfvgVtFOt3
 mnSik9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYiG4o+z9lqw9LCgJYX0n4sH+6Zr
 i7UkXu3KrzTveNJW7keR45bqCl2fvF6OHujuOLE6pOXmXhUS7fyh/wqmeqydng8Pp3ZV5O5cee7LI7
 tIJLJOt53+EW9Q2RT9qami6pS3Idcc8WCH1990RSj/22yYWCh/SVvjr23hH9Ji1X43Kx0jjkaF6JyY
 EwvazQ619EWbZedQ7cfsKg0vrWvm+LT1rOXdtT25rWaiRQlRmz/96+nCklVp0pqcfy9CXtq6ZpNMke
 X6powW9+L9CkWeNfms/PwNyiAMvLbK82qFhrTLWeaODS9DPEckOyfd/VWAc/H6u/e5rUe0Xvd5den3
 5ho61E9vJv808luk7am/J0x+ODAA==
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
the ak4642 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ak4642.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index c49c58eeb476..c284dcc5af76 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -392,13 +392,13 @@ static int ak4642_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	data = MCKO | PMPLL; /* use MCKO */
 	bcko = 0;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	/* set clocking for audio interface */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		data |= MS;
 		bcko = BCKO_64;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

