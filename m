Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5752607EBD
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 21:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748FF9566;
	Fri, 21 Oct 2022 21:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748FF9566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666379449;
	bh=DS3kNRrxvQNnQ5FSBW8HqwtDWRSQIlWA9aI0kdJZTLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAv6MMo/gMRqh6PJ/tFkaJy4LwfODMr8J76Y0cl58iGkpdfp9BgN7xGGT9jw6x2aJ
	 9cDXiBZgzIVgQl1LmujsBalt6czZ/JPUg1VD7Hy8BIK0X3J9Lf57F14RM/GtTahvdD
	 0pjAiTYapf+HGCLqHMEzN82CQoEtGQN5oYB7wKoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4107CF80551;
	Fri, 21 Oct 2022 21:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E6D5F80543; Fri, 21 Oct 2022 21:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 399FEF800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 21:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399FEF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="N/oJ4KJN"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 49EE066026E6;
 Fri, 21 Oct 2022 20:09:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666379356;
 bh=DS3kNRrxvQNnQ5FSBW8HqwtDWRSQIlWA9aI0kdJZTLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N/oJ4KJNyg6WVSLigu+m3R6pG774ED2lh9CHfCen5Xvwl3LEtWmXDkQD1JIqUOcGG
 2rRbhrj4MkXSw9/V1xWZxWI82K6mrLCQU7ZCdx3g6jeccBPQ1i3tJewuNV40lAXdpp
 OH9OSCbWbAU9tvVdm3QhatLiEdL/3OREevzsXZf7lYmn72QJhysaKIETFH8z8Ap5pn
 d8ZIXyOehrZtBJncoi6WBd296/nulbmmnEoWvcu+lXSSz9IwGExC0a8KF1I0k0Ty0n
 H7f7HDfvzxztz7vpMo8wEkI//53M35J/j4LQxEI/PwoSmzH9kABPMPK8OWzCQyqcEl
 9HB6ll62hMaaw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dt-bindings: realtek,
 rt5682s: Add AVDD and MICVDD supplies
Date: Fri, 21 Oct 2022 15:09:07 -0400
Message-Id: <20221021190908.1502026-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221021190908.1502026-1-nfraprado@collabora.com>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The rt5682s codec can have two supplies: AVDD and MICVDD. Add properties
for them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index ea53a55015c4..ca1037e76f96 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -90,6 +90,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  AVDD-supply: true
+
+  MICVDD-supply: true
+
 additionalProperties: false
 
 required:
-- 
2.38.1

