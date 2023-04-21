Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D156EADAA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 17:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5470FE8A;
	Fri, 21 Apr 2023 17:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5470FE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682089274;
	bh=IKb5A/MOaUskTqc1QxuZdYodnLSOi5IQzVc1HDaPWxA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XWiX6+n2qwHQ0KfZAYwNu7ZXFgKdG7Kql1p9BK+vrNhC8hCCj1rku8C4EnBNKvuCa
	 anO6Swc4RgS0NO8pYrIgMWDWqmUgA+NwV9gEAJ0p0/jbfiEEdMo/VcSQXJVohJiRIk
	 qXcInjRo0r9L6rP1i/D/BN0A5dZW3zWAzHI+oPY8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC77F80149;
	Fri, 21 Apr 2023 17:00:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69D9CF80155; Fri, 21 Apr 2023 17:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EAACF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 17:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EAACF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E7ED12409E
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 11:00:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppsFA-EMn-00
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 17:00:12 +0200
Date: Fri, 21 Apr 2023 17:00:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH 6/7] ALSA: emu10k1: remove unused
 emu->pcm_playback_efx_substream field
Message-ID: <ZEKk/FseMJ+d4eWd@ugly>
Mail-Followup-To: alsa-devel@alsa-project.org
References: <20230421141006.1005452-1-oswald.buddenhagen@gmx.de>
 <20230421141006.1005452-6-oswald.buddenhagen@gmx.de>
 <87ttx9qo9u.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ttx9qo9u.wl-tiwai@suse.de>
Message-ID-Hash: LGZUD5JCQOKV6BGGQUKOCPFC4627D7OC
X-Message-ID-Hash: LGZUD5JCQOKV6BGGQUKOCPFC4627D7OC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGZUD5JCQOKV6BGGQUKOCPFC4627D7OC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 21, 2023 at 04:54:21PM +0200, Takashi Iwai wrote:
>On Fri, 21 Apr 2023 16:10:05 +0200, Oswald Buddenhagen wrote:
>> 
>> Amends commit 27ae958cf6.
>
>I couldn't find this commit ID in the upstream.
>
it's from the historic repo. i'll amend it to mention that.

>Also put the commit summary in text, not only the SHA1 ID, too.
>
right.

