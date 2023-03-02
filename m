Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E26ACAD0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 835FE1146;
	Mon,  6 Mar 2023 18:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 835FE1146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124429;
	bh=K+F0zEoOni4QYu/KLFW2VjlpSBy/WKzy7blh66XCPzs=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lgyROljuMvWAvWBts945nyYEtQ4niwrYny7rFOOTIVkrm7+gWAIzjC8ySw6bzVqc2
	 3ZaTclBUNtzP/9OdZwK5xZkqsWPUd+TXzQ+ud3xaGag37hmgJbqCTMYubQ999Mv2kI
	 Lu4KuPAPqt7b1FaiKUhrwu8rCtD4JSA4KsWj7KpM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F79BF80527;
	Mon,  6 Mar 2023 18:38:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AC6CF8049C; Thu,  2 Mar 2023 12:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from out-23.mta1.migadu.com (out-23.mta1.migadu.com
 [IPv6:2001:41d0:203:375::17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 168F4F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 12:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 168F4F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=PEgtSEKv
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677758239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qsZyZ7PXvZbQBk4eGYRvHjkNl0k+LhGMBIeZUd7Jv4A=;
	b=PEgtSEKvtKfASJar6LgW/Ka8GyNSWdi+f0JfSINgyXld74M/kqeAo4eu15KN9yTF+v2CwN
	7DOQEgUCeMKPeJLW4MkXzhjUGSMoV87mcu4H1doWnctIFD494OBGPHcjoo4S/hpyC9MP48
	lcQYq4XVdncPI6AzjUmXnH8fr7mQTvk=
From: richard.leitner@linux.dev
Subject: [PATCH 0/3] Add "mclk" support for maxim,max9867
Date: Thu, 02 Mar 2023 12:55:00 +0100
Message-Id: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSOAGQC/x3NQQ6CQAyF4auQri0OxSB4FeOiA1UadTRTMGMId
 3dw8RZ/8iVvAZOoYnAqFojyUdNXyFHtCuhHDjdBHXIDOapd7QifnLq2OeKhc22Vx8QesvZsgj5
 y6MfN210Hnnj/0DAnbEoqv5t6R7lq+v+dL+v6A6U1NbR/AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=K+F0zEoOni4QYu/KLFW2VjlpSBy/WKzy7blh66XCPzs=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFIY+iVe7uS991BX5X3YK0eN5L+nOOZsVyh/+9/+/Y4WucyY
 nwcbO0pZGMS4GGTFFFnsjbna3XPL3lcq6uTCzGFlAhnCwMUpABO5c4ORYZf+msWB5h39zsc2RcRN/O
 SpmvaBlS3Wp9HhWUTsdImJ9YwMX6duTVERyP/7/orHK1n79TKxcxd6cm5lrl5qVm85i2ExMwA=
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XUZQ753BBFE2BAH6US7FVMJJJMQEULYJ
X-Message-ID-Hash: XUZQ753BBFE2BAH6US7FVMJJJMQEULYJ
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:44 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUZQ753BBFE2BAH6US7FVMJJJMQEULYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds support for the clocks and clock-names properties in
the maxim,max9867 bindings. Furthermore the binding definitions are
converted from txt to yaml.

The mclk property is needed for one of our boards which uses the the
i.MX8MP SAI MCLK as clock for the maxim,max9867.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Benjamin Bara (1):
      ASoC: maxim,max9867: add "mclk" support

Richard Leitner (2):
      ASoC: dt-bindings: maxim,max9867: convert txt bindings to yaml
      ASoC: dt-bindings: maxim,max9867: add "mclk" property

 .../devicetree/bindings/sound/max9867.txt          | 17 ------
 .../devicetree/bindings/sound/maxim,max9867.yaml   | 61 ++++++++++++++++++++++
 sound/soc/codecs/max9867.c                         | 14 ++++-
 3 files changed, 74 insertions(+), 18 deletions(-)
---
base-commit: c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
change-id: 20230302-max9867-49081908a2ab

Best regards,
-- 
Richard Leitner <richard.leitner@skidata.com>

