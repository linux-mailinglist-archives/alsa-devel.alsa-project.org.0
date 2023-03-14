Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235436B87B1
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD932148D;
	Tue, 14 Mar 2023 02:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD932148D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758230;
	bh=E1vpSUnv0GpopyC7lDUkDQqhHE9rQzhik8od9N+jq4w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gYJrZeEwH1MnsB0vKAWtweJyvwGM7sYaOUxk1zgE8yXrVxjboBOKp4cqaQ7s3TObe
	 C9m0TCtPz7FGgEuANgd2k7Go1DvOhNGCTlItA+fbRO9WXWii2OUKU6SnSJc8YA2MFV
	 OvytBKm7vvqsRrsILzXro6QPS+Mgj49vLPEp4qJU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83051F80567;
	Tue, 14 Mar 2023 02:41:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24C17F8051B; Tue, 14 Mar 2023 02:41:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 816D1F80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 816D1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KwLU1gJw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758077; x=1710294077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E1vpSUnv0GpopyC7lDUkDQqhHE9rQzhik8od9N+jq4w=;
  b=KwLU1gJwUJoazSuPnxxKu0cPIZNQVkPYQBLhAIMOHTtQB0QXJstUfejk
   9cd7W8QDnF5FmVBRERzqBEd9WRQ+IyFgfdqDiKa2zLNrDphGFKkVNomtu
   1MJWXKpgOmIl29HCP24LR7StxSQ90eQdtXNoLgJcZAmy62kjXACUOd0Vx
   Oci3DesgKDiKBkDjYc80yIBPcOoDrM9GuSgCXcErB64ibvtFM1gRvI/FJ
   02ItzuBbJK9l6EUmYV/+Kc6QHTZY8a/ynzj3dtxoybtvtd13wRWSr3682
   RmJMYvtR4mcI+wZOWkxy5xyirsjcwnDJeESj6WtXZFNByaXUQaTXOgyOz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949234"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949234"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327386"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327386"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/16] soundwire: intel: remove useless abstraction
Date: Tue, 14 Mar 2023 09:53:58 +0800
Message-Id: <20230314015410.487311-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LWI2GJHB3GRXOJZKGWP5W7OVZ4ZN2X4D
X-Message-ID-Hash: LWI2GJHB3GRXOJZKGWP5W7OVZ4ZN2X4D
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWI2GJHB3GRXOJZKGWP5W7OVZ4ZN2X4D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

PDM is supported in the hardware but never enabled: there are no known
PDM-based devices. We can directly call the PCM helper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 6c17baab7923..2c1c905f8889 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -586,13 +586,6 @@ static int intel_pdi_stream_ch_update(struct sdw_intel *sdw,
 	return 0;
 }
 
-static int intel_pdi_ch_update(struct sdw_intel *sdw)
-{
-	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
-
-	return 0;
-}
-
 static void
 intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 {
@@ -1094,7 +1087,7 @@ static int intel_register_dai(struct sdw_intel *sdw)
 	if (ret)
 		return ret;
 
-	intel_pdi_ch_update(sdw);
+	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
 
 	/* DAIs are created based on total number of PDIs supported */
 	num_dai = cdns->pcm.num_pdi;
-- 
2.25.1

