Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C13AAF2B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 10:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E4716EB;
	Thu, 17 Jun 2021 10:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E4716EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623920120;
	bh=0JfZD3u5IFaUiozDYAt43Axmf4bDptnheqIAdh2Zo+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=glOujJE0OE163tCPLq3/UvivAxBn1utsTzWPP1jGdpLtOrqJeMF08R7w97RY8UlVL
	 Uth6KnK8Iqu20VFYssxlT/Zgp6wpfItuaXpnxxOa39zznTFdNiZ6FqIZMeMWFbiWDc
	 SAGbsdDQtBXSqmM4M7npp6QH603Ef7szB63GZMqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D34EF804E4;
	Thu, 17 Jun 2021 10:52:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07646F804E3; Thu, 17 Jun 2021 10:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77366F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77366F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="iQgnirbV"
Received: from localhost (dslb-084-062-104-230.084.062.pools.vodafone-ip.de
 [84.62.104.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: ch@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 47B3982024;
 Thu, 17 Jun 2021 10:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623919968;
 bh=xeDue/WnOOtGXp+2ku3MmnMQPyFPmeXZP5vSiFO0p24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iQgnirbV2ldVLDDkgvLyQa3BRo6DqY1N3zdtuKIzLpuPGeF6gTGnQd/RGGB3TwXYI
 yRKBn11SbXvuA1QL6ybmL+L8m+0Rfcyq5SisjVg/60nnBv44Ynrs5t13Gq8oB4yJti
 OmVHcHsDrEHeS4cBe/u7tF+EzrTBmOJGRRxzQBfuIrgbMbEc8N0x8m8QlFUL6nqNnj
 Xx4xjONQJ+ysdZI3eh4pGJ/evCh4p81iDo44iXL6u3albdbI0p766tgkNCXAlrgfGB
 gYuOMXRN+shDYXSd6mo2rzS+XV0DxXyKmMmwBRgwQmCrACPHGQ+YZBwOwTuxnJRcVy
 fhTvA38OR7GMQ==
From: Claudius Heine <ch@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>,
 Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] ASoC: tlv320aic32x4: dt-bindings: add TAS2505 to
 compatible
Date: Thu, 17 Jun 2021 10:52:30 +0200
Message-Id: <20210617085230.1851503-4-ch@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617085230.1851503-1-ch@denx.de>
References: <20210617085230.1851503-1-ch@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Claudius Heine <ch@denx.de>
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

This adds 'ti,tas2505' for TAS2505 to the list of allowed compatible
strings.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 Documentation/devicetree/bindings/sound/tlv320aic32x4.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
index ca75890f0d07..f59125bc79d1 100644
--- a/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
+++ b/Documentation/devicetree/bindings/sound/tlv320aic32x4.txt
@@ -6,6 +6,7 @@ Required properties:
  - compatible - "string" - One of:
 	"ti,tlv320aic32x4" TLV320AIC3204
 	"ti,tlv320aic32x6" TLV320AIC3206, TLV320AIC3256
+	"ti,tas2505" TAS2505, TAS2521
  - reg: I2C slave address
  - supply-*: Required supply regulators are:
     "iov" - digital IO power supply
-- 
2.32.0

