Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0937050A0B8
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 15:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BF318DF;
	Thu, 21 Apr 2022 15:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BF318DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650547430;
	bh=6Qa/nOY82DN2LGwd4MccZx5hJk7l6gXPuRwJRlA6WbU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s9nlL11OWQ/0SW66jhEATeW23BruKjV9b4NtJCmqM8Bpb00FRllTfV6z0mIl8tl2F
	 z3WZJ4n3n+fGJEoXsJXP6uc3k5M8mXmGhMlRAk0BTbFcW6kGn84WqEGxtBgwkCkYCU
	 lBhRCOxNwJPLOUXbL6Fm/4i9HMt7Yio1kn7Tbz3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3B5F8047D;
	Thu, 21 Apr 2022 15:22:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29C38F800F4; Thu, 21 Apr 2022 15:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2E7CF800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 15:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E7CF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tHLYUDRh"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LDMiEr065593;
 Thu, 21 Apr 2022 08:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650547364;
 bh=+VFNKTAB//MK7xlNT2KoS5a+qBg4nty6a/x60XARYSI=;
 h=From:To:CC:Subject:Date;
 b=tHLYUDRh+vWYFzDw9cv/KdLVilVf0Qn4sYDQiIWFtyrJokKJSDZBrOShMlLDiWhCu
 OWzsIFatrpbncf6ZWc18pOvCzsqcSWehT+ViEDwHh+FLGuFj7q1HC6ZQRUZRiCudxh
 1Sl/zIuYZOtCfg7CyLNuQXALmCEjLUFFnxRF2w0Y=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LDMisi072033
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 Apr 2022 08:22:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 08:22:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 08:22:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LDMh27017103;
 Thu, 21 Apr 2022 08:22:43 -0500
From: Jai Luthra <j-luthra@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jayesh Choudhary
 <j-choudhary@ti.com>
Subject: [PATCH 0/3] Enable audio output on AM62-SK
Date: Thu, 21 Apr 2022 18:52:21 +0530
Message-ID: <20220421132224.8601-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jai Luthra <j-luthra@ti.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch series adds support for audio output via headphone jack on the 
AM62-SK board. The jack is wired to TLV320AIC3106 (codec), which is 
connected to McASP (serializer).

The same 3.5mm jack can be used for combined playback+recording, but audio 
input is currently disabled on McASP until further testing and debugging.

Please apply this series on top of 
https://lore.kernel.org/all/20220415131917.431137-1-vigneshr@ti.com/ 

Jai Luthra (1):
  arm64: dts: ti: am625-sk: Add audio output support

Jayesh Choudhary (2):
  arm64: dts: ti: k3-am62-main: Add McASP nodes
  ASoC: ti: davinci-mcasp: Add dma-type for bcdma

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 51 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-sk.dts   | 89 ++++++++++++++++++++++++
 sound/soc/ti/davinci-mcasp.c             |  2 +
 3 files changed, 142 insertions(+)

-- 
2.17.1

