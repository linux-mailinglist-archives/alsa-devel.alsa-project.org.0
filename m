Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB646C3CA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:41:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499D7251F;
	Tue,  7 Dec 2021 20:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499D7251F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906091;
	bh=QACsctaqu2AcdCTbm9Flwtf6KFbQa89qZpwixeAOgGU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WDhGAJ4f8rUVON7fHZLhKLzCHJ0fzoOdwZlbfcU2NVD28HOWu9pIgWdakSrleHODg
	 J+QCXHCLLkYkzEZCNvp2RtwpKORge28fDqw7xCI9aTSsS3n74gTdV0jbOVztFZC6Bb
	 lvkonnKaK+0LVUPGOkD4kCIhqbmlpgH1HLndWNZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F4BF804AE;
	Tue,  7 Dec 2021 20:40:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 082C0F8028D; Tue,  7 Dec 2021 20:40:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEE60F80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE60F80253
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407801"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407801"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641144"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: Intel: SOF: clarifications on hardware support
Date: Tue,  7 Dec 2021 13:39:40 -0600
Message-Id: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

This patchset revisits the Intel hardware support in SOF. The HDAudio
DMA position information was not following hardware recommended
programming sequences (similar changes are already part of the HDaudio
legacy driver), and the stream assignment applied a work-around that
was only needed on specific versions of hardware. These changes are
not tagged as 'Fixes' and don't need to be applied to -stable
versions.

While we're at it, DPIB handling is improved, useless fields removed,
a comment added on JasperLake support, and IceLake-specific routines
are isolated.

Pierre-Louis Bossart (6):
  ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
  ASoC: SOF: Intel: hda-ctrl: apply symmetry for DPIB
  ASoC: SOF: hda-stream: only enable DPIB if needed
  ASoC: SOF: Intel: hda: add quirks for HDAudio DMA position information
  ASoC: SOF: Intel: hda-dai: remove unused fields
  ASoC: SOF: Intel: add comment on JasperLake support

Ranjani Sridharan (1):
  ASoC: SOF: Intel: ICL: move ICL-specific ops to icl.c

 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  7 +++
 sound/soc/sof/intel/hda-ctrl.c   |  2 +-
 sound/soc/sof/intel/hda-dai.c    |  4 --
 sound/soc/sof/intel/hda-loader.c | 64 ------------------------
 sound/soc/sof/intel/hda-pcm.c    | 86 ++++++++++++++++++++++----------
 sound/soc/sof/intel/hda-stream.c | 25 ++++++----
 sound/soc/sof/intel/hda.c        |  9 +++-
 sound/soc/sof/intel/hda.h        |  8 ++-
 sound/soc/sof/intel/icl.c        | 67 ++++++++++++++++++++++++-
 sound/soc/sof/intel/shim.h       |  4 ++
 11 files changed, 169 insertions(+), 108 deletions(-)

-- 
2.25.1

