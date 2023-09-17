Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A367A36E3
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Sep 2023 19:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E76DA1E0;
	Sun, 17 Sep 2023 19:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E76DA1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694972323;
	bh=P/I85reyqagYHLYDBw7tUEOofDIR0sGdBNr3gVr3tPI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=goR8Y3/7tyuqYR78EzNU2FMRH2uyiK9e9JseTKKzkntZAI4d6MbodDrG5ARmVVhVg
	 fXQi+Cmy0TaHqrXlaWPHxlUxLmk5YmQoWO/xGF4gzOypO+IPsqPl0AFBK5SLqQxdSI
	 DW1+3easSGRQdJK7omQ4Wwo08QizoppoG3KSrL/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67E28F8047D; Sun, 17 Sep 2023 19:37:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03025F801D5;
	Sun, 17 Sep 2023 19:37:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77005F801F5; Sun, 17 Sep 2023 19:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-215.mta1.migadu.com (out-215.mta1.migadu.com
 [IPv6:2001:41d0:203:375::d7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41B88F800F4
	for <alsa-devel@alsa-project.org>; Sun, 17 Sep 2023 19:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B88F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=Hx+AGSSU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694972257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cothmr+77o5e2+4r9KfUSFxuV8BjV2N0LakyRZnqIAM=;
	b=Hx+AGSSUKxqQRB0EAhnk2jNtrY8DxlBBs4gWDHSw3BGOuKmiXCAzH93LkH3bl/8Tj2p7RM
	oqBdX7ALk9Pagk5qFr0uOR5fLkqlailnskw8WzyHDuPpXciVsq/+Qgwa2HEpXzDOcWDY+F
	WoJO80mhaMOaDfv0ILZx4pm+vXLYQnbm+WJmbfb0GMQ/Kaj/EpTdT7336m3FVbVqdL+zAk
	+DA/TY1SdQLjsfDrPZUP9nlN4vPUGGhPWnvkI9zKVyqf/9U1LD1tTs4jxR6uTCR//hnCcV
	Z0gZu2zKAF4mbf88Tk/cSAGiZvJS7pyutsdmQ07E3rfI2shF3cRVDp/Q4RiHIQ==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] ASoC: wm8782: Allow higher audio rates
Date: Mon, 18 Sep 2023 03:37:23 +1000
Message-ID: <20230917173726.1916439-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: UIZCHQ6XYOUFNU7K7A6M2FK3ZJMK52GU
X-Message-ID-Hash: UIZCHQ6XYOUFNU7K7A6M2FK3ZJMK52GU
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIZCHQ6XYOUFNU7K7A6M2FK3ZJMK52GU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8782 supports higher audio rates than just 48kHz. This is
configured by setting the FSAMPEN pin on the codec chip.

This patch series introduces the 'wlf,fsampen' device tree property
to indicate the pin status and control the maximum rate available
when using the codec.

v2 -> v3:
- Rate is now properly constrained using ALSA constraints

v1 -> v2:
- Switched from max-rate property to wlf,fsampen property
- Clarified property is optional, not required

John Watts (3):
  ASoC: wm8782: Constrain maximum audio rate at runtime
  ASoC: wm8782: Use wlf,fsampen device tree property
  ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen property

 .../devicetree/bindings/sound/wm8782.txt      |  5 ++
 sound/soc/codecs/wm8782.c                     | 63 +++++++++++++++----
 2 files changed, 55 insertions(+), 13 deletions(-)

-- 
2.42.0

