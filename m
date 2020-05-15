Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A408D1D7AF2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 16:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25AF116EF;
	Mon, 18 May 2020 16:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25AF116EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589811594;
	bh=bCjOyNRKUkTpcOLhAepu3z2mXkjIylErXdaWaUYvqIM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fPPX5qgdaOBH/YrclNPLkeYQEVLXIPfsNNBUZUgw0iM2C1DjUtpyxrtNzC7dMTeel
	 gaF/oKpID87huTNupO+rXpQSdEEZB00IKV9ZGvELEJByZn/3r6qs5IYMSnZ1xy1xer
	 D3uuC05tS2pIPsYNj6oaunl7jFTxSpchTKvqsmj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49F83F801F9;
	Mon, 18 May 2020 16:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1A85F80247; Fri, 15 May 2020 14:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 142E6F80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 14:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 142E6F80101
IronPort-SDR: q9alwId5W8m0r9X2VOQUlpwyRooVztQwp8kEj22x64xLioJSvH0oU9PTSIJmOt001z9J3gns2R
 bi3WqNJ1GDiwVWCtLA6Xn+XxtZYWQ/4ZvXpSP6iAPqtDbdun4ctIOkrgUkvF579vaQdZFySchY
 VH/bUzqGrCHgHs29SMfgAK2w18Vt1ApHMa4+kAP2A7Sz610QfIjUkyXOBUlK5mjv7lEfxaIsf0
 aBN+pOEMc/UcV9EwkQBQF+SxOSc6LUafm5/uvZN5YlkfUexYmPrt/fNinD39hozDVIbjPgNV3n
 IvQ=
X-IronPort-AV: E=Sophos;i="5.73,395,1583190000"; 
   d="scan'208";a="8523670"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: max9867: fix volume controls
Date: Fri, 15 May 2020 14:07:57 +0200
Message-ID: <20200515120757.24669-1-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-Mailman-Approved-At: Mon, 18 May 2020 16:18:11 +0200
Cc: ladis@linux-mips.org, broonie@kernel.org, lgirdwood@gmail.com,
 Pavel Dobias <dobias@2n.cz>
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

The xmax values for Master Playback Volume and Mic Boost
Capture Volume are specified incorrectly (one greater)
which results in the wrong dB gain being shown to the user
in the case of Master Playback Volume.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 8600c5439e1e..2e4aa23b5a60 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -46,13 +46,13 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(max9867_micboost_tlv,
 
 static const struct snd_kcontrol_new max9867_snd_controls[] = {
 	SOC_DOUBLE_R_TLV("Master Playback Volume", MAX9867_LEFTVOL,
-			MAX9867_RIGHTVOL, 0, 41, 1, max9867_master_tlv),
+			MAX9867_RIGHTVOL, 0, 40, 1, max9867_master_tlv),
 	SOC_DOUBLE_R_TLV("Line Capture Volume", MAX9867_LEFTLINELVL,
 			MAX9867_RIGHTLINELVL, 0, 15, 1, max9867_line_tlv),
 	SOC_DOUBLE_R_TLV("Mic Capture Volume", MAX9867_LEFTMICGAIN,
 			MAX9867_RIGHTMICGAIN, 0, 20, 1, max9867_mic_tlv),
 	SOC_DOUBLE_R_TLV("Mic Boost Capture Volume", MAX9867_LEFTMICGAIN,
-			MAX9867_RIGHTMICGAIN, 5, 4, 0, max9867_micboost_tlv),
+			MAX9867_RIGHTMICGAIN, 5, 3, 0, max9867_micboost_tlv),
 	SOC_SINGLE("Digital Sidetone Volume", MAX9867_SIDETONE, 0, 31, 1),
 	SOC_SINGLE_TLV("Digital Playback Volume", MAX9867_DACLEVEL, 0, 15, 1,
 			max9867_dac_tlv),
-- 
2.20.1

