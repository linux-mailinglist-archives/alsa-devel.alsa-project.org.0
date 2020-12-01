Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC02CFA7B
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:09:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B86D18FA;
	Sat,  5 Dec 2020 09:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B86D18FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155740;
	bh=3X7nDeaHGV8ca1bsDthpExKd61Y42M88KLXSYxDFZUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmJ4KRH7iWhu3EsVdRgnOlMZ9RLA4CGiWbYKNCFM7ctIhZq7pq+Qy7iMfj9W6I7DV
	 1csx+2r54anOGejv0XWdIm3ROqOAdZzhIvP5iu8xw7gb4NvrXAsUv2ENbz0vy40wZ4
	 FEW73uP34i2StWesEgYMdTb4MUe+K+xkyLM+R6H0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96FBCF8050F;
	Sat,  5 Dec 2020 09:03:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07D5EF8016D; Tue,  1 Dec 2020 10:07:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C21F8016C
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 10:07:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C21F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Y6jSkLP2"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D9C622249;
 Tue,  1 Dec 2020 09:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606813625;
 bh=3X7nDeaHGV8ca1bsDthpExKd61Y42M88KLXSYxDFZUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y6jSkLP2TnJ26daDMQI/4iYYCFW0BbJo3n3p10NEws2c6dmgg4DIl3VZtbqRyhXDN
 zo10xkjwgMEYr+HkOnvGFxWxvryxG8K6EVifhMGRxz/oWroW8sT5Ib1MD5v+wQTtBf
 8P8TIie8dl3T1FQ37pGSbyAJ8IPEmxuj2MvEFLZY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 96/98] ASoC: Intel: Skylake: Await purge request ack on CNL
Date: Tue,  1 Dec 2020 09:54:13 +0100
Message-Id: <20201201084659.771053432@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201084652.827177826@linuxfoundation.org>
References: <20201201084652.827177826@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:15 +0100
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

commit 7693cadac86548b30389a6e11d78c38db654f393 upstream.

Each purge request is sent by driver after master core is powered up and
unresetted but before it is unstalled. On unstall, ROM begins processing
the request and initializing environment for FW load. Host should await
ROM's ack before moving forward. Without doing so, ROM init poll may
start too early and false timeouts can occur.

Fixes: cb6a55284629 ("ASoC: Intel: cnl: Add sst library functions for cnl platform")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-8-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/intel/skylake/bxt-sst.c     |    1 -
 sound/soc/intel/skylake/cnl-sst.c     |   20 ++++++++++++++++++--
 sound/soc/intel/skylake/skl-sst-dsp.h |    1 +
 3 files changed, 19 insertions(+), 3 deletions(-)

--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -17,7 +17,6 @@
 #include "skl.h"
 
 #define BXT_BASEFW_TIMEOUT	3000
-#define BXT_INIT_TIMEOUT	300
 #define BXT_ROM_INIT_TIMEOUT	70
 #define BXT_IPC_PURGE_FW	0x01004000
 
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -57,18 +57,34 @@ static int cnl_prepare_fw(struct sst_dsp
 	ctx->dsp_ops.stream_tag = stream_tag;
 	memcpy(ctx->dmab.area, fwdata, fwsize);
 
+	ret = skl_dsp_core_power_up(ctx, SKL_DSP_CORE0_MASK);
+	if (ret < 0) {
+		dev_err(ctx->dev, "dsp core0 power up failed\n");
+		ret = -EIO;
+		goto base_fw_load_failed;
+	}
+
 	/* purge FW request */
 	sst_dsp_shim_write(ctx, CNL_ADSP_REG_HIPCIDR,
 			   CNL_ADSP_REG_HIPCIDR_BUSY | (CNL_IPC_PURGE |
 			   ((stream_tag - 1) << CNL_ROM_CTRL_DMA_ID)));
 
-	ret = cnl_dsp_enable_core(ctx, SKL_DSP_CORE0_MASK);
+	ret = skl_dsp_start_core(ctx, SKL_DSP_CORE0_MASK);
 	if (ret < 0) {
-		dev_err(ctx->dev, "dsp boot core failed ret: %d\n", ret);
+		dev_err(ctx->dev, "Start dsp core failed ret: %d\n", ret);
 		ret = -EIO;
 		goto base_fw_load_failed;
 	}
 
+	ret = sst_dsp_register_poll(ctx, CNL_ADSP_REG_HIPCIDA,
+				    CNL_ADSP_REG_HIPCIDA_DONE,
+				    CNL_ADSP_REG_HIPCIDA_DONE,
+				    BXT_INIT_TIMEOUT, "HIPCIDA Done");
+	if (ret < 0) {
+		dev_err(ctx->dev, "timeout for purge request: %d\n", ret);
+		goto base_fw_load_failed;
+	}
+
 	/* enable interrupt */
 	cnl_ipc_int_enable(ctx);
 	cnl_ipc_op_int_enable(ctx);
--- a/sound/soc/intel/skylake/skl-sst-dsp.h
+++ b/sound/soc/intel/skylake/skl-sst-dsp.h
@@ -68,6 +68,7 @@ struct skl_dev;
 #define SKL_FW_INIT			0x1
 #define SKL_FW_RFW_START		0xf
 #define BXT_FW_ROM_INIT_RETRY		3
+#define BXT_INIT_TIMEOUT		300
 
 #define SKL_ADSPIC_IPC			1
 #define SKL_ADSPIS_IPC			1


