Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C977F467CE0
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 18:52:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3481249E;
	Fri,  3 Dec 2021 18:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3481249E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638553958;
	bh=sjUDlRzGKvbKVrH0gyQWnGzouzwqlG1XZ4Jt6m71DjQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UwvGpbCdloftkJnnwsRlXcE/RGDf3zE/X86V/rW1abEI0lX1aQJXQqcsVxtYcZ516
	 s8H/c2KvPtsfsN+prldfMAYajDab9WPOpzx6xSGbEziZ1kCEbcy9IdrsLMdUphA0zr
	 BW6nEgerRZ3NRImUnfoJ2mXO0L5sfBo0P/i3PaGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4032F80475;
	Fri,  3 Dec 2021 18:50:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0BF0F80246; Fri,  3 Dec 2021 18:50:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7FBAF80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 18:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7FBAF80085
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="NwkfaQST"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 5BF591F4724E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638553848; bh=sjUDlRzGKvbKVrH0gyQWnGzouzwqlG1XZ4Jt6m71DjQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NwkfaQSTsNOkewcP0B716mc78gWZExuruZKkT+w5vMZK3j5bz16Jz46lMdsSHN6d8
 vbrQW+rczqrkZv7gADP/scWRDEpZELWkgK9yA3WbJZ7dzxsAcQM3cDW6Z1dSMAb2Ph
 DNZF/IGm1DuStbG7DGLsA3ifLF43DOGqZelzCHtFwWuhY9wg8KVgqH+XQ0KWLpha4L
 qG7g0WNvjEWJlWRgAmxQ49gBw/2k9U/fZgKgHc25hoh1vheF6Au/McyIVX/qPQcez6
 qZRfpnnAGXXsjsVkukAqI/r4Gfni8Z3xi3pR/SlzRu6kHkDoRnRsKTWgE+AyRiCnpk
 05KK4eUCt4h8g==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Date: Fri,  3 Dec 2021 14:50:18 -0300
Message-Id: <20211203175018.252641-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
References: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

The following commit added support for tlv320aic31xx codec to
fsl-asoc-card, but missed the related Kconfig option. Fix this.

  commit 8c9b9cfb7724685ce705f511b882f30597596536
  Author: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
  Date:   Fri Nov 19 12:32:48 2021 -0300

      ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8e05d092790e..10fa38753453 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -311,6 +311,7 @@ config SND_SOC_FSL_ASOC_CARD
 	select SND_SOC_FSL_ESAI
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_SSI
+	select SND_SOC_TLV320AIC31XX
 	select SND_SOC_WM8994
 	select MFD_WM8994
 	help
-- 
2.30.2

