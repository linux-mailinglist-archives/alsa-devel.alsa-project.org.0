Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA51E87E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7D81688;
	Wed, 15 May 2019 08:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7D81688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902897;
	bh=HfTVUukeh0e/yjyQoxSkyj9aFrCgn0TNY7sH4jWKbyY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZAGsy85Uz//BptCwZ06ZCysAVPpdCBKqTw8IWZTrx+ojc405Eg++vuHyzIX7xFrCZ
	 T14ka3q1YvM0oyj+O+C7mJMeQO1izgZepadpDb/yW3sibRzApotRYk5zutkzhwaFtL
	 ghz4YKXWNlJhkFkm5uuLduzy/YZu9UbpGVZ7GRWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 512ACF8973C;
	Wed, 15 May 2019 08:45:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CC4FF89719; Wed, 15 May 2019 08:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E03F8968A;
 Wed, 15 May 2019 08:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E03F8968A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="j6f3d7JI"
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
 by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 453lRB5zDyz1XLGMG;
 Wed, 15 May 2019 08:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902694;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=j6f3d7JICG5/fg9xm5mu/tDNUl68W9pd1fP1I4i5JpDFnBGx7dczHEvus/NN/CC0T
 sZzpl5bXuB+uZ09SWOiXmY3K3mIEtjCTseWu9GN0aIHnGNHDWQw5tWyJqpJOza0JPV
 0IvVyvso27LS+G1rKJI0mXZb3EkF5zJtDuNbtnZk=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 453lRB5htxz1CS;
 Wed, 15 May 2019 08:44:54 +0200 (CEST)
X-AuditID: 0a3aad10-057ff70000007f88-11-5cdbb566c631
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 09.5A.32648.665BBDC5;
 Wed, 15 May 2019 08:44:54 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 453lRB3BlDz5gM;
 Wed, 15 May 2019 08:44:54 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:53 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:33 +0530
Message-ID: <1557901597-19215-3-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA21Sf0wTZxjud3dtj9JjX690vNYf2864LSYqONdVRpZl2x+4GNmyv2a6uGNc
 f0TakrsWQbOFGBmTTYLKSIsBDMQgQxEpbOggaCNTkRgQRaW6BZnBEge44rbEBXdnwfaP/fPl
 fZ/3ed7n+558NMme1Zppl8cniB6+kNPoKF32yZXr7N0RW+ZAaLX1+kiYsJ5sKVNbo6GHhLWp
 Nki8S+V2xPZqcusq2rS5oSt7PiK363IKhEJXsSBueOdznXNu+DBZVLum5MDdsLoMnV5ViWga
 8Cb4re+zSqSjWRwgoPHeOBlvTiBoGxggKlFKvJns/ESpNfhVuDA2p1XqdLwO7k8e0ig1iUU4
 eKSDUJYasR+mFhgFpvAaiE09IZWawdugYq7hGR3wKrh9df8zPAXnwY9/TlBxq20QaZ5Z5Bvg
 cvB3Kr4e4PyDB2Rc+zLUjAXU1QjXJdHqkmhHEfEDMtmFzGL3W5uzrOvFfEHanZm1/guvuxPF
 w8Q96MygPYwwjTg9U9wUsbFqvlgqdYfRmzTBmZh9dhlKy/cWlDp5yblD9BcKEmdmVgx/aGON
 z2HJn+92SZLL6wkjoEkundn+yi0byxTwpbsF0RuXhdFymuIyGAedZ2Oxg/cJOwWhSBCXpm/T
 NAfMji7Z0CAKDqHE7ir0LY25lQxSqVTsi8mTZFuCTgmjN2i97D2urGCkIt4tuRyL8mVxObuE
 JqSD6H36/N8T9SRLebwewZzB5Ch6rDCdfs/zG5hXMGN/3LSxpqRBYss0uo3kDI3M952yWC//
 2YQ3MMuVuAyLYEK08ZiswSMsnHq0D0FDz2MErb0NFESaqtTw871/1XDm6jcamO/u1UBsVD6u
 na3TQuBgLQ0dN5/SMNRQrYPyI1M6WLhUmQpDkVupcPxRNBWmG0cY6Gu/lgaxigsvQP+VIQz/
 tC5gCMw3G2Dk618MEIg+ZOFO/WP5aBs1wvRsVzqcOLXXJHv0m6CquT8Daqq+A/i1/diyaTlY
 Qg52s2tcCdbH+/4n2EU08TpzGdIfj65t0UqXcoLlr4v22U0fO386917aa7tqRoeprYZo0B/M
 /aq8t4/6y3b6JZNltvS6sbrXcsBweI/HsOtJgc4y0TqzcaprJ3ModN/y5afzR4n+2m+r99va
 Y4N586Oqlszscxc/iF129GSvDm21EPUzkyXGLU+7N9xoz0b6scZBFUdJTj5rLSlK/H8hY7qp
 TQQAAA==
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH v2 2/6] pcm: dshare: Added "hw_ptr_alignment"
	option in configuration for alignment of slave pointers
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

