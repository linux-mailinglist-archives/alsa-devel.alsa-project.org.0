Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B59AC308C68
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:30:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5134D167D;
	Fri, 29 Jan 2021 19:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5134D167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611945029;
	bh=aN1CZo7Gs+WuhkM1EppmnErhAQFwv+m4ivyxMytIIJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L717RZEQhlB7SDemIQQZuDlfYqsktAco3JIZ+6f9REZqOhpgmltzzA7DYsM8NhAJ2
	 4JDjJaoKEMF3nER1PrzKTMi92l6u9l9U3ObLlP5GDAq+Zn/sXCNf/pRS9nqMcDs/M3
	 v+73/HCrqaOP7I9C0ORwOV1kDoN07L2k1gUNMyFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F4FF804C2;
	Fri, 29 Jan 2021 19:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A4EDF804CA; Fri, 29 Jan 2021 19:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC394F8026B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC394F8026B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="G1d+n92d"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601453b50000>; Fri, 29 Jan 2021 10:28:05 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:04 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:01 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 3/9] ASoC: audio-graph-card: Add clocks property to
 endpoint node
Date: Fri, 29 Jan 2021 23:57:40 +0530
Message-ID: <1611944866-29373-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944885; bh=8rCymPluJ1fUEPrMoQ5Gx5LsQlp+yRtKBAeGRmkhoEc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=G1d+n92d6yK2YA73nDfo1PcAoEe5hSzVgOruUcSNj27pHkdqPPP8JSX7S4+SswibI
 /Vq/4ZrHsoNs6B1rNKiKgQVYuyPQzGI9AIVymwQQJ1nQoeIejVZ6Oet1M1/RXWyDyf
 kVBH4pOP6cWthsajccJvTpUFxfLw4bI/+47ojqOs/lKRVq6jMwxYEOeC45qSMBw362
 f37yfrVMQPW6SXC5I6bPpR2dXY3bmtrXwCHmTVcz44EhG2bi33OM5J05nh2XLWNjv4
 7nsfH02XbNBvIic9oKryQalIr7Lt0FMe2R/4W00aAs5o2KfjDYWIneaRIaV4QRrEdb
 AXWAQhvAydoYQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 jonathanh@nvidia.com, sharadg@nvidia.com, linux-tegra@vger.kernel.org
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

Add optional 'clocks' property to audio port 'endpoint' node. One
such example is where SoC supplies a clock to external audio codec
component.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 766e910..08ed8f5 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -33,6 +33,9 @@ properties:
         properties:
           remote-endpoint:
             maxItems: 1
+          clocks:
+            maxItems: 1
+            description: Describes the clock used by audio component.
           mclk-fs:
             description: |
               Multiplication factor between stream rate and codec mclk.
-- 
2.7.4

