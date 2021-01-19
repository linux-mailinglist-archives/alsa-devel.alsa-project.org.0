Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA352FB4E9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:32:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01CEE1878;
	Tue, 19 Jan 2021 10:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01CEE1878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611048764;
	bh=/XpSaqmXdvyMZ0MrWoHGxFD3BO7pVAp2VFpF/CwVmxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FP8lnCHztu3TNm9l1bdylVKzoByG/xBMvNjxonen3qGC202YOW23hb3ST7hP5dBae
	 slGPqhM6TmLKvE+CSCOOlvVmj05S2Wig7/jtHVxyhduu8U0yGP0Pz7Hqwn6sZ6oNcX
	 hEGBbqoJIB3/b9ps0m+qxgQonSkcjjCQIgbIP4f8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7452AF804E0;
	Tue, 19 Jan 2021 10:29:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77504F80255; Tue, 19 Jan 2021 10:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82370F800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82370F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="O4kL+JxQ"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6006a6540000>; Tue, 19 Jan 2021 01:28:52 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:52 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:48 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [RESEND PATCH v6 4/6] arm64: defconfig: Enable Tegra audio graph card
 driver
Date: Tue, 19 Jan 2021 14:58:14 +0530
Message-ID: <1611048496-24650-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611048532; bh=K6ffk+sf+Kr8aOJa1Q3UxSgncS5xJ1/jwgXDUj0CrKg=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=O4kL+JxQDDK1PDJag7/IxjJDsCagLy7qXdmvcw2emgQEQ4W4Re9MtgUuLkav+HiY9
 HfC/vMJ1Eyp1vrvRw+n6F/HCkedIJ08ZzMV0/V7NtqzZXt98h9M4WzR1EER84WzhVC
 wuGQgyJvsrmGLYvNTWptPrHkKlEDyvZje7sTAsibm6JeYWbzeACdbG3j29Qls+ZF1S
 pjZ6LSfN4/NzMehkZDCRA1SuL3gn73FiqrenSNylZl8QoiPzj6W/cFfznb59G2TkV0
 StXMISx7iBsvn0ZFm6GMXtjca93uevaXpEu41ltYMDJRWShiyGfEE/FP9p2Wvd9Fju
 NJcq58OX3lh1A==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org
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

This commit enables Tegra audio graph card driver which is based on
the generic audio-graph card driver. This is intended to be used
on platforms based on Tegra210 and later chips.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1cd0106..62763fc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -747,6 +747,7 @@ CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
+CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
-- 
2.7.4

