Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7354ECE4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F219A1B05;
	Thu, 16 Jun 2022 23:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F219A1B05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416544;
	bh=u73d0+BoP1tEdhTHzz6o1sKqQmEEJFFGrl9buc7hnZ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aXsEb2jNotmYDyYx9YxcIzJHoiFMjHfqy5fYNLYTx/ma5VZdxAStSR4TKDR3q80oM
	 eqkL5dOyfh7PZlbcReGD1QLxm3o7XYQd9xzNPvJEsXKfGYmwsUIvuvEXDoX/xdC0XB
	 0+XhLszndS0Z7RIs5CIRQEXhOWlBFZ7vjawEwQT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53A12F800F0;
	Thu, 16 Jun 2022 23:54:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C38DF80423; Thu, 16 Jun 2022 23:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3977F8012A
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3977F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VCWTDeqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416478; x=1686952478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u73d0+BoP1tEdhTHzz6o1sKqQmEEJFFGrl9buc7hnZ4=;
 b=VCWTDeqAmeW3lAMks012ql2XahZNEsRUEcg5wWGwGvX4o7TzSJMdtq2/
 xDijIwSnNOw7nPVr4OUbTyZSjc+rwfCDMnqWNobC4388QlZyxTaLzOdCW
 yqJGZdsjz7f36JsvfVntx5idZsnuTL/xUkr/VlB3qTDAA+IqaUrWabANQ
 MEsVmQu3Ba2YEQrDbkIcA38/0pXE1RIzlHo2KOv4mwuULd7Clo2/ww8Cy
 7TFP+jknUnEAVhHk676gvM+sZym2WqgR6o1oLk6jbjiL2vy64o/a64tfw
 bb24UuOgAN9IoB0SGZXdW+JbOwNbOOERR1NNKkrRBTRzoWlSZewldxQ0f w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047790"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047790"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:15 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212635"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/13] ASoC: SOF/Intel: remove __func__ from dev_dbg()
Date: Thu, 16 Jun 2022 16:53:38 -0500
Message-Id: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Cleanups suggested by Greg KH during SoundWire reviews, since the
__func__ information can be added with the dyndbg kernel parameter
[1].

The first two patches change the error level in cases where the use of
dev_dbg() was inconsistent with an aborted programming sequence.

[1] https://lore.kernel.org/alsa-devel/20220610023537.27223-2-yung-chuan.liao@linux.intel.com/

Pierre-Louis Bossart (13):
  ASoC: SOF: Intel: hda-dsp: report error on power-up/down
  ASoC: SOF: Intel: hda-stream: report error on stream not opened
  ASoC: SOF: Intel: hda-dai: remove use of __func__ in dev_dbg
  ASoC: SOF: Intel: hda-stream: remove use of __func__ in dev_dbg
  ASoC: SOF: Intel: mtl: remove use of __func__ in dev_dbg
  ASoC: SOF: ipc3-dtrace: remove use of __func__ in dev_dbg
  ASoC: SOF: ipc3-loader: remove use of __func__ in dev_dbg
  ASoC: SOF: ipc3-topology: remove use of __func__ in dev_dbg
  ASoC: SOF: ipc4-topology remove use of __func__ in dev_dbg
  ASoC: SOF: sof-client: remove use of __func__ in dev_dbg
  ASoC: SOF: ipc4: remove use of __func__ in dev_dbg
  ASoC: Intel: boards: hda: remove use of __func__ in dev_dbg
  ASoC: Intel: boards: sof_sdw: remove use of __func__ in dev_dbg

 sound/soc/intel/boards/hda_dsp_common.c      |  4 ++--
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  4 ++--
 sound/soc/intel/boards/sof_sdw.c             |  2 +-
 sound/soc/sof/intel/hda-dai.c                |  6 +++---
 sound/soc/sof/intel/hda-dsp.c                |  4 ++--
 sound/soc/sof/intel/hda-stream.c             |  6 +++---
 sound/soc/sof/intel/mtl.c                    |  3 +--
 sound/soc/sof/ipc3-dtrace.c                  |  5 ++---
 sound/soc/sof/ipc3-loader.c                  | 11 +++++------
 sound/soc/sof/ipc3-topology.c                |  4 ++--
 sound/soc/sof/ipc4-topology.c                | 18 +++++++++---------
 sound/soc/sof/ipc4.c                         |  2 +-
 sound/soc/sof/sof-client.c                   |  4 ++--
 13 files changed, 35 insertions(+), 38 deletions(-)

-- 
2.34.1

