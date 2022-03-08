Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E364D216E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCA11895;
	Tue,  8 Mar 2022 20:27:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCA11895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767706;
	bh=AwxYf9uh40FN2nRZJMgoLGlwAJAL7qa3XTBibSE7Oiw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7TUggTzpvPJscNSGyI1XK78nojYf0eM8iEk8E+BcCyhQeArvkdaoQQAyl1Gvea6z
	 zDXMgTTIkKAO6KCQNl0V1Ny7JtKul+aAn4N1c7ALqBmgcQAftTj1aNdvI0g5zUZU/i
	 XI/eUeQ28zK1ia0BwJZCOsPaQOmZ1PKmL85cS/04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21042F8051D;
	Tue,  8 Mar 2022 20:26:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 361C4F80517; Tue,  8 Mar 2022 20:26:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46317F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46317F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ectc8NCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767602; x=1678303602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AwxYf9uh40FN2nRZJMgoLGlwAJAL7qa3XTBibSE7Oiw=;
 b=ectc8NCzyzSwMyRoORKIrIxlqVvtZI1tctnPDVWvxrJ/CN3L9jID4Jef
 KCzWbeOXl8dT2Ja+ouk2MqWvQHB2DxBadyIoQ4wmrOVRqE+DezupSiSk9
 OssESjLBiGgttpABoE7/bcq/rnrPyjoIS8BK1RNYEdQM9tSurIyWzDcS2
 kWRsDcHbLeT31QPr3fonVFSYbRBoeOa7IaQxd6cAlLjxzO6FMyMzAJ+xC
 JebGJ9OzljFBcnM3w3RCF+h4fdULzpr0MRMAIzv5hs/fjzH9lHmdT0MPk
 n3aPn0sN1JvJOTnoOjjhuZZmFqyB6T2lRv259pQnI/y2/mn4AW2Zt/pHB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363672"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573928"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/20] ASoC: soc-acpi: fix kernel-doc descriptor
Date: Tue,  8 Mar 2022 13:25:51 -0600
Message-Id: <20220308192610.392950-2-pierre-louis.bossart@linux.intel.com>
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

Add missing dmic_num mention and clarify that 'links' mean 'SoundWire
links', not to be used for other links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-acpi.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index fdb536d699ff..a8fd62c00f91 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -60,9 +60,10 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @acpi_ipc_irq_index: used for BYT-CR detection
  * @platform: string used for HDAudio codec support
  * @codec_mask: used for HDAudio support
+ * @dmic_num: number of SoC- or chipset-attached PDM digital microphones
  * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
- * @link_mask: links enabled on the board
- * @links: array of link _ADR descriptors, null terminated
+ * @link_mask: SoundWire links enabled on the board
+ * @links: array of SoundWire link _ADR descriptors, null terminated
  * @num_dai_drivers: number of elements in @dai_drivers
  * @dai_drivers: pointer to dai_drivers, used e.g. in nocodec mode
  */
-- 
2.30.2

