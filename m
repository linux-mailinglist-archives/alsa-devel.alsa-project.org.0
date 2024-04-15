Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F28728A492F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:38:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0A014E3;
	Mon, 15 Apr 2024 09:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0A014E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713166697;
	bh=TVphkgPIbaKZ9UblBuJEkcSWMubdmdRr+kaRCEvWeqI=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oCgVMP9wgrUTz0//tHFdzSOz7nvVBS8MTtziUW0nRMxONblgutnhqt3rvSHwSTTOu
	 EnsYD6EwFATd1d8lA/LgRqms1i9vgi/qrmzXyagE2lEuDSdOMhWCeZzzr8CHpcKV0T
	 mIusywWB3R3jV/WiS2WetsVM+pBdoKmiLBMUQgP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D41AF80587; Mon, 15 Apr 2024 09:37:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5419F8057F;
	Mon, 15 Apr 2024 09:37:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6110AF80494; Mon, 15 Apr 2024 09:36:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE762F80124
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE762F80124
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F7172001C5;
	Mon, 15 Apr 2024 09:35:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CCAFA2001C4;
	Mon, 15 Apr 2024 09:35:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DF879183ACAF;
	Mon, 15 Apr 2024 15:35:26 +0800 (+08)
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
Subject: [PATCH 0/2] ASoC: fsl-asoc-card: add wm8904 codec support
Date: Mon, 15 Apr 2024 15:17:34 +0800
Message-Id: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: ZD7XGB5UUESAHQWTSUZYBUOSJ52RTSWU
X-Message-ID-Hash: ZD7XGB5UUESAHQWTSUZYBUOSJ52RTSWU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZD7XGB5UUESAHQWTSUZYBUOSJ52RTSWU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

add wm8904 codec support in fsl-asoc-card.

Shengjiu Wang (2):
  ASoC: fsl-asoc-card: add wm8904 codec support
  ASoC: dt-bindings: fsl-asoc-card: Add compatbile string for wm8904
    codec

 .../devicetree/bindings/sound/fsl-asoc-card.yaml          | 1 +
 sound/soc/fsl/fsl-asoc-card.c                             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.34.1

