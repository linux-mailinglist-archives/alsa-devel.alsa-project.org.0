Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF5A4D216F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:28:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED32518A9;
	Tue,  8 Mar 2022 20:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED32518A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767709;
	bh=hxq4X2WdCZrN3Ge9nwtJEn6K+AkFeMNG9Ql83sNm/QA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ggnqp95lxoZu9Liej9OmD5p96264Zcs6vuhAuucgGx5g5J+b02KLVlKhHnL5MabRI
	 XXRkmeThAVRtjKYSc3KwO8cMIszA1aYLtoFm3srLHM7m0WWAFz2cmm/Yx5gEzEEmAi
	 EIcUkuSjsv4arHD/9xxPdidS9XC5RLqMPhmg7JjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FC3FF80526;
	Tue,  8 Mar 2022 20:26:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DEABF80518; Tue,  8 Mar 2022 20:26:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77A53F8026A
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A53F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hqa9544B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767604; x=1678303604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hxq4X2WdCZrN3Ge9nwtJEn6K+AkFeMNG9Ql83sNm/QA=;
 b=Hqa9544BQs42+I+pl3rLvU6GpPb5/xdoGW3eQy/Zgt0zjz4/psZaltka
 rxqUMYzBXpdwNNcgsiOjyLAPQa1bZVfVONrZYxEI2/HQe7J2UQQzmbfYG
 afF1XepsWRTafTDCsc7aTF85yEOg9kmvZBRY/4E9LGr+0ci6wAwvhFM5d
 ZqcpovjSyumDZs44sGHC5t9lxBgnQMQnDMeqN4TxoLwB49HFtO7H25TBz
 RZetxG/KE9mdLFBTNHNuvjembIDV+0PQv0xr7B6qRbAKIxjsSieJl+IyY
 d6Pb3cPtf3RRTsKhrdrVMD3k429HmPl2yER3fqGgfQS8zTMXg1/Rk6TCM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363675"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363675"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:38 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573933"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:37 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/20] ASoC: soc-acpi: add information on I2S/TDM link mask
Date: Tue,  8 Mar 2022 13:25:52 -0600
Message-Id: <20220308192610.392950-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The platform driver may have information on which I2S/TDM link(s) to
enable in the machine driver. In the case of Intel devices, this may
be extracted from NHLT tables in platform firmware. This link
information is necessary to make sure machine driver and topology are
aligned.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-acpi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index a8fd62c00f91..093bbe7f0e1f 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -64,6 +64,7 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
  * @link_mask: SoundWire links enabled on the board
  * @links: array of SoundWire link _ADR descriptors, null terminated
+ * @i2s_link_mask: I2S/TDM links enabled on the board
  * @num_dai_drivers: number of elements in @dai_drivers
  * @dai_drivers: pointer to dai_drivers, used e.g. in nocodec mode
  */
@@ -75,6 +76,7 @@ struct snd_soc_acpi_mach_params {
 	bool common_hdmi_codec_drv;
 	u32 link_mask;
 	const struct snd_soc_acpi_link_adr *links;
+	u32 i2s_link_mask;
 	u32 num_dai_drivers;
 	struct snd_soc_dai_driver *dai_drivers;
 };
-- 
2.30.2

