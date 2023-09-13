Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B6B79F038
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 19:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23D2886;
	Wed, 13 Sep 2023 19:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23D2886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694625427;
	bh=HmIE6g1MTK7UziarS4CimkTEySxK5WpM2bbqVxvWbwc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R6L9VSgeh2QBtjPJJFGOjs1Skc5cFlvBi7tBLbUmJQgi4uTlOrW4H8A5KLsU/U6oM
	 /VRVa+q1a/emK5MT7ww5HiqFQzY/whaU3OM5NNAzrbDUc0xAFC/OhFULVvVfRrcLTT
	 omVaKqbO/RnCz0soMF1hHptJ0ylsAS2BJCFRIvoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33301F80549; Wed, 13 Sep 2023 19:16:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD3EEF80425;
	Wed, 13 Sep 2023 19:16:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0030EF80212; Wed, 13 Sep 2023 19:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-226.mta1.migadu.com (out-226.mta1.migadu.com
 [IPv6:2001:41d0:203:375::e2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 162A9F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 19:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 162A9F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=MopDdj+z
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1694625361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VCy5Fm2ZbO6JXF49obe3yELdCB4LbYDYhIgHM9669eI=;
	b=MopDdj+zlz9nV8t6ZnIoNnxG2DgoGWJxW4X6tFEfIGfqeldt3QDA5A9focV3BTzgftWxu0
	tg7qLsc9XLXozEqHe71TBgD+tQ1tr8AA4AXvj3cLCEwfIslmO2/pSihOfl5Me2PR2nByN9
	F2Lq1jfD7j49idNUYIZVAZmcaWcFqNQRaCLgi4tZNJDwp7BW5azuHrGP6gvcGzAknJ0ctH
	XsAJkBVUBD4iki/fPv82AXwPiXwoCBooxo7sdy9zpx1o1TW+F2TITap21LSIp/L7cPOsaF
	L0obz0Xfpe1CxctwEil2y2dPZ7C2/ze6/OKxMp9MF7Uf83I+LBUq0LQYiZavOA==
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
Subject: [PATCH v2 0/3] ASoC: wm8782: Allow higher audio rates
Date: Thu, 14 Sep 2023 03:15:49 +1000
Message-ID: <20230913171552.92252-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID-Hash: VNMJOED55PU4QUR4AYLZLG2ZLKCFEYHA
X-Message-ID-Hash: VNMJOED55PU4QUR4AYLZLG2ZLKCFEYHA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNMJOED55PU4QUR4AYLZLG2ZLKCFEYHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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

v1 -> v2:
- Switched from max-rate property to wlf,fsampen property
- Clarified property is optional, not required

John Watts (3):
  ASoC: wm8782: Handle maximum audio rate at runtime
  ASoC: wm8782: Use wlf,fsampen device tree property
  ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen property

 .../devicetree/bindings/sound/wm8782.txt      |  5 ++
 sound/soc/codecs/wm8782.c                     | 66 +++++++++++++++----
 2 files changed, 58 insertions(+), 13 deletions(-)

-- 
2.42.0

