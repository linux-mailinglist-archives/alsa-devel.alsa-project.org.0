Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D3528296
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814701698;
	Mon, 16 May 2022 12:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814701698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698238;
	bh=6l3DLTM1fWF79oYbq6YMDLUQs3o2FQiFa3fJrn9touk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LElGBJ7RWXQy+Np5zofngrnkBuA813gyv/Y9hnHTeXIMYFolzU0rgD3gD6H6DPe5d
	 /hiftEWSFf2E3LQn+4dAH6mr2P9wBriuIC+7M0ErFxB7fhT44EUjBcF339DkFNclFz
	 cH9c6OVl77VbLYtMKIuxGjDbmprEB+0op6RYDN/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4FA4F80536;
	Mon, 16 May 2022 12:47:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80657F80520; Mon, 16 May 2022 12:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E71F800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E71F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OQghTAyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698051; x=1684234051;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6l3DLTM1fWF79oYbq6YMDLUQs3o2FQiFa3fJrn9touk=;
 b=OQghTAyhNRQdbtnhPfrULB1huyBYlA6c/w7b8l0KuJLJvgUFaHntaUqu
 VD7nRHHDKkvnSJtP1rBAADdm5Vxfv12IglBZVGqdodV/BpgRlUEVm+/aZ
 q3dXAWRyP/0DON6yjq9k4KjmxbE1b/r0I8fZAHRwMtCGIpQ+CyhaMMwz0
 Qn5YfPBfNe9eCJpS0JJ/pmCCbU6JMg0ecOrUkZgH5TDOjiTZCbD49+3lq
 iVIMcWQOn/WpTBaxRgJxT50unCwW91aHhC7KToIHs2Km1h5VoXsdzlp4y
 /UoMEylSM32FQyFWY7K5N9OJJVBClcJLPalEyxYCiK5HOlpVuq+HVAPsV Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853260"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853260"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459845"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 7/8] ASoC: SOF: Introduce opaque storage of private data for
 firmware tracing
Date: Mon, 16 May 2022 13:47:10 +0300
Message-Id: <20220516104711.26115-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
References: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Firmware tracing implementations can allocate and store their privately
used data behind the fw_trace_pdata pointer instead of adding more
members to struct snd_sof_dev.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index b176fc7e346c..d8d81e1ec259 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -549,6 +549,7 @@ struct snd_sof_dev {
 
 	/* firmwre tracing */
 	bool fw_trace_is_supported; /* set with Kconfig or module parameter */
+	void *fw_trace_data; /* private data used by firmware tracing implementation */
 
 	/* DMA for Trace */
 	struct snd_dma_buffer dmatb;
-- 
2.36.1

