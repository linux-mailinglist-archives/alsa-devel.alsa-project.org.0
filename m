Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA16F083
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jul 2019 21:47:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B94516EC;
	Sat, 20 Jul 2019 21:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B94516EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563652072;
	bh=N5UUBbk/wToMyBtaqi6iOmomf0PN7GrI/pVsK3/AKEA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XGCZBGIfLsC/7cc73e1Rt+pZQazbrEY2G9obcvt5iVaKkD8fZnc0BRWEXUc2ssItD
	 NbPda9psMIOTCFLBRB8uiW5Eo5hHhyi6wboADuI7ZsnYkTBoXwgmojRF4CQ5IDzFAO
	 HTj1iI77Lwgpf0U85i0ZQS1nzaEyI2E0Ko/fRdWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00194F80376;
	Sat, 20 Jul 2019 21:46:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEFC3F802BC; Sat, 20 Jul 2019 21:46:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D96F800AE
 for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2019 21:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D96F800AE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2019 12:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,288,1559545200"; d="scan'208";a="176592899"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2019 12:45:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 20 Jul 2019 21:45:27 +0200
Message-Id: <20190720194532.23682-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/5] ASoC: Intel: IPC framework updates
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

Cezary Rojewski (5):
  ASoC: Intel: Update request-reply IPC model
  ASoC: Intel: Haswell: Align with updated request-reply model
  ASoC: Intel: Baytrail: Align with updated request-reply model
  ASoC: Intel: Skylake: Align with updated request-reply model
  ASoC: Intel: Skylake: large_config_get overhaul

 sound/soc/intel/baytrail/sst-baytrail-ipc.c |  65 ++++----
 sound/soc/intel/common/sst-ipc.c            |  68 ++++----
 sound/soc/intel/common/sst-ipc.h            |  27 ++--
 sound/soc/intel/haswell/sst-haswell-ipc.c   | 164 +++++++++++---------
 sound/soc/intel/skylake/cnl-sst.c           |   6 +-
 sound/soc/intel/skylake/skl-messages.c      |   3 +-
 sound/soc/intel/skylake/skl-sst-ipc.c       | 152 ++++++++++--------
 sound/soc/intel/skylake/skl-sst-ipc.h       |   3 +-
 8 files changed, 259 insertions(+), 229 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
