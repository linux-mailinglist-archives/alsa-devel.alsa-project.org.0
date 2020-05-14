Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FD1D2B81
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 11:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EBA31675;
	Thu, 14 May 2020 11:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EBA31675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589448813;
	bh=YyRGXa5DQcTP+zR/GFV7KPSpwoZI7crU4X4yEoj0mXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/MCP3/NkcfDCpbucikAEa7nogj80ejBARga0mwCzPk6ZMQqeQmILqFiVFie86n+k
	 O9B0+n0bJjPt66zhn1a3xAY90EiC/oWQUNyh1J1qsIvTzbQO/Zw3OZyuth4OW/LKW/
	 EOCcxP6On9N52g9V+hIgqKN7/+whW0ui7/GdZiC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94116F80274;
	Thu, 14 May 2020 11:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B39B4F800BD; Thu, 14 May 2020 11:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by alsa1.perex.cz (Postfix) with ESMTP id 3416CF800BD
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 11:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3416CF800BD
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.53 with ESMTP; 14 May 2020 18:30:45 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: changjoon.lee@lge.com
Received: from unknown (HELO MacBookPro.local.net) (10.157.161.30)
 by 156.147.1.125 with ESMTP; 14 May 2020 18:30:45 +0900
X-Original-SENDERIP: 10.157.161.30
X-Original-MAILFROM: changjoon.lee@lge.com
From: changjoon.lee@lge.com
To: tiwai@suse.de
Subject: [PATCH v2 1/1] Updated negative return values for documentation
 update.
Date: Thu, 14 May 2020 18:30:39 +0900
Message-Id: <20200514093039.39558-2-changjoon.lee@lge.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514093039.39558-1-changjoon.lee@lge.com>
References: <20200514093039.39558-1-changjoon.lee@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ChangJoon Lee <changjoon.lee@lge.com>, alsa-devel@alsa-project.org,
 linux@endlessm.com, linux-kernel@vger.kernel.org
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

From: ChangJoon Lee <changjoon.lee@lge.com>

Hi, ALSA Teams,

This is documentation update purpose patch.
This patch does NOT alter any of operations.

This patch allows an application engineer to understand why they received negative return
such as -EIO, -EBADFD, -ENOSYS, -ESTRPIPE and etc which are not fully documented on documentation site.

This patch also exposes Expected Status of PCM based on bad_pcm_state() with P_STATE to help engineer to understand API behavior to the documentation site.

TODO :
We may need improve consistency of return value especially for snd_pcm_hw_params_current().
It returns -EBADFD when PCM is not setup while other API returns -EIO in this case.

Signed-off-by: ChangJoon Lee <changjoon.lee@lge.com>
---
 src/pcm/pcm.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/src/pcm/pcm.c b/src/pcm/pcm.c
index 1064044c..b53797a6 100644
--- a/src/pcm/pcm.c
+++ b/src/pcm/pcm.c
@@ -820,6 +820,7 @@ int snd_pcm_nonblock(snd_pcm_t *pcm, int nonblock)
  * \param sig Signal to raise: < 0 disable, 0 default (SIGIO)
  * \param pid Process ID to signal: 0 current
  * \return 0 on success otherwise a negative error code
+ * \return -ENOSYS Async is not supported on this PCM
  *
  * A signal is raised every period.
  */
@@ -850,6 +851,7 @@ int snd_pcm_async(snd_pcm_t *pcm, int sig, pid_t pid)
  * \param pcm PCM handle
  * \param info Information container
  * \return 0 on success otherwise a negative error code