From: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>

This change adapt the fix commit 6b058fda9dce
("pcm: dmix: Add option to allow alignment of slave pointers")
for dshare plugin

Issue is that snd_pcm_wait() goes back to waiting because the hw_ptr
is not period aligned. Therefore snd_pcm_wait() will block for a longer
time as required.

With these rcar driver changes the exact position of the dma is returned.
During snd_pcm_start they read hw_ptr as reference, and this hw_ptr
is now not period aligned, and is a little ahead over the period while it
is read. Therefore when the avail is calculated during snd_pcm_wait(),
it is missing the avail_min by a few frames.

An additional option hw_ptr_alignment is provided to dshare configuration,
to allow the user to configure the slave application and hw pointer
alignment at startup

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm_dshare.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index f135b5d..cf8a863 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -333,16 +333,16 @@ static int snd_pcm_dshare_reset(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	dshare->hw_ptr %= pcm->period_size;
 	dshare->appl_ptr = dshare->last_appl_ptr = dshare->hw_ptr;
-	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	return 0;
 }
 
-static int snd_pcm_dshare_start_timer(snd_pcm_direct_t *dshare)
+static int snd_pcm_dshare_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dshare)
 {
 	int err;
 
 	snd_pcm_hwsync(dshare->spcm);
-	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	err = snd_timer_start(dshare->timer);
 	if (err < 0)
 		return err;
@@ -364,7 +364,8 @@ static int snd_pcm_dshare_start(snd_pcm_t *pcm)
 	else if (avail < 0)
 		return 0;
 	else {
-		if ((err = snd_pcm_dshare_start_timer(dshare)) < 0)
+		err = snd_pcm_dshare_start_timer(pcm, dshare);
+		if (err < 0)
 			return err;
 		snd_pcm_dshare_sync_area(pcm);
 	}
@@ -547,7 +548,8 @@ static snd_pcm_sframes_t snd_pcm_dshare_mmap_commit(snd_pcm_t *pcm,
 		return 0;
 	snd_pcm_mmap_appl_forward(pcm, size);
 	if (dshare->state == STATE_RUN_PENDING) {
-		if ((err = snd_pcm_dshare_start_timer(dshare)) < 0)
+		err = snd_pcm_dshare_start_timer(pcm, dshare);
+		if (err < 0)
 			return err;
 	} else if (dshare->state == SND_PCM_STATE_RUNNING ||
 		   dshare->state == SND_PCM_STATE_DRAINING) {
@@ -755,6 +757,7 @@ int snd_pcm_dshare_open(snd_pcm_t **pcmp, const char *name,
 	dshare->slowptr = opts->slowptr;
 	dshare->max_periods = opts->max_periods;
 	dshare->var_periodsize = opts->var_periodsize;
+	dshare->hw_ptr_alignment = opts->hw_ptr_alignment;
 	dshare->sync_ptr = snd_pcm_dshare_sync_ptr;
 
  retry:
@@ -912,6 +915,12 @@ pcm.name {
 	ipc_key INT		# unique IPC key
 	ipc_key_add_uid BOOL	# add current uid to unique IPC key
 	ipc_perm INT		# IPC permissions (octal, default 0600)
+	hw_ptr_alignment STR	# Slave application and hw pointer alignment type
+		# STR can be one of the below strings :
+		# no
+		# roundup
+		# rounddown
+		# auto (default)
 	slave STR
 	# or
 	slave {			# Slave definition
@@ -936,6 +945,27 @@ pcm.name {
 }
 \endcode
 
+<code>hw_ptr_alignment</code> specifies slave application and hw
+pointer alignment type. By default hw_ptr_alignment is auto. Below are
+the possible configurations:
+- no: minimal latency with minimal frames dropped at startup. But
+  wakeup of application (return from snd_pcm_wait() or poll()) can
+  take up to 2 * period.
+- roundup: It is guaranteed that all frames will be played at
+  startup. But the latency will increase upto period-1 frames.
+- rounddown: It is guaranteed that a wakeup will happen for each
+  period and frames can be written from application. But on startup
+  upto period-1 frames will be dropped.
+- auto: Selects the best approach depending on the used period and
+  buffer size.
+  If the application buffer size is < 2 * application period,
+  "roundup" will be selected to avoid under runs. If the slave_period
+  is < 10ms we could expect that there are low latency
+  requirements. Therefore "rounddown" will be chosen to avoid long
+  wakeup times. Such wakeup delay could otherwise end up with Xruns in
+  case of a dependency to another sound device (e.g. forwarding of
+  microphone to speaker). Else "no" will be chosen.
+
 \subsection pcm_plugins_dshare_funcref Function reference
 
 <UL>
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
