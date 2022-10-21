Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9FE607EBC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 21:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90ED1A47C;
	Fri, 21 Oct 2022 21:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90ED1A47C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666379440;
	bh=ywauAsdLjkUJQdp0DsPF37EGmMMhN0y3N+sXyQYS3Qg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WaDPwCHkh+Exx+840ZJ+VgTQdyM++6jIdw3ybHtr0rMXs8JA6+E5R2bR/pp1/QX1R
	 lyg5uEHGtDWCPl5Ac5O3EV59Scwu8zwQ5fUJ90idovBLl6V7QikYCjC8O3B78N31MH
	 //Yza1FLmHotq9o5Z/wf0+93Rcz+l6myNOLEgKb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA976F8053D;
	Fri, 21 Oct 2022 21:09:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEE3F8053D; Fri, 21 Oct 2022 21:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA262F80134
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 21:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA262F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="iu0jAwwG"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BEE05660253A;
 Fri, 21 Oct 2022 20:09:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666379355;
 bh=ywauAsdLjkUJQdp0DsPF37EGmMMhN0y3N+sXyQYS3Qg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iu0jAwwGrKbqJzEzPiKUlOya7r6lOCskEMWFOVGoIzf/0Y7zjRuxwWsHvs8VPDIAR
 1aPXxUaTwKc3rthrwR/k6jEs1J74w5Uet7EHlnItZNBs4SKUgNerZSxQuWDWcRaVyb
 djtz+Toe9r/ZwCyOJsztGqOreeuC+qrb95HBpPLxqmDArPj39ryaBRzB+Jwxht9P1F
 Jjwx1J9n8oCVFShIQRxzCh+j/n825V6z1jryXCbI/aA/eM01c1GRVIxFWSncFpqzFg
 HbLoX3UYi4M8enWCq4jEAlnsx0pixO2hI3eEJp71gftL6KjfB6zprKWRTy2XZAUMrf
 Y3T34Z9UTdS8A==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: realtek,rt5682s: Add #sound-dai-cells
Date: Fri, 21 Oct 2022 15:09:06 -0400
Message-Id: <20221021190908.1502026-2-nfraprado@collabora.com>
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

The rt5682s codec can be pointed to through a sound-dai property to be
used as part of a machine sound driver. dtc expects #sound-dai-cells to
be defined in the codec's node in those cases, so add it in the
dt-binding and set it to 0.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index ca5b8987b749..ea53a55015c4 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -87,6 +87,9 @@ properties:
     maxItems: 2
     description: Name given for DAI word clock and bit clock outputs.
 
+  "#sound-dai-cells":
+    const: 0
+
 additionalProperties: false
 
 required:
-- 
2.38.1