+ * \return -ENOSYS Info is not supported on this PCM
  */
 int snd_pcm_info(snd_pcm_t *pcm, snd_pcm_info_t *info)
 {
@@ -867,6 +869,7 @@ int snd_pcm_info(snd_pcm_t *pcm, snd_pcm_info_t *info)
  * \param pcm PCM handle
  * \param params Configuration space definition container
  * \return 0 on success otherwise a negative error code
+ * \return -EBADFD PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
  */
 int snd_pcm_hw_params_current(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 {
@@ -933,6 +936,7 @@ int snd_pcm_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 /** \brief Remove PCM hardware configuration and free associated resources
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \return -ENOSYS Hw_free is not supported on this PCM
  */
 int snd_pcm_hw_free(snd_pcm_t *pcm)
 {
@@ -960,7 +964,9 @@ int snd_pcm_hw_free(snd_pcm_t *pcm)
  * \param pcm PCM handle
  * \param params Configuration container
  * \return 0 on success otherwise a negative error code
- *
+ * \retval -EIO PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EINVAL Incorrect parameter, avail_min cannot be 0
+ * 
  * The software parameters can be changed at any time.
  * The hardware parameters cannot be changed when the stream is
  * running (active).
@@ -1017,6 +1023,7 @@ int snd_pcm_sw_params(snd_pcm_t *pcm, snd_pcm_sw_params_t *params)
  * \param pcm PCM handle
  * \param status Status container
  * \return 0 on success otherwise a negative error code
+ * \return -ENOSYS Status is not supported on this PCM
  *
  * The function is thread-safe when built with the proper option.
  */
@@ -1060,7 +1067,8 @@ snd_pcm_state_t snd_pcm_state(snd_pcm_t *pcm)
  * \brief (DEPRECATED) Synchronize stream position with hardware
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
- *
+ * \retval -EIO PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * 
  * Note this function does not update the actual r/w pointer
  * for applications. The function #snd_pcm_avail_update()
  * have to be called before any mmap begin+commit operation.
@@ -1089,6 +1097,7 @@ int snd_pcm_hwsync(snd_pcm_t *pcm)
  * \param pcm PCM handle
  * \param delayp Returned delay in frames
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
  *
  * For playback the delay is defined as the time that a frame that is written
  * to the PCM stream shortly after this call will take to be actually
@@ -1133,6 +1142,7 @@ int snd_pcm_delay(snd_pcm_t *pcm, snd_pcm_sframes_t *delayp)
  * \brief Resume from suspend, no samples are lost
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
  * \retval -EAGAIN resume can't be proceed immediately (audio hardware is probably still suspended)
  * \retval -ENOSYS hardware doesn't support this feature
  *
@@ -1166,6 +1176,8 @@ int snd_pcm_resume(snd_pcm_t *pcm)
  * \param avail Number of available frames when timestamp was grabbed
  * \param tstamp Hi-res timestamp
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -ENOSYS Hi-res timestamp is not supported on this system.
  *
  * Note this function does not update the actual r/w pointer
  * for applications.
@@ -1194,6 +1206,9 @@ int snd_pcm_htimestamp(snd_pcm_t *pcm, snd_pcm_uframes_t *avail, snd_htimestamp_
  * \brief Prepare PCM for use
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -ENOSYS Prepare is not supported on this PCM
+ * \retval -EBADFD PCM is not in the right state (#SND_PCM_STATE_DISCONNECTED)
  *
  * The function is thread-safe when built with the proper option.
  */
@@ -1222,6 +1237,8 @@ int snd_pcm_prepare(snd_pcm_t *pcm)
  * \brief Reset PCM position
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -ENOSYS Reset is not supported on this PCM
  *
  * Reduce PCM delay to 0.
  *
@@ -1249,6 +1266,8 @@ int snd_pcm_reset(snd_pcm_t *pcm)
  * \brief Start a PCM
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (#SND_PCM_STATE_PREPARED)
  *
  * The function is thread-safe when built with the proper option.
  */
@@ -1274,6 +1293,8 @@ int snd_pcm_start(snd_pcm_t *pcm)
  * \brief Stop a PCM dropping pending frames
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED,DRAINING,SETUP or SUSPENDED)
  *
  * This function stops the PCM <i>immediately</i>.
  * The pending samples on the buffer are ignored.
@@ -1309,7 +1330,10 @@ int snd_pcm_drop(snd_pcm_t *pcm)
  * \brief Stop a PCM preserving pending frames
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED or DRAINING,SETUP or SUSPENDED)
  * \retval -ESTRPIPE a suspend event occurred
+ * \retval -ENOSYS Drain is not supported on this PCM
  *
  * For playback wait for all pending frames to be played and then stop
  * the PCM.
@@ -1345,6 +1369,10 @@ int snd_pcm_drain(snd_pcm_t *pcm)
  * \param pcm PCM handle
  * \param enable 0 = resume, 1 = pause
  * \return 0 on success otherwise a negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED or DRAINING)
+ * \retval -ESTRPIPE a suspend event occurred
+ * \retval -ENOSYS Pause is not supported on this PCM
  *
  * Note that this function works only on the hardware which supports
  * pause feature.  You can check it via \link ::snd_pcm_hw_params_can_pause() \endlink
@@ -1377,6 +1405,10 @@ int snd_pcm_pause(snd_pcm_t *pcm, int enable)
  * \brief Get safe count of frames which can be rewinded
  * \param pcm PCM handle
  * \return a positive number of frames or negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED or DRAINING)
+ * \retval -ESTRPIPE a suspend event occurred
+ * \retval -ENOSYS Rewindable is not supported on this PCM
  *
  * Note: The snd_pcm_rewind() can accept bigger value than returned
  * by this function. But it is not guaranteed that output stream
@@ -1412,6 +1444,9 @@ snd_pcm_sframes_t snd_pcm_rewindable(snd_pcm_t *pcm)
  * \param frames wanted displacement in frames
  * \return a positive number for actual displacement otherwise a
  * negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED or DRAINING)
+ * \retval -ENOSYS Rewind is not supported on this PCM
  *
  * The function is thread-safe when built with the proper option.
  */
@@ -1443,6 +1478,9 @@ snd_pcm_sframes_t snd_pcm_rewind(snd_pcm_t *pcm, snd_pcm_uframes_t frames)
  * \brief Get safe count of frames which can be forwarded
  * \param pcm PCM handle
  * \return a positive number of frames or negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED or DRAINING)
+ * \retval -ENOSYS Forwardable is not supported on this PCM
  *
  * Note: The snd_pcm_forward() can accept bigger value than returned
  * by this function. But it is not guaranteed that output stream
@@ -1478,6 +1516,9 @@ snd_pcm_sframes_t snd_pcm_forwardable(snd_pcm_t *pcm)
  * \param frames wanted skip in frames
  * \return a positive number for actual skip otherwise a negative error code
  * \retval 0 means no action
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EBADFD PCM is not in the right state (Should be PREPARED,RUNNING,XRUN,PAUSED or DRAINING)
+ * \retval -ENOSYS Forward is not supported on this PCM
  *
  * The function is thread-safe when built with the proper option.
  */
@@ -1517,6 +1558,8 @@ use_default_symbol_version(__snd_pcm_forward, snd_pcm_forward, ALSA_0.9.0rc8);
  * \param size frames to be written
  * \return a positive number of frames actually written otherwise a
  * negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EINVAL Access type is not Interleave type.
  * \retval -EBADFD PCM is not in the right state (#SND_PCM_STATE_PREPARED or #SND_PCM_STATE_RUNNING)
  * \retval -EPIPE an underrun occurred
  * \retval -ESTRPIPE a suspend event occurred (stream is suspended and waiting for an application recovery)
@@ -1556,6 +1599,8 @@ snd_pcm_sframes_t snd_pcm_writei(snd_pcm_t *pcm, const void *buffer, snd_pcm_ufr
  * \param size frames to be written
  * \return a positive number of frames actually written otherwise a
  * negative error code
+ * \retval -EIO    PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EINVAL Access type is not Non-Interleave type.
  * \retval -EBADFD PCM is not in the right state (#SND_PCM_STATE_PREPARED or #SND_PCM_STATE_RUNNING)
  * \retval -EPIPE an underrun occurred
  * \retval -ESTRPIPE a suspend event occurred (stream is suspended and waiting for an application recovery)
@@ -1595,6 +1640,8 @@ snd_pcm_sframes_t snd_pcm_writen(snd_pcm_t *pcm, void **bufs, snd_pcm_uframes_t
  * \param size frames to be read
  * \return a positive number of frames actually read otherwise a
  * negative error code
+ * \retval -EIO PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EINVAL Access type is not Interleave type.
  * \retval -EBADFD PCM is not in the right state (#SND_PCM_STATE_PREPARED or #SND_PCM_STATE_RUNNING)
  * \retval -EPIPE an overrun occurred
  * \retval -ESTRPIPE a suspend event occurred (stream is suspended and waiting for an application recovery)
@@ -1634,6 +1681,8 @@ snd_pcm_sframes_t snd_pcm_readi(snd_pcm_t *pcm, void *buffer, snd_pcm_uframes_t
  * \param size frames to be read
  * \return a positive number of frames actually read otherwise a
  * negative error code
+ * \retval -EIO PCM has not been setup (PCM isn't configured yet, or lifecycle of PCM has been ended)
+ * \retval -EINVAL Access type is not Non-Interleave type.
  * \retval -EBADFD PCM is not in the right state (#SND_PCM_STATE_PREPARED or #SND_PCM_STATE_RUNNING)
  * \retval -EPIPE an overrun occurred
  * \retval -ESTRPIPE a suspend event occurred (stream is suspended and waiting for an application recovery)
@@ -1669,8 +1718,9 @@ snd_pcm_sframes_t snd_pcm_readn(snd_pcm_t *pcm, void **bufs, snd_pcm_uframes_t s
 /**
  * \brief Link two PCMs
  * \param pcm1 first PCM handle
- * \param pcm2 first PCM handle
+ * \param pcm2 second PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -ENOSYS Link is not supported on pcm1
  *
  * The two PCMs will start/stop/prepare in sync.
  */ 
@@ -1691,6 +1741,7 @@ int snd_pcm_link(snd_pcm_t *pcm1, snd_pcm_t *pcm2)
  * \brief Remove a PCM from a linked group
  * \param pcm PCM handle
  * \return 0 on success otherwise a negative error code
+ * \retval -ENOSYS Unlink is not supported on this PCM.
  */
 int snd_pcm_unlink(snd_pcm_t *pcm)
 {
-- 
2.26.2

