Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274F4ABF6B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:25:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B2E1696;
	Mon,  7 Feb 2022 14:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B2E1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240311;
	bh=XpGgoG6h1iV+g/By2vSWdxXSDhJBe6uKNfUmTXRc2UI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dd/bQCpXGzd8kyV7vJr/BirqWRszvjefoJUQM4PR7ZhMhSqfSWbvY2rfSC5wWzFx+
	 7Yv3D3Hq4WPNbomdq0Rh2fQ8NZuMggjasCwjZ4KG0g1ZzjkuA2ezFIOpn7rOx+CLyE
	 p5NZ89PAd6EdtTo1dqtceot+foX9woopdInoWsWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14747F804D2;
	Mon,  7 Feb 2022 14:24:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28E72F800E9; Mon,  7 Feb 2022 14:24:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC114F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC114F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gA4PT3Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240239; x=1675776239;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XpGgoG6h1iV+g/By2vSWdxXSDhJBe6uKNfUmTXRc2UI=;
 b=gA4PT3Z9AYZdQuThFHSBaN+uNEbrcfKhSe229I/lJYnS3fOVo/oeOcmQ
 aXHWT3nTy3OF8RNxWsDW6Col88nQnh+s0kEuFoijl3HMkgGCWI8uGDYNu
 ye+8drlX4qZQNJls5eEKUyiLdiqWF3XQXsoTBhg9iZpLrWLK6/6jnjzFn
 Ct70g6ise6dfWtKj9gEuLRbcqYKxftEIfz/uvwhs4HIlKnrheyq2kMUo5
 tJUD8ckJyNxyN0+vbQHGaLZ4m4FcUgkKvHmiARtzSiolOnpWXrBtObjUl
 e2Y8Pz+CQiXB3S3r8qqqILj6w9C7KIrEami57zZq0GnqDsfjevbh/R4Zr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011458"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011458"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751256"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:23:46 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 00/13] ASoC: Intel: avs: Topology and path management
Date: Mon,  7 Feb 2022 14:25:18 +0100
Message-Id: <20220207132532.3782412-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

A continuation of avs-driver initial series [1]. This chapter covers
path management and topology parsing part which was ealier path of the
main series. The two patches that represented these two subjects in the
initial series, have been split into many to allow for easier review and
discussion.

AVS topology is split into two major parts: dictionaries - found within
ASoC topology manifest - and path templates - found within DAPM widget
private data. Dictionaries job is to reduce the total amount of memory
occupied by topology elements. Rather than having every pipeline and
module carry its own information, each refers to specific entry in
specific dictionary by provided (from topology file) indexes. In
consequence, most struct avs_tplg_xxx are made out of pointers.

A 'path' represents a DSP side of audio stream in runtime - is a logical
container for pipelines which are themselves composed of modules -
processing units. Due to high range of possible audio format
combinations, there can be more variants of given path (and thus, its
pipelines and modules) than total number of pipelines and module
instances which firmware supports concurrently, all the instance IDs are
allocated dynamically with help of IDA interface. 'Path templates' come
from topology file and describe a pattern which is later used to
actually create runtime 'path'.

[1]: https://lore.kernel.org/alsa-devel/20220207122108.3780926-1-cezary.rojewski@intel.com/T/#t


Cezary Rojewski (13):
  ASoC: Intel: avs: Declare vendor tokens
  ASoC: Intel: avs: Add topology parsing infrastructure
  ASoC: Intel: avs: Parse module-extension tuples
  ASoC: Intel: avs: Parse pplcfg and binding tuples
  ASoC: Intel: avs: Parse pipeline and module tuples
  ASoC: Intel: avs: Parse path and path templates tuples
  ASoC: Intel: avs: Add topology loading operations
  ASoC: Intel: avs: Declare path and its components
  ASoC: Intel: avs: Path creation and freeing
  ASoC: Intel: avs: Path state management
  ASoC: Intel: avs: Arm paths after creating them
  ASoC: Intel: avs: Prepare modules before bindings them
  ASoC: Intel: avs: Configure modules according to their type

 include/uapi/sound/intel/avs/tokens.h |  126 ++
 sound/soc/intel/Kconfig               |    2 +
 sound/soc/intel/avs/Makefile          |    3 +-
 sound/soc/intel/avs/avs.h             |   23 +
 sound/soc/intel/avs/path.c            | 1008 ++++++++++++++++
 sound/soc/intel/avs/path.h            |   72 ++
 sound/soc/intel/avs/topology.c        | 1600 +++++++++++++++++++++++++
 sound/soc/intel/avs/topology.h        |  195 +++
 8 files changed, 3028 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/sound/intel/avs/tokens.h
 create mode 100644 sound/soc/intel/avs/path.c
 create mode 100644 sound/soc/intel/avs/path.h
 create mode 100644 sound/soc/intel/avs/topology.c
 create mode 100644 sound/soc/intel/avs/topology.h

-- 
2.25.1

