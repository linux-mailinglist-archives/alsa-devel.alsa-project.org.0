Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FBF3FB415
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 12:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79816171B;
	Mon, 30 Aug 2021 12:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79816171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630320578;
	bh=0csqc1ZbDXmIHRbQOhyIoXigMPaPkBz6pMKmCmRXOcA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z1xQg0/x8+YamCXoQhT0BFc1r9RWR9EsmcyTt04xFT57+T/9Fu3lzhxE9Hc8GFAY7
	 J37s74Ljsd+w2zSJ/D2WR4QCpgaYOTWcDLx6fNAhmlDQ3jBqieLOivmtxG0FNvtCNd
	 0u9/MYQHo1SpLJ/dvkSq2acU7IW6CxMRDGcU34ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAED1F80256;
	Mon, 30 Aug 2021 12:48:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E3D5F80218; Mon, 30 Aug 2021 12:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dnyon.com (dnyon.com [82.223.165.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E235F80169
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 12:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E235F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=dnyon.com header.i=@dnyon.com
 header.b="RuRGLtZm"
Received: from dnyon.com (45.74.222.87.dynamic.jazztel.es [87.222.74.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dnyon.com (Postfix) with ESMTPSA id 8F7C640442;
 Mon, 30 Aug 2021 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dnyon.com; s=mail;
 t=1630320491; bh=0csqc1ZbDXmIHRbQOhyIoXigMPaPkBz6pMKmCmRXOcA=;
 h=From:To:Cc:Subject:Date:From;
 b=RuRGLtZmWZEbZSqXziYuHTi4c328X/G+cL4SX1UfhpSWYq+O3dPllp7twYJc4K6Sp
 XlRysrCA6j/VNMipnwL6oijEszJghvVMrJhqbI8jOayZ0pBB8ot9GjuotF6XBtKUB6
 UVlDhwgVhSRv5p/Os2g/7IVE8dyWkJxXOHa/Nk5BDBjBcWrTezscY9Tw5/xmLPaPIv
 Vd4ciwZiH/AZqe5nZiZ2IYhBdQ3QfVJlH2IYLeVBD98WAfygcI5hKlPyCOnfv9ouGl
 jvT7JmmrNVYmarDc2PuiEC5cUBxbosCncO1ANHbdg9vFDc6xwcVF8HHT1EDqoBdpNr
 1fPR7EqBdVEUw==
From: Alejandro Tafalla <atafalla@dnyon.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] Add reset-gpios handling for max98927
Date: Mon, 30 Aug 2021 12:44:22 +0200
Message-Id: <20210830104426.487246-1-atafalla@dnyon.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Alejandro Tafalla <atafalla@dnyon.com>
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

The max98927 codec on some devices (i.e. Xiaomi Mi A2 Lite phone) require
hardware-resetting the codec by driving a reset-gpio. This series add
support for it through an optional reset-gpios property.

Alejandro Tafalla (2):
  ASoC: max98927: Handle reset gpio when probing i2c
  dt-bindings: sound: max98927: Add reset-gpios optional property

 .../devicetree/bindings/sound/max9892x.txt        |  3 +++
 sound/soc/codecs/max98927.c                       | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

-- 
2.32.0

