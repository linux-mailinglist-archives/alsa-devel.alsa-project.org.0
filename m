Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD36F5724
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124D1135A;
	Wed,  3 May 2023 13:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124D1135A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113247;
	bh=znrMfRn+jwlb+R6P7MhymwJcOgqoPRxZ8/o9XO0RDk0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YHiR5h9d9sXFcCNvXSW/IfyncDuefgewfYHTg3ARxcYeTlXIKZrsPiB7t/+y+PBHs
	 V3Nng0RbYAOrJmrj6yWzyiMqGyt7eB2/F7HIr/fKjqGjhguJQGCWY/grqz4tCV/f2K
	 C9FHYbOZWnQCMZjGZ7AFVDhOj/ozye3UNGFp2G+w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0104F8032B;
	Wed,  3 May 2023 13:26:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D44F804B1; Wed,  3 May 2023 13:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4FB1F80137
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 13:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FB1F80137
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id B75C723FF1;
	Wed,  3 May 2023 07:26:29 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puAcv-mpr-00; Wed, 03 May 2023 13:26:29 +0200
Date: Wed, 3 May 2023 13:26:29 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 4/4] pcm: hw: introduce
 SNDRV_PCM_HW_PARAMS_DRAIN_SILENCE
Message-ID: <ZFJE5SQQbVnRqRRk@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-5-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230502115010.986325-5-perex@perex.cz>
Message-ID-Hash: TMEO3O27GHETYMPNCS5CHC6RQEUWDPKD
X-Message-ID-Hash: TMEO3O27GHETYMPNCS5CHC6RQEUWDPKD
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMEO3O27GHETYMPNCS5CHC6RQEUWDPKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 02, 2023 at 01:50:10PM +0200, Jaroslav Kysela wrote:
>The application may not require to touch the sample stream
>for the drain operation at all. Handle this situation
>in alsa-lib.
>
i find this too vague.

  This allows an application which uses an mmapped buffer to inform us 
  that it is handling the silence padding itself.

>Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>---
> include/sound/uapi/asound.h |  3 +++
> src/pcm/pcm.c               | 32 ++++++++++++++++++++++++++++++++
> src/pcm/pcm_hw.c            |  3 ++-
> src/pcm/pcm_local.h         |  1 +
> 4 files changed, 38 insertions(+), 1 deletion(-)
>
>diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
>index 0b8834f2..f970179e 100644
>--- a/include/sound/uapi/asound.h
>+++ b/include/sound/uapi/asound.h
>@@ -390,6 +390,9 @@ typedef int snd_pcm_hw_param_t;
> #define SNDRV_PCM_HW_PARAMS_NORESAMPLE	(1<<0)	/* avoid rate resampling */
> #define SNDRV_PCM_HW_PARAMS_EXPORT_BUFFER	(1<<1)	/* export buffer */
> #define SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP	(1<<2)	/* disable period wakeups */
>+#define SNDRV_PCM_HW_PARAMS_NO_DRAIN_SILENCE	(1<<3)	/* supress drain with the filling
>+							 * of the silence samples
>+							 */
"suppress automatic silence fill when draining playback"

>--- a/src/pcm/pcm.c
>+++ b/src/pcm/pcm.c
>@@ -4958,6 +4958,38 @@ int snd_pcm_hw_params_get_period_wakeup(snd_pcm_t *pcm, snd_pcm_hw_params_t *par
> 	return 0;
> }
> 
>+/**
>+ * \brief Restrict a configuration space to allow the drain with the 
>filling of silence samples
>
there is no way i'd understand what this means. in fact, i'm having a 
hard time even though i more or less know it already.

>+ * \param pcm PCM handle
>+ * \param params Configuration space
>+ * \param val 0 = disable, 1 = enable (default) drain with the filling of silence samples
>
"padding the playback buffer with silence when drain() is invoked"

>+ * \return 0 otherwise a negative error code

add description:

"When disabled, the application must ensure that enough samples are 
silenced, as most hardware will read beyond the application pointer when 
drain() is invoked."

>+/**
>+ * \brief Extract drain with the filling of silence samples from a configuration space
>
this is also kinda incomprehensible.

>+ * \param pcm PCM handle
>+ * \param params Configuration space
>+ * \param val 0 = disable, 1 = enable
>
as this returns the status quo, this should be disabled/enabled.

>+ * \return 0 otherwise a negative error code
>
there is no "otherwise" here.

>+ */
>+int snd_pcm_hw_params_get_drain_silence(snd_pcm_t *pcm, snd_pcm_hw_params_t *params, unsigned int *val)
>+{
>+	assert(pcm && params && val);
>+	*val = params->flags & SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE ? 0 : 1;
>
i know i'm paranoid, but i'd put extra parens around the condition.

>+	return 0;
>+}
>+

>--- a/src/pcm/pcm_hw.c
>+++ b/src/pcm/pcm_hw.c
>@@ -399,7 +399,8 @@ static int snd_pcm_hw_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
>-	hw->perfect_drain = !!(params->info & SND_PCM_INFO_PERFECT_DRAIN);
>+	hw->perfect_drain = !!(params->info & SND_PCM_INFO_PERFECT_DRAIN) ||
>+			    !!(params->flags & SND_PCM_HW_PARAMS_NO_DRAIN_SILENCE);
> 
pedantically, you can remove the double negations as this point.

regards
