Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5B6995D5
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 14:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB9AE7C;
	Thu, 16 Feb 2023 14:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB9AE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676554280;
	bh=IAgsBF4ANYOsWrMlLvnN+PPC4Pi1HojSN7EDP9tJSDo=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O0wN9FwYquGO4SiJRFXba5/OcwU5LcOpps4TmzmWER5uQwNl/qY72iHLPdS+zw4L/
	 7P8pQscfcVIzbiU1g33a6eYpEfh4VdSgKlDC5k1KTMHVJHmjHlkOMwh3CeC6SHLea7
	 95mwyy4b8vCONUlJRwAkqVKleIpDiR7KyB14Gsks=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB37F80496;
	Thu, 16 Feb 2023 14:29:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B74F80171; Thu, 16 Feb 2023 12:33:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DF9FEF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 12:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF9FEF80083
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9326C23F65;
	Thu, 16 Feb 2023 06:33:05 -0500 (EST)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pScVd-xVv-00; Thu, 16 Feb 2023 12:33:05 +0100
Date: Thu, 16 Feb 2023 12:33:05 +0100
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/130+] ALSA: emu10k1 & more
Message-ID: <Y+4UcetSxH6lDPoy@ugly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AKEPZNUEOHBOU6MVUDSGH5QGMPETKSPZ
X-Message-ID-Hash: AKEPZNUEOHBOU6MVUDSGH5QGMPETKSPZ
X-Mailman-Approved-At: Thu, 16 Feb 2023 13:29:37 +0000
CC: Takashi Iwai <tiwai@suse.de>, Lee Revell <rlrevell@joe-job.com>,
 James Courtier-Dutton <James@superbug.co.uk>,
 Veli-Matti Valtonen <maligor@gmail.com>, Ctirad Fertr <c.fertr@gmail.com>,
 Pavel Hofman <dustin@seznam.cz>, michael@gernoth.net,
 Maxim Kachur <mcdebugger@duganet.ru>, shane-alsa@cm.nu,
 Thomas Zehetbauer <thomasz@hostmaster.org>,
 Alexander Samad <alex@samad.com.au>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKEPZNUEOHBOU6MVUDSGH5QGMPETKSPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

moin,

i got myself an old e-mu 0404 card, because i found the analog hardware 
well hackable for dc operation.
then i found the driver to be lacking, and got hacking that, too. hence 
this blast from the past.

this is a huge branch with many internal dependencies, so i'm assuming 
i'm not supposed to post a patch series.
instead it's on https://github.com/ossilator/linux/tree/ossis-alsa - let 
me know if another review platform is preferable.

apart from the actual driver work, this contains some alsa patches 
unrelated to emu10k1, some patches which really shouldn't be merged via 
the alsa route (if at all), and some patches which are just collections 
of questions (to which i hope to receive answers on github). this is of 
course meant to be cleaned up in due time.

feel free to cherry-pick the patches you deem ready; i'll happily rebase 
the branch.

some of these patches are not (fully) tested due to lack of hardware. in 
particular, someone should check that SB Live! and Audigy cards still 
work. then there is a whole bunch of e-mu card specific functionality 
which targets the "bigger members of the family". all patches that need 
testing are clearly marked as such.
if someone wants to provide me with hardware (temporarily or 
permanently), go ahead (i'm in berlin, germany).

on CC is everyone who is recorded to have hacked the emu1010 part of the 
driver or tested something. i fully expect half the addresses to bounce, 
and the remainder to wonder what i'm smoking. ;-)
when you reply, please do so only to the list and me.

regards

