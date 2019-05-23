Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADE27D87
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916F01670;
	Thu, 23 May 2019 15:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916F01670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558616606;
	bh=9cUZN/Ipxmwi0RewW70Rw+Aop3gXfwvi7eZ+5r3UY+8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sj8ZQif2Vzu4i7xdj9tCYclN/Pl/PsmwHEWkkWrGov2CjZkccYWEN3rs1GCzzXYNm
	 Et5mFP1oaPjekod+6xl9k2wcmG5L2ARyLdx3Vvun4eRtkq+Zz4H2sT4XtR8+s/mzOj
	 bK2LefAGtJ8qCJOfOVIGhbVR+h8HjShdBcBJBdw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B725F89718;
	Thu, 23 May 2019 15:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18CFCF89709; Thu, 23 May 2019 15:01:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C97F89670;
 Thu, 23 May 2019 15:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C97F89670
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 9A1B53C005E;
 Thu, 23 May 2019 15:00:55 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wu7e33ndPn3H; Thu, 23 May 2019 15:00:48 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id CE6D53C00D1;
 Thu, 23 May 2019 15:00:48 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 23 May 2019 15:00:48 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Thu, 23 May 2019 15:00:39 +0200
Message-ID: <1558616440-21044-2-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558616440-21044-1-git-send-email-amiartus@de.adit-jv.com>
References: <1558616440-21044-1-git-send-email-amiartus@de.adit-jv.com>
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/2] pcm: add mmap_begin callback to
	snd_pcm_fast_ops_t api
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

main motivation for adding the callback is to use it to enable operation
on mmaped buffer before user access for pcm_file plugin

support for MMAP read access with masking by data from input file is not
implemented for pcm_file plugin, by adding this callback implementing
such feature can be done by rewriting next continuous portion of buffer
on each mmap_begin call

plugins like softvol use pcm_plugin interface and overwrite the buffer by
looping around it in avail_update callback, this patch hopes to simplify
the task by adding new api callback, removing the need for rewriting
pcm_file (to use pcm_plugin callbacks) and careful checking when looping
around whole mmaped buffer

Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
---
 src/pcm/pcm.c       | 6 ++++++
 src/pcm/pcm_local.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 3a71d79..323926e 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -7129,7 +7129,13 @@ int __snd_pcm_mmap_begin(snd_pcm_t *pcm, const snd_pcm_channel_area_t **areas,
 	snd_pcm_uframes_t f;
 	snd_pcm_uframes_t avail;
 	const snd_pcm_channel_area_t *xareas;
+
 	assert(pcm && areas && offset && frames);
+
+	if (pcm->fast_ops->mmap_begin)
+		return pcm->fast_ops->mmap_begin(pcm->fast_op_arg, areas, offset, frames);
+
+	/* fallback for plugins that do not specify new callback */
 	xareas = snd_pcm_mmap_areas(pcm);
 	if (xareas == NULL)
 		return -EBADFD;
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index d52229d..d5726eb 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -184,6 +184,7 @@ typedef struct {
 	int (*poll_descriptors)(snd_pcm_t *pcm, struct pollfd *pfds, unsigned int space); /* locked */
 	int (*poll_revents)(snd_pcm_t *pcm, struct pollfd *pfds, unsigned int nfds, unsigned short *revents); /* locked */
 	int (*may_wait_for_avail_min)(snd_pcm_t *pcm, snd_pcm_uframes_t avail);
+	int (*mmap_begin)(snd_pcm_t *pcm, const snd_pcm_channel_area_t **areas, snd_pcm_uframes_t *offset, snd_pcm_uframes_t *frames); /* locked */
 } snd_pcm_fast_ops_t;
 
 struct _snd_pcm {
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
