Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE1050EB7A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA1D1860;
	Tue, 26 Apr 2022 00:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA1D1860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924806;
	bh=Gbw9ge+2xnq7VUHYQ125+uvpdWSxOmkSi3bCf7aTAXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ubg5lwhKocAQ6zxBMwltsfweczGJXwOZjrbPBk0gTtXNyttPL9+OP53cbg8KmZpxc
	 1iwRYnc4YMzarn+ffRT2hquBBhUPf72ceFR7cSQoco9zauhu8zC2CxNSxEAjUk33eh
	 WRCBiDAhrYZeOjaQ4PGsG87F0EzSnLfawFHyRmbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B899F80507;
	Tue, 26 Apr 2022 00:11:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FC12F804AA; Tue, 26 Apr 2022 00:11:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 698B3F8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 698B3F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ffyWRX99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924704; x=1682460704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gbw9ge+2xnq7VUHYQ125+uvpdWSxOmkSi3bCf7aTAXg=;
 b=ffyWRX99+XqRQkG8czNRoZpSJBKpMdwKGsmiLTLe01PbQJLuLegE9sRN
 DzZHyEVK7vDZCehTWpgF0actLnRAy9RNR/BIWOXPYQ/TMSBa+X13wNE5e
 SZ4B4Vy9ZGz4iB3DETQXVDK5f3b0FLu39nH7UxOnZsBbbGEIScQmlf3MC
 bzi3FUKH3Xc+0EBhLXdf9p6+hDp1SvtTL0g8qMAs07TGyLk7sRriOjx7J
 0jyCsTmDMlzNqqerSUdNwFQl4w820kWxy5ero215ALZJuC0ynPcQwQoWJ
 pOZI3b2dxkpM7jWu0bcUzeU4W4ERySvc/Z9Oem6EzwqZAGXuRrK32HZy7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265181139"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="265181139"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939934"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:37 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ASoC: SOF: imx: Do not set the load_module ops
Date: Mon, 25 Apr 2022 15:11:25 -0700
Message-Id: <20220425221129.124615-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The used firmware loader (snd_sof_load_firmware_memcpy) can use the generic
module loading, which is by default uses the same implementation as the
snd_sof_parse_module_memcpy.

No need to set the callback for iMX.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 6 ++----
 sound/soc/sof/imx/imx8m.c | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index ba2fbed93f1d..2844d9a8040a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -510,9 +510,8 @@ static struct snd_sof_dsp_ops sof_imx8_ops = {
 	.ipc_msg_data	= sof_ipc_msg_data,
 	.set_stream_data_offset = sof_set_stream_data_offset,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
 	.get_bar_index	= imx8_get_bar_index,
+
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
@@ -572,9 +571,8 @@ static struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.ipc_msg_data	= sof_ipc_msg_data,
 	.set_stream_data_offset = sof_set_stream_data_offset,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
 	.get_bar_index	= imx8_get_bar_index,
+
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 1e95f91a7b22..1243f8a6141e 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -436,9 +436,8 @@ static struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.ipc_msg_data	= sof_ipc_msg_data,
 	.set_stream_data_offset = sof_set_stream_data_offset,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
 	.get_bar_index	= imx8m_get_bar_index,
+
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
-- 
2.25.1

