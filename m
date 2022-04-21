Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49FA50A01C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 14:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D500190D;
	Thu, 21 Apr 2022 14:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D500190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650545764;
	bh=5fez7wr8uqc+IWPhOReqP+qP7BSjjeMLlqht5y+cQyI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXAVnY+P1A6IIwKbWin7vBXUWymnE+cYgec1NnLTiEleua5kjGiXdRDSNXWg43FXo
	 gr7BSFtGvPQ82nbmXUhGe8pJUPXIgh5FnATGAOeE+1bPwmiXQQN3wtoUrj93ZN9S3i
	 m3wnv6OZjtVES5ge983kfAIE+YmDSWqI1vhzn9zA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8652BF804F1;
	Thu, 21 Apr 2022 14:54:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 042F5F804DA; Thu, 21 Apr 2022 14:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56B0AF8047D
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B0AF8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Ha2g3ikx"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650545677; x=1682081677;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5fez7wr8uqc+IWPhOReqP+qP7BSjjeMLlqht5y+cQyI=;
 b=Ha2g3ikxfWQAmcMGZaiJwsr0uUhhlSUhB2PhpKtSDIuYVeRGHMs0G9w9
 4fL3p2CRXCCrddB7ocr3SreIDwh6af0y5nKNitR7mXj+4u1zm9YvF4r8V
 vDxQ2VfYmPJ/F1GMMepBiZMxbHeHJjjZ6ZmvUH1UdmNODZsTKevdqPn0Z
 KBZNWz3Gn4vbxW+EKKqXo8XMZyPfZlCkhG28MNXkq2HLSfets46SWRUWn
 wCmOBov4NFTCIcDTbApbqcYV8T6ycLE7LKcsQ9n/pT2eRPQAeGs3bliUW
 MQA/ZjnzJ/Zp/o7l2X2oK7e8tBmjYcKkUCKYwGdq/rwQCzmOUziQm1O1/ w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="156304300"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 05:54:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 05:54:24 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 05:54:21 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: atmel: mchp-pdmc: set prepare_slave_config
Date: Thu, 21 Apr 2022 15:54:03 +0300
Message-ID: <20220421125403.2180824-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220421125403.2180824-1-codrin.ciubotariu@microchip.com>
References: <20220421125403.2180824-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alexandre.belloni@bootlin.com, tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, sha@pengutronix.de
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

Since a pointer to struct snd_dmaengine_pcm_config is passed,
snd_dmaengine_pcm_prepare_slave_config() is no longer called unless it's
explicitly set in prepare_slave_config.

Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Suggested-by: Sascha Hauer <sha@pengutronix.de>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 1a7802fbf23c1..a3856c73e2214 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -966,6 +966,7 @@ static int mchp_pdmc_process(struct snd_pcm_substream *substream,
 
 static struct snd_dmaengine_pcm_config mchp_pdmc_config = {
 	.process = mchp_pdmc_process,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
 static int mchp_pdmc_probe(struct platform_device *pdev)
-- 
2.32.0

