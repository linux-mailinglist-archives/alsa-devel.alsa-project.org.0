Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D84678DF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 14:52:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CDCE22AD;
	Fri,  3 Dec 2021 14:51:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CDCE22AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638539524;
	bh=EUOOj1w5o/+kj169E0ovMXoLxYesUiGRUYC6RdweQy8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gm1jkd6RvX5BTwv35lmrGUgetXHAu9ZBwl+RDOOuWEnacsNKFBywCEXutG3Fs+/YH
	 ppuj1DYeTDn6Dvt/KCRwgJhjBmoD0l+PAmcJhOkhAyDIdP4mcDqSmAsnkuWmtMlAWA
	 L2xooW6YZgaGlCV0imtTZaI5lOlhQnV+Dn4gXKNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 022B3F804A9;
	Fri,  3 Dec 2021 14:50:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0EF4F8025C; Fri,  3 Dec 2021 14:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06A18F800D3
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 14:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A18F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="X7YFdJ4S"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id C20161F46E6D
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638539400; bh=EUOOj1w5o/+kj169E0ovMXoLxYesUiGRUYC6RdweQy8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X7YFdJ4S5uPncfB66kSY/ujNMHRrPRuCMZ7xNTVBSyp+xHujyxIwl8TVi5RJM/OIF
 qFACkQCk0Kmu+kwz9RNIRthQUfHR//fehHk7z2bPTCs7+aEN6zUKKuL9nXwZiYIC9u
 j/yR9r0FCnDfIbILm/d6xoqhEYFUULV0LvIgU1m2i8ewP/H2Euqyv8yroEOX5NPXb9
 SzLC/NCiWhHFLg9ndrpL+5nIWfksHSxdhPWilngCvqEXvCKlD089aKNkrum4QfXRRt
 MnCOLIs8qYo5MJGuFz+rUS0X/bO6dJTFqSUP7g6rxLYfi8ZK8e+ClIIgHEUM2wa2ys
 nge9Z6jKKi3Jw==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] dt-bindings: tlv320aic31xx: Define PLL clock inputs
Date: Fri,  3 Dec 2021 10:49:28 -0300
Message-Id: <20211203134930.128703-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
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

Add constants for the different PLL clock inputs in tlv320aic31xx.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 include/dt-bindings/sound/tlv320aic31xx.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/sound/tlv320aic31xx.h b/include/dt-bindings/sound/tlv320aic31xx.h
index 3a845fbba992..4a80238ab250 100644
--- a/include/dt-bindings/sound/tlv320aic31xx.h
+++ b/include/dt-bindings/sound/tlv320aic31xx.h
@@ -6,4 +6,9 @@
 #define MICBIAS_2_5V		2
 #define MICBIAS_AVDDV		3
 
+#define PLL_CLKIN_MCLK		0x00
+#define PLL_CLKIN_BCLK		0x01
+#define PLL_CLKIN_GPIO1		0x02
+#define PLL_CLKIN_DIN		0x03
+
 #endif /* __DT_TLV320AIC31XX_H */
-- 
2.30.2

