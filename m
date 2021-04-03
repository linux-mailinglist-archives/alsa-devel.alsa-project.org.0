Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C607F353449
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Apr 2021 16:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C94B16C2;
	Sat,  3 Apr 2021 16:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C94B16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617459315;
	bh=z+Jhi0Oh6mJe04ry9ogQ+Wf00OAhbA+QIXqmOIGOwXw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h6BOa53h5ZCrHsq94JUoxvNYBndyDey1qU3AImm/laEA2AsViumn0hs5grc2QZa5m
	 qfYe2dXL+h0L08clifIWj077iS6OiRNqExb/rnNVFpj0pmg3VvZAOW7rF0vW9fA97P
	 dNdxDqKFPiMM0iuA7N9z3FXt+F51SUTYiwzgX6Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A592F80147;
	Sat,  3 Apr 2021 16:13:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B0F2F80147; Sat,  3 Apr 2021 16:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C86FF80147
 for <alsa-devel@alsa-project.org>; Sat,  3 Apr 2021 16:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C86FF80147
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0ED881A0BBE;
 Sat,  3 Apr 2021 16:13:40 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A3ABA1A0FBB;
 Sat,  3 Apr 2021 16:13:36 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2A601402D9;
 Sat,  3 Apr 2021 16:13:32 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] ASoC: ak5558: Fix s/show/slow/ typo
Date: Sat,  3 Apr 2021 21:59:25 +0800
Message-Id: <1617458365-23393-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

s/show/slow/

Fixes: 920884777480 ("ASoC: ak5558: Add support for AK5558 ADC driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak5558.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 3ac62a281807..8e4dca753f0b 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -75,8 +75,8 @@ static const struct soc_enum ak5552_mono_enum[] = {
 };
 
 static const char * const digfil_texts[] = {
-	"Sharp Roll-Off", "Show Roll-Off",
-	"Short Delay Sharp Roll-Off", "Short Delay Show Roll-Off",
+	"Sharp Roll-Off", "Slow Roll-Off",
+	"Short Delay Sharp Roll-Off", "Short Delay Slow Roll-Off",
 };
 
 static const struct soc_enum ak5558_adcset_enum[] = {
-- 
2.27.0

