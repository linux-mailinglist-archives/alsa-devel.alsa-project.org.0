Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C41E7D3B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 14:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5319717B7;
	Fri, 29 May 2020 14:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5319717B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590755419;
	bh=XxxzWtndB6f9doMsnPm5RcgLAvAG2lTTIsCQGdRsMe8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n1ziCnOBOXmW0j+kT+ZlRr/qxosZByMRzS8HZDiEm4BAhyH1rh8DqgBPgvxqsiOHF
	 9+SxOIpEm3Dn1aOkOQN2DR6Auenps8oVMpVWkESlO/ZnZsYwI+GM7clcFY5wAJW3f7
	 WrewyYEU3QyjHb2/o4xzmD12fu2SYDOE8xjjhxt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474C1F8016F;
	Fri, 29 May 2020 14:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB514F8021E; Fri, 29 May 2020 14:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C334EF800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 14:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C334EF800FF
IronPort-SDR: 2cfDf4pFcxeg0Uwosju3T6ItTD2Wthslxj2PwMArZaiWCGUeccLZrPMO1zYa6C5ZajgFLtk7ix
 i50OZnGvyzIg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 05:28:20 -0700
IronPort-SDR: um5js2YQ+zUWt7gjiCaqFtkMTIlW+yL2woRSZi+0zIjWKkkCgwZARzuZqeYXWyRqHJGZHqurm7
 JNQXedQw27Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="469491461"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 29 May 2020 05:28:20 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz
Subject: [PATCH 0/2] alsa-lib: -ENODATA documentation
Date: Fri, 29 May 2020 15:28:15 +0300
Message-Id: <20200529122817.1198-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com
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

Hello all,

here's patch to document -ENODATA error as a PCM error code.
We have recently merged patches to SOF firmware to use
this error code:
  https://github.com/thesofproject/sof/pull/2918

Some additional background on the use-case:
  https://github.com/thesofproject/sof/issues/2564

In thread "Functionality of pcm_notify in snd-aloop?"
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-April/166974.html

.. we discussed the possibility for ALSA to provide a mechanism
for application to wait for the condition to change, but at least
for the currently known usages, the synchronization responsibility
will be in user-space (UCM file will describe the PCM dependencies).
Anyways, this is orthogonal to documenting -ENODATA, so sending
this now.

Kai Vehmanen (2):
  pcm: add documentation for -ENODATA error code
  pcm: fix spelling in documentation for -EBADFD

 src/pcm/pcm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.26.2

