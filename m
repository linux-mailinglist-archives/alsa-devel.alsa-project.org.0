Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35B3FF8BD
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 03:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5947F17D4;
	Fri,  3 Sep 2021 03:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5947F17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630633988;
	bh=mcwX7Miz5TrtHPejHmXNGJzxpaa4beQjg0TVC4MXFPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNzfN9wlZLY+JWjmKO1wxZccWDUdilmI6jpBeLYpOhLJm5UaYPxamjbwByyy/A+MM
	 e3Aj1IXHxayW6kddr36+J/7q6siKkqbfVLvvg/kuAAe1NplHxWOJK3//9HG6xEzS2B
	 tkbEJZS2/Skj8/FN5tzvkdnWK4LIj3QX3AIoBbUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C80A3F800B5;
	Fri,  3 Sep 2021 03:51:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D2E7F80256; Fri,  3 Sep 2021 03:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dnyon.com (unknown [IPv6:2001:ba0:1800:12f::1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 055ECF80227
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 03:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055ECF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="jJpeUgZw"
Received: from dnyon.com (55.red-81-39-194.dynamicip.rima-tde.net
 [81.39.194.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 32CCF40487;
 Fri,  3 Sep 2021 01:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630633899; bh=mcwX7Miz5TrtHPejHmXNGJzxpaa4beQjg0TVC4MXFPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJpeUgZwzCOtQsHa8UiD74DoTmY7z1QKEpUoLkzfSNsQNPNIuQ6pwvPIZxmr6Z+Hv
 SRQO6mteBd9vp2aLTtZ7cOUWXidwjZulAT+oQtFB6B8Uwz3r1zQ6+x0rFwk8ehfLVr
 IjxR4pcbDjkcu6U5IKaFOnNR5hXQ4BRv/p/+k5TF6bNVVKBagHC1mwvs4HpHrtNpCg
 pWFr8cVV4wXa3dQv+hqWPtQOb+v57lyonLZ6WsGC9JAygs0Glr8SdDg58sugOZFybp
 QfmS/B98kN2EUAdWFCneAG7/nJ/mbbXQjZQFBi+MlndhHBMafi3GfNDeWKgypBqhHN
 ZgfS9CSe2Yu3A==
From: Alejandro <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 2/2] dt-bindings: sound: max98927: Add reset-gpios optional
 property
Date: Fri,  3 Sep 2021 03:49:51 +0200
Message-Id: <102ae6df3b5398e8c66b954ac5e13a9d565fab6f.1630632805.git.atafalla@dnyon.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1630632805.git.atafalla@dnyon.com>
References: <cover.1630632805.git.atafalla@dnyon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Alejandro Tafalla <atafalla@dnyon.com>
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

From: Alejandro Tafalla <atafalla@dnyon.com>

Add the reset-gpios as an optional property because some devices might
not need it to work properly.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
---
 Documentation/devicetree/bindings/sound/max9892x.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/max9892x.txt b/Documentation/devicetree/bindings/sound/max9892x.txt
index f6171591ddc6..98cb9ba5b328 100644
--- a/Documentation/devicetree/bindings/sound/max9892x.txt
+++ b/Documentation/devicetree/bindings/sound/max9892x.txt
@@ -30,6 +30,9 @@ Required properties:
 
   - reg : the I2C address of the device for I2C
 
+Optional properties:
+  - reset-gpios : GPIO to reset the device
+
 Example:
 
 codec: max98927@3a {
-- 
2.33.0

