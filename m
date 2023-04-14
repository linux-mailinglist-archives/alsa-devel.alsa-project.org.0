Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647406E1ED4
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 10:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 236B7DF7;
	Fri, 14 Apr 2023 10:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 236B7DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681462632;
	bh=ESpjs31c2z1v64JNiXpmmtwrkkvmFcz6a0lScTXz6MQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ndh8NvNEhDIEm/IIoKD4LEkKBvtErnGoleREgCzVuOslXBxuEaSzRv2UpJbgd6CBl
	 g2jLaf9vmo3CrTA52wns5Vv+pjY3sZ8gYMgLqUfO/iqesEVDmdKDlEcxbUio0T/n01
	 5W4lvX0THv22urinq+jKencdW3/w6IgTjLdJbkb0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F1DF8025E;
	Fri, 14 Apr 2023 10:56:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B30F8032B; Fri, 14 Apr 2023 10:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5FB2F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 10:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5FB2F80100
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E07D5202CD
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 04:56:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pnFE2-v8c-00
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 10:56:10 +0200
Date: Fri, 14 Apr 2023 10:56:10 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDkVKhergjGu5S3F@ugly>
Mail-Followup-To: ALSA development <alsa-devel@alsa-project.org>
References: <ZDZmDyOMYMD4Uu5g@ugly>
 <87wn2ho06z.wl-tiwai@suse.de>
 <54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
 <871qkoxrrl.wl-tiwai@suse.de>
 <ZDfWZG+VASX/Xo/j@ugly>
 <87ile0vzxp.wl-tiwai@suse.de>
 <ZDfjKgLJ2tpV45eW@ugly>
 <87edoovvdy.wl-tiwai@suse.de>
 <ZDgYto5sExV2q3pE@ugly>
 <87h6tina31.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87h6tina31.wl-tiwai@suse.de>
Message-ID-Hash: NR5222URT4232MDY2WZN7KWQR26NYD5F
X-Message-ID-Hash: NR5222URT4232MDY2WZN7KWQR26NYD5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NR5222URT4232MDY2WZN7KWQR26NYD5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 14, 2023 at 10:26:26AM +0200, Takashi Iwai wrote:
>Indeed we might want to take the kernel-side fix in the end, but let's
>check things a bit more beforehand.
>
i'll post updated patches soon, then you can sleep over it. :-D

(i'm being a bit slow, because i'm also developing tooling for 
maintaining stacked branches and (re-)posting them, and of course i want 
to try it out with real data.)

>BTW, I guess that one missing piece in your patch is the case where
>the drain is called at the moment of fully filled data.  You added
>snd_pcm_playback_silence() at snd_pcm_do_drain_init(), but in this
>scenario, the call wouldn't do anything at this moment.  But
>snd_pcm_playback_silence() won't be called afterwards because
>runtime->silence_size = 0.  So this workaround won't take effect in
>that case, no?
>
the hunk in snd_pcm_update_hw_ptr0() should take care of that.

regards
