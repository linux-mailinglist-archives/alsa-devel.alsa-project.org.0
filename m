Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 620408CBD7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B9A165D;
	Wed, 14 Aug 2019 08:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B9A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763560;
	bh=vbHDtfhtmwkUxc9P11b6DIUTZnNhi40RALGfJvXkY8g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7xDUt4ctDBEkH3qUsZuuiHcgRov60xfxR0TTfAx+ejKGPxSxnZ0PB2mxQOphwECN
	 scm8Pyt/WBWKuIpWa52w9fwcfh4DcgHrpqWlachHaM/wUbdVLO75WlgClh5d2k6wZS
	 +dDsus1uWleW6UxkXZk0E+Kxy0JCmdmSsvc5JyQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2D2F80717;
	Wed, 14 Aug 2019 08:09:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C9A8F80672; Wed, 14 Aug 2019 08:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 769D8F8065A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 769D8F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LDjG+Z8m"
Received: by mail-lf1-x142.google.com with SMTP id v16so6751706lfg.11
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8xlhGnlcLyXPojY0bRPSDLMcy+hJZFPi39TOyTS/wBU=;
 b=LDjG+Z8mIhS5zgHxWzmnF037zhntmBJl5zKjHirJ7skqEwESZ/9TPssPMun9VHd2gJ
 paoyDg16Hp50SSAZN7dwo2ODWuSrTe3rFjXzjteC4kXfai6KEhoTk5mEPSbXAOmNftnk
 mXGruXqtXay0ByyQKbpWP+ihz0ogwxrIp6ZmEKdCPOwSl0tYSW0pcFhNKIQ8vlbnPl3T
 5W8QHXnGS/Q9C/oSNSp9ON/H+4+u67fPjkyRotDsZDaGrizdtLuzOBuxd2VnHjgEjYrr
 Ovzwa8TmuLte801MqTa06cGHKe8YtzbV1XAPsjES+LYOL3nA7flEEaNGdXfEFp/gY6ws
 Yk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xlhGnlcLyXPojY0bRPSDLMcy+hJZFPi39TOyTS/wBU=;
 b=kWSsSK848rzNea2+XQP9YjYqRVXIbZqNmLHcMfj46/UOPw7hW8SFFQbz5zy11RMscY
 9ecEF0+N1M9lhcuwUZ/m917uOzBAK4YTQ3gcwPGhzl7GEWXfRRi9wiXoc14L5DVeqN0K
 AZQuYQnwKxXXtHeEpR9RFMnPBdB47hM6SyBFdTOWkifSPNCJFh4616ceD9jv09RZ6hCw
 fd3Bwu6HWKT7Rk3yFf9DVobgMKvR+bq8t01NSeZsq9kPfvul36+EHq+7fSMR+CIRLI67
 9vP/LXDmbjJlFglYzO6C6YzcjyKnnwyu++onX5GX2/+diFngGWP5K2AZ2kNRaqIRCu+A
 rCmQ==
X-Gm-Message-State: APjAAAXAFZXSBLVfb1suVHhwOG8Ctgg8S4bAqxkVNPpXDgD/sr2ysmAc
 EkWIXHm2C3RqfEruWuG5mK3EuWew
X-Google-Smtp-Source: APXvYqyZgq101jMRdi4NBQz/E+rmMXrIu0bWV/oCYTnoMBDnWs6w3jX6We+jj/pMt68nDXYjRzfYqw==
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr26657795lfg.126.1565762954043; 
 Tue, 13 Aug 2019 23:09:14 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:13 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:49 +0200
Message-Id: <20190814060854.26345-11-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 10/15] dt-bindings: ASoC: sun4i-i2s: Add H6
	compatible
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to H3, except that it supports up to 16 channels
and thus few registers have fields on different position.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index eb3992138eec..6928d0a1dcc8 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-i2s
           - const: allwinner,sun8i-h3-i2s
+      - const: allwinner,sun50i-h6-i2s
 
   reg:
     maxItems: 1
@@ -59,6 +60,7 @@ allOf:
               - allwinner,sun8i-a83t-i2s
               - allwinner,sun8i-h3-i2s
               - allwinner,sun50i-a64-codec-i2s
+              - allwinner,sun50i-h6-i2s
 
     then:
       required:
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
