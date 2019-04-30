Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B2F1CA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 10:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DCD1692;
	Tue, 30 Apr 2019 10:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DCD1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556611741;
	bh=Cw0q2A55oEKUy3C9UykNNYgZGIOW2XKM8RnIKd8mDAU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qoeu2UtlqgGNtjLnOgLzfvviy/GNAXVPKvkzMiKyN4ltocLe4NIl9R4EyKjJutw6f
	 ChnG1f7rcm9zy+R4qdkL/b2dM7MiVB2Bl5CKsxCVbbAiQrw40tF1U9Uceq/37qDl0u
	 WnG6N3jhwXVU0OoSTzG8lzzIE0PDSNRgC1M48axY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A19AF89724;
	Tue, 30 Apr 2019 10:05:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE40F896F3; Tue, 30 Apr 2019 09:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C2D4F80C0D;
 Tue, 30 Apr 2019 09:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2D4F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="M5fknlsm"
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 44tYb564zvz4f3kZX;
 Tue, 30 Apr 2019 09:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1556610593;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:From:Reply-To:Sender;
 b=M5fknlsmMHwPuGnZO1NhTL82zFeAZQryCWhMCeN1JIck4NPHJfuYHdxEUClnVTUiG
 bGCLgfzeH/ECcjWI0akJsABCMH4Hxe3rWdc++BxQLvCa9wkNddAVBGcMVut9ewO7YC
 LxvsUvxApMdHIhwribmiWxsiuHnmd8HU6P6OK0CM=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 44tYb55lyvz6CjQSN;
 Tue, 30 Apr 2019 09:49:53 +0200 (CEST)
X-AuditID: 0a3aad10-057ff70000007f88-5a-5cc7fe214cb6
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 06.07.32648.12EF7CC5;
 Tue, 30 Apr 2019 09:49:53 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 44tYb534ssz6CjZrX;
 Tue, 30 Apr 2019 09:49:53 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Tue, 30 Apr 2019 09:49:52 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <patch@alsa-project.org>
Date: Tue, 30 Apr 2019 13:08:39 +0530
Message-ID: <1556609923-14093-1-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SbUxTVxzGe+69bU8LhxwuMP4r1cmdkMwXBuoiuo1sizOEJW4m+zBmE3eR
 C22klNxbCPCJublpRwLGYgpjRAT34stkRhdkC4SOQSBaFXxrgmwSSbC+EgWxm273rmD7Yd/+
 53n+v/PkPDmY5euNFuwod0tyuVgmGMyceePxJavTnw3ZsocvpOdeuuhnco9/V6fPPXSgmXmL
 ze96uMuQ3/LlUeMHzMfmN4qlMkeVJL+a94nZvutht76iPqP6YHsTV4cOv+RBJgx0HfTe7uQ8
 yIx56mNgNnjaEDn0Ifjjq6ectsXTYwj+DBi02UAzYeDKA6MHYZxMrdAwSjSZpTLs+7qL0eYk
 ugPC17/VazNHM2DeN/6fTugWmPvCy0WCl0IwsJeN6Ikw3HyTi9wD0D89zUZ2loH3ik/fiBJa
 YtZaYtYOIuYISimRsquc6zfk5GbJRZJSm52TtcPlPIkiZdFudGakxI8oRkI8cd4bsvF6sUqp
 cfrRa5gRUkhJrSolFLmKa+yiYt8uV5ZJimAh1gsFNj7puaxUFjkdiuJwlfsRYFZIJvlDv9t4
 UizW1EqyK4L5URrmhFRSit+38bRUdEs7JalCkhfd1zEWgGz4Sw1MlKVSqbrEUeZetIUlBOl0
 Ov6FWCc2lsEmP1qL49XsD7UriFIhOhVH6QL+YgTnF9UoOoLWW1IJ+7fKUM21V5Y/T7VYCQgD
 Nj4lxoiSIXQVqb0lEaMGx6v/MJoHJE2rKHFBjEJrOlSGhszQOLYK+vZthd8e9CBo655F4D3R
 boDRnhYjnB1sNMGP9f0m6A0/MUHrjftmOHqnLQ6+n7kVBx3j38SD7+opAqd7xil0XpxMhqa9
 Eykwf++zVDg1cgfg2I1AGgS7Bq3wT+iWFSY8j6xwvr8hXTumw2i442UYnphbDr11P2TA2csn
 V8C15smVMPBkajVMeHdnhdQqGbXK7W2DWpVu0f0/VS6o0bdZ6hCegrE2Dz3x0S90bGbjpuq5
 gqW6+Z9DOHjp0JaAb2xl57mRgUz91szC9/LClwvfFZvyPj0cl1Agsbbba37yNhQG+G26oskj
 U8/W7n+lL/NAauv+8+fuVnVPv9O/hwQne/fMGDa/iR/Ptl4PL7/5+e52+PVptex6nFdprX97
 nfho5yaBU+xizgpWVsR/ATOFMUcfBAAA
X-Mailman-Approved-At: Tue, 30 Apr 2019 10:05:53 +0200
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH 1/5] pcm: direct: Add generic hw_ptr_alignment
	function for dmix, dshare and dsnoop
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

