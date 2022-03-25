Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1AF4E77C1
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E521740;
	Fri, 25 Mar 2022 16:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E521740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222571;
	bh=AWBxOhZ8G2NcA+v3xSDS7tuQrOljT8MnfBJLg2MRTcs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhoF+9lGrotz/xZwhBE5w/cdgz4aNQm2KN+JMVVxSQTbVQJFsPUxhdRY0/jDOXA41
	 9dfVg4zt7nCNCXsCWpqTduxCvzMLgLFhcftHD0ZH1NZeej1PuUMTcPfO1KMYb1ynoM
	 3gEyjyatxf0DDNAUG/P9B+5w1N5gjAdDLPczV9P4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7052BF8053A;
	Fri, 25 Mar 2022 16:33:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB9BF8053A; Fri, 25 Mar 2022 16:33:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15F41F80533
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F41F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TrdKuMTG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B9BCB827B7;
 Fri, 25 Mar 2022 15:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0807C36AE2;
 Fri, 25 Mar 2022 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222396;
 bh=AWBxOhZ8G2NcA+v3xSDS7tuQrOljT8MnfBJLg2MRTcs=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=TrdKuMTGGXC/AnERBlShWugWcen941XwgSuzwIG8e9/FXbR/GUqtGCRvWTRShZBRw
 SLMIZozJtcJZKhCA4YPusHkhPvzxVLL6m+udinED10CeGVqNkS765Gqy9LJmbsB+5Y
 /fY3FOEQrCXBLXLHF43BpX0/uvKTiI18lPnXlfkcJQaDbbrELrj+N5ctdpnEUhVTBm
 3K8xRQgsQbQa05z17dVK/AI7VtxY8S6heranoTKqVFSivApCNa54nZDwCo31Q1agOg
 B8FDSuPbTmrHVUM6SRT1cg0QAVpk3iaCQA4GDNCkMAlz8yQor7EPK6foFFfHBH43Zo
 iqQYnbAirL/uw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 7/7] ARM: configs: Update multi_v5_defconfig for WM8731 bus
 refactoring
Date: Fri, 25 Mar 2022 15:31:21 +0000
Message-Id: <20220325153121.1598494-8-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=840; h=from:subject;
 bh=AWBxOhZ8G2NcA+v3xSDS7tuQrOljT8MnfBJLg2MRTcs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBI+8hhUyrAB9konZFbE6QBpOXwo19/k9GOEAKZ
 McW27kaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gSAAKCRAk1otyXVSH0OP5B/
 4k9hwaZDR+RXEc4lZMqfglkGk0309vFUPvwfdse81h2AyWYu/A9c/Z++ZQAQMYtCcu9TRlWi6tBVKC
 ynvtz6b+BVbGkjXW9InYfj++TBaH5jaGMFBEnSMRC71/r+RVns51m+l6Dj4G2RI0LklCQtTzuNBTx2
 sS623vYQG9wpECfbKRLfnGTMBDguVEj7aVQXThGYHrbqqNatHcQcT93UWvZt6go6G/YuS/xDyIUfa8
 rIzpavR4xGVTPgRgu5L+p/bDznWLgyqdDfm9ZDm97MeDBOp59EBNFD8GoV59fHGpnvYb5Um3xaensU
 IZG40FZugKgMJlzTKdtw16CJS10r5Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, soc@kernel.org
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

The WM8731 driver has been refactored so the I2C and SPI bus code is
separate modules. Refresh multi_v5_defconfig to reflect this.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: soc@kernel.org
---
 arch/arm/configs/multi_v5_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index fe8d760256a4..38a939d91a32 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -208,7 +208,8 @@ CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_AT91_SOC_SAM9X5_WM8731=m
 CONFIG_SND_KIRKWOOD_SOC=y
 CONFIG_SND_SOC_ALC5623=y
-CONFIG_SND_SOC_WM8731=y
+CONFIG_SND_SOC_WM8731_I2C=y
+CONFIG_SND_SOC_WM8731_SPI=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_HID_DRAGONRISE=y
 CONFIG_HID_GYRATION=y
-- 
2.30.2

