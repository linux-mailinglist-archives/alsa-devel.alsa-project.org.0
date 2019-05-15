Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99E1E882
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28071682;
	Wed, 15 May 2019 08:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28071682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902943;
	bh=QSQxC8kAqxMMJbdeKRpLBmpA9ED93A0WkSSQ5r3FRRY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TEDKeWaO7e5sL1KLNJcQNplrSMiQSwelILSHQn1mPW7nbMUzOzxAuN5QGMYOz8ueG
	 99FfZm0wcqjfrl+geC4JITplVP8F3BavtsyxWK6jvVFffIUgxqIysN5lw047Y1gSgz
	 R/WsHMmHXeaGrOZtRfXLNl3Qkkh0fJgBdRIPGJk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFA6F89742;
	Wed, 15 May 2019 08:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9C1AF89713; Wed, 15 May 2019 08:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F65F806E5;
 Wed, 15 May 2019 08:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F65F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="b86UbeY0"
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 453lRD1B5Zz1XLFrv;
 Wed, 15 May 2019 08:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902696;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=b86UbeY0spmXMQl8XRiAlcd0NUaexX+O1ORmoHwfyWrREDum4jBanrI8hRrU7NiyN
 kh6Ux+UGk3nv6UctFLbvSG20Ggrk+nrejg+eGTQSYxeQZreyBGuveor+JH/Ht/E05a
 4GmW3qgDotLnCaTOxXbv5wUN8ghWoiMpdjJoL7YI=
Received: from fe0vm1740.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 453lRD0w9Cz1CP;
 Wed, 15 May 2019 08:44:56 +0200 (CEST)
X-AuditID: 0a3aad14-cc5ff7000000410a-09-5cdbb5675ce5
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1740.rbesz01.com (SMG Outbound) with SMTP id CB.D8.16650.765BBDC5;
 Wed, 15 May 2019 08:44:55 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 453lRC5zs1zR7g;
 Wed, 15 May 2019 08:44:55 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:54 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:34 +0530
Message-ID: <1557901597-19215-4-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA21Sf0wbZRjmu7u2R+nh9Sjba8eMnHEzRkZxW2ST6YwJQZewGZNlkmbsGEfb
 SFu8KwjTaF1wOjQTtGtKEWRlsF+yNYORDTC6sjjnCFnRsY3WxY2pQFCZUDeD2bzjYO0f/nN5
 vud9nvf5vidH4ky/xkjaHC5ecHDlrFpLaNd3Ls+ynIqYTZ7963N/DIew3M5DblXuRNcUlhvw
 NmIbiYLgzG51gf+DY5qCrotvbcGLtHmlfLmtiheyn9uhtYbdB7AKX3b1QGub2o1aVtahZBLo
 NeC59LeqDmlJhvZhsHtmmlAOXyLw9O3DZNX84aN2l4zV9Ao4NzKtkbGBzoJfxj5VyxinBWho
 Cs7r0+g34EKwcx4T9OPguduOZEzRhTDa0IGU5Efg2tBeXMbJ9Gbo+esGoWQVQqTtD1zR6+FC
 4y1C2Q9wdnwcV7yPgmfEp6pHtD9B5k+QtSLsKEov401V9pxn1phWCSW8uMuUs2qn034SKXUa
 TqO5UFkI0SRidZQrEDEzKq5KrLGH0FoSY9Op2jKJSi1xltZYOdFaLFSW8yJrpDIuvWxm0h7Q
 YmWJ3SaKNqcjhIDEWQNVlHnVzFClXM0uXnAqthBaRhLsUspCbjYztIVz8a/zfAUvLE6fJUkW
 qOJuKVAv8Ba+usxW7locs8splJSUxCxJnCTGYmRyCK0mdVL23i5pBSVWcHbRZlmwP6zYmUU2
 bv0evUievXOjGWcIh9PBG5dSefIVaFlprXQ8uIExgxr5/YqZSU8YxLdMomtI6jCNWi2bddJf
 G88Gaplcl36BjJuebpc89MUlcOJ2LYKB6V4ELadjCG5+EsPhSH8LAXOxWyrou/mvCs4MfagG
 z4kDapg91a+Ggdb3NTDc69eAr8FLQvDKfRIGW+q1cL2uWwv3vqtLgcHI1RQ4fHsiBdqizTqY
 /CJMwVfHh1NhwHsnFe4euUeDb7ZND+E93+rBNzHFQLQ5Jn2O/ZAG1wNNBpj8s9sgZXydPikV
 i0nFrrONysW6ONf/FLvAxl9ndKNNn52J9mqjzfXV+4KX8wqe6KBmG7dvyt/zzcax4d96pt/O
 y9yQkf/TmLi1pmPt5ZOjtS81bfvV/VQ+hRW+NtcovhCN9MR+ZnD21WIdaf54g+n8K9sDj7kP
 92Uceu9+f9HB52czz2d5d75zzo+/Gx4M6KMPTXz+z9SOmcI3s4fWEVvHvStYQrRyOU/igsj9
 B9WS7qBPBAAA
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH v2 3/6] pcm: dsnoop: Added "hw_ptr_alignment"
	option in configuration for slave pointer alignment
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
for dsnoop plugin

