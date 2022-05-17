Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACA5297A7
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 05:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57968E12;
	Tue, 17 May 2022 05:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57968E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652756919;
	bh=gkLunz/wkIiUfLBMENteZ7GSTBjOBBSNWPW0Wq8mnI4=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=JZSV6qSE9JwEEC/WuuPvaZ4oyyCHU3XUkiH6oxqh90f2686QJXRMMUPLmLP1RFAd8
	 3q77ipEkH2+zREFqXYzTWUcMJiAefO9Kgf84a/MvTJ09TvivggJXQgz1VaO1STx+dd
	 5ATth5E4I2VxvlbUkwXl/SXX9u3VjODzjAW1GehA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6142F80310;
	Tue, 17 May 2022 05:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31E0AF802DB; Tue, 17 May 2022 05:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 636F3F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 05:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 636F3F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="IEtmubtN"
Date: Tue, 17 May 2022 03:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1652756849;
 bh=gkLunz/wkIiUfLBMENteZ7GSTBjOBBSNWPW0Wq8mnI4=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=IEtmubtNVWqJPZ/e8kZ/4W31pKL0Myd6LsJN3XpH5W//Jl+VlEe86lM7rEyqfMr71
 YMRDIPVqtuUBxEMI5koh88EATVfgPEQ/ygA9Gn66YSSuYpnlE9wLm+rBq1uKFFYJ1O
 LK84gkkj33KLTakW1V5JPHId4KDZQggYX/P26l/lnbi3zgOsCR0wtoU3nA+1PN7Wc/
 VG9LMjD3SY3MjN/02JMeWlKfrOIrqByfR8wlE9cHRSsetYiNFaXe8VLsffbQbLz8BP
 IEUfzNZUST4zSZGzPd4taRk9N+lEpEXunS8jB9rgpxMcu95iwt0CSPOHzMPk33xoaN
 ul2JCHxkvXtsg==
To: Jaroslav Kysela <perex@perex.cz>
From: Peter Wedder <pwedder@protonmail.com>
Subject: Re: UCM2 configuration guide
Message-ID: <xQsDJDUXWHuq4il0ax5D8UaE0mQXEutgvMK72KFbIx0JnNAFd07UonE_LLnyFHn2m5DsqzFWDjxjUEK_CzioRfcd72Maf2J3GuQyYvDHWfs=@protonmail.com>
In-Reply-To: <7d2feff6-e84f-3512-0bcf-f331b5a807a9@perex.cz>
References: <VwoP3j4nu98HV-5itWgDOdFuspSQQHQI_W_SS_WSy25y82ZLj0VupitgOTUv0AmrvI1q7Xx6gJHtm-g68W8QJWgpndDFrd_f-SA8pNp0qp0=@protonmail.com>
 <7d2feff6-e84f-3512-0bcf-f331b5a807a9@perex.cz>
Feedback-ID: 42199824:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>
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
Reply-To: Peter Wedder <pwedder@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sounds good!

I am also open to reworking the guide into a part of ALSA documentation, if=
 that suits you better.

I must confess I don't exactly understand what you mean by splitting channe=
ls "inside app" (what app?), though. Do you mean some kind of tool to avoid=
 having to write configuration by hand? In any case, I will update the guid=
e accordingly if changes are made to the process.

- Peter



------- Original Message -------
On Monday, May 16th, 2022 at 19:31, Jaroslav Kysela <perex@perex.cz> wrote:


>
>
> On 14. 05. 22 19:43, Peter Wedder wrote:
>
> > Hello,
> >
> > I have been working on an article to describe the process of writing UC=
M2 configuration to split multi-channel devices into smaller devices, parti=
cularly in the context of USB audio interfaces. This is a common problem wi=
th enthusiast/studio USB audio interfaces and it happens to be a pet peeve =
of mine.
> >
> > I recently contributed a profile for the Behringer UMC204HD (https://gi=
thub.com/alsa-project/alsa-ucm-conf/pull/128) and found the process to be a=
 little intimidating, but with a lot of help from Perexg I managed to get i=
t working. I would like to help other potential contributors out by explain=
ing the process step by step.
>
>
> It's because many things are work-in-progress and there's a tight relatio=
n
> between UCM and the alsa-lib's configuration.
>
> > I was considering posting the article to the Fedora Magazine (https://f=
edoramagazine.org/), since that's the distro I use. However, I wanted to ch=
eck with you, the ALSA maintainers, first, because the intent of the articl=
e is to encourage readers to contribute UCM configurations for their own ca=
rds, and I thought perhaps a potential surge of contributions is not someth=
ing you want at the moment.
>
>
> At the time there's a lot of USB cards configs waiting for the merge, but=
 I'd
> like to clean the configs at first. The per card configurations should no=
t
> bother so much with the alsa-lib configurations. Also, I'd like to suppor=
t the
> channel management (split) by the applications. The implementation may be
> completely hidden in the included common blocks.
>
> > Let me know what you think -- is this a welcome idea or should I forget=
 it? I have a draft of the article available here: https://gist.github.com/=
brndd/ccec98a575f7c0422d50402937439227
>
>
> Thank you for this work. The document looks nice for users dealing with t=
he
> support for this type of hardware. Please, wait a moment to complete this
> support. I will be happy to co-operate with you to finish this.
>
> I created an issue #154
> (https://github.com/alsa-project/alsa-ucm-conf/issues/154) and I'll try t=
o
> update it until this is finished.
>
> Jaroslav
>
> BTW: perexg =3D me
>
> --
> Jaroslav Kysela perex@perex.cz
>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
