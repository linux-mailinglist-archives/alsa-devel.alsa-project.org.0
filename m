Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3879782811
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C7B2836;
	Mon, 21 Aug 2023 13:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C7B2836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692617858;
	bh=AiJi4uM1jHp+ojlSE66Td566xqesw1vTxZlTUqX0j28=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CStaGrJYmdZSXVK0sNL9Phv5mlOO+jFCgpygHnt/tDfooZk1OcLkd/VXefUC6L48m
	 jrjvHo4uAJ4zs8MuQLwwg7rrbBwMLHIi/It9lEFIEgl0YhGBXkwN7Go74evRN+kneZ
	 Y6hchg+7WMOoVMDHeC8KyiUfpCAXRIGxeUMRVlKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3820AF800BF; Mon, 21 Aug 2023 13:36:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9555EF8016C;
	Mon, 21 Aug 2023 13:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB2CBF800BF; Mon, 21 Aug 2023 13:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AA4FF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 13:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AA4FF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D7ZXxmBv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692617799; x=1724153799;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AiJi4uM1jHp+ojlSE66Td566xqesw1vTxZlTUqX0j28=;
  b=D7ZXxmBvk3/vWw4s2XuCkD4GiMoSL1LG7wEE8WcosLjRLwbKu1eD8551
   2s2J0IBLUEh9B05L7QUZg1uUTHD4uFjrhdLn/cFJFZjHn2HJhKkl752S8
   N0joG00IwgN4L2vFCGA01jeqUYzq2QJk8wzs4NU1/BlPO/JowG6j/WGx6
   K/v9+pB0sBRrvAgUJmqrjRUkZn2cZ9L+qVsnqcC/q0oBLWH1P3llAEf/d
   tZBBXFNgzTFsfiRxhAhSmfxUEGNamU57ft/YnhtDm/5Xodt7AxwUkdJK3
   RmkoIDHQ8MzfyY6Poauw38qsan7baaXYN7OkBxLKx9gktQSUvYKU05jnA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="459933046"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="459933046"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770911372"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="770911372"
Received: from yabolano-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.44.22])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:36:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 0/4] ASoC: SOF: ipc4-topology: Fixes for pipelines with SRC 
Date: Mon, 21 Aug 2023 14:36:25 +0300
Message-ID: <20230821113629.5017-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 76R6W2UEMQ6C5UXEUVM2GF6OF73QX5ZK
X-Message-ID-Hash: 76R6W2UEMQ6C5UXEUVM2GF6OF73QX5ZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76R6W2UEMQ6C5UXEUVM2GF6OF73QX5ZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

the SRC component in a pipeline provides flexibility on the sampling
rate which was not handled previously.

This series will improve the kernel side with the needed logic to be
able to deal with the SRC type of components in pipelines.

Regards,
Peter
---
Ranjani Sridharan (4):
  ASoC: SOF: ipc4-topology: Modify pipeline params based on SRC output
    format
  ASoC: SOF: ipc4-topology: Fix the output reference params for SRC
  ASoC: SOF: ipc4-topology: Fix pipeline params at the output of copier
  ASoC: SOF: ipc4-topology: Modify the reference output valid_bits for
    copier

 sound/soc/sof/ipc4-topology.c | 134 ++++++++++++++++++++++------------
 1 file changed, 89 insertions(+), 45 deletions(-)

-- 
2.41.0