Issue is that snd_pcm_wait() goes back to waiting because the hw_ptr
is not period aligned. Therefore snd_pcm_wait() will block for a longer
time as required.

With these rcar driver changes the exact position of the dma is returned.
During snd_pcm_start they read hw_ptr as reference, and this hw_ptr
is now not period aligned, and is a little ahead over the period while it
is read. Therefore when the avail is calculated during snd_pcm_wait(),
it is missing the avail_min by a few frames.

An additional option hw_ptr_alignment is provided to dsnoop configuration,
to allow the user to configure the slave application and hw pointer
alignment at startup

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm_direct.c |  1 -
 src/pcm/pcm_dmix.c   |  2 ++
 src/pcm/pcm_dshare.c |  2 ++
 src/pcm/pcm_dsnoop.c | 30 +++++++++++++++++++++++++++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 411a035..54d9900 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -2043,7 +2043,6 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 {
-	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
 
 	if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
 		(dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index dcde40d..274726e 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -562,6 +562,7 @@ static int snd_pcm_dmix_reset(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dmix = pcm->private_data;
 	dmix->hw_ptr %= pcm->period_size;
 	dmix->appl_ptr = dmix->last_appl_ptr = dmix->hw_ptr;
+	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dmix);
 	return 0;
 }
@@ -571,6 +572,7 @@ static int snd_pcm_dmix_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 	int err;
 
 	snd_pcm_hwsync(dmix->spcm);
+	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dmix);
 	err = snd_timer_start(dmix->timer);
 	if (err < 0)
diff --git a/src/pcm/pcm_dshare.c b/src/pcm/pcm_dshare.c
index cf8a863..b75809c 100644
--- a/src/pcm/pcm_dshare.c
+++ b/src/pcm/pcm_dshare.c
@@ -333,6 +333,7 @@ static int snd_pcm_dshare_reset(snd_pcm_t *pcm)
 	snd_pcm_direct_t *dshare = pcm->private_data;
 	dshare->hw_ptr %= pcm->period_size;
 	dshare->appl_ptr = dshare->last_appl_ptr = dshare->hw_ptr;
+	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	return 0;
 }
@@ -342,6 +343,7 @@ static int snd_pcm_dshare_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dshare)
 	int err;
 
 	snd_pcm_hwsync(dshare->spcm);
+	dshare->slave_appl_ptr = dshare->slave_hw_ptr = *dshare->spcm->hw.ptr;
 	snd_pcm_direct_reset_slave_ptr(pcm, dshare);
 	err = snd_timer_start(dshare->timer);
 	if (err < 0)
diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index d08b624..58b1e53 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -278,6 +278,7 @@ static int snd_pcm_dsnoop_reset(snd_pcm_t *pcm)
 	dsnoop->hw_ptr %= pcm->period_size;
 	dsnoop->appl_ptr = dsnoop->hw_ptr;
 	dsnoop->slave_appl_ptr = dsnoop->slave_hw_ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dsnoop);
 	return 0;
 }
 
@@ -285,12 +286,13 @@ static int snd_pcm_dsnoop_start(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dsnoop = pcm->private_data;
 	int err;
-	
+
 	if (dsnoop->state != SND_PCM_STATE_PREPARED)
 		return -EBADFD;
 	snd_pcm_hwsync(dsnoop->spcm);
 	snoop_timestamp(pcm);
 	dsnoop->slave_appl_ptr = dsnoop->slave_hw_ptr;
+	snd_pcm_direct_reset_slave_ptr(pcm, dsnoop);
 	err = snd_timer_start(dsnoop->timer);
 	if (err < 0)
 		return err;
@@ -627,6 +629,7 @@ int snd_pcm_dsnoop_open(snd_pcm_t **pcmp, const char *name,
 	dsnoop->max_periods = opts->max_periods;
 	dsnoop->var_periodsize = opts->var_periodsize;
 	dsnoop->sync_ptr = snd_pcm_dsnoop_sync_ptr;
+	dsnoop->hw_ptr_alignment = opts->hw_ptr_alignment;
 
  retry:
 	if (first_instance) {
@@ -771,6 +774,12 @@ pcm.name {
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
@@ -795,6 +804,25 @@ pcm.name {
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
+  "roundup" will be selected to avoid over runs. If the slave_period
+  is < 10ms we could expect that there are low latency
+  requirements. Therefore "rounddown" will be chosen to avoid long
+  wakeup times. Else "no" will be chosen.
+
 \subsection pcm_plugins_dsnoop_funcref Function reference
 
 <UL>
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
