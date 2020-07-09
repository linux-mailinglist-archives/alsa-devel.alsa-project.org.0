Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C383E219EFF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 13:21:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 711E715E2;
	Thu,  9 Jul 2020 13:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 711E715E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594293671;
	bh=rVRfJ7kQOVnNIORrSF3GD8CdMDHnXyeXLDxFs2kx7qI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khCLRMGPrqNmCEFdsHIWMTr8g+S8aquJPBQqLx7XHS4QD2KMxjCjfZ7Jj5SZraz4O
	 vi1/ANAqy7j6nAJb/1acQWKCN0Nv3/ru6YD/r8mz4uN7Fy/orBWLaMILD8phrviX0J
	 IOOme3/EuBQIKAv72tcdTP4VG1a2pjNh6EGhywTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52582F80264;
	Thu,  9 Jul 2020 13:18:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EB61F802BC; Thu,  9 Jul 2020 13:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC68CF80257
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 13:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC68CF80257
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17F07AE54;
 Thu,  9 Jul 2020 11:17:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: xen: Remove superfluous fall through comments
Date: Thu,  9 Jul 2020 13:17:49 +0200
Message-Id: <20200709111750.8337-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200709111750.8337-1-tiwai@suse.de>
References: <20200709111750.8337-1-tiwai@suse.de>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>
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

The "fall through" comments found in switch-cases in ALSA xen driver
are all superfluous.  The kernel coding style allows the multiple
cases in a row.  Let's remove them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/xen/xen_snd_front.c         | 4 ----
 sound/xen/xen_snd_front_evtchnl.c | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/sound/xen/xen_snd_front.c b/sound/xen/xen_snd_front.c
index e21d0bfafeae..228d82031297 100644
--- a/sound/xen/xen_snd_front.c
+++ b/sound/xen/xen_snd_front.c
@@ -246,11 +246,8 @@ static void sndback_changed(struct xenbus_device *xb_dev,
 
 	switch (backend_state) {
 	case XenbusStateReconfiguring:
-		/* fall through */
 	case XenbusStateReconfigured:
-		/* fall through */
 	case XenbusStateInitialised:
-		/* fall through */
 		break;
 
 	case XenbusStateInitialising:
@@ -289,7 +286,6 @@ static void sndback_changed(struct xenbus_device *xb_dev,
 		break;
 
 	case XenbusStateUnknown:
-		/* fall through */
 	case XenbusStateClosed:
 		if (xb_dev->state == XenbusStateClosed)
 			break;
diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index 102d6e096cc8..29e0f0ea67eb 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -46,13 +46,9 @@ static irqreturn_t evtchnl_interrupt_req(int irq, void *dev_id)
 			continue;
 		switch (resp->operation) {
 		case XENSND_OP_OPEN:
-			/* fall through */
 		case XENSND_OP_CLOSE:
-			/* fall through */
 		case XENSND_OP_READ:
-			/* fall through */
 		case XENSND_OP_WRITE:
-			/* fall through */
 		case XENSND_OP_TRIGGER:
 			channel->u.req.resp_status = resp->status;
 			complete(&channel->u.req.completion);
-- 
2.16.4

