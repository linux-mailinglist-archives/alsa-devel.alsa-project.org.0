Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169D6ADA8D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45C01409;
	Tue,  7 Mar 2023 10:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45C01409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182109;
	bh=7U3rcN9RlOr+BlhoeR1GNwu2co3TrN0yxf1YRD/yDxE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z+pifbMp7ipJ6ozUGealWtBc6LfftphE00ZhM6esIPHxrH9k3L6fqoaVtSl7r/baG
	 WKUvMv7IjDDrAc/c48/BOTgirAefaWMTN2WbZ56c472RNbbeVcm3FO8Gqu8mcogKa1
	 93yyTTSplCba+UPxdeiYjYehg388iT2/2mwUMY9M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A7F3F80542;
	Tue,  7 Mar 2023 10:39:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 968E2F80236; Tue,  7 Mar 2023 10:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3B03F80431
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:39:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B03F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OGunYsgf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678181947; x=1709717947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7U3rcN9RlOr+BlhoeR1GNwu2co3TrN0yxf1YRD/yDxE=;
  b=OGunYsgf8TwK+jUG88488yvx6vNECDTJB/X6NgPVVzcH5xrfVjDm/oVH
   02S0dA9DEG3NbRC2ZmgokdgfTOZ+BuF+EYXu3V8JeL4e6xck60dAcJrfN
   w0WejpjUlgqJqQrth64TIWdrFdxc+iJIX9vuSy/jqt46s8V2F4BGJzC8t
   AgeIpqdtixiV0IF5ozFAl+KvwAochd5GbEK0Am5dLDs6kLfFgGX/k5u33
   qeOInSdXVTNwrPRNOVwyi+vNF+/fukuTomFC08k1ZKlMmkUw9aFqebosU
   3O2OvGw13hD8uJZBN6DVRua3/1tRGTh524CAU18v3FTPW/vxz6I5UghHH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338132636"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338132636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:39:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676504889"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="676504889"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:39:02 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 4/4] ASOC: SOF: Intel: pci-tgl: Fix device description
Date: Tue,  7 Mar 2023 11:39:14 +0200
Message-Id: <20230307093914.25409-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
References: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KDGBDBNUXWMDPEZKLZBJJ72DLUDCHG6S
X-Message-ID-Hash: KDGBDBNUXWMDPEZKLZBJJ72DLUDCHG6S
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDGBDBNUXWMDPEZKLZBJJ72DLUDCHG6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the missing ops_free callback.

Fixes: 63d375b9f2a9 ("ASoC: SOF: Intel: pci-tgl: use RPL specific firmware definitions")

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index adc7314a1b57..22e769e0831d 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -239,6 +239,7 @@ static const struct sof_dev_desc rpls_desc = {
 	.nocodec_tplg_filename = "sof-rpl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 static const struct sof_dev_desc rpl_desc = {
@@ -270,6 +271,7 @@ static const struct sof_dev_desc rpl_desc = {
 	.nocodec_tplg_filename = "sof-rpl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
 	.ops_init = sof_tgl_ops_init,
+	.ops_free = hda_ops_free,
 };
 
 /* PCI IDs */
-- 
2.39.2

