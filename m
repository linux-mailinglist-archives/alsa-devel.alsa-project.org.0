Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FAD76D14B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9B5829;
	Wed,  2 Aug 2023 17:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9B5829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690989271;
	bh=YTpU3YPygDX+4cqxAGZDUye/uEWEAh28w5ZEcpcqEhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SByv2fj/tvH3P8iPMX43NNCA/WDMEGr5n8FNDCzwdx52TeoB8lqaCC9xs4SjP/+7W
	 WhFtn/iigLLyk9S/r5ObM5R4xWg9J23WRjbO++SmGaYeHsTh3fnN4JFB7udigxpToo
	 uauRaoREIVhqoCPwWluJ1LTveUzRH6oprCIIyNII=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11C52F80558; Wed,  2 Aug 2023 17:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FCBEF80557;
	Wed,  2 Aug 2023 17:12:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34848F8025A; Wed,  2 Aug 2023 17:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DBCEF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBCEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S40naXgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690989163; x=1722525163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YTpU3YPygDX+4cqxAGZDUye/uEWEAh28w5ZEcpcqEhE=;
  b=S40naXguh23w/I82r9FpoRqOIeiDgziWT01I3d8gTeuuhgayNpDxfUxQ
   C6hM2w2leAx0uVDEyD64jkBW1DIsNd2qxeDF8XMpNxGkcecS0AO0TIKfc
   meS/TBJrW351G05zz5obUdCoFppmrg3vxDRsm4SHSAlrKqYhweFjGHfPt
   O3e0hALcF6wtshGbAs1tMsB+sZ953lwHQk3QzbgJtvO5Cog0HN9p5e031
   neFZt4PERMJKvq/p7jC+J+BshsC7m3DqofMn4Im6C9QM7V46c78HndBO4
   F4twSmcg+C1YWTdcJH/X6EJkYJLj4+hxL+PndO6Uel8QaO7kJ25BzPhQL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369607254"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="369607254"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="732428672"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200";
   d="scan'208";a="732428672"
Received: from rickylop-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.125.114])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 08:01:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/5] PCI: add ArrowLake-S PCI ID for Intel HDAudio subsystem.
Date: Wed,  2 Aug 2023 10:01:01 -0500
Message-Id: <20230802150105.24604-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
References: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S577I5Q5BJ5NMANCPY3L55PUXUXW3JCU
X-Message-ID-Hash: S577I5Q5BJ5NMANCPY3L55PUXUXW3JCU
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S577I5Q5BJ5NMANCPY3L55PUXUXW3JCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add part ID to common include file

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/pci_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 3066660cd39b..a6411aa4c331 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3058,6 +3058,7 @@
 #define PCI_DEVICE_ID_INTEL_HDA_RPL_S	0x7a50
 #define PCI_DEVICE_ID_INTEL_HDA_ADL_S	0x7ad0
 #define PCI_DEVICE_ID_INTEL_HDA_MTL	0x7e28
+#define PCI_DEVICE_ID_INTEL_HDA_ARL_S	0x7f50
 #define PCI_DEVICE_ID_INTEL_SCH_LPC	0x8119
 #define PCI_DEVICE_ID_INTEL_SCH_IDE	0x811a
 #define PCI_DEVICE_ID_INTEL_HDA_POULSBO	0x811b
-- 
2.39.2

