Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D36F571C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA3B135E;
	Wed,  3 May 2023 13:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA3B135E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113191;
	bh=ODpNCIJSvxkYIeID+m7jAaVwuWukq+0wC9QlNXyKkvA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RCRPTHeimMNvlNWK6wh8JDSZuyLkpACx+dcl8SjAZcmzlwGi7/om1cFMuc43UwjiN
	 B/KmsAjDLb5kUBZ5DL3tbiEn7IEXJUvtVEhC/4UxnHgyPQXZ3+ROvaD40/852zmrKK
	 ZQCrCvl6rJPFkXTykxAa36SnwTQJkHg/JcXEWrLc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23968F8051B;
	Wed,  3 May 2023 13:25:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FFEEF80520; Wed,  3 May 2023 13:25:20 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80DABF800EC
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 13:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DABF800EC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 747EF24144;
	Wed,  3 May 2023 07:25:17 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1puAbl-mif-00; Wed, 03 May 2023 13:25:17 +0200
Date: Wed, 3 May 2023 13:25:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH alsa-lib 3/4] pcm: hw: introduce
 SNDRV_PCM_INFO_PERFECT_DRAIN
Message-ID: <ZFJEncyUfjnSicnL@ugly>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>
References: <20230502115010.986325-1-perex@perex.cz>
 <20230502115010.986325-4-perex@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230502115010.986325-4-perex@perex.cz>
Message-ID-Hash: 6B3PM64QPYWJ7VRVSXOMJAOY7HM6L4W4
X-Message-ID-Hash: 6B3PM64QPYWJ7VRVSXOMJAOY7HM6L4W4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6B3PM64QPYWJ7VRVSXOMJAOY7HM6L4W4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 02, 2023 at 01:50:09PM +0200, Jaroslav Kysela wrote:
>The driver may not require to touch the sample stream
>
"touching"

>for the drain operation at all.
>Handle this situation in alsa-lib.
>
this is weird without already knowing the context. i'd instead write:

   Handle the driver informing us that it is not necessary to set up 
   silencing upon playback draining. This will be the case for drivers 
   which are guaranteed to not read any samples beyond the application 
   pointer.

>--- a/src/pcm/pcm.c
>+++ b/src/pcm/pcm.c
>@@ -3707,6 +3707,29 @@ int snd_pcm_hw_params_can_disable_period_wakeup(const snd_pcm_hw_params_t *param
> 	return !!(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP);
> }
> 
>+/**
>+ * \brief Check if hardware does perfect drain
>
"(is a) perfect drain" vs. "does draining".

>+ * \param params Configuration space
>+ * \retval 0 Hardware doesn't do perfect drain
>+ * \retval 1 Hardware does perfect drain
>+ *
>+ * This function should only be called when the configuration space
>
"should be called only when"

>+ * contains a single configuration. Call #snd_pcm_hw_params to choose
>+ * a single configuration from the configuration space.
>+ *
>+ * The perfect drain means that the hardware does not use samples
>
see above. i guess one way to write it here would be

   "Perfect drain" means [...]

>+ * beyond the stream application pointer.
>+ */

regards
