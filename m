Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B441B303182
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 02:53:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2807217BE;
	Tue, 26 Jan 2021 02:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2807217BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611625997;
	bh=N8qwmTBoO3v922OJSHg65AYk00hfnzg6qaJAlfjeEbQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CU/Bs9jEquECgZCF0wBipR5A/MAboTBdBxZsa8njbrsaHeOMmW+Jdu/yrfDqtdPVm
	 G+uMbC+W1M97QJyB29XjBAzukg7nWdBzLc8zw+qLm/V3wB7RmtRJR3tt78Gq0DwJsx
	 QEdiczMfzzYGWDbkaQUlOcosxWB7hV0NZACtgqXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 841E3F80269;
	Tue, 26 Jan 2021 02:51:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D479F8025F; Tue, 26 Jan 2021 02:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0252F80130
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 02:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0252F80130
IronPort-SDR: JYcP4EcB3YxlgjOsSWFt0xmOx7TWEhAcx4T7LTrI8uiZx/HZe5F6DsVMcDyB2mHU50l23PBkmr
 Vj2IW4gd/e6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="159610091"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="159610091"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 17:51:36 -0800
IronPort-SDR: gi8yn8Dv/iqHnb0lHDB79eavnaKJuc+a8kcgg7TIUWXb4KR3RdrJ9lphXG3+Mfxd631L2UFL7E
 aVvT209WVkfg==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="356564912"
Received: from sugatabx-mobl.amr.corp.intel.com (HELO
 rsridh-mobl1.localdomain) ([10.212.73.120])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 17:51:35 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: SOF: Intel: hda: Enable DMI L1 for power savings
Date: Mon, 25 Jan 2021 17:51:28 -0800
Message-Id: <20210126015130.1023840-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, tiwai@suse.com,
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

This series includes 2 patches that enable DMI L1 for D0I3-compatible
streams and trace DMA stream to maximise power savings on Intel
HDA platforms.

Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda: enable DMI L1 for D0i3-compatible streams
  ASoC: SOF: Intel: hda: Enable DMI L1 for trace

 sound/soc/sof/intel/hda-compress.c |  2 +-
 sound/soc/sof/intel/hda-loader.c   |  2 +-
 sound/soc/sof/intel/hda-pcm.c      | 16 ++++++++++++-
 sound/soc/sof/intel/hda-stream.c   | 38 +++++++++++++++++-------------
 sound/soc/sof/intel/hda-trace.c    |  4 ++--
 sound/soc/sof/intel/hda.h          |  6 ++++-
 6 files changed, 46 insertions(+), 22 deletions(-)

-- 
2.25.1

