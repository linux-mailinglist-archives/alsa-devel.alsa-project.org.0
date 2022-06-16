Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95054D919
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 06:05:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D337A1AB2;
	Thu, 16 Jun 2022 06:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D337A1AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655352304;
	bh=t2QL/Gs6kJ1auJrBWOrJOUqHeh66OEA/cy9vNl/puIo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lFbTrgi0TrM3CutVxQVb6jcx99wMQPlhGo/22MEQCNN8EAUQA7G3DORJsVlDA22uq
	 xIsFJFVJHlngbK+RW62dKsnrvBIheZAqkADe6ZqygsOgrSAdcJW+MDOZekgoTGut7u
	 WLZu8R6ujL8Wl/Tn701xwAtydeXevNXFyYyL/cVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D36DF804D0;
	Thu, 16 Jun 2022 06:03:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A67D7F800D3; Thu, 16 Jun 2022 06:03:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE50F800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 06:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE50F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="T8U3o2P2"
Received: from localhost.localdomain (unknown [123.112.64.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E20A43FABE; 
 Thu, 16 Jun 2022 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1655352201;
 bh=BIaL5YjhwvSOZWDibG4N3YPkaqSYs7Yh93PRwqDEZ1c=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=T8U3o2P21PihFinPNCa5yF5mTO5YlZlotnJ2fe8OkahHJHw3weYMHcFMrNRLgGtNR
 r6DcbxgluesDzjFKBYGlhyrfLEJ0IC6OmbF2LF7ajB75pJKvy4H/tGWEh5p4DS+qO6
 Yokuww6KBsWwka0W8VNu4FYSjDnhFcwxP/K0mT65OLV9zpC04FInRDhKTCMOCJcERe
 TcREiViwXturTDLLxOEyJI9cDFwkDNXuWPAs+yJ/qmm9pk6UbwcknrrEK+A+ZaF9hF
 RQ1N7nS2KqZcZa8v046P/3DWwhSXHAWsOQvwz3kg5IkXeXae1CShNVC9/0LOy8HEYZ
 l+50u0j18QVfw==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: bindings: fsl-asoc-card: add compatible string for
 nau8822 codec
Date: Thu, 16 Jun 2022 12:00:46 +0800
Message-Id: <20220616040046.103524-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616040046.103524-1-hui.wang@canonical.com>
References: <20220616040046.103524-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: shengjiu.wang@nxp.com
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

The nau8822 codec is used on an imx6sx EVB.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 8b4f4015cfe4..4e8dbc5abfd1 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -46,6 +46,8 @@ The compatible list for this generic sound card currently:
 
  "fsl,imx-audio-wm8958"
 
+ "fsl,imx-audio-nau8822"
+
 Required properties:
 
   - compatible		: Contains one of entries in the compatible list.
-- 
2.25.1

