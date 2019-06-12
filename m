Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556942CA5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999E8178D;
	Wed, 12 Jun 2019 18:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999E8178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560358164;
	bh=JD1z0JdalN6GhCErfIgXoxMJmHo5p8+ZQTC2H5x/22w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t/wnFswH809gBHtCAW3+n9A/dJBKqBs10IOo7aeOye0MRz+gMI4j2aX4Jt39jbz7v
	 3xHll2uQv2Fv3c130H5zAMvVxPwDyXyd8HjtY0R3S+VOMDDRYy1yfTCaagTcGSMvKC
	 ucR1zvCYswLbVEQTP2S6E2dBYGQoCCv7hTcuWnRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96EFAF896EA;
	Wed, 12 Jun 2019 18:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 605E1F896E3; Wed, 12 Jun 2019 18:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93D7DF80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93D7DF80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:47:32 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2019 09:47:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:47:23 -0500
Message-Id: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 0/3] ASoC: SOF: suspend/resume debug tools
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

These patches were submitted in an earlier series but not merged and
then conflicted with the IPC flood test.

Resending, no new functionality. These helpers are really helpful for
e.g. SoundWire or HDaudio bringup.

Pierre-Louis Bossart (3):
  ASoC: SOF: trace: move to opt-in with Kconfig and module parameter
  ASoC: SOF: acpi: add module param to disable pm_runtime
  ASoC: SOF: pci: add module param to disable pm_runtime

 sound/soc/sof/Kconfig        |  8 ++++++++
 sound/soc/sof/core.c         | 26 ++++++++++++++++++++------
 sound/soc/sof/sof-acpi-dev.c | 12 +++++++++++-
 sound/soc/sof/sof-pci-dev.c  | 12 +++++++++++-
 sound/soc/sof/sof-priv.h     |  1 +
 sound/soc/sof/trace.c        | 17 ++++++++++++++++-
 6 files changed, 67 insertions(+), 9 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
