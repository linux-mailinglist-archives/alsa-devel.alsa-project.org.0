Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD03B690B96
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 15:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 407A0AE9;
	Thu,  9 Feb 2023 15:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 407A0AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675952542;
	bh=A0vdSNjPMJyLjXlkzEN0wg98Do1f/+T9zwXcuSekAMM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c1X49b/pE7ANfNfD4XrIBQYjyCruGEkFX994VnmkLliIbCVLQ8OAZ/TkOSyjzliY4
	 RsuJpEEFZOneDXOo/weCuiLxJcmmCKu//TXTMdRboZXFz5pylNj4SPFqGpeTAy05dz
	 FxjL2Uopqbl0YhwCAQgGRkexr/pBt0dlMrAufnT8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6228DF800E4;
	Thu,  9 Feb 2023 15:21:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF9BDF8021D; Thu,  9 Feb 2023 15:21:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F910F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 15:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F910F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iJHohRtC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675952481; x=1707488481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A0vdSNjPMJyLjXlkzEN0wg98Do1f/+T9zwXcuSekAMM=;
  b=iJHohRtCgZ6XySaMiurMUrMbh7hjCmguhbPhcEWF+XBKWf8F83E2lCAh
   AHcj8yyEN9aOg6kyzbq6bV22oeo949gcS4N0wfsAhU6lfBorH34+E7hKg
   QxXKHCSUZEtDr1IYeUJstlt7lkBow3M5BtwbaeSMGdRwacEiiyytc9UF6
   UmpCoCD1WHTYzfSGfpJPiplnZnaX7AxHd4ROIxUjohDIC1LuSSjNWCeuH
   slBPh2uotHlycAPGb7bO7DrK6rJ+Hm6b5uNcW+Tv/uArrnDCKrGaQERf+
   jSuUorB5hba3rl4RROp2esXjy/RnI0j5BmmzWFxa8n1BbGy9vg0M1D/EA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309763774"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000";
   d="scan'208";a="309763774"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 06:21:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756412200"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000";
   d="scan'208";a="756412200"
Received: from borisgol-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.16.232])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 06:21:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 0/2] ASoC: SOF: ipc4-topology: Configure copier sink format
Date: Thu,  9 Feb 2023 16:21:21 +0200
Message-Id: <20230209142123.17193-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q3WREWZWCGA6NU6NDUT3YSFK2GDCL3BU
X-Message-ID-Hash: Q3WREWZWCGA6NU6NDUT3YSFK2GDCL3BU
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3WREWZWCGA6NU6NDUT3YSFK2GDCL3BU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

In a course of creating complicated topologies where multiple output pins of a
copier is enabled, we have discovered that additional configuration needs to be
sent to the firmware to make the use cases working.

Regards,
Peter
---
Bard Liao (1):
  ASoC: SOF: ipc4-topology: set copier sink format

Ranjani Sridharan (1):
  ASoC: SOF: ipc4-topology: Print queue IDs in error

 sound/soc/sof/ipc4-topology.c | 81 +++++++++++++++++++++++++++++++----
 sound/soc/sof/ipc4-topology.h | 46 ++++++++++++++++++++
 sound/soc/sof/sof-audio.h     |  1 +
 3 files changed, 119 insertions(+), 9 deletions(-)

-- 
2.39.1

