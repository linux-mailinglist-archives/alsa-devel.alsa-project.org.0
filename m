Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BD6FF571
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 17:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 687A9EE0;
	Thu, 11 May 2023 17:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 687A9EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683817691;
	bh=N6qICPKs0gFERitcYpsAcY+hRoMimHDzdZsQ12fe6Y0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j11m/k1okjwQdyAdG2Z/zhDJeaAanbFMO+vqFVNlE3kB/k25VupB41i+II0elRB5S
	 l09QIGZJLfFb2wG1EQRYfgNez8CbZbkK5mfVqZaNldWYGk8X+hmS0lDKzB4sQgyogu
	 zTrEnbQvPEXg8l4OV/v0C3vbAeNzAg3DlJwNScNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 111B1F8055A; Thu, 11 May 2023 17:06:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF393F8014C;
	Thu, 11 May 2023 17:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81442F80534; Thu, 11 May 2023 17:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_FAIL,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3BACF8052E
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 17:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3BACF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=P1x6Sq/Q
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683817578; bh=Y2qYN0nC7/bpDhI5lh52Gv/GBqFV2U6L49sbpArIaKo=;
	h=From:To:Cc:Subject:Date;
	b=P1x6Sq/QWXxyw/DQe9YPNPoSdkxp3gNAje5YsQTKJK9YuvGSmHpH0+pTQjyPwBcV7
	 3iRYrof6f6FX/iaZDzYnPn4/p+ZxTf9AoP/8z8g+7eZoOvsAwMAfjY7v7wOWioZdjO
	 hTNAFj7t82mKLHdogP3SWd2BwouMsyK/RxIUBzEk=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC SSM3515 codec driver
Date: Thu, 11 May 2023 17:05:44 +0200
Message-Id: <20230511150546.8499-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H2K7C3UHVICGOSM4ESWW3SS2XQPC3XNO
X-Message-ID-Hash: H2K7C3UHVICGOSM4ESWW3SS2XQPC3XNO
X-MailFrom: povik+lin@cutebit.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2K7C3UHVICGOSM4ESWW3SS2XQPC3XNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Analog Devices SSM3515 is a simple speaker amp that Apple is
using in their 2021 iMacs, possibly elsewhere. This is a v2
of an ASoC driver for those, to be used with upcoming ASoC
support (in upstream kernels anyway) of those platforms.

Martin

Changes since v1:
https://lore.kernel.org/asahi/0fcc4617-e706-8743-e65d-1ff99f38ddac@linaro.org/T/#t
 - drop 'adi,ana-gain' from the binding
 - move device reset to bus probe
 - fix schema copyright, other schema tweaks

Martin Povišer (2):
  ASoC: dt-bindings: Add adi,ssm3515 amp schema
  ASoC: ssm3515: Add new amp driver

 .../bindings/sound/adi,ssm3515.yaml           |  49 ++
 MAINTAINERS                                   |   2 +
 sound/soc/codecs/Kconfig                      |   6 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/ssm3515.c                    | 448 ++++++++++++++++++
 5 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
 create mode 100644 sound/soc/codecs/ssm3515.c

-- 
2.38.3

