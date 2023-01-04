Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5365D4F0
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 15:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04E0B1AC;
	Wed,  4 Jan 2023 15:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04E0B1AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672841144;
	bh=rQbyRGIOjye6XpK3VIW9faCnu3RpMayfvgYRrYPUabw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Hb0vuvzprUAzyox2fuKYR1RWn1ZzXb3yjmKsCMCbySu+zx31yLdpJzqdgEs6GQ3Y0
	 lfdxmr8F5Q9LT8pJqyzCRvcmkRCfF+oDKlc7FrXN+wMvDorZAlPet/e+LwtnF3c+7r
	 +dgV4Zk/QN0eTXR3y8pudBmvtQf1qTwUnrAj5wrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D9FCF8023A;
	Wed,  4 Jan 2023 15:04:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6C2F8023B; Wed,  4 Jan 2023 15:04:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-08.comm2000.it (smtp-out-08.comm2000.it [212.97.32.78])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC05F80238
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 15:04:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC05F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=u0BlObqy
Received: from francesco-nb.toradex.int (31-10-206-125.static.upc.ch
 [31.10.206.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id B154F4233B5;
 Wed,  4 Jan 2023 15:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1672841074;
 bh=rQbyRGIOjye6XpK3VIW9faCnu3RpMayfvgYRrYPUabw=;
 h=From:To:Cc:Subject:Date;
 b=u0BlObqy+vqP7z9a1KVtY+kUuYCsKBinxLvXBDKDAiwDOeny5d898e6PmfyB+ldNx
 tyS+pfm60c3682PGIq2qzaXrQAbC+akwJBp/UR1WSOd0wD1vmU3oLgPMoskm6hlE3z
 LUS+V8q2UWLO6JVHIwbSISOddi3GLf5KhJQG/ZsrUHkyP9xqmEFMW4NVNvyHJihm2u
 MZKClDWVgsgBFo9nEkwxVNSNItwcrDYDzOf0QUjqSC1Xc9KHJrzReAirMCQrvUpy2q
 ZZFOvu72L933TOqdLn2S3Q8rwWWxoW7xhh/bbzhb4jJfwAVKh56PB+mP1d092I1dGh
 ixmNBGxvj9aQw==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: nau8822: add speaker Bridge Tied Output
Date: Wed,  4 Jan 2023 15:04:09 +0100
Message-Id: <20230104140412.35575-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for BTL (Bridge Tied Load) configuration to NAU8822 audio codec,
since this requires adding a new property to the binding convert it from
txt to yaml first.

v2:
 - added Krzysztof reviewed-by and acked-by
 - removed non-relevant information about SPI not being supported from binding document

Emanuele Ghidoli (3):
  ASoC: dt-bindings: nau8822: convert to the dtschema
  ASoC: dt-bindings: nau8822: add nuvoton,spk-btl property to dtschema
  ASoC: nau8822: add speaker Bridge Tied Output configuration

 .../devicetree/bindings/sound/nau8822.txt     | 16 -------
 .../bindings/sound/nuvoton,nau8822.yaml       | 46 +++++++++++++++++++
 sound/soc/codecs/nau8822.c                    | 10 ++++
 sound/soc/codecs/nau8822.h                    |  9 ++++
 4 files changed, 65 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8822.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml

-- 
2.25.1

