Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8050EB76
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8FCF185E;
	Tue, 26 Apr 2022 00:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8FCF185E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924770;
	bh=aIMBwOX3Cp8Ri7mtJowwjOOMLN0IdSeAQ7qPiU3TNQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPC+uOKggjCvbrMkCUfmWu6+Goq6nEefaHrNllYj5zbjlmANs0hBhXB0Qkh0R43MX
	 pqM6JfqwrYNflEhGwfWRLHlNTwqj4UDaeoxbA95D2fLdT8WKThQig3wC1bUziOzuZU
	 ZP6oumirhCkbR/dKWp2SxEfP1/S78aZjoHmzoy00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DA3F804AA;
	Tue, 26 Apr 2022 00:11:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6916F800FA; Tue, 26 Apr 2022 00:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 296D2F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296D2F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QTUwZYi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924704; x=1682460704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aIMBwOX3Cp8Ri7mtJowwjOOMLN0IdSeAQ7qPiU3TNQ4=;
 b=QTUwZYi5xwiq1VT1b/eOAtMBHhJA/7TpRfr836ywI1nltK+DG5FO0y97
 B6XOP3Jy5xHPfBX0+3z5HCizsNr7uPWBQDoKPNnIhnPID6paMoTa7UFIt
 2+WKL9dTO6xT9sLJirAmdLKi/FSs70LMAwCb4IsDga6uaE9+ldgiAtNhS
 PwwIJhopCACYB0kuWbWTbM/aM+FNMtB/YAGfEChxcaIpfgwRL8W58D9wr
 EKfLrdIzJF5rvo9OYAb4pJcooMsn61NzPNHlCzT5X9PojxbWfEEvEWS2I
 SN3m4q7nqmHdhNEui6G2yQb+uKdx1vqo4goAeNHoYwo8qG1218k2fK7Qr w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264897779"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="264897779"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939947"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:38 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ASoC: SOF: mediatek: mt8195: Do not set the load_module
 ops
Date: Mon, 25 Apr 2022 15:11:27 -0700
Message-Id: <20220425221129.124615-9-ranjani.sridharan@linux.intel.com>
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

No need to set the callback for this platform.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 90ec7b14823b..1766050e39f5 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -415,8 +415,6 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* misc */
 	.get_bar_index	= mt8195_get_bar_index,
 
-	/* module loading */
-	.load_module	= snd_sof_parse_module_memcpy,
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
-- 
2.25.1

