Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87B42CF4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B983017B0;
	Wed, 12 Jun 2019 19:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B983017B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560359156;
	bh=JrMvkXSYKq/DGbn6epnzqDRQnwA4EXNkdqs8IXuMsUw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LSa9bUZwsXODCEp4YBPLoRmglfE7tr+1NmTYo90m0Ie2AXzyuDg7SY2Yr/ywI1qC7
	 K9Pl8BGtS3wS0KEX36Iwi1oSivywBz0PeRpGdvwNKOioxwioZAnG1zTxvnNBrhzMzq
	 lSdmxYJ6WTinxHctepZGIyDjej7sltzZ6BBlYJLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C05DF89743;
	Wed, 12 Jun 2019 19:02:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75C19F89741; Wed, 12 Jun 2019 19:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A1C9F80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 19:02:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A1C9F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 10:02:02 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2019 10:02:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 12:01:44 -0500
Message-Id: <20190612170148.15327-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: SOF: control/topology improvements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

3 patches to improve volume handling and DMIC unmute, plus a
long-overdue one to avoid waking-up the DSP when reading from a
kcontrol cached value.

Bard Liao (1):
  ASoC: SOF: dont wake dsp up in kcontrol IO

Seppo Ingalsuo (1):
  ASoC: SOF: Add DMIC token for unmute gain ramp time

Zhu Yingjiang (2):
  ASoC: SOF: topology: add min/max step for volume_table
  ASoC: SOF: topology: pass volume min/max linear value to FW

 include/sound/sof/dai-intel.h   |   3 +-
 include/uapi/sound/sof/abi.h    |   2 +-
 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/control.c         | 270 +++++---------------------------
 sound/soc/sof/sof-priv.h        |   2 +
 sound/soc/sof/topology.c        |  68 ++++++++
 6 files changed, 112 insertions(+), 234 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
