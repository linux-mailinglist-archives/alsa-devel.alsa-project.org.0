Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF2764E1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 13:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FFCF202A;
	Fri, 26 Jul 2019 13:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FFCF202A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564141775;
	bh=fe85+KYDpxeKK/6QXnkF7tGvjYCcWshGUc52tTNNAx8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSW6OVPzR88+EuDS4KmDFuko+C8V30HJMeDEOswPTCi7HgY9qC2KuEvZEoUGeCeUA
	 aKeuDudYVRp6T2QBlblb428hsfxNUQALY6VASiwnTMckR4xFnYaOfO131Zm6x3OCUO
	 otKqOg7PSJkV6xUA619sP5ATUDSuS3VptZ7jrSkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA22BF803D1;
	Fri, 26 Jul 2019 13:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 944E2F800E8; Fri, 26 Jul 2019 13:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25FCAF800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 13:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25FCAF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="qPS1241m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Phy5XDngETsW9sBLZfyPtiYDuQsve7+De1x9Fhgug7E=; b=qPS1241mP7CmquAYyyjjhRqEDl
 OeVd3gYIpPZPhWDL4ctOtVPSTtF2i3Ar/G1t5xhU3CjfFWWgU4pMEBKsxQa0KS1yMr+DpAx0UlI1P
 7OiI507/7BvLOXkjUaa2yXHhxI9cSFnUpd7sacZKwPbBbdDdm+5IpawMBYmWkHRjFdlf3wHTv648x
 ip7iqBzRd10KZV4Hfi4ARMhpHn16qMckelpf/DWZcLfvqMW4z0b/GC9/DZVx5YyLBlcw5fSPjMusn
 doWB23uRH6/Tx3fmShV5DmC5W6h5SKeeR8j1S0OVVfPr7uh5yJqOZ6i2zF9KWUKFYA61HjBzNOJ4i
 agiUUhiA==;
Received: from [179.95.31.157] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqyh9-0003Bd-8h; Fri, 26 Jul 2019 11:47:31 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hqyh7-0000uJ-4z; Fri, 26 Jul 2019 08:47:29 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: 
Date: Fri, 26 Jul 2019 08:47:27 -0300
Message-Id: <9932608f32030c886d906ea656eda8408c544776.1564140865.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564140865.git.mchehab+samsung@kernel.org>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 7/7] docs: dt: fix a sound binding broken
	reference
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

Address this rename:
	Documentation/devicetree/bindings/sound/{sun4i-i2s.txt -> allwinner,sun4i-a10-i2s.yaml}

Fixes: 0a0ca8e94ca3 ("dt-bindings: sound: Convert Allwinner I2S binding to YAML")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
index 2ca3d138528e..7ecf6bd60d27 100644
--- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
+++ b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
@@ -4,7 +4,7 @@ Allwinner SUN8I audio codec
 On Sun8i-A33 SoCs, the audio is separated in different parts:
 	  - A DAI driver. It uses the "sun4i-i2s" driver which is
 	  documented here:
-	  Documentation/devicetree/bindings/sound/sun4i-i2s.txt
+	  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
 	  - An analog part of the codec which is handled as PRCM registers.
 	  See Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
 	  - An digital part of the codec which is documented in this current
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
