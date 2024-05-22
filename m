Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A16D8CB9D2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 05:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E587826;
	Wed, 22 May 2024 05:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E587826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716348852;
	bh=VtW7mWc78r/BBEDArrKEb/OrAquOD6TeXurMZtE5JCU=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=T9yJoFNLEOjzy067R7Ctb94d/aNGokNlCi0pEFSVGptn1RlE8BySw0zSUfVPDU5Jq
	 XAPs+1t1BauDybMu/RDt7UKVaBcEUax1HExucwlTzTbHcKqFAqfydALbWppZES9S6g
	 /cA6AEFytxXSGDWgPDlmOLjKv880xhHdkO/flIE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89005F80051; Wed, 22 May 2024 05:33:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 912BCF805A8;
	Wed, 22 May 2024 05:33:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B87BFF800BA; Wed, 22 May 2024 05:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34EDCF8020D
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 05:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34EDCF8020D
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DFC95200E7C;
	Wed, 22 May 2024 05:28:09 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A4CFD200E80;
	Wed, 22 May 2024 05:28:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ADD56180226C;
	Wed, 22 May 2024 11:28:07 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] ASoC: fsl_mqs: Add i.MX95 platform support
Date: Wed, 22 May 2024 11:08:23 +0800
Message-Id: <1716347305-18457-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: KIVQBGZCT5K5UJBHBNFJL6GZL6ZF6XM4
X-Message-ID-Hash: KIVQBGZCT5K5UJBHBNFJL6GZL6ZF6XM4
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIVQBGZCT5K5UJBHBNFJL6GZL6ZF6XM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are two MQS instances on the i.MX95 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

changes in v2:
- remove "fsl,mqs-ctrl" property
- use two compatible strings to distinguish two instances

Shengjiu Wang (2):
  ASoC: dt-bindings: fsl,mqs: Add i.MX95 platform support
  ASoC: fsl_mqs: Add i.MX95 platform support

 .../devicetree/bindings/sound/fsl,mqs.yaml    |  2 +
 sound/soc/fsl/fsl_mqs.c                       | 46 ++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.34.1

