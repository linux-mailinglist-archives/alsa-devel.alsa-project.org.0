Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 280DC25717D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 03:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E8A180E;
	Mon, 31 Aug 2020 03:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E8A180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598837001;
	bh=ccP785mNxhpk84ZWaHzCuimoitehQdaexnfjDuHcvfA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z3f8dhK9kjd3ntbNcod58vj9HkegLblKchXQC0GeWDH7tPRjX6QfiXNGLoK7YUFU2
	 osU17wfqNi2xd0HQSWoJdXDFQLvu0rhUZGb4wi8TNXza1NW3s5oodzFB/pxsI5gIz7
	 JoIuKHdzee4bQ+sVNt0+XiTafO176M40kB+Xogjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B8AF80217;
	Mon, 31 Aug 2020 03:21:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F870F8020D; Mon, 31 Aug 2020 03:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75086F8012E
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 03:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75086F8012E
IronPort-SDR: M2QvcY5+CfQ+ML3NF+x/C2PDwFrwZEziYDOk8YcGdA5DPcoBJT+P3KiSW7fmdfsUMH4Q6cW/gK
 YHvsSyVNfqFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="156899765"
X-IronPort-AV: E=Sophos;i="5.76,373,1592895600"; d="scan'208";a="156899765"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2020 18:21:26 -0700
IronPort-SDR: geFNoiApp43dnDgzKUTSISJDdK+49HGeZhvMkDE7Q2iLoriMbnUuTRV4OSqO50qEGzA3/wIwgm
 z21n+lY+x9SA==
X-IronPort-AV: E=Sophos;i="5.76,373,1592895600"; d="scan'208";a="476529179"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2020 18:21:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v3 0/3] ASoC: soundwire: fix port_ready[] dynamic allocation
Date: Sun, 30 Aug 2020 21:27:39 +0800
Message-Id: <20200830132742.20404-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

The existing code allocates memory for the total number of ports.
This only works if the ports are contiguous, but will break if e.g. a
Devices uses port0, 1, and 14. The port_ready[] array would contain 3
elements, which would lead to an out-of-bounds access. Conversely in
other cases, the wrong port index would be used leading to timeouts on
prepare.

This can be fixed by allocating for the worst-case of 15
ports (DP0..DP14). In addition since the number is now fixed, we can
use an array instead of a dynamic allocation.

Changes in v3:
- Add ASoC tag in the cover letter title.
- Edit the title and commit message of the third patch for better
  understanding.

Changes in v2:
- Split patches into sdw and asoc patches. Please note that "soundwire:
  fix port_ready[] dynamic allocation in mipi_disco" and "ASoC: codecs:
  fix port_ready[] dynamic allocation in ASoC codecs" should be merged
  at the same time.

Pierre-Louis Bossart (3):
  soundwire: add definition for maximum number of ports
  soundwire: fix port_ready[] dynamic allocation in mipi_disco
  ASoC: codecs: soundwire: remove port_ready[] usage from codecs.

 drivers/soundwire/mipi_disco.c  | 18 +-----------------
 drivers/soundwire/slave.c       |  4 ++++
 include/linux/soundwire/sdw.h   |  5 +++--
 sound/soc/codecs/max98373-sdw.c | 15 +--------------
 sound/soc/codecs/rt1308-sdw.c   | 14 +-------------
 sound/soc/codecs/rt5682-sdw.c   | 15 +--------------
 sound/soc/codecs/rt700-sdw.c    | 15 +--------------
 sound/soc/codecs/rt711-sdw.c    | 15 +--------------
 sound/soc/codecs/rt715-sdw.c    | 33 +--------------------------------
 9 files changed, 14 insertions(+), 120 deletions(-)

-- 
2.17.1

