Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B78C0A14
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 05:19:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5F7E68;
	Thu,  9 May 2024 05:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5F7E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715224766;
	bh=FEu9+pGrH6Ue95etWUKSQKyGUULlshNpk9Nh/JCzfmQ=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KBp5gmFcLYjKk93Ep/kvXCcv1BzS40HdOR4kBaz3PJQg1XWQVoP3aE4taQMEjqaip
	 zxqdy8FLR3ELurb4xYzIm3ArAKhJN2sKDACOmiInQUNJvNtnOY52qiL+hEwTbtkp/J
	 WOlhXAnpO1nc9F+WgZSeJMjzbX0K7UYorEOImQDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA44F805AC; Thu,  9 May 2024 05:18:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9E61F805A8;
	Thu,  9 May 2024 05:18:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2544DF80563; Thu,  9 May 2024 05:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA635F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 05:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA635F8024C
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 505D9200AAA;
	Thu,  9 May 2024 05:18:38 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 03CDD2007D5;
	Thu,  9 May 2024 05:18:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id CEF81180222F;
	Thu,  9 May 2024 11:18:35 +0800 (+08)
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
Subject: [PATCH 0/4] ASoC: fsl_xcvr: Support i.MX95 platform
Date: Thu,  9 May 2024 10:57:36 +0800
Message-Id: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: 6UQ5VNXEIFPVAM4NLSVB42RIDCMELYWJ
X-Message-ID-Hash: 6UQ5VNXEIFPVAM4NLSVB42RIDCMELYWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UQ5VNXEIFPVAM4NLSVB42RIDCMELYWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On i.MX95 wakeup domain, there is one instance of Audio XCVR
supporting SPDIF mode with a connection to the Audio XCVR physical
interface.

Shengjiu Wang (4):
  ASoC: dt-bindings: fsl,xcvr: Add compatible string for i.MX95
  ASoC: dt-bindings: fsl,xcvr: Add two PLL clock sources
  ASoC: fsl_xcvr: Support reparent pll clocks for phy_clk
  ASoC: fsl_xcvr: Add support for i.MX95 platform

 .../devicetree/bindings/sound/fsl,xcvr.yaml   |   7 +
 sound/soc/fsl/fsl_xcvr.c                      | 128 ++++++++++++------
 sound/soc/fsl/fsl_xcvr.h                      |  91 +++++++++++++
 3 files changed, 183 insertions(+), 43 deletions(-)

-- 
2.34.1

