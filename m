Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD429F0B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E48831760;
	Fri, 24 May 2019 21:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E48831760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558725909;
	bh=9eXRNlo21bFoBNCYgNbtv6GTATgF/lNqt6eJKYnZVfs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nLEnPcbSRPQ6zvYJZ9+4PpcUBW1TIWjWbqm4g470XLz30uPoeDxFqPlVUQoETBiq1
	 jIUH9lhcTMvw73NnazyrG/fOYffXaIJPwia9iwuc0HeitJylYSLHf7G2Hnu3n2Gl/m
	 Tk1DBdKp8VQWwJfln8OcySun6CyFgipF9MfI9BFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09798F89636;
	Fri, 24 May 2019 21:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C62CF80C0F; Fri, 24 May 2019 21:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B93F9F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B93F9F80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 12:23:15 -0700
X-ExtLoop1: 1
Received: from tattafos-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.178.85])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2019 12:23:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 14:23:04 -0500
Message-Id: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/5] ASoC: SOF: suspend/resume debug tools
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

No new functionality per se, just utilities for developers. The vast
majority of current integration issues are related to HDAudio + trace
support combined with runtime suspend/resume.

Add a couple of changes to make it easier for developers to see the
firmware logs across suspend/resume transitions, disable the trace
and/or disable runtime_pm to help narrow down the problems.

Kai Vehmanen (2):
  ASoC: SOF: trace: remove code duplication in sof_wait_trace_avail()
  ASoC: SOF: force end-of-file for debugfs trace at suspend

Pierre-Louis Bossart (3):
  ASoC: SOF: trace: move to opt-in with Kconfig and module parameter
  ASoC: SOF: acpi: add module param to disable pm_runtime
  ASoC: SOF: pci: add module param to disable pm_runtime

 sound/soc/sof/Kconfig        |  8 +++++
 sound/soc/sof/core.c         | 26 ++++++++++----
 sound/soc/sof/sof-acpi-dev.c | 12 ++++++-
 sound/soc/sof/sof-pci-dev.c  | 12 ++++++-
 sound/soc/sof/sof-priv.h     |  3 ++
 sound/soc/sof/trace.c        | 67 ++++++++++++++++++++++++++++++------
 6 files changed, 110 insertions(+), 18 deletions(-)


base-commit: 188d45fe779eeb8e3521b59fcb12cc48a6f2c203
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
