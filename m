Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978E1864CA
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 06:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A21187D;
	Mon, 16 Mar 2020 06:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A21187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584338164;
	bh=lS+qwx9mm8I2t3RkiOHXznQAfI14rFMap31xJBPpUeA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5AIzKegkW7RiDJbLHuLgs9edGxxMw46yHpe09tCZTaxkHW8ZvOLEuqutNyVKK8Fg
	 bhxCNiOSrkn48a2iLbDQqm7ft3Vu4KKcxXhIESpZSPO6EFqR1+1Uop3tdIFI5v6PRk
	 W9OlrUAKnHeLKpIdC5A3FwxNmgZ2qQGlW9XMR4iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D80DF8028E;
	Mon, 16 Mar 2020 06:54:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA05F8028D; Mon, 16 Mar 2020 06:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 058E5F80248
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 06:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 058E5F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HDPfi1Yb"
Received: from vkoul-mobl.Dlink (unknown [49.207.58.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0293A20679;
 Mon, 16 Mar 2020 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584338039;
 bh=lS+qwx9mm8I2t3RkiOHXznQAfI14rFMap31xJBPpUeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HDPfi1Ybg/eRCYs8Bqoeg3jdNYM+kD/gPF62hGWaB7wcg+OFwKii7ZYEaCl2gbWKe
 alerMxtOXyVeYXca82uMpQRTsXKapK+i0vOHftiOghOmgYA3Qae2m7bO3wq2PLPPxo
 ZqPjBPiBKV9k38wvwm5pUoiMPi5T5u9xgaMkLYcA=
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/9] ALSA: compress: add wma codec profiles
Date: Mon, 16 Mar 2020 11:22:13 +0530
Message-Id: <20200316055221.1944464-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316055221.1944464-1-vkoul@kernel.org>
References: <20200316055221.1944464-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

Some codec profiles were missing for WMA, like WMA9/10 lossless and
wma10 pro, so add these profiles

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/uapi/sound/compress_params.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index 9c96fb0e4d90..a47d9df0fd7b 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -142,6 +142,9 @@
 #define SND_AUDIOPROFILE_WMA8                ((__u32) 0x00000002)
 #define SND_AUDIOPROFILE_WMA9                ((__u32) 0x00000004)
 #define SND_AUDIOPROFILE_WMA10               ((__u32) 0x00000008)
+#define SND_AUDIOPROFILE_WMA9_PRO            ((__u32) 0x00000010)
+#define SND_AUDIOPROFILE_WMA9_LOSSLESS       ((__u32) 0x00000020)
+#define SND_AUDIOPROFILE_WMA10_LOSSLESS      ((__u32) 0x00000040)
 
 #define SND_AUDIOMODE_WMA_LEVEL1             ((__u32) 0x00000001)
 #define SND_AUDIOMODE_WMA_LEVEL2             ((__u32) 0x00000002)
-- 
2.24.1