This patch is same as the fix in below commit
commit 6b058fda9dce ("pcm: dmix: Add option to allow alignment of slave
pointers")

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm_direct.c | 19 +++++++++++++++++++
 src/pcm/pcm_direct.h |  8 ++++++++
 src/pcm/pcm_dmix.c   | 25 ++-----------------------
 3 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 666a8ce..411a035 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -2040,3 +2040,22 @@ int snd_pcm_direct_parse_open_conf(snd_config_t *root, snd_config_t *conf,
 
 	return 0;
 }
+
+void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
+{
+	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
+
+	if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
+		(dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
+		pcm->buffer_size <= pcm->period_size * 2))
+		dmix->slave_appl_ptr =
+			((dmix->slave_appl_ptr + dmix->slave_period_size - 1) /
+			dmix->slave_period_size) * dmix->slave_period_size;
+	else if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDDOWN ||
+		(dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
+		(dmix->slave_period_size * SEC_TO_MS) /
+		pcm->rate < LOW_LATENCY_PERIOD_TIME))
+		dmix->slave_appl_ptr = dmix->slave_hw_ptr =
+			((dmix->slave_hw_ptr / dmix->slave_period_size) *
+			dmix->slave_period_size);
+}
diff --git a/src/pcm/pcm_direct.h b/src/pcm/pcm_direct.h
index da5e280..a71aab1 100644
--- a/src/pcm/pcm_direct.h
+++ b/src/pcm/pcm_direct.h
@@ -24,6 +24,11 @@
 
 #define DIRECT_IPC_SEMS         1
 #define DIRECT_IPC_SEM_CLIENT   0
+/* Seconds representing in Milli seconds */
+#define SEC_TO_MS               1000
+/* slave_period time for low latency requirements in ms */
+#define LOW_LATENCY_PERIOD_TIME 10
+
 
 typedef void (mix_areas_t)(unsigned int size,
 			   volatile void *dst, void *src,
@@ -257,6 +262,8 @@ struct snd_pcm_direct {
 	snd1_pcm_direct_get_chmap
 #define snd_pcm_direct_set_chmap \
 	snd1_pcm_direct_set_chmap
+#define snd_pcm_direct_reset_slave_ptr \
+	snd1_pcm_direct_reset_slave_ptr
 
 int snd_pcm_direct_semaphore_create_or_connect(snd_pcm_direct_t *dmix);
 
@@ -341,6 +348,7 @@ int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct);
 int snd_pcm_direct_client_chk_xrun(snd_pcm_direct_t *direct, snd_pcm_t *pcm);
 int snd_timer_async(snd_timer_t *timer, int sig, pid_t pid);
 struct timespec snd_pcm_hw_fast_tstamp(snd_pcm_t *pcm);
+void snd_pcm_direct_reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix);
 
 struct snd_pcm_direct_open_conf {
 	key_t ipc_key;
diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index c5592cd..dcde40d 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -55,9 +55,6 @@ const char *_snd_module_pcm_dmix = "";
 #define STATE_RUN_PENDING	1024
 #endif
 
-#define SEC_TO_MS	1000			/* Seconds representing in Milli seconds */
-#define LOW_LATENCY_PERIOD_TIME	10	/* slave_period time for low latency requirements in ms */
-
 /*
  *
  */
@@ -560,30 +557,12 @@ static int snd_pcm_dmix_hwsync(snd_pcm_t *pcm)
 	}
 }
 
-static void reset_slave_ptr(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
-{
-	dmix->slave_appl_ptr = dmix->slave_hw_ptr = *dmix->spcm->hw.ptr;
-
-	if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDUP ||
-	    (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
-	     pcm->buffer_size <= pcm->period_size * 2))
-		dmix->slave_appl_ptr =
-			((dmix->slave_appl_ptr + dmix->slave_period_size - 1)
-			 / dmix->slave_period_size) * dmix->slave_period_size;
-	else if (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_ROUNDDOWN ||
-		 (dmix->hw_ptr_alignment == SND_PCM_HW_PTR_ALIGNMENT_AUTO &&
-		  (dmix->slave_period_size * SEC_TO_MS) / pcm->rate < LOW_LATENCY_PERIOD_TIME))
-		dmix->slave_appl_ptr = dmix->slave_hw_ptr =
-			((dmix->slave_hw_ptr / dmix->slave_period_size) *
-			 dmix->slave_period_size);
-}
-
 static int snd_pcm_dmix_reset(snd_pcm_t *pcm)
 {
 	snd_pcm_direct_t *dmix = pcm->private_data;
 	dmix->hw_ptr %= pcm->period_size;
 	dmix->appl_ptr = dmix->last_appl_ptr = dmix->hw_ptr;
-	reset_slave_ptr(pcm, dmix);
+	snd_pcm_direct_reset_slave_ptr(pcm, dmix);
 	return 0;
 }
 
@@ -592,7 +571,7 @@ static int snd_pcm_dmix_start_timer(snd_pcm_t *pcm, snd_pcm_direct_t *dmix)
 	int err;
 
 	snd_pcm_hwsync(dmix->spcm);
-	reset_slave_ptr(pcm, dmix);
+	snd_pcm_direct_reset_slave_ptr(pcm, dmix);
 	err = snd_timer_start(dmix->timer);
 	if (err < 0)
 		return err;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
