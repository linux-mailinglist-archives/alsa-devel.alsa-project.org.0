Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 781DC70DA9C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 12:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4001ED;
	Tue, 23 May 2023 12:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4001ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684838059;
	bh=927PR1r5gSV8XZKkttHN/uoj/uvrlN1T2Znoj/Uu9RE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Dxg5g7CyjqZrigN07xZBVmpL9S1pVEOjxR/50yRChUUaQsxZWVfl0Tojb09vRsadN
	 gZukAM1w9PvTjVfHt/RfFCNV9Y2YNlaWEJMoYEXXpcQjriKHZm71hwf0ncOhpQK31P
	 U688qcX/U2Q1wsR2ohr78nRqYru34BlKI9ILUiMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A618AF80086; Tue, 23 May 2023 12:33:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C00F8024E;
	Tue, 23 May 2023 12:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEA5DF8053D; Tue, 23 May 2023 12:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE8ECF80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 12:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8ECF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RkDokGwu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684837997; x=1716373997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=927PR1r5gSV8XZKkttHN/uoj/uvrlN1T2Znoj/Uu9RE=;
  b=RkDokGwumrO+wxA/ErAfEzw+op67X/LmzNY61OKqLorXlUU9kyHZ6uRu
   j0RdEYKF7nwvPkx5ohR+amoJX1qJVfSHaekYS/BQiLfI4jHzNmpPfUGoY
   QEtqxIWKb8MRtYRN9iBNlM07yVGbBXmQ3z5IApsr1rWEEZ2URHL9mrM6r
   awaKqAkiGQutZ8fFcIUm1SlXcEBKV4B3BVceCh1/ioDpIIKXatq6kbWac
   WMjFWL8GGUzd9c3kZEglbZPyqKnDdBWT1e2KeOzELN3SE9Ps/tU8Yw1e7
   oRHgTqZ59g9ycuq6PJZe2JDRj4PgJ0XNPx4FRh3isaVZcDRWgCNNZpCYH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333562937"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400";
   d="scan'208";a="333562937"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 03:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681333511"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400";
   d="scan'208";a="681333511"
Received: from nmkenne1-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.53.154])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 03:31:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 0/3] ASoC: SOF: Intel: mtl: Enable multicore support
Date: Tue, 23 May 2023 13:32:14 +0300
Message-Id: <20230523103217.20412-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X4GS6ICBYBFRZYMMOO6OVFVHKRD3NB5A
X-Message-ID-Hash: X4GS6ICBYBFRZYMMOO6OVFVHKRD3NB5A
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4GS6ICBYBFRZYMMOO6OVFVHKRD3NB5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The following series will enable multicore support on MTL platforms similarly
to other Intel platforms.

The TGL patch is included to simplify the core_put implementation.

Multicore support can be enabled by updated topologies, with current set of
tplg files this series is not introducing any runtime change.

Regards,
Peter
---
Rander Wang (3):
  ASoC: SOF: Intel: mtl: setup primary core info on MeteorLake platform
  ASoC: SOF: Intel: mtl: add core_get & put support on MeterLake
    platforms
  ASoC: SOF: Intel: tgl: unify core_put on IPC3 & IPC4 path

 sound/soc/sof/intel/mtl.c | 52 +++++++++++++++++++++++++++++++++++----
 sound/soc/sof/intel/tgl.c | 10 +++++---
 2 files changed, 54 insertions(+), 8 deletions(-)

-- 
2.40.1

