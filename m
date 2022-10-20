Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC872605FE3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:14:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99AF3414D;
	Thu, 20 Oct 2022 14:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99AF3414D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268098;
	bh=BQoO01bFiTrDI5W7Y4cKr8B0RyqH4Fa2djT2J+2MGfA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hMH10+gee8mU69UvzGb6z41r18e9K5O2qrvEGJe0oDCvSQwAc7/oqqdXhUoJ1RD5f
	 ZJ5/cRhRfbjkqlsw06VVKhJ06VIr7/wIH/iU71aAp0kBTEieaEQ9wq8LxmAdZ4hOG7
	 QTWCU1c+qt8E3zfrnpe2TxHRgPrOfadaV8TBguiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52FE8F80568;
	Thu, 20 Oct 2022 14:12:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A40F80568; Thu, 20 Oct 2022 14:12:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DC18F80551
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC18F80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AUyzevIj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267953; x=1697803953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BQoO01bFiTrDI5W7Y4cKr8B0RyqH4Fa2djT2J+2MGfA=;
 b=AUyzevIjmZ7EmYpNvb4eZm32m2ITQy44dXeBb5oS8Ez2HXMuqlsmf232
 eMJ/GP+bnQYUQyXE06EVUa+BlIZcJ65wmark7LzKdo9nB5HwFqXonnVjf
 opVwnkvj4auPg7mJntqR3Hc68gtLPB5TXGMnUKEJEPI/+HQW2f2r9BdQy
 RhZUZQNaWWUi6FkNh3Q3re2X9DhNbmHARHPjNvjrZCjAQqi8vh671NcSh
 az5nBp3TDXhDTAVBVL/+R57ePXtsjI/oADywRmR3mgtUyrsaH9FQDw0bi
 1FhG0zG2CJudlTCE9BOeSPfmeh/kBHLmOaAIHEB2DqT+mvmRDVguqB+O6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256326"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663009920"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663009920"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 05/19] ASoC: SOF: Intel: hda-loader-skl: Use the basefw
 firmware container directly
Date: Thu, 20 Oct 2022 15:12:24 +0300
Message-Id: <20221020121238.18339-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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

Switch to access to the firmware struct via sdev->basefw container to
unblock the removal of the firmware information from plat_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader-skl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
index 0193fb3964a0..3211f561db29 100644
--- a/sound/soc/sof/intel/hda-loader-skl.c
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -494,14 +494,13 @@ static int cl_copy_fw_skl(struct snd_sof_dev *sdev,
 			  struct snd_dma_buffer *dmab)
 
 {
-	struct snd_sof_pdata *plat_data = sdev->pdata;
-	const struct firmware *fw =  plat_data->fw;
+	const struct firmware *fw =  sdev->basefw.fw;
 	struct firmware stripped_firmware;
 	unsigned int bufsize = HDA_SKL_CLDMA_MAX_BUFFER_SIZE;
 	int ret;
 
-	stripped_firmware.data = plat_data->fw->data + plat_data->fw_offset;
-	stripped_firmware.size = plat_data->fw->size - plat_data->fw_offset;
+	stripped_firmware.data = fw->data + sdev->basefw.payload_offset;
+	stripped_firmware.size = fw->size - sdev->basefw.payload_offset;
 
 	dev_dbg(sdev->dev, "firmware size: %#zx buffer size %#x\n", fw->size, bufsize);
 
-- 
2.38.1

