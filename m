Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC94ECDCC
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 22:21:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BA891A75;
	Wed, 30 Mar 2022 22:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BA891A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648671716;
	bh=//VLX0NSVXpvaYf1bPnlh5QRE3lJwScoas6Df7RnmF4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELqXeH+LW9HH5ys1EUbyYuzajW8bvVD6QFtfRz29L9Gt3P9OVVIfnpjFIDBYWs5PF
	 28yduQoMh48XfQqRCTA2JTbNeOFKOZjwlUvjtwheM6ue7I5oHuW3mQrgTMVi97gRjO
	 ai7GkRx4JnKG/+t13j3epskO2dl2DlpXYvd5KVrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82402F8051C;
	Wed, 30 Mar 2022 22:19:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAF93F8051A; Wed, 30 Mar 2022 22:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6DC1F80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 22:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6DC1F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LTWOsOZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648671582; x=1680207582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=//VLX0NSVXpvaYf1bPnlh5QRE3lJwScoas6Df7RnmF4=;
 b=LTWOsOZ8/YwGenNhm06kKBQvJvTA7yXrnoyyFC4ci7cCLK8kA2JZJd9j
 ep2XGTIdxNr0zY/tX8LrRSzESaVKnuBnTml4wqJSvVqEQuNfuzgv3JoZ4
 5es5Rg6Ilh6yEtCu/FMtihYHGpV9EDFvcuk+yHl6BCm+FfSqxqtKq7sbh
 c4BWSkkE+eM+96a2nvOivWcT3KbKqIjOGxoD/Gkh543bPT3/SpVB6kgoJ
 LTEdeI4m9cIDD/3Zaek7seKfAtJrwDkI1rPa7wcKklyIOHlC/g2yQzHk8
 kKA24/V1QnKKEihhMcZWF1hDHg+i4VK5K/rskXm9Ky/TKNaaBHM5HuY75 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="322819825"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="322819825"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="522045017"
Received: from ggunnam-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.195])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 13:19:36 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/11] ASoC: SOF: Remove dmab and dmab_bdl from snd_sof_dev
 struct
Date: Wed, 30 Mar 2022 13:19:17 -0700
Message-Id: <20220330201926.1330402-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
References: <20220330201926.1330402-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

The dmab and dmab_bdl is not used by any platform, it can be removed from
struct snd_sof_dev.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0d9b640ae24c..93de5547b952 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -457,8 +457,6 @@ struct snd_sof_dev {
 	bool ipc_dump_printed;
 
 	/* firmware loader */
-	struct snd_dma_buffer dmab;
-	struct snd_dma_buffer dmab_bdl;
 	struct sof_ipc_fw_ready fw_ready;
 	struct sof_ipc_fw_version fw_version;
 	struct sof_ipc_cc_version *cc_version;
-- 
2.25.1

