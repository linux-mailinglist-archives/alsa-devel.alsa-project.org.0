Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248731E88C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 08:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C0116D9;
	Wed, 15 May 2019 08:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C0116D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557903048;
	bh=mARxSfedDgPJPIKo3evICVWwCTTSGYJf1EpY9VuZYeo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cpdf3DubwCJsKUtQIzcV8o3KVuSoaAjqXGB+LMl2Di3uZpx7oPsoNnm2J8vwdKnB7
	 Pg1F5nK9twXFs3l3gVIndcFP2pStk1BgVvnDPrK45Stxf6QW0W2XfXRHxZ6lvPb2bF
	 wNl5/7b4jOeLuvOpPAvg4sBuCsW1MzgDHMfShPJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 096CFF8974E;
	Wed, 15 May 2019 08:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 297C6F89737; Wed, 15 May 2019 08:45:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61091F806E5;
 Wed, 15 May 2019 08:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61091F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="dwhk/gtb"
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 453lRJ12Vxz1XLGMG;
 Wed, 15 May 2019 08:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=2015-01-21; t=1557902700;
 bh=j9ghyqlcIsq1VvBEl8XAwe9fmi0UKdHNOBlJj7mLn+I=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=dwhk/gtbqrWjjQsxNJ8MwNuOPS4JoNumUsKIBvsWaYJ2XsZ4m375XZoFL7WiTPoTT
 V5w5QW+3+e+tvEVz2oPuXlfGc0LyH2Rp6BDGc7EZhPCnSsSD5YG8FBYf5jPNK+eZf/
 7xyJ4IcdJTeZnP/d/OYBaEUc7ZJj636fD8YKOve8=
Received: from si0vm2083.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 453lRJ0gtdz1Tg;
 Wed, 15 May 2019 08:45:00 +0200 (CEST)
X-AuditID: 0a3aad17-5a7ff70000001fa9-22-5cdbb56bf032
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm2083.rbesz01.com (SMG Outbound) with SMTP id B4.D1.08105.B65BBDC5;
 Wed, 15 May 2019 08:44:59 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
 by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 453lRH683jz6Cjg80;
 Wed, 15 May 2019 08:44:59 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1713.5;
 Wed, 15 May 2019 08:44:58 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <tiwai@suse.de>, <patch@alsa-project.org>
Date: Wed, 15 May 2019 11:56:37 +0530
Message-ID: <1557901597-19215-7-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
References: <1557901597-19215-1-git-send-email-vanitha.channaiah@in.bosch.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA21Sb0wTZxzmvbuWa8PBceXoj4LLvGQu0alVXKyMLduyLKgJmn2badRDrvQi
 LeyuEMElIyA2FafYMIWqjcIyjKMRBY2MD2ONGeAYEQLVARugmPiPhSAVVELW88D2w7499/z5
 PXmfHIkzgXgTKTpdguTkCzmtntBnBVatP3h91Gqu7s6yDA0EMUuguUJjedz2DLM0nm7APiVy
 Wp9XanN87p/jc9r+OLwb36PPzhcKxVJB2vjJfr194am5eG7boeHF19oKtPDBMaQjgd4CV05c
 x44hPcnQ9RhMnpzF1Y8rCP5uaEGKi6FbELj71ypYS6+BW6GZeAWn0Ovh4QOvVsE4LcGps62Y
 gg20E7qWmnAFE/R7MHXV8+YORefCUtUNrdr8DvzV73nj0dG74MbsJKF25cJo07+46k+G3oYp
 Qr0P8NujR7iafRfqQvWaWkT7Ymy+GNsFhF1GrCyaSx2bzZbMDVKeIJebN204UOS4htQ1jTdR
 c8gWRDSJuATK1ThqZTR8qVzmCKIPSYxjqSO2CJWYV5RfZudl+z6ppFCQOROVcWeHlTG8peWS
 PIcoy2KRM4iAxLkUas/qe1aGyufLygWpSI0FUTpJcEaqgNxlZegC3iUcFIRiQVpRPyJJDqh9
 7ZHCZEkoEA7ZxELXisytolBcXByTGqvE1mKkLogyyYRI94hygpKLeYcsFizH09Q4s8JGo7fR
 VpORylYytKLaS5xvW00ZVGj6rpVhY4Ro8gm6iyK7GahMJZwQ+VGjfUClKxMlL5PR0OamSIbu
 YGEmmAH+Sgl6/b8j8N8MI+iseongpfsOBr3tXgIu9U4Q0Dfm0cCtztMaGJt/pYWZ+2EKFtte
 JEKf/0gSDJ3wJUFP7fkkGBk4w0DIPcPAnLfLAPenHxpgzhNKgfrhAAv1060s9A0PsuA970mF
 usoXqfDcd9EI4bEOgPbbzwAWJv5Jg6vjf6ZDy2R/+pPIlFhkym3iiDKli3f9z5TLbPRtpgr0
 2byctnPLeP/hnqO/Tt37wZrTtHW6uXknLA2mses6Tp6zTdmO28fPzObWyLXfCeJQOOP7bx5k
 1fy48du9n8vrjHWJ/p6BxWpdY9f27b98+XF5/H73kL/mq/buzkDWRLjli6pBbddunbf0aHb3
 gbNrKp8GBumGx9Xvs/Onkn3DPx3/mucI2c5vWotLMv8fyS+YQEAEAAA=
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org,
 Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
