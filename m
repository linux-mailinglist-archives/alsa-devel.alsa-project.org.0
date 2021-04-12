Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4E35C35F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 12:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BEC7950;
	Mon, 12 Apr 2021 12:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BEC7950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618222136;
	bh=vYmrOHtcx1fS3l6nJHpmCy5H49r/8IF/LQepI/e6bQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnhQNjaejI/M62vJBEyfnpU9fhzJnPB9xNqQkFLrDaY5qwIjRa088Hot6yBktDa4h
	 xJq3NHE4TjgrP+Cas3Q8PLBhY4UfxjKZVHxvBwk8r6KWij1R8Ww61wCcpMSVaa56DU
	 qtVXTA3/rxzBzUfvyRnT4vmDYdLlzyKNPid8gKFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8221F80277;
	Mon, 12 Apr 2021 12:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39443F80277; Mon, 12 Apr 2021 12:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A30CF800D3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 12:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A30CF800D3
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FJkrD3JvvzlXJR;
 Mon, 12 Apr 2021 18:05:16 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 18:06:58 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: renesas,
 rsnd: Clear warning 'dais' is a required property
Date: Mon, 12 Apr 2021 18:06:37 +0800
Message-ID: <20210412100638.3349-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210412100638.3349-1-thunder.leizhen@huawei.com>
References: <20210412100638.3349-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Zhen Lei <thunder.leizhen@huawei.com>
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

When I do dt_binding_check, below warning is reported:
Documentation/devicetree/bindings/sound/renesas,rsnd.example.dt.yaml: \
sound@ec500000: 'dais' is a required property

I looked at all the dts files in the "arch/arm64/boot/dts/renesas/"
directory. However, the dts node of this driver does not reference any
property in file audio-graph.yaml. This can be proved to be true, because
after I deleted "$ref: audio-graph.yaml#", the old 'dais' warnings are
cleared, and no new warning are generated.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 1e0e14e889133b8..384191ee497f534 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -258,7 +258,6 @@ required:
   - "#sound-dai-cells"
 
 allOf:
-  - $ref: audio-graph.yaml#
   - if:
       properties:
         compatible:
-- 
2.26.0.106.g9fadedd


