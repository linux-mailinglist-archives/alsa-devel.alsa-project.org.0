Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D817A71AB3
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 16:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A7EC18A9;
	Tue, 23 Jul 2019 16:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A7EC18A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563893152;
	bh=akR0rPqT8b/EHda9Aa/MoaFXLHL89/NNjG5/TNTgHzY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MYDnXXdvG4ikQJ3iYDJZ5+yfIzp41nl6gU9ED+Y2SKAE62Z8D+Uw4XX1LjT+5mulO
	 GSs8a9G+RtV6IU/jZnYuAjhj/yo3afaM2y4MS1o8rV65LvmjovcnNOO+IxUOPH5H5+
	 tjWWKS9W+vk1hy0c9JSKbxdVclzm1Z/xrcAU0YD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD71DF80447;
	Tue, 23 Jul 2019 16:44:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7798F80447; Tue, 23 Jul 2019 16:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BA2CF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 16:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA2CF800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 07:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="177315175"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2019 07:43:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 23 Jul 2019 16:43:39 +0200
Message-Id: <20190723144341.21339-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: Intel: IPC framework updates
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

Existing IPC framework omits crucial part of the entire communication:
reply header. Some IPCs cannot function at all without the access to
said header. Update the sst-ipc with new sst_ipc_message structure to
represent both request and reply allowing reply-processing handlers to
save received responses.

Despite the range of changes required for model to be updated, no
functional changes are made for core hanswell, baytrail and skylake
message handlers. Reply-processing handlers now save received response
header yet no usage is added by default.

To allow for future changes, righful kings of IPC kingdom need to be put
back on the throne. This update addresses one of them: LARGE_CONFIG_GET.

Changes since v1:
- Combined first four patches into single one
- Rebased onto v5.4

Cezary Rojewski (2):
  ASoC: Intel: Update request-reply IPC model
  ASoC: Intel: Skylake: large_config_get overhaul

 sound/soc/intel/baytrail/sst-baytrail-ipc.c |  65 ++++----
 sound/soc/intel/common/sst-ipc.c            |  69 ++++----
 sound/soc/intel/common/sst-ipc.h            |  27 ++--
 sound/soc/intel/haswell/sst-haswell-ipc.c   | 164 +++++++++++---------
 sound/soc/intel/skylake/cnl-sst.c           |   6 +-
 sound/soc/intel/skylake/skl-messages.c      |   3 +-
 sound/soc/intel/skylake/skl-sst-ipc.c       | 152 ++++++++++--------
 sound/soc/intel/skylake/skl-sst-ipc.h       |   3 +-
 8 files changed, 260 insertions(+), 229 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
