Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C834D060C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD2A173C;
	Mon,  7 Mar 2022 19:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD2A173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646676758;
	bh=j1cMrAD8JHeH9nuVnWV592W3SG9tN36SU+QKfTdswY4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GN5uATFWrmr966k0Ju66fOcC5GV40Ffap5/RfHJgKuRf9+yzfRymOIgRJuqGmbZ8Q
	 k3I/fVU04rjLfnovxvWjjy2MQOEzzcNgeuPyhMBHNS0AekJTZEvtXRTdue6eVETJ8E
	 yC9zLvTLyJ/BFepR1+iD8ABBgj5mmaJHRZg3Nsss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51768F800D1;
	Mon,  7 Mar 2022 19:11:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80AE9F80124; Mon,  7 Mar 2022 19:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C29F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C29F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MDVyVF6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676686; x=1678212686;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j1cMrAD8JHeH9nuVnWV592W3SG9tN36SU+QKfTdswY4=;
 b=MDVyVF6pgdeRfAxpTwRxFiFS1qlkm7OkzIbFE/ZoEZqY+MfdjWzON+7a
 /XnNciW4Ak0reTEz2YMhVk7vZD8d1EsV5lDQJDZMFMweRsVIg+/gg6cAU
 4u+R9ZKT2WFbpj+WZq/wfHx2uoetSrDrAg1eUcSJiKZxl2YqjLGoMpoXl
 cmpyFwjse5e8MU3vMXgCUEUTMz9NAerWi6roRHSOono7oVlob3kkWAik3
 kYDKfXX66hY+Q64nhqmLna0ZdSVwlwtv51XPA+EIiwoj2pQgz0X+u1oQB
 l15QXb3rzaU3v2ScrTWLnMYRM+LU2BGBYQN3DQeFU66ejlOvtBpZHD8sb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401302"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401302"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146638"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:21 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/18] Clean ups and preparation for IPC abstraction in the
 SOF driver
Date: Mon,  7 Mar 2022 10:10:53 -0800
Message-Id: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

In preparation for adding support for the new IPC version that has been
introduced in the SOF firmware, this patch set includes some clean ups
and necessary modifications to commonly used functions that will be
re-used across different IPC-specific code.

Pierre-Louis Bossart (1):
  ASoC: SOF: sof-audio: removed unused function

Rander Wang (1):
  ASoC: SOF: move definition of snd_sof_ipc to header file

Ranjani Sridharan (16):
  ASoC: SOF: remove snd_sof_pipeline_find()
  ASoC: SOF: simplify snd_sof_device_remove()
  ASoC: SOF: set swidget's core for scheduler widget
  ASoC: SOF: topology: remove redundant code
  ASoC: SOF: topology: remove redundant code in sof_link_afe_load()
  ASoC: SOF: topology: Drop the size parameter from struct
    sof_topology_token
  ASoC: SOF: topology: Modify the get_token op for string tokens
  ASoC: SOF: topology: expose some get_token ops
  ASoC: SOF: change comp_dai to a pointer in struct snd_sof_dai
  ASoC: SOF: make struct snd_sof_widget IPC agnostic
  ASoC: SOF: topology: make sof_route_load() IPC agnostic
  ASoC: SOF: Add a tuples array to struct snd_sof_widget
  ASoC: SOF: topology: Modify signature for token parsing functions
  ASoC: SOF: topology: Rename arguments in sof_parse_token_sets()
  ASoC: SOF: topology: Rename arguments in sof_parse_tokens()
  ASoC: SOF: make struct snd_sof_dai IPC agnostic

 include/sound/sof/dai.h       |   5 +
 include/sound/sof/topology.h  |   5 -
 sound/soc/sof/core.c          |  10 +-
 sound/soc/sof/intel/hda-dai.c |  27 ++-
 sound/soc/sof/intel/hda.c     |  39 +++-
 sound/soc/sof/ipc.c           |  12 --
 sound/soc/sof/pcm.c           |  77 +++----
 sound/soc/sof/sof-audio.c     | 108 +++-------
 sound/soc/sof/sof-audio.h     |  30 ++-
 sound/soc/sof/sof-priv.h      |  12 ++
 sound/soc/sof/topology.c      | 391 +++++++++++++++++-----------------
 11 files changed, 354 insertions(+), 362 deletions(-)

-- 
2.25.1

