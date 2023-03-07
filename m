Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B26ADA85
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 10:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F6D13F1;
	Tue,  7 Mar 2023 10:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F6D13F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678182015;
	bh=kvsiQ1eOAnt0vvEp0yYhBnQkY9mh/x7Zl2GYzoK5Br8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GR3jWTgH2upsJOvrVtF4gZxct2/DTCLI1WL8/v7lOwmZuMnW7YfmRaSUR78vU8npf
	 GOuLCAAm18RKWrtYZtOPeSiFgopQnBt35JIBEaBXtsVZKZ9R67VDnccHz5j0U3zm2M
	 3g6XQcrNlf7Xi65aFv2fd5lFK8/Fk04cqWi//QdI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1498F80236;
	Tue,  7 Mar 2023 10:39:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30B86F804FE; Tue,  7 Mar 2023 10:39:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1CCCF80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 10:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1CCCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fLquBUJV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678181941; x=1709717941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kvsiQ1eOAnt0vvEp0yYhBnQkY9mh/x7Zl2GYzoK5Br8=;
  b=fLquBUJVPfZA7LwJspXqAhJENshp8LIL9UD9SuIMeRxVUdGaTP5yIFSQ
   U2emEdmSohrsS2lT70jssWkpRST8SUxr8Vb4fMtkguNb0TnTxE4xo4yHl
   bpYrL7ymvCbnXIo2+OkaqSl6V2q7GE6qhtxxUw2ksY9IurrkICLPa6gGV
   4Pdy7suwvFY7Z9OFXWLPteB1vLsIvdKFHXPDlnDVOseHvDVCGw8Nn4wPY
   sOpqC0ivzYOfHNvfwDaCQnN1gj54blk71RnZ8LIauI2SUx8dlT+TZSCfQ
   AOjglYbhYnGryHIotR4jTnxvtQe0TxQEMj8ALpt8V4Qu2EV2JtFbZNnCa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338132598"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338132598"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:38:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676504884"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="676504884"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:38:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/4] SoC: SOF: Intel: FIx device descriptions (missing
 ops_free)
Date: Tue,  7 Mar 2023 11:39:10 +0200
Message-Id: <20230307093914.25409-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y7JJDQLS7ULBN56FON3ERKRKUQ5STSZA
X-Message-ID-Hash: Y7JJDQLS7ULBN56FON3ERKRKUQ5STSZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7JJDQLS7ULBN56FON3ERKRKUQ5STSZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

We have recently noticed that the ops_free callback was missed for the device
descriptions on Intel platforms.

Regards,
Peter
---
Ranjani Sridharan (4):
  ASoC: SOF: Intel: MTL: Fix the device description
  ASoC: SOF: Intel: HDA: Fix device description
  ASoC: SOF: Intel: SKL: Fix device description
  ASOC: SOF: Intel: pci-tgl: Fix device description

 sound/soc/sof/intel/pci-apl.c | 1 +
 sound/soc/sof/intel/pci-cnl.c | 2 ++
 sound/soc/sof/intel/pci-icl.c | 1 +
 sound/soc/sof/intel/pci-mtl.c | 1 +
 sound/soc/sof/intel/pci-skl.c | 2 ++
 sound/soc/sof/intel/pci-tgl.c | 7 +++++++
 6 files changed, 14 insertions(+)

-- 
2.39.2

