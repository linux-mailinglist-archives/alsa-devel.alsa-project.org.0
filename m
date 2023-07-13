Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D3751B5B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58EAE7F4;
	Thu, 13 Jul 2023 10:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58EAE7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689236214;
	bh=RqhBbBu5q6VwYWgVfFzB51+DvgIBaxYhb/wQ52swrnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hFgKZxB7oKANI7y9CjeFEKtTibUUK6iind5gJbrlKc88M8pGUiOJB/6IXVstBcM2u
	 IZT+qXk1FGQhBO2JMKRkWQXvqtyAuO4qP39I5POqrMh7FCC+aEJYsBZbvDKgQ1h3mq
	 jlFY+n98m4LRqZTcpeDxLYpYxm+vSqFXu0snIMBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03CEF80535; Thu, 13 Jul 2023 10:15:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78348F80236;
	Thu, 13 Jul 2023 10:15:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A0B5F80249; Thu, 13 Jul 2023 10:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78424F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78424F800E4
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 964CD24080;
	Thu, 13 Jul 2023 04:15:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qJrTt-hrY-00; Thu, 13 Jul 2023 10:15:21 +0200
Date: Thu, 13 Jul 2023 10:15:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/3] ALSA: emu10k1: remove superfluous IRQ enable state
 saving
Message-ID: <ZK+ymU7ynF0eRy8R@ugly>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
 <20230712145750.125086-2-oswald.buddenhagen@gmx.de>
 <875y6ogxt8.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <875y6ogxt8.wl-tiwai@suse.de>
Message-ID-Hash: MOOJLA3TLOMOGM7HE2Q7ILKHCVGI2OPJ
X-Message-ID-Hash: MOOJLA3TLOMOGM7HE2Q7ILKHCVGI2OPJ
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOOJLA3TLOMOGM7HE2Q7ILKHCVGI2OPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 07:55:31AM +0200, Takashi Iwai wrote:
>On Wed, 12 Jul 2023 16:57:49 +0200,
>Oswald Buddenhagen wrote:
>> 
>> The mixer, PCM prepare, MIDI, synth driver, and procfs callbacks are all
>> always invoked with IRQs enabled, so there is no point in saving the
>> state.
>> 
>> snd_emu1010_load_firmware_entry() is called from emu1010_firmware_work()
>> and snd_emu10k1_emu1010_init(); the latter from snd_emu10k1_create() and
>> snd_emu10k1_resume(), all of which have IRQs enabled.
>> 
>> The voice and memory functions are called from mixed contexts, so they
>> keep the state saving.
>> 
>> The low-level functions all keep the state saving, because it's not
>> feasible to keep track of what is called where.
>> 
>Wouldn't it make more sense if you replace it with a mutex?
>It'll become more obvious that it's only for non-IRQ context, too.
>
huh?
at least some of the ~six different locks touched by this patch 
absolutely _are_ used in irq context. this patch is concerned only about 
the specific call sites, where we know that local irqs are enabled, so 
we can unconditionally re-enable them rather than restoring the old 
state (the latter being a much more expensive operation). the code 
already contains precedents for this, and the complementary optimization 
of not disabling/restoring irqs where we know that they are already 
disabled.

the reg_lock would be convertible to a mixer_mutex in most mixer 
callbacks, but that is an orthogonal question, which is raised in the 
next commit.

regards