Subject: [alsa-devel] [PATCH v2 6/6] pcm: Update pcm->avail_min with
	needed_slave_avail_min, after reading unaligned frames
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

This Fix was analyzed for below usecase :

alsa configuration:
pcm.line_in {
    type dsnoop
    ipc_key  INT
    slave {
        pcm hardware
	channels 2
	period_time 8000
        rate 48000
        format S16_LE
    }
   bindings {
       0 0
       1 1
   }
}
pcm.hardware {
    type hw
    card "gmd-card"
    device 0
    subdevice 0
    channels 2
    period_time 2000
    rate 48000
    format S16_LE
}

command:
$arecord -v -D line_in -r 48000 -c 2 -f S16_LE recordfile.wav
Direct Snoop PCM
Its setup is:
  stream       : CAPTURE
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 1536
  period_size  : 384
  period_time  : 8000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 384
  period_event : 0
  start_threshold  : 1
  stop_threshold   : 1536
  silence_threshold: 0
  silence_size : 0
  boundary     : huge value
Hardware PCM card 3 'gmd-card' device 0 subdevice 0
Its setup is:
  stream       : CAPTURE
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 1536
  period_size  : 96
  period_time  : 2000
  tstamp_mode  : ENABLE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 96
  period_event : 0
  start_threshold  : 1
  stop_threshold   : huge value
  silence_threshold: 0
  silence_size : 0
  boundary     : huge value
  appl_ptr     : 0
  hw_ptr       : 576

Here, there are no other plugins apart from Dsnoop.

Issue: After partial read of unaligned frames(not one period frames),
snd_pcm_wait() would  block for the pcm->avail_min which would result in
blocking for longer periods i.e more than one period as specified by
pcm->avail_min

For e.g.:
Slave period size = 0x60
Client period-size=0x180
No. of Ticks = 4
pcm->avail_min = one period size = 0x180

Issue:
- During the start of streaming, the position of slave hw_ptr returned
  from the driver is 0x20.
- avail is 0x20
- hw_ptr is calculated by new_slave_hw_ptr - old_slave_hw_ptr i.e.
  0x20 - 0 = 0x20
- hw_ptr updated to 0x20
- avail is 0x20
- app_ptr updated to 0x20
- Now, avail = 0
- snd_pcm_wait() waits till avail=0x180 because pcm->avail_min = 0x180
- After 4 snd_pcm_elapsed(), slave_hw_ptr = 0x180
- Since app_ptr has updated with 0x20, avail becomes 0x160
  There is a shortage of 0x20 frames and hence snd_pcm_wait()
  goes back to wait again.
- Now, snd_pcm_wait is locked.
- After another 4 snd_pcm_elapsed() slave_hw_ptr = 0x300
- avail = 0x2e0
- snd_pcm_wait() unlocks.
So, here snd_pcm_wait() is locked for more than 1 period(exactly 2 periods)

Also, this issue can be seen without dsnoop plugin, when HW reports unaligned hw_ptr
For e.g.
period size = 0x60
pcm->avail_min = 0x60
- During the start of streaming, the position of slave hw_ptr returned
  from the driver is 0x20.
- hw_ptr is calculated by new_slave_hw_ptr - old_slave_hw_ptr i.e.
  0x20 - 0 = 0x20
- hw_ptr updated to 0x20
- avail is 0x20
- app_ptr updated to 0x20
- Now, avail = 0
- snd_pcm_wait() waits till avail=0x60 because pcm->avail_min=0x60
- After 1 snd_pcm_elapsed(), slave_hw_ptr = 0x60
- Since app_ptr has updated with 0x20, avail becomes 0x40
  There is a shortage of 0x20 frames and hence snd_pcm_wait()
  goes back to wait again.
