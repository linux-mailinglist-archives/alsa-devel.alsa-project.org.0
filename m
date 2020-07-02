Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F032E212D4F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:46:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C46616F1;
	Thu,  2 Jul 2020 21:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C46616F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593719202;
	bh=DBW7pR8Gcxrh6nPvAgInrUHqC0yFZbna7LUkvyyyX38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goAZDPhD7yIf5XcfkLXxHggm7w3hOmL1FuB+7hxZqzEwW/IrSD6gMnyKUDR5I9/5h
	 NfYHh+Sf1TjEgT53TPVZIWd+ebTsssOetX8Ehi15ZpmObDE7+Rxnt5/G0Ed7feAjvK
	 hSr52iK9vicanQhGDSK6OsZ3/hzNFTBAY2H2KxRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 382B2F80349;
	Thu,  2 Jul 2020 21:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F7A4F80317; Thu,  2 Jul 2020 21:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15184F802EA
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15184F802EA
IronPort-SDR: oew8i1NfQ/8hzUzZ8HJH8Oq/38h93XqvyYLLS2yXhRVIYDKhETstOtcvHRByJRmTgbANtdnMGz
 kherdxhbqqng==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="148549359"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="148549359"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:29 -0700
IronPort-SDR: uxspDb0Qbab/1QfQ/U0AaQl+oDYoCUSO4MY22YXCUzK2un7XDvb5U2HJDU9607WfV0fXMeTal/
 ZCQo1iR9mwDg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="482116392"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:36:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 17/23] ALSA: xen: remove 'set but not used' warning
Date: Thu,  2 Jul 2020 14:35:58 -0500
Message-Id: <20200702193604.169059-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
References: <20200702193604.169059-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning. Mark the 'req' variable as __always_unused.

sound/xen/xen_snd_front.c: In function ‘xen_snd_front_stream_close’:
sound/xen/xen_snd_front.c:117:21: warning: variable ‘req’ set but not
used [-Wunused-but-set-variable]
  117 |  struct xensnd_req *req;
      |                     ^~~

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/xen/xen_snd_front.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
index a9e5c2cd7698..e21d0bfafeae 100644
--- a/sound/xen/xen_snd_front.c
+++ b/sound/xen/xen_snd_front.c
@@ -114,7 +114,7 @@ int xen_snd_front_stream_prepare(struct xen_snd_front_evtchnl *evtchnl,
 
 int xen_snd_front_stream_close(struct xen_snd_front_evtchnl *evtchnl)
 {
-	struct xensnd_req *req;
+	__always_unused struct xensnd_req *req;
 	int ret;
 
 	mutex_lock(&evtchnl->u.req.req_io_lock);
-- 
2.25.1

