Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A2A6E0C27
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 13:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B73CEBB;
	Thu, 13 Apr 2023 13:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B73CEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681384292;
	bh=Ar1yNmAySm0hhxRYqXBO2mtpbUPq9vBpHrKXs9melBg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mG0OeTfTxmNy5/E5mLlJ9wrF3/TstBT1YKeT9+Y1zHTeYZMr4j8isQpNaoMtKdgTz
	 MwN5TDXqzGkT0/z03ZfRZXBsjfu4l4F8CIXXrmX6h3nGOy+7jcQAWD2AVX5vW1xmS4
	 zbGvtpRtG3VhFZfHq0pS7wV6qXszucVbxr23Bj9k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9EECF8023A;
	Thu, 13 Apr 2023 13:10:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A1D5F8032B; Thu, 13 Apr 2023 13:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98713F800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 13:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98713F800E5
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E8BD8241C0
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 07:10:34 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pmuqY-cVi-00
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 13:10:34 +0200
Date: Thu, 13 Apr 2023 13:10:34 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
Message-ID: <ZDfjKgLJ2tpV45eW@ugly>
Mail-Followup-To: ALSA development <alsa-devel@alsa-project.org>
References: <6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
 <ZDWPy9YbXWWOqaC+@ugly>
 <7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
 <87ttxl7cxd.wl-tiwai@suse.de>
 <ZDZmDyOMYMD4Uu5g@ugly>
 <87wn2ho06z.wl-tiwai@suse.de>
 <54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
 <871qkoxrrl.wl-tiwai@suse.de>
 <ZDfWZG+VASX/Xo/j@ugly>
 <87ile0vzxp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ile0vzxp.wl-tiwai@suse.de>
Message-ID-Hash: YGG4PDERSDYRJU2ZDHMNFWW6RIWFRT6F
X-Message-ID-Hash: YGG4PDERSDYRJU2ZDHMNFWW6RIWFRT6F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGG4PDERSDYRJU2ZDHMNFWW6RIWFRT6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 13, 2023 at 12:28:34PM +0200, Takashi Iwai wrote:
>On Thu, 13 Apr 2023 12:16:04 +0200, Oswald Buddenhagen wrote:
>> On Thu, Apr 13, 2023 at 07:42:06AM +0200, Takashi Iwai wrote:
>> > Also, we may skip the
>> > workaround for applications accessing directly via mmap as default.
>> > 
>> no, because one may easily miss that more than one period is required.
>> also, i think that forgetting it entirely is an easy mistake to make,
>> even if it's harder with mmap than with write.
>
>I don't agree with that point -- if application wants the access only
>via mmap (without any write actions via alsa-lib functions), the
>buffer and data management relies fully on the application itself.
>Manipulating the data *silently* is no good action for such
>applications.

>For them, the drain simply means to stop at the certain point.
>
i don't think that's true. if an app wants to control things finely, it 
would just use start/stop and manage the timing itself. draining otoh is 
a convenient fire-and-forget operation. that makes it easy to miss the 
finer details, which is why i'm so insistent that it should just work 
out of the box.

if you exclude mmapped devices in kernel, you exclude plughw with 
emulated write(), so you'd have to add yet more code to compensate for 
that. and doing it all in user space is yet more code. for all i can 
tell, it's really just layers of complexity to solve a non-problem.

regards
