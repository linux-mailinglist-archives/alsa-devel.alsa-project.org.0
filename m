Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDBF50EB81
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C742818A0;
	Tue, 26 Apr 2022 00:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C742818A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924898;
	bh=GX6UpIcjeLKcRESqhBQBnv+dbN0+7NRc+rjuwbtKkc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAcihk2+I7PL6iSf3NuoUBGTXbzUuTQFEOXIWIoxzqiCkbTCXkzkAjNLTcrUSXBS7
	 6VH48EtFfynsWBgLcpkMvNcSWLEs/CTuYaBbokmit7BN8eWFcGG5aIJEgU9IyDLmyk
	 dxYAkGgnp0nhGpXrNfeN1XqxPlyrk7DVqOPvoQxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E75F80542;
	Tue, 26 Apr 2022 00:12:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D234BF80534; Tue, 26 Apr 2022 00:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4EE8F804F1
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4EE8F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AX0DvH4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924716; x=1682460716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GX6UpIcjeLKcRESqhBQBnv+dbN0+7NRc+rjuwbtKkc0=;
 b=AX0DvH4eapz9cuL/f0VkQXKvPn/p9GOspQs0yq6JCJpM2z2vx4YhYF3Q
 Lor3ynvzOGrzzktuHzPOotlmriESYCH5NHpmsEDobtM8eRY5ZgOz4d+Ou
 ZjNbC6G9hRjN8EKXyh1BNIyQMo9sxizYfzW2wGkXH8de03ENzrMN7yD/A
 gIMDEQGounPhT+nX3NdLEapYOIxrUc20tywaKqCEWiiFuf+B7ortF0T+1
 1RhpRkhyt45jnARv87KTY9Nw7V6lBR4DBna6U5rPm0Sv5qS+lhSbkvfVJ
 2XNiThvViRUWYuGHnsj1fsFJJOTq7xmLtX9jc9vhVTcQBsyb/g2F/9xaz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245942144"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="245942144"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939928"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:37 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ASoC: SOF: amd: renoir: Do not set the load_module ops
Date: Mon, 25 Apr 2022 15:11:24 -0700
Message-Id: <20220425221129.124615-6-ranjani.sridharan@linux.intel.com>
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
 sound/soc/sof/amd/renoir.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 275f266c5e4d..70190365328c 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -136,9 +136,6 @@ struct snd_sof_dsp_ops sof_renoir_ops = {
 	.block_read		= acp_dsp_block_read,
 	.block_write		= acp_dsp_block_write,
 
-	/* Module loading */
-	.load_module		= snd_sof_parse_module_memcpy,
-
 	/*Firmware loading */
 	.load_firmware		= snd_sof_load_firmware_memcpy,
 	.pre_fw_run		= acp_dsp_pre_fw_run,
-- 
2.25.1

