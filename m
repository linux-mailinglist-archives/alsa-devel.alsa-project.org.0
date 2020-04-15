Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC301AB27E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58881675;
	Wed, 15 Apr 2020 22:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58881675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982645;
	bh=66kqXWGVYsK1yLut1ELvsZayjV4eZKT2GyZD9CBag9U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M5fBhdWQ6NIf339S5s6swf00UoKcbcr/eyXb/fvUwv3EUfzs7Cn/RL++fO35r7vjs
	 TlUCnjfNzqPAFQPLYGjIwcx4PDV1x92Qzm5ibyzk5xwHSrZg21ACTjihQQkrjv4m/z
	 NgMBhQ2D1WlW7K/lIhZ485lQE94uc/uQAQ436NLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6BDF8028B;
	Wed, 15 Apr 2020 22:29:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BC73F80264; Wed, 15 Apr 2020 22:28:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B026AF80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B026AF80115
IronPort-SDR: sJ/LOIZ3kfzCctjZBJqRuweeRz3nj5pk3HhYFthQ99OGvXQ/Jo9haYLyCq0LW3GJIM4GsU/bg/
 pGpjXsyM92+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:28:49 -0700
IronPort-SDR: JXOw4RLpIKH8XrhtxenCtj0F9qNlumkvCW4HqtaX6w206LTI+4facCDwHmeSgO9YZ/LP2gHFmu
 oFq3THl6oeDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656226"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:28:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/24] ASoC: SOF: topology and firmware IPC updates for 5.8
Date: Wed, 15 Apr 2020 15:27:52 -0500
Message-Id: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Long series made of a relatively small changes from multiple SOF
contributors. I didn't find a good way to split this series since it
tracks SOF minor ABI changes (backwards-compatible with older firmware
files) and needs to be kept in-order. Future series should be much
shorter.

The main addition is support for an extended firmware manifest, which
helps retrieve capabilities directly from the firmware file instead of
the current IPC mechanism (still supported but will be deprecated).

The IPC is realigned with the firmware, along with type cleanups, and
the DMIC interface is simplified.

The topology changes are mainly about a multi-cpu DAI fix, a new DC
blocking component, better parsing of tuples and new parameters for
ALH (SoundWire) and HDaudio DAIs. New tokens are also added to clarify
the firmware behavior in the case of dependent pipelines, e.g. for
echo reference generation.

Artur Kloniecki (1):
  ASoC: SOF: Add XRUN flags field to struct sof_ipc_buffer.

Bard Liao (5):
  ASoC: SOF: topology: fix: handle DAI widget connections properly with
    multiple CPU DAI's
  ASoC: SOF: align sof_ipc_dai_alh_params with FW
  ASoC: SOF: topology: Get ALH rate amd channels from topology
  ASoC: SOF: topology: fix: parse hda_tokens to &config->hda
  ASoC: SOF: topology: Get HDA rate and channels from topology

Jaska Uimonen (2):
  ASoC: SOF: topology: stop parsing when all tokens have been found
  ASoC: SOF: topology: handle multiple sets of tuple arrays

Karol Trzcinski (6):
  ASoC: SOF: Mark get_ext* function ext_hdr arguments as const
  ASoC: SOF: Introduce offset in firmware data
  ASoC: SOF: Introduce extended manifest
  ASoC: SOF: ext_manifest: parse firmware version
  ASoC: SOF: ext_manifest: parse windows
  ASoC: SOF: ext_manifest: parse compiler version

Pan Xiuli (6):
  ASoC: SOF: add probe support extend data
  ASoC: SOF: add debug ABI version
  ASoC: SOF: change type char to uint8_t in info.h
  ASoC: SOF: change type char to uint8_t in trace.h
  ASoC: SOF: change type char to uint8_t in topology.h
  ASoC: SOF: make sof_ipc_cc_version to fixed length

Sebastiano Carlucci (1):
  ASoC: SOF: topology: Add support for DC Blocker

Seppo Ingalsuo (3):
  ASoC: SOF: Intel: Fix typo in header file comment text
  ASoC: SOF: Intel: Change DMIC load IPC to fixed length
  ASoC: SOF: Intel: Rename deprecated DMIC IPC struct field

 include/sound/sof.h                   |   3 +
 include/sound/sof/dai-intel.h         |  20 +-
 include/sound/sof/info.h              |  26 ++-
 include/sound/sof/topology.h          |  16 +-
 include/sound/sof/trace.h             |   2 +-
 include/uapi/sound/sof/abi.h          |   2 +-
 include/uapi/sound/sof/ext_manifest.h |  91 ++++++++
 include/uapi/sound/sof/tokens.h       |   8 +
 sound/soc/sof/intel/hda-loader.c      |   9 +-
 sound/soc/sof/loader.c                | 226 ++++++++++++++++--
 sound/soc/sof/topology.c              | 323 ++++++++++++++++----------
 11 files changed, 568 insertions(+), 158 deletions(-)
 create mode 100644 include/uapi/sound/sof/ext_manifest.h


base-commit: 83b35f4586e235bfb785a7947b555ad8f3d96887
-- 
2.20.1

