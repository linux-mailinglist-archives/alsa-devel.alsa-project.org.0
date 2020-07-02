Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F1212635
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 16:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5299216EB;
	Thu,  2 Jul 2020 16:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5299216EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593699924;
	bh=6ZfEJM3ortBa+zJ0KKQKMob/UebfTJox7PxN/JV+Yg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvKPr9MdNA88NXv/HiQDM1Ckl8Ne4B7ejqTdgqOVtTT1B7cVef3yxALJXYO2ZKI4d
	 xvGH1yCPkVUxSkXEtM9T6ExMmmTmU36h8mLD4+GhivNFXa/IHsSIgJvbLh32yupBZQ
	 IQijg0KgJrqGH0xPbf6q4EUeTiGJCO4emfPbR3uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D126AF80247;
	Thu,  2 Jul 2020 16:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB83CF8028F; Thu,  2 Jul 2020 16:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6154F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 16:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6154F80134
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B97AB2A1D11;
 Thu,  2 Jul 2020 15:23:04 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 1/4] dt-bindings: sound: fsl,
 asrc: add properties to select in/out clocks
Date: Thu,  2 Jul 2020 16:22:32 +0200
Message-Id: <20200702142235.235869-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

The ASRC peripheral accepts a wide range of input and output clocks, but
no mechanism exists at the moment to define those as they are currently
hardcoded in the driver.

This commit adds new properties allowing selection of arbitrary input
and output clocks.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 Documentation/devicetree/bindings/sound/fsl,asrc.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
index 998b4c8a7f78..e26ce9bad617 100644
--- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
@@ -55,6 +55,12 @@ Optional properties:
 			  Ends, which can replace the fsl,asrc-width.
 			  The value is 2 (S16_LE), or 6 (S24_LE).
 
+   - fsl,asrc-input-clock	: Input clock ID, defaults to INCLK_NONE
+				  (see enum asrc_inclk in fsl_asrc.h)
+
+   - fsl,asrc-output-clock	: Output clock ID, defaults to OUTCLK_ASRCK1_CLK
+				  (see enum asrc_outclk in fsl_asrc.h)
+
 Example:
 
 asrc: asrc@2034000 {
@@ -77,4 +83,6 @@ asrc: asrc@2034000 {
 		"txa", "txb", "txc";
 	fsl,asrc-rate  = <48000>;
 	fsl,asrc-width = <16>;
+	fsl,asrc-input-clock = <0x3>;
+	fsl,asrc-output-clock = <0xf>;
 };
-- 
2.27.0

