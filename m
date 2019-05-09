Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3857619334
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 22:12:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A8B3186D;
	Thu,  9 May 2019 22:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A8B3186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557432746;
	bh=5GfK/74HjehDLi1y3BeB+R4GH3juHYwE6IRnloyvHQo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g5V8ZlNEgDddjkgR1eduiZ89cLIXZsq0MhoYFRT7ULxS+QypSPnT+ckrR2vr5duGe
	 7XBrbACmfYnG8BdOS78GOqZqNQOJmjlVG+rSQRGhdLWGZr/E4d28O9cXXDnSgpEddQ
	 eP8R+Pf7/NZdQ7mdHHhEG/VYyJAfgIpmZxpccLqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 547A6F89682;
	Thu,  9 May 2019 22:10:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B8AF8073C; Thu,  9 May 2019 22:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E463F8073C
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 22:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E463F8073C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 May 2019 13:10:32 -0700
X-ExtLoop1: 1
Received: from kli-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.111.224])
 by fmsmga005.fm.intel.com with ESMTP; 09 May 2019 13:10:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  9 May 2019 15:10:21 -0500
Message-Id: <20190509201027.3906-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/6] ASoC: SOF: small update to align with
	Mark's tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This small patchset removes unneeded include files, fixes a race
condition seen in QEMU tests, removes unnecessary PM calls, fixes
typos and updates ICL configurations.

Jaska Uimonen (1):
  ASoC: SOF: uapi: remove unused sof header files

Kai Vehmanen (1):
  ASoC: SOF: fix race in FW boot timeout handling

Ranjani Sridharan (2):
  ASoC: SOF: pcm: remove runtime PM calls during pcm open/close
  ASoC: SOF: fix error in verbose ipc command parsing

Zhu Yingjiang (2):
  ASoC: SOF: Intel: ICL: add Icelake SSP count
  ASoC: SOF: Intel: ICL add Icelake chip info struct

 include/uapi/sound/sof/eq.h       | 172 ---------------------------
 include/uapi/sound/sof/manifest.h | 188 ------------------------------
 include/uapi/sound/sof/tone.h     |  21 ----
 include/uapi/sound/sof/trace.h    |  66 -----------
 sound/soc/sof/intel/cnl.c         |  19 +++
 sound/soc/sof/intel/hda.h         |   2 +
 sound/soc/sof/ipc.c               |   2 +-
 sound/soc/sof/loader.c            |   2 +
 sound/soc/sof/pcm.c               |  29 +----
 sound/soc/sof/sof-pci-dev.c       |   2 +-
 10 files changed, 27 insertions(+), 476 deletions(-)
 delete mode 100644 include/uapi/sound/sof/eq.h
 delete mode 100644 include/uapi/sound/sof/manifest.h
 delete mode 100644 include/uapi/sound/sof/tone.h
 delete mode 100644 include/uapi/sound/sof/trace.h

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
