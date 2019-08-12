Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 578208A0F6
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 16:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74681677;
	Mon, 12 Aug 2019 16:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74681677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565619991;
	bh=kEeDmrT0w2YZ78JpY+9GZCfVupB7AgPwpBDUINfhE7k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DZlM2Kj/zfJs8APrLU/p4l7Kh2EP+f7M+OmD+JdTM1uR30QxycQ2PAGGnrU/AZpmR
	 jCMmrpdAqjVH2AfrixnNOThylVSzPZAS3zolNWH6sYZeeNtjzfOLaMn9BhTt7Gyp9r
	 W5tIN6fslYIDCrJLpAoaTL9FRNtzs1ixGC1ABqjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6509DF801EB;
	Mon, 12 Aug 2019 16:24:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A14F80213; Mon, 12 Aug 2019 16:19:51 +0200 (CEST)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5797F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 16:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5797F800F6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 07:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; d="scan'208";a="178349702"
Received: from ruchipur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.197.82])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2019 07:03:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 12 Aug 2019 09:03:05 -0500
Message-Id: <20190812140305.17570-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: hsw: remove i386 build warning w/
	size_t argument
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

Recent changes in the common IPC code introduced a build warning with
size_t fields, use the correct %zu format.

include/linux/dynamic_debug.h:82:16: warning: format '%lu' expects
argument of type 'long unsigned int', but argument 4 has type 'size_t'
[-Wformat=]

Fixes: abf31feea26c0 ('ASoC: Intel: Update request-reply IPC model')
Reported-by: kbuild test robot <lkp@intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/haswell/sst-haswell-ipc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-ipc.c b/sound/soc/intel/haswell/sst-haswell-ipc.c
index 5c73b11375e3..0ff89ea96ccf 100644
--- a/sound/soc/intel/haswell/sst-haswell-ipc.c
+++ b/sound/soc/intel/haswell/sst-haswell-ipc.c
@@ -2015,11 +2015,11 @@ int sst_hsw_module_set_param(struct sst_hsw *hsw,
 
 	if (payload_size <= SST_HSW_IPC_MAX_SHORT_PARAMETER_SIZE) {
 		/* short parameter, mailbox can contain data */
-		dev_dbg(dev, "transfer parameter size : %lu\n",
+		dev_dbg(dev, "transfer parameter size : %zu\n",
 			request.size);
 
 		request.size = ALIGN(payload_size, 4);
-		dev_dbg(dev, "transfer parameter aligned size : %lu\n",
+		dev_dbg(dev, "transfer parameter aligned size : %zu\n",
 			request.size);
 
 		parameter = kzalloc(request.size, GFP_KERNEL);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
