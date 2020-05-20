Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772E1DBA6E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E5D17FA;
	Wed, 20 May 2020 19:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E5D17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589994080;
	bh=8uhF/ljvmedJ70ItH39c/h8Ga4yjY2SdgluNFaBMrMQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lwQkpSVX2QEGYcmFJ+2FU0DX4RbQEkseyVxSHqYbSC2tHLKny0pz/dn1tXSBw6/1f
	 6RGqaxKJICrZ+F4S+daNi2Eh7kzg/iL5mIkScrC7EloHZf3ZQfqNO3Dsxk35fWeEj+
	 E59BbnssiNXr146N1f5Kjpg3nj2R1D+QLqUL5wHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0795F801DA;
	Wed, 20 May 2020 18:59:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADE5AF80272; Wed, 20 May 2020 18:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAD99F80090
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 18:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAD99F80090
IronPort-SDR: 0U6QTMDTKEgqsIMRqU6xvX71aVienxxjzXUhlha9KrlL7qcr0A1itChFx3Pt8jk4qKYaNc4I7Q
 csNJHkljAfTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 09:59:16 -0700
IronPort-SDR: jHIvC2t0NL6lLGeHp+sljHvikGu6BSaCya8kuUZkfkCV60G33XLax4myCQV8MhfjfbVzNw1A0F
 6kcmyDB1SYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; d="scan'208";a="412085886"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 20 May 2020 09:59:14 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/5] ASoC: SOF: extended manifest support for 5.8
Date: Wed, 20 May 2020 19:59:06 +0300
Message-Id: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Hello,

extended firmware manifest is a method to retrieve capabilities
directly from the firmware file instead of routing the information via
the DSP and reading it back via IPC (latter mechanism still supported
but will be deprecated).

This feature was briefly merged to 5.8 with the series sent on
2020-Apr-15, but due to a regression hit with exporting uapi headers,
the patches got dropped.

Here's an update with the uapi header issue fixed, rebased to latest
'for-5.8' and a few minor fixes. This has been sitting in sof-dev for
some weeks and no further issues have been found. We also added
a check for the uapi-export case to SOF CI, so such errors would
not slip through again in the future.

Tooling support to create firmware files with an extended header
is available in SOF firmware repository (see the rimage tool) and
this part is already merged.

Karol Trzcinski (5):
  ASoC: SOF: loader: Adjust validation condition for fw_offset
  ASoC: SOF: Introduce extended manifest
  ASoC: SOF: ext_manifest: parse firmware version
  ASoC: SOF: ext_manifest: parse windows
  ASoC: SOF: ext_manifest: parse compiler version

 include/sound/sof/ext_manifest.h |  95 +++++++++++++++++
 sound/soc/sof/intel/hda-loader.c |   2 +-
 sound/soc/sof/loader.c           | 176 ++++++++++++++++++++++++++++++-
 3 files changed, 269 insertions(+), 4 deletions(-)
 create mode 100644 include/sound/sof/ext_manifest.h

-- 
2.26.2

