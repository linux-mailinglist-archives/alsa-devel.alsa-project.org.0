Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D342CD3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 18:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9601177F;
	Wed, 12 Jun 2019 18:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9601177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560358742;
	bh=gHUrlDVRut9Jha7Oitgar0R4NqHpz6WShhYQq+X5t4w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tkvbqrJLa5xALyKi/ndHRmxG0d/ogr/q0gfwMNpMF0id681ltJbS6KKagUhs0Wrvc
	 +G/GrKuFx9GM1yzGL/P6DPB8GOVtd1NX1R3on2+RUs35ISAjBWA2sMJU0hCrHht+Bz
	 BJw19Z173ycfDvUzbhigPwvN+bX/H3AzzAQaX/rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98DEBF89716;
	Wed, 12 Jun 2019 18:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1542AF80791; Wed, 12 Jun 2019 18:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E057AF80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E057AF80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:57:09 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by orsmga002.jf.intel.com with ESMTP; 12 Jun 2019 09:57:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:57:00 -0500
Message-Id: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/5] ASoC: SOF: IPC: style,
	logs and suspend improvements
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

4 mostly cosmetic patches and a nice one to force recovery on failed
suspend

Dragos Tarcatu (1):
  ASOC: SOF: ipc: prevent logging trace messages

Kai Vehmanen (2):
  ASoC: SOF: intel: extend IPC dump information
  ASoC: SOF: ignore unrecoverable CTX_SAVE IPC errors at suspend

Pierre-Louis Bossart (2):
  ASoC: SOF: uapi: align comments with firmware files
  ASoC: SOF: ipc: clarify operator precedence

 include/sound/sof/topology.h |  4 ++--
 include/sound/sof/trace.h    |  4 +++-
 sound/soc/sof/intel/cnl.c    |  2 ++
 sound/soc/sof/intel/hda.c    | 29 +++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h    |  2 ++
 sound/soc/sof/ipc.c          |  9 +++++----
 sound/soc/sof/pm.c           | 11 ++++++++++-
 7 files changed, 53 insertions(+), 8 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