- Now, snd_pcm_wait is locked.
- After another 1 snd_pcm_elapsed(), slave_hw_ptr = 0x120
- avail = 0xe0
- snd_pcm_wait() unlocks.
So, here snd_pcm_wait() is locked for more than 1 period (exactly 2 periods)

Fix: After reading unaligned frames(not one period frames),
set the pcm->avail_min to the needed_avail_slave_min frames
so that snd_pcm_wait() blocks till needed_avail_slave_min available
Once needed_avail_slave_min frames are read, set back the original
pcm->avail_min

For ex:
Slave period size = 0x60
Client period-size=0x180
No. of Ticks = 4
pcm->avail_min = one period size = 0x180

Fix:
- During the start of streaming, the position of slave_hw_ptr returned
  from the driver is 0x20.
  - hw_ptr is calculated by new_slave_hw_ptr - old_slave_hw_ptr
  i.e. 0x20 - 0 = 0x20
- hw_ptr updated to 0x20
- avail is 0x20
- app_ptr updated to 0x20
- Now, avail = 0
- calculate needed_avail_slave_min = 0x160
- update the needed_avail_slave_min to pcm->avail_min
  i.e. pcm->avail_min = 0x160
- snd_pcm_wait() waits till avail=0x160
- After 4 snd_pcm_elapsed(), slave_hw_ptr = 0x180
- snd_pcm_wait() unlocks.
- Once needed_avail_slave_min frames are read, set back the
  original pcm->avail_min to 0x180
So, here snd_pcm_wait() is locked for 1 period only.

Signed-off-by: Vanitha Channaiah <vanitha.channaiah@in.bosch.com>
---
 src/pcm/pcm.c       | 21 +++++++++++++++++++++
 src/pcm/pcm_local.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index f0db545..f361eb1 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -973,6 +973,7 @@ int snd_pcm_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
 		__snd_pcm_unlock(pcm);
 		return err;
 	}
+	pcm->original_avail_min = pcm->avail_min;
 	__snd_pcm_unlock(pcm);
 	return 0;
 }
@@ -7267,6 +7268,17 @@ void snd_pcm_areas_from_bufs(snd_pcm_t *pcm, snd_pcm_channel_area_t *areas,
 	snd_pcm_unlock(pcm);
 }
 
+static void snd_pcm_set_avail_min(snd_pcm_t *pcm, snd_pcm_uframes_t avail)
+{
+	if (avail != pcm->avail_min) {
+		snd_pcm_sw_params_t swparams;
+
+		snd_pcm_sw_params_current(pcm, &swparams);
+		swparams.avail_min = avail;
+		_snd_pcm_sw_params_internal(pcm, &swparams);
+	}
+}
+
 snd_pcm_sframes_t snd_pcm_read_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_t *areas,
 				     snd_pcm_uframes_t offset, snd_pcm_uframes_t size,
 				     snd_pcm_xfer_areas_func_t func)
@@ -7274,6 +7286,7 @@ snd_pcm_sframes_t snd_pcm_read_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_
 	snd_pcm_uframes_t xfer = 0;
 	snd_pcm_sframes_t err = 0;
 	snd_pcm_state_t state;
+	snd_pcm_uframes_t needed_slave_avail_min = 0;
 
 	if (size == 0)
 		return 0;
@@ -7332,6 +7345,14 @@ snd_pcm_sframes_t snd_pcm_read_areas(snd_pcm_t *pcm, const snd_pcm_channel_area_
 		if (err < 0)
 			break;
 		frames = err;
+		pcm->unaligned_frames += frames;
+		pcm->unaligned_frames %= pcm->period_size;
+		if (pcm->unaligned_frames) {
+			needed_slave_avail_min = pcm->period_size - pcm->unaligned_frames;
+			snd_pcm_set_avail_min(pcm, needed_slave_avail_min);
+		} else {
+			snd_pcm_set_avail_min(pcm, pcm->original_avail_min);
+		}
 		offset += frames;
 		size -= frames;
 		xfer += frames;
diff --git a/src/pcm/pcm_local.h b/src/pcm/pcm_local.h
index e103f72..3fdffb4 100644
--- a/src/pcm/pcm_local.h
+++ b/src/pcm/pcm_local.h
@@ -210,6 +210,8 @@ struct _snd_pcm {
 	snd_pcm_tstamp_type_t tstamp_type;	/* timestamp type */
 	unsigned int period_step;
 	snd_pcm_uframes_t avail_min;	/* min avail frames for wakeup */
+	snd_pcm_uframes_t unaligned_frames;
+	snd_pcm_uframes_t original_avail_min;
 	int period_event;
 	snd_pcm_uframes_t start_threshold;
 	snd_pcm_uframes_t stop_threshold;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
