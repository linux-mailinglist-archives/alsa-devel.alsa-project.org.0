Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A646AE1FD
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:16:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ADE01475;
	Tue,  7 Mar 2023 15:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ADE01475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198584;
	bh=7PyrBh6T5Lkf14rrvmOSB1ef8O/Ep9JP/RpLtPDh67A=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=bovRnTUfxsybW5P7AyNh5sY793IcDQ4Asy8kQ5yutyNmTInFjg+U0Q+vu0DJHINih
	 znIVjxQ2NlOj6fkX2bZdhaPkaiULUMEnl2cnbfIp+Y2G0iiulJi1iB5tFDe4fcf9tB
	 g2cC9gZOKh7iu2uVvXBlZfMOY4gnyoDu2b/01YcA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2FDF80236;
	Tue,  7 Mar 2023 15:15:33 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/3] Fix the PowerQUICC audio support using the QMC
Date: Tue,  7 Mar 2023 15:15:00 +0100
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDYVLPLI6N7KNFQGOJPYVEKFPDK4FRYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167819853204.26.13858134245652058914@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAC07F8042F; Tue,  7 Mar 2023 15:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8742CF800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8742CF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N8l72tsW
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 1D0CB10001D;
	Tue,  7 Mar 2023 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678198526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TroEz27wSqUZ40T3hjcBwjx8v3Ktx9rBSE/61eZDZtI=;
	b=N8l72tsWCIEJS91MPLTyLmuiZYcZWigc7Rfx1cvouryTxhJusO3Jbv5HS6cmngwWTIZEbR
	QoR1VFWjY8jUsL9fB8o/Oh0g5b0NkRfjO3digjSKxH2YYU7ogl0I6zhLooz5mQEu2TBa+N
	6QT2p1FrxqMPUArCM5CH2488I5tn22EiYWviQho1zO6Edh08YNmqmaIsu5gligNl/M7H2Q
	5VtiC3uRkm5oYj+A0rLJUM5TDFtsUr3lNeCi8X+5LcQnDu49XntlbMEPWNd0eVRXyQQreJ
	8c8gE6fgZM19nfKZgjmJHpClYfae7c5AX/fUASmeH7UTmNiRMj8UcpBTC2eMag==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/3] Fix the PowerQUICC audio support using the QMC
Date: Tue,  7 Mar 2023 15:15:00 +0100
Message-Id: <20230307141503.159766-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TDYVLPLI6N7KNFQGOJPYVEKFPDK4FRYU
X-Message-ID-Hash: TDYVLPLI6N7KNFQGOJPYVEKFPDK4FRYU
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDYVLPLI6N7KNFQGOJPYVEKFPDK4FRYU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A previous series added the PowerQUICC audio support using the QMC.
The v6 version of this previous series was applied but some feedbacks
lead to a v7 version.

The v6 can be found here:
 https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codina@bootlin.com/
and the v7, here:
 https://lore.kernel.org/linux-kernel/20230306161754.89146-1-herve.codina@bootlin.com/

This 'fix' series is the incremental version of v6 -> v7 and can only be
applied on the Marc Brown's tree as the v6 patches it fixes are only
present on this tree.

Regards,
Herve Codina

Herve Codina (3):
  dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Remove unneeded property
  dt-bindings: soc: fsl: cpm_qe: cpm1-tsa: Remove unneeded property
  soc: fsl: cpm1: qmc: Fix assigned timeslot masks

 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 10 ----------
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml          | 10 ----------
 drivers/soc/fsl/qe/qmc.c                               | 10 +++++++---
 3 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.39.2

