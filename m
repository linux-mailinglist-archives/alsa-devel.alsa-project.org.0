Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAB6ACAFF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:45:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471A0117F;
	Mon,  6 Mar 2023 18:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471A0117F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124713;
	bh=lABtBknjf+2ofJrshcscPhXS8qeqNM0qmvagAqkFnOk=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tDjJQIhIGzM4+RajnFVPEF1e/+DdFX5F0OYKbioaiTAhQQQbaJDOAxDBjBUtF0Mqc
	 U3JWmEtzWqW4SeYj/Ip8EBs0lsvixjzcFkvgRJvHb/XTSyGCxK57FbuDqE8YoEm1IQ
	 eKUpc4+olf4U0AyqRomt4oKmq11hmXuNxTOu3qLw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37EE0F80542;
	Mon,  6 Mar 2023 18:40:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A46BFF804B1; Fri,  3 Mar 2023 11:04:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-43.mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DDC2F800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 11:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DDC2F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=OfJurxfk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677837851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j5Z5sdd2BdV1dzkgQLa3P+giXSo0A/xE3te2w2iBryE=;
	b=OfJurxfk/AWSgt5hfN+ATcKhKO56sCye+5OBTGv3nRygs3ovkGc5hphUfMEtqVA56tEFdI
	DeEKltZQw7AmUpYSj2VW/DKssUkHfQ9PyZ9jJveLtr8dN3QK5+M1zEX60fSlLPUPRNZ4sY
	htIZI+afZuPrsFj8b+syDzsIBMm63r4=
From: richard.leitner@linux.dev
Subject: [PATCH v2 0/3] Add "mclk" support for maxim,max9867
Date: Fri, 03 Mar 2023 11:04:00 +0100
Message-Id: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDGAWQC/x3NQQ6CQAyF4auQri2OxSB4FeOiA1UadTBTMGMId
 3dw8RZ/8iVvAZOoYnAuFojyUdMx5KBdAd3A4S6ofW4gR5WrHOGLU9vUJzy2rjnkMbGHrD2boI8
 cumHz9tCeJ94/NcwJ65LK76beUW6a/n+X67r+APhLWa1/AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=lABtBknjf+2ofJrshcscPhXS8qeqNM0qmvagAqkFnOk=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFIYj0nyPtVfnbJEySEgtvrB0t6tNat3xJ2xFz2dvYIv7M4+
 m3r/jlIWBjEuBlkxRRZ7Y65299yy95WKOrkwc1iZQIYwcHEKwEQ40hgZ5hzI15rDvT3FPeaUW8iZNO
 uEmzklx85csV/IJWg+k13GieF/7j/1BCEGK627CjtfOk2/JZjEOd1hM2+4cny0hevVFE9+AA==
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XOOASL5S6O2TIBPCOLCNIFL44C5PME5W
X-Message-ID-Hash: XOOASL5S6O2TIBPCOLCNIFL44C5PME5W
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:40:31 +0000
CC: Benjamin Bara <bbara93@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOOASL5S6O2TIBPCOLCNIFL44C5PME5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds support for the clocks properties in the
maxim,max9867 bindings. Furthermore the binding definitions are
converted from txt to yaml.

The clock property is needed to define the mclk for one of our
boards which uses the the i.MX8MP SAI MCLK as clock for the
maxim,max9867.

ChangeLog:
v2:
 - dt-bindings:
  - add "additionalProperties: false" property
  - remove "clock-names" property
  - fix $id
  - fix example
 - max9867:
  - Enable and prepare mclk on SND_SOC_BIAS_ON
  - disable and unprepare mclk on SND_SOC_BIAS_OFF
  - drop "mclk" clock-name

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Benjamin Bara (1):
      ASoC: maxim,max9867: add "mclk" support

Richard Leitner (2):
      ASoC: dt-bindings: maxim,max9867: convert txt bindings to yaml
      ASoC: dt-bindings: maxim,max9867: add clocks property

 .../devicetree/bindings/sound/max9867.txt          | 17 ------
 .../devicetree/bindings/sound/maxim,max9867.yaml   | 66 ++++++++++++++++++++++
 sound/soc/codecs/max9867.c                         | 19 ++++++-
 3 files changed, 83 insertions(+), 19 deletions(-)
---
base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
change-id: 20230302-max9867-49081908a2ab

Best regards,
-- 
Richard Leitner <richard.leitner@skidata.com>

