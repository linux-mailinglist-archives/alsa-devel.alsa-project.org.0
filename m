Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47622797159
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 11:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE4583A;
	Thu,  7 Sep 2023 11:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE4583A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694080603;
	bh=/da8tVv3EeWQ/u8FEIpgk9inkudV/aJzn0hoy1LwzqQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h8boMB4m2aqkSQYvvOfI67Y2DF1ImyMQ13WTN+iNrsGpG9awfy4CF6coifrJVNyZE
	 4ZuMHQDRLuELS4REByV0ZMpQaX7tG6FLkMBu+eCX7M4CmuGS+SAU6hx7m+jT0ZLEWJ
	 ETRi0VObku0dYGpiaVi3GimhAvAobkiRsulyY5WU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F28F800F5; Thu,  7 Sep 2023 11:55:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F8EF8047D;
	Thu,  7 Sep 2023 11:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 398D2F804F3; Thu,  7 Sep 2023 11:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21B3FF800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 11:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B3FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256
 header.s=dc header.b=HPx166wi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WtCoctKqrOuNL7YPM9mYObCf6Hdm7ApMb7s6UV96VRg=;
  b=HPx166wijMpi0SuqjYCYznd1XBpiCUbrQLc/PO/UMyEq3ZEUYTobIRDo
   3Rqqz8tTf3ziWlg9eiO0gtAOEfHBNxrgu+g1iTCYRdavySvFpyxmeL4HB
   GFAsE9lOiSmMbIKRRI/H8INxUF7Ej0oMCIoW7c5cwML7MMfndJw9rsVW5
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600";
   d="scan'208";a="65324651"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:29 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>,
	Amit Kucheria <amitk@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-mmc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 00/11] add missing of_node_put
Date: Thu,  7 Sep 2023 11:55:10 +0200
Message-Id: <20230907095521.14053-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WDMMPIFSWUHLDOHJUWNILRCZEK3R3UBU
X-Message-ID-Hash: WDMMPIFSWUHLDOHJUWNILRCZEK3R3UBU
X-MailFrom: Julia.Lawall@inria.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WDMMPIFSWUHLDOHJUWNILRCZEK3R3UBU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add of_node_put on a break out of an of_node loop.

---

 arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
 arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
 arch/powerpc/platforms/powermac/smp.c                |    4 +++-
 drivers/bus/arm-cci.c                                |    4 +++-
 drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
 drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
 drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
 drivers/soc/dove/pmu.c                               |    5 ++++-
 drivers/thermal/thermal_of.c                         |    8 ++++++--
 sound/soc/sh/rcar/core.c                             |    1 +
 13 files changed, 46 insertions(+), 14 deletions(-)
