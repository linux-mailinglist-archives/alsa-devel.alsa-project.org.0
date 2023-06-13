Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DCA72E920
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 19:15:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79695EA0;
	Tue, 13 Jun 2023 19:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79695EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686676518;
	bh=7qL5UIu4iwV7Zvu239VP4GFRlzE6zD4pZH/62qsJMIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E+FF++kGvO9lfqhquONm0QkdHxTPUD8Mhwn1LAVHUwv2nw2Dtwuh/kyhyoFn2CWAt
	 8cHYF1LrnCnlg6cwU5Kf8hyrnfhABK6dY3fHwfoY6TxX3s2LP9CE1s3aM2nQM3zFBo
	 jWpJDnEgoTthNArxSStKkSNJJzNQTDsSS4X9KlLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC627F80093; Tue, 13 Jun 2023 19:14:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CEE4F80132;
	Tue, 13 Jun 2023 19:14:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B92B2F80149; Tue, 13 Jun 2023 19:14:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEBEFF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 19:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEBEFF80130
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D3AE123EA1;
	Tue, 13 Jun 2023 13:14:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q97b0-mEH-00; Tue, 13 Jun 2023 19:14:18 +0200
Date: Tue, 13 Jun 2023 19:14:18 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/8] ALSA: emu10k1: add support for 2x/4x word clocks in
 E-MU D.A.S. mode
Message-ID: <ZIij6mdc1utyBD93@ugly>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
 <20230613073822.1343234-7-oswald.buddenhagen@gmx.de>
 <87v8fren1k.wl-tiwai@suse.de>
 <ZIhKe99WGpLFN1ld@ugly>
 <87edmfei0o.wl-tiwai@suse.de>
 <ZIh2gp/I4ot326KP@ugly>
 <871qife9ga.wl-tiwai@suse.de>
 <ZIiJ9zzwgvQHyrW9@ugly>
 <87fs6vcqpt.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87fs6vcqpt.wl-tiwai@suse.de>
Message-ID-Hash: NWOALXW65GM2KZSJK4QFMHPNVBYTN2BL
X-Message-ID-Hash: NWOALXW65GM2KZSJK4QFMHPNVBYTN2BL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWOALXW65GM2KZSJK4QFMHPNVBYTN2BL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 13, 2023 at 05:43:58PM +0200, Takashi Iwai wrote:
>> the notion of "malicious" is meaningless in this context. a valid
>> attack vector would allow the application to do something that i
>> cannot do otherwise. hogging a cpu thread while flooding the system
>> with meaningless ioctls is something an app can do regardless, so
>> whatever.
>
>Adding/deleting kctl increases the numid.  It grows and grows.
>
as the code handles numid wraparound just fine, that would be a rather 
pointless attack.

>Crashing an existing application is the worst-case scenario.
>
a new driver (which this effectively is) crashing a broken application 
is perfectly legitimate, as it doesn't affect any existing users.

>> that would indeed be a problem, but fortunately the put() callback is
>> nowadays invoked with a write lock (see also commit 06405d8ee).
>
>Oh well, that's really not a change to be advertised for creating /
>deleting kctls from the put callback at all.
>
and? it's done, and it's basically impossible to revert. so we may reap 
its full benefits just as well, as i did in that previous commit.

>Sorry, but my answer is same: NO.  I see no reason why kctl deletion
>and creation _must_ be implemented _inevitably_ in that way.
>
being the most straight-forward way to implement it certainly qualifies 
as a good reason for doing it that way.
and i still see no convincing reason why it shouldn't.

>Actually, snd_ctl_remove() should be changed back to a version that
>takes the lock by itself instead.  There is no reason to have a helper
>without the lock called from leaf drivers.
>
well, except that this driver shows that there _is_ a reason. one may 
choose to throw stones in one's own way, but that's rarely a wise 
decision ...

regards,
ossi
