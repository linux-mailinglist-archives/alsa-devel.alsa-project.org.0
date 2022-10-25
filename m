Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B25B60CC32
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C064530F;
	Tue, 25 Oct 2022 14:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C064530F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666701818;
	bh=AlJdfI6AqBKdahVAhBLf5jp/i/JMNDalJrBK/WPvBlg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pa2hCmQ4jLRasv9ZdUOzckE12fLQ0I8jXZmzVuwRwAA0cc5GeUUj1IjYvvuGEaHl8
	 h5IZGOTB3wkL8xa+rGQSM3+g6oV63xdAHVrpXE+D2aW5vPsrveGJbrVF+X184qQQcS
	 qJK9mE4j5SDJoIXRb5UoWvxsA3PFTh7yFOfD8aAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 130F8F8055C;
	Tue, 25 Oct 2022 14:42:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47A05F804AC; Tue, 25 Oct 2022 14:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0E39F804AC
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E39F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HHau6xvD"
Received: by mail-wr1-x432.google.com with SMTP id k8so11960811wrh.1
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElsXKifGPu+xWV5kp4Q++GnbWWKLpxXO2HTLVtO10F0=;
 b=HHau6xvD/rOVqNP6ObIxSLZ9tnj+QB3yZIBup+RJEu6HUeGApKsCbQg71GXp4WHpP1
 HeFb1s2MCV1T3pQc9zhYMbzja1i/iUogcuOd4ki2KtMh2nACc5tX5fxsuYV2uywXyQU8
 fIE4FU9pD8162SSETLavaz6p0DxVFO59t8uPJtGqLWgoimkuzYOK7U9Ss123dNaQ8Aaa
 35EVE8YbSiUjK9/tNd9xNViE4PEoZ2LA3d4nf/7vC7A/V8RNXS3Rc3gdP4z1gm0NEhee
 CqhgL3zs7MNbwytp/PiGRGhyRkWPmqRe9hHZotjX0JR0+3nikKGZ1CeLe+/gYnQdnZVW
 ISDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElsXKifGPu+xWV5kp4Q++GnbWWKLpxXO2HTLVtO10F0=;
 b=1L5FWxQ9ISIB31eQMZ2BqBY5FsYQpaY1zoXAON78sfzGZjm881vFeHyyRbsKTg8YsM
 Wc+eBnhnW+YJXl7ql38eqzNrmGwgKxnxB7Kto0Nar5OL3BxW0w8arRbvJ3TDCsmHtEM+
 vtE0HDsvC8vviEO0N5BwEHTRXK66zcsj6GST6K1HlW4y7V5apncjd5oTsscXi1xztSOu
 eAmtPYGXnQf+5kmOTwJBqH5k/REv5ew8uKMwKAOlWQ3cRLasuZstqtUUv6oaxZ8OH/u3
 ERc2ihKI4y3nZuU7ZKsFq4QK7xShhe1r52mdbaZuTaFM29h2rlrdzZZg7A4nUQxcQeT9
 ShHw==
X-Gm-Message-State: ACrzQf3yt0KH+hmU5CYTCOEbY067ih2rAaPV00A2xeGNl8rEBikCDSwP
 QLHu0EaRxTqd4zLe86kSlYwRWYm3jDM=
X-Google-Smtp-Source: AMsMyM4kI+X+FZY7+WMg564s3kMyQmXgsKWXajfJpp1On9XiNlJ/mym/OBtcbcEgIGxZXcTFg4DEdw==
X-Received: by 2002:a7b:c048:0:b0:3b4:fb26:f0f3 with SMTP id
 u8-20020a7bc048000000b003b4fb26f0f3mr48434995wmc.115.1666701715943; 
 Tue, 25 Oct 2022 05:41:55 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05600c1e1300b003a1980d55c4sm11250664wmb.47.2022.10.25.05.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:41:55 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/4] ASoC: dt-bindings: rockchip: i2s-tdm: Make grf property
 optional
Date: Tue, 25 Oct 2022 14:41:29 +0200
Message-Id: <20221025124132.399729-2-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

Turns out most things don't require the GRF, so making the property
optional is the obvious move.

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index 6a7c004bef17..8646cdc692d7 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -135,7 +135,6 @@ required:
   - clock-names
   - resets
   - reset-names
-  - rockchip,grf
   - "#sound-dai-cells"
 
 additionalProperties: false
-- 
2.38.1

