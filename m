Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4194415F5DA
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 19:40:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C1E1673;
	Fri, 14 Feb 2020 19:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C1E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581705650;
	bh=sc6PdmMA5Saj9qv5emOsCARJeAu4FDkY17g8uRd+Gkg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLjPm6byKV2Yt/4+FykF31h4MReNaceoYH3pq70MTgHh1IDa3xusvXmdw4hDjwi3p
	 MaKEn51rU6nd1d+SL/3tgm0yq6caZhHqcuoRgYFrrhzDUittm8bNA7102IcrFDGwnQ
	 dLOLXDMNHUuCIreQ54xK6hrjTiuze1vavzrc17nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCDD0F80157;
	Fri, 14 Feb 2020 19:39:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43B7BF800F0; Fri, 14 Feb 2020 19:39:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50B94F800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 19:39:03 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 16289A003F;
 Fri, 14 Feb 2020 19:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 16289A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581705543; bh=xySUiXr4rHjXcQOaU/vhwmZ3YCvxxvXZAGsuLwcQwQg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ro4UwjowhQ7bjlS0+MEbq3mochGu8ME0759k5omB/q9RqKje+g9HpFsUo+jHFFu1V
 NceqallSK7Nrt82kVFM2u/nKKXh6rF+5MBiaC8Y1sNbF5QXzyUVDpIMQ3qUyftnZPG
 JcDhWUzP9Z8WedKnHXGtpm/8b4Cf1msyUQP/91Ec=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 14 Feb 2020 19:38:57 +0100 (CET)
To: Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>
References: <CAOReqxhbvG03QvqkbjnGB8w5cM4WOK4qeZ+bh0apNna7i3ZimA@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <23daf96d-f854-f01f-bc4e-2afc47299c0a@perex.cz>
Date: Fri, 14 Feb 2020 19:38:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOReqxhbvG03QvqkbjnGB8w5cM4WOK4qeZ+bh0apNna7i3ZimA@mail.gmail.com>
Content-Language: en-US
Cc: Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] alsa-ucm-conf via portage on arm
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 14. 02. 20 v 19:23 Curtis Malainey napsal(a):
> Hello Takashi and Jaroslav,
> 
> There appears to be a upstream package issue for alsa-ucm-conf in that
> portage seems to have it restricted to x86 and amd64 platforms. Given
> the nature of the ucms I figure this is an error and was hoping you
> know who to speak to in order to resolve this. If this isn't an error
> what can I do to help get the repo to state in which it is supported
> on arm/arm64?
> 
> See https://gitweb.gentoo.org/repo/gentoo.git/commit/media-libs/alsa-ucm-conf/alsa-ucm-conf-1.2.1.2.ebuild?id=dd3e0570e2465639431709bce0410b787d312bbe
> 
> Curtis

It's Gentoo specific and you see signed-off-by in this commit.

Did you contact this person (Lars Wendler) from Gentoo?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
