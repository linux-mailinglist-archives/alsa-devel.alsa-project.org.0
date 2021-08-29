Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB993FAD53
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Aug 2021 19:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B3B816C8;
	Sun, 29 Aug 2021 19:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B3B816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630256957;
	bh=d+2QNTvIoV14dRg4l4dGxY/K6mqRrojAgpr6qjkd1vY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCkCAKY6yDHPTKzejBFr0AzdzGmDnjBwW+5PFZqwyvMC4QkCjQA7DhdjyOR2T2aZL
	 6ncjGFKOMriJj6cFzWApbPip2FdCaTVWRP8K237Oxr8pi5QFLWmONGcMUaoA5IMiKj
	 Qkh8VMd0NGxmEmi3/JMhmU33UB9fkwj4TIBATbQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C55EF804B3;
	Sun, 29 Aug 2021 19:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF30AF80143; Sun, 29 Aug 2021 19:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C49FF80143
 for <alsa-devel@alsa-project.org>; Sun, 29 Aug 2021 19:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C49FF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="RQZTpODu"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id CD4C940457;
 Sun, 29 Aug 2021 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630256854; bh=d+2QNTvIoV14dRg4l4dGxY/K6mqRrojAgpr6qjkd1vY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RQZTpODurghBG3P44ykBj/me+k/9HHMcNsQrngtFfakKZH9kJW/EC8he6HXATnO3/
 QdcTVp94I+/HcESNsN/2wT/VpPWZadHpqfLBh6KXCCiJcFNSik0v6tKh87Vrp5s3+s
 OH0rcDgvvtvSS+9XaI+0SmsfeKHI2f/faKMRyO4TsiMbFJOHkrWO2A2z32Qphhgj5M
 xHjyXQf/zEhF3hw94DpuauoryI0k2W06QbL+gegnjqjx4e6GoVAxwIzn+knFNka3yC
 +NciyzLVJi57ChDvjvI7f8Wj9c1vDwRL2O1pu22a/u541ADeWH5E/OqUiPPx1AVCQ1
 tdnEsbS9J+Wpg==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [PATCH RESEND 2/2] dt-bindings: sound: max98927: Add reset-gpios
 optional property
Date: Sun, 29 Aug 2021 19:00:17 +0200
Message-Id: <20210829170019.384632-3-atafalla@dnyon.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210829170019.384632-1-atafalla@dnyon.com>
References: <20210829170019.384632-1-atafalla@dnyon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Alejandro Tafalla <atafalla@dnyon.com>
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

Add the reset-gpios as an optional property because some devices might 
not need it to work properly.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
---
 Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/max9892x.txt b/Documentation/devicetree/bindings/sound/max9892x.txt
index f6171591ddc6..73733fb60136 100644
--- a/Documentation/devicetree/bindings/sound/max9892x.txt
+++ b/Documentation/devicetree/bindings/sound/max9892x.txt
@@ -30,6 +30,9 @@ Required properties:
 
   - reg : the I2C address of the device for I2C
 
+Optional Properties:
+  - reset-gpios : reference to the GPIO connected to the reset pin, if any.
+
 Example:
 
 codec: max98927@3a {
-- 
2.32.0

