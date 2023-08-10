Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BEF778862
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54BA7829;
	Fri, 11 Aug 2023 09:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54BA7829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691739612;
	bh=LHd99ZAEAk14RHMHg7apnTB74/78w1nDI7S3rnKELzI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pqM28VH+54x4zW06PHQ8XFZ08pXfOESXm5LqIqM92RnM3z80kVP3JWxxRhKe8rZpo
	 cs2CpTouFoZc456P/YLmtH1DMisylY7qk+jVgSpQ25/zAbYqbyKsZsg5ApgJlmSvw/
	 IcTOYxpUEitcuLkSDjQFDCQYgA4c2AfCBumHSL18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DE28F80134; Fri, 11 Aug 2023 09:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3801F80134;
	Fri, 11 Aug 2023 09:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A63CF801EB; Fri, 11 Aug 2023 00:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-83.mta1.migadu.com (out-83.mta1.migadu.com
 [IPv6:2001:41d0:203:375::53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F40D4F800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 00:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40D4F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=jookia.org header.i=@jookia.org header.a=rsa-sha256
 header.s=key1 header.b=YaL7y1P7
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691707778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PSP4YBxo8D6m3XZCk4VYqj+oPk1gw7bx7s64DSVlKUQ=;
	b=YaL7y1P7Ilsu4wJJ4m5+dVAfhcGn45SVAuDhFrneAsrrW8XTGYmRBcTgk5UEjCJegNEAOk
	Y8iyz9l9ZfPGkdMOshA2ap1l3Q4YizcEqq8tLO0soHkyVLqoHtp/KKfuciEe1vosleWm1k
	ilsOLcoGVqeLnVYY1nBksK5X1P5XZVEpysZTmWqgYJRd4BQ+H1+C70jcOApmyO/f7WThO3
	Aq4rB+OFo5jUcrt3z8jnduHxOTysTcHrGh6XuqCYzYXsztTdHraQBdjJ4282mB9BfrBCJ6
	vaQeDkB0uWMLNH4QM261dAkPK1QMVHLggVoyH4h8RAwleJKfOAac7HMoR8Pu2w==
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
Subject: [PATCH 0/3] ASoC: wm8782: Allow higher audio rates
Date: Fri, 11 Aug 2023 08:49:27 +1000
Message-ID: <20230810224930.3216717-1-contact@jookia.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-MailFrom: contact@jookia.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WG4W5XDSQGERJB2TOSXDAGJ2LRGTZRON
X-Message-ID-Hash: WG4W5XDSQGERJB2TOSXDAGJ2LRGTZRON
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:39:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WG4W5XDSQGERJB2TOSXDAGJ2LRGTZRON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wm8782 supports higher audio rates than just 48kHz. This is
configured by setting the FSAMPEN pin on the codec chip.

This patch series introduces the 'max-rate' device tree property
to allow indicating which rates are fully supported by the codec
without accidentally overclocking.

John Watts (3):
  ASoC: wm8782: Handle maximum audio rate at runtime
  ASoC: wm8782: Use max-rate device tree property
  ASoC: dt-bindings: wlf,wm8782: Add max-rate property

 .../devicetree/bindings/sound/wm8782.txt      |  2 +
 sound/soc/codecs/wm8782.c                     | 49 ++++++++++++++-----
 2 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.41.0

