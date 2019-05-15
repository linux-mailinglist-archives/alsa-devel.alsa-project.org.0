Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB11E87A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCB6166D;
	Wed, 15 May 2019 08:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCB6166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557902854;
	bh=ZRGzEpq2LmFGhXq16rjkWrpeMuk0JmTevA3Bw3rv960=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLfGbntrw+ONlthMl0elDT5gqfQz1ZznS0DoPFqUcdmnmXeS5YywCg7IAzFy8m0ko
	 0HfGmLzuso3dxaxoOx4Gnk6HykZPakacC/ZNC1DIAA8vG+j3jTD+RwMeP8Ef4oDDeG
	 hwBPWqy0vzWjkIApAPdOCaUjXYVT9bzyYTXorDEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0363EF896B8;
	Wed, 15 May 2019 08:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94AF7F89708; Wed, 15 May 2019 08:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A31BF89684;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A31BF89684
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="oaL2qrZR"
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 453lR92TlNz4f3m1b;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902693;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=oaL2qrZRIP5uqBmnPzEvheI+ejP5ESE6VPhCFvHBkLkgQ96+VRtBKlCBvi1Y2W28S
 Ncieu6/OkSRvH3YMU04J8SGrIX8d8VGlFj62PBMUkATxiODyx0oMr9up9xPBCINB07
 3ui2EAyF+GNomoasgLeHPsG/2s0gT9Y6qtN9+6/Y=
Received: from si0vm02576.rbesz01.com (unknown [10.58.172.176])
 by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 453lR9244gz6CjQSL;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
X-AuditID: 0a3aad0d-173ff700000036fe-c8-5cdbb5652519
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm02576.rbesz01.com (SMG Outbound) with SMTP id 3C.F9.14078.565BBDC5;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 453lR90S6rz5gK;
 Wed, 15 May 2019 08:44:53 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:51 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:32 +0530
Message-ID: <1557901597-19215-2-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALsWRmVeSWpSXmKPExsXCZbVWVjd16+0Yg61TuCyuXDzEZLF2eQOr
 xcvNb5gsFk2byeTA4rHhcxObx6z21ewem09XBzBHcdmkpOZklqUW6dslcGVcXtPFWvBatWL/
 uVssDYw/5LsYOTkkBEwkzixrY+xi5OIQEpjJJPFm0kNWCGcNo8TXSbuZ4JzJO9eyg7SwCahJ
 HLn2AcwWEdCVePp4EhuIzSxQJDFx9gYmEFtYIE3i6MqNYDUsAqoSPw+3s4LYvAJ+Eq0/nrNC
 rJaTuHmukxnE5hTwl9j26SELiC0EVHN78TtmiHpBiZMzn7BAzJeQOPjiBTNEr4LElGszWCcw
 CsxCUjYLSdkCRqZVjGLFmQZluQZGpuZmekVJqcVVBoZ6yfm5mxghAcq7g/Hct7RDjAIcjEo8
 vCWLbscIsSaWFVfmHmI05WBSEuVtSQMK8SXlp1RmJBZnxBeV5qQWK0nxylzwihEShgsXlybl
 ZhYXZ+bnHWKU4GBWEuGNUrwRI8SbklhZlVqUD9F2iFGag0VJnDedwz9GSCA9sSQ1OzW1ILUI
 JmvNwaEkwRu/BWihYFFqempFWmZOCUxaSZaXkYGBQUgMWQbZWiYOzkOMxhw8QLtvgYzgLS5I
 zC3OTIdql4RoF4KJIrSeYjSXEue1AekRAMlmlObBbZWS4b329nqMkCiSBELnK8brjMBwE+ad
 ugmomQeYVhH2SfBKg4JIECqI0GS0GKhHoJVbYsJlHYn9EwMlDn/YxSgxb8dXRokp6xeySVza
 NYtd4syxCZwS63oOckrs+/WTU2LOw/dcEqvfzOOWWHxnLo/EjOtbeCW27rojILHk4iMRiamd
 90QlfrxrFpfYcuqNhMSah+ekJTr2PJOWuLnhmIzE/1cvZSTudX2RkTh/sF8RxFWUuPRrsbLE
 yXvfVCT2NaxUlThzdZOWxJGfT3Ul7k1p1ZPY8WW93itgUDIBg9Iy8xYoKEsSS7AEJVQU4Tep
 BkbLQykRZ86VV1ROOljvpnNn7WvucIf//fMW9wj4rmJ3aeJKVXIwjotmCRdt/7h5ihoXN9OD
 Nznysw/YuC9iPZ9QrMUZtzsrRGf+ZzaF/3+2i7jrft7rdDb+zsnJeyXOG84PeTm33Es7q/ue
 lvGO0KYSv8Y4ht4bv5hlHpRLXi7Y9NWq8uC1rUosxRmJhlrMRcWJAKHjVBxDBAAA
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH v2 1/6] pcm: direct: Add generic
	hw_ptr_alignment function for dmix, dshare and dsnoop
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

Move the code snd_pcm_direct_reset_slave_ptr() from pcm_dmix.c
to pcm_direct.c and its header so that the helper function can be
re-used by other direct-pcm plugins.
There is no change in the behavior or the functionality.

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
