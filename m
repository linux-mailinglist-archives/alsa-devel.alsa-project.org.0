Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E87490974
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 14:23:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7070817E8;
	Mon, 17 Jan 2022 14:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7070817E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642425829;
	bh=2RICMHQrkMO5zSBVKKX/QOjg/XRPM2S1SVfQ0XJNulQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hx3VoQVGW+XKJUxTotY11bIpwpCDcQzjP9GwJSPuR7LF386GTCkhdOHsTlh4bN/4N
	 nnwtjAnoO/ES+v8ck1sPapokzSM7AqkC8l24A/9j2VR2BD3n566sieOkeN+IOdyTxG
	 C62nn0gr0ivEhWAWzfsWxCr8VW8u1zlTlfwS4Cq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7BD4F8051B;
	Mon, 17 Jan 2022 14:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A32F80515; Mon, 17 Jan 2022 14:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7DEF80515
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 14:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7DEF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="oEQdFHQ7"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 95D491F439DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642425704;
 bh=2RICMHQrkMO5zSBVKKX/QOjg/XRPM2S1SVfQ0XJNulQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oEQdFHQ7mDOuvcs28VptPlgKC63qEcN4K/a7qlzScErykt3VxA7ufhYxjG6hLuGf5
 WMTnRI6Rf1Q5SCT1ISMXt2FzfFBFIsXmjLemoIo2iBdPJh5Wl2Ho/9nEd9hAKW7/BA
 wem4IXfFCZZB/GoKsYHWLIgrwQayvIXgXFQia0rfyI/rXPkTomguAOJpys9imvaXXV
 k52OJBg0UW8eKM7WuoneSA6LklK7a10IMl7ilp1TjIpY5Pfv6Q9TruYNKUoyjJH9fd
 CzXdcKYzphUpcWnI69TNMVdLkiYWcyOsGAILeeVX6T4l1NmtgfkzhBtLrlIeC7FcA4
 ZbQMGNkG/YzCQ==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/5] ASoC: bindings: fsl-asoc-card: Add mclk-id optional
 property
Date: Mon, 17 Jan 2022 10:21:07 -0300
Message-Id: <20220117132109.283365-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

Support setting the sound card main clock input from the device-tree
using the mclk-id property.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 23d83fa7609f..b219626a5403 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -82,6 +82,7 @@ Optional properties:
   - dai-format		: audio format, for details see simple-card.yaml.
   - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
   - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
+  - mclk-id		: main clock id, specific for each card configuration.
 
 Optional unless SSI is selected as a CPU DAI:
 
-- 
2.34.1

