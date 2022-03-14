Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A84D8DCE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:06:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F0F6175C;
	Mon, 14 Mar 2022 21:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F0F6175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288410;
	bh=Q6AglH7efeHSEAVSI2KpOERMrfMyyvfF1249GtdgnQc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EZ/OBBxAYhfzjnmMe50dnVGzXbBgw05gEgU+ZOU/roz7R+EXTQv7s1C+sAXWRDMjX
	 +/+7o4MphTtbr8vWA7aFqlQiSKowi0TbiQt60cM4doEDsusXenlVlpIW8r8tPC8hb+
	 CkVDDmIczR0Lcsl9HSRQ8Sksm0fbgpJeQxOcnAWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C41F804E4;
	Mon, 14 Mar 2022 21:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5206F80475; Mon, 14 Mar 2022 21:05:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8357DF80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8357DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HlXIfJap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288339; x=1678824339;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q6AglH7efeHSEAVSI2KpOERMrfMyyvfF1249GtdgnQc=;
 b=HlXIfJapJyvYkeFT2HHtU8aX8JONAiAofpQahYRNur4aquRqbX0YXOvw
 KjB6EDlUJlkyAdNIWRgtIG3ZSYOed5xJO8rT/+gpwLww9n4rxW7Fq4deB
 jo9+mt0/Ccqw6iwFsjrs8UKB6OsRB9AKPHuj+gENDQ2bj0yktlECpEpPL
 Z0ql9e1+qLsvrP+x4fvgOiro9dVVo+FprkRfRXGM8kPnZuhgPEo8xyzGq
 OC801DO309ydhWCrtH7ih73908fWH+3wR+DpcXolMc1yEkoigmwKdzqau
 QVFH9uCW4Al6MFsGouH4BFT4urIHQJ0m+jCYqVaYgbrOby+Buq2xUcumO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563465"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563465"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339882"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:31 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/18] Introduce IPC abstraction for SOF topology parsing
Date: Mon, 14 Mar 2022 13:05:01 -0700
Message-Id: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com, broonie@kernel.org,
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

This patchset makes the topology parsing layer in the SOF driver
IPC-agnostic in preparation for supporting the new IPC version
introduced in the SOF firmware. These patches purely contain abstraction
changes for the current IPC version (IPC3) supported and do not introduce
any functional changes.

Ranjani Sridharan (18):
  ASoC: SOF: Introduce struct snd_sof_dai_link
  ASoC: SOF: IPC: Introduce IPC ops
  ASoC: SOF: topology: Add helper function for processing tuple arrays
  ASoC: SOF: Introduce IPC3 ops
  ASoC: SOF: topology: Make scheduler widget parsing IPC agnostic
  ASoC: SOF: topology: Make buffer widget parsing IPC agnostic
  ASoC: SOF: topology: Make pga widget parsing IPC agnostic
  ASoC: SOF: topology: Make mixer widget parsing IPC agnostic
  ASoC: SOF: topology: Make mux/demux widget parsing IPC agnostic
  ASoC: SOF: topology: Make src widget parsing IPC agnostic
  ASoC: SOF: topology: Make asrc widget parsing IPC agnostic
  ASoC: SOF: topology: Make siggen widget parsing IPC agnostic
  ASoC: SOF: topology: Make effect widget parsing IPC agnostic
  ASoC: SOF: topology: Make route setup IPC agnostic
  ASoC: SOF: topology: Make DAI widget parsing IPC agnostic
  ASoC: SOF: topology: Make control parsing IPC agnostic
  ASoC: SOF: topology: Make widget binding IPC agnostic
  ASoC: SOF: topology: remove snd_sof_complete_pipeline()

 sound/soc/sof/Makefile        |    3 +-
 sound/soc/sof/control.c       |   26 +-
 sound/soc/sof/core.c          |    1 +
 sound/soc/sof/ipc.c           |   14 +-
 sound/soc/sof/ipc3-topology.c | 2019 ++++++++++++++++++++++
 sound/soc/sof/sof-audio.c     |   66 +-
 sound/soc/sof/sof-audio.h     |  135 +-
 sound/soc/sof/sof-priv.h      |   16 +
 sound/soc/sof/topology.c      | 3060 ++++++++-------------------------
 9 files changed, 2941 insertions(+), 2399 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-topology.c

-- 
2.25.1

