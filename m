Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFB17495F
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 21:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62CB16A5;
	Sat, 29 Feb 2020 21:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62CB16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583009005;
	bh=3zvGo+crweJCCbe3Ixv3jJcJ00UFC7LLyznnEHSCYxc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FBTZIUZu+c7lSoYtjIiTzmqVoDsEBy7GqBvGWu14aq6Ai0qriX/nG6x4EY4OyysFQ
	 e8plHmGo4nU1ItKy5HiOOyMU/z6bHwtS5aAgALtUEghtnpCheKsvi4VW715E1V067B
	 Ur2OIzpX6rkEe96Jf/f/wzZ2CA+spv5ndj/l2Zjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5CC5F800C6;
	Sat, 29 Feb 2020 21:41:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14A9AF8013E; Sat, 29 Feb 2020 21:41:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9399F800E1
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 21:41:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 890F0A0040;
 Sat, 29 Feb 2020 21:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 890F0A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583008895; bh=QjxhG1fEOUPBumxHTYqWComeGnRppshgr8q1ZrBBnM8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=hfoKP5vBnEdmyPhWSmFCsOsvaGu2uwgHcbOPvgtTgAYdXTKNMLwt0xIb5cnauJ0PJ
 yfUy70wjXoDCK9SA7+YCvAOJKKk3VSxurAPOaU779kCMyICQ9FmaYTsdFxWcPYqzv4
 MwUOTbGv6Mk3iLGqwlsq5Quai1t8edDSY6vCnC7s=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 29 Feb 2020 21:41:32 +0100 (CET)
Subject: Re: alsa-lib 1.2.2 kills my unity3d games
To: "Thomas J. Moore" <darktjm@gmail.com>, alsa-devel@alsa-project.org
References: <ef4b66db-5271-2ed4-fc8a-cdfbd45910a3@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ddd2423f-aad0-f066-03b1-f0413e97714c@perex.cz>
Date: Sat, 29 Feb 2020 21:41:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ef4b66db-5271-2ed4-fc8a-cdfbd45910a3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 29. 02. 20 v 21:19 Thomas J. Moore napsal(a):
> Sorry if this has already been reported, but I only really subscribed to
> report this bug, and nothing recent in the archive jumped out at me.
> 
> Some time after Jan 12, some change in my (Gentoo Linux) system caused
> 67 of my 72 commercial, closed-source unity3d games to crash on startup.
>    gdb was no help, but strace showed alsa activity before two crashes,
> and, sure enough, reverting alsa-lib to 1.2.1.2 cured it.
> 
> I bisected to this commit (5ee5ef31b "namehint: correct the @args check"):
> 
> https://git.alsa-project.org/?p=alsa-lib.git;a=blobdiff;f=src/control/namehint.c;h=4927ef973c326bef41e33b87714de87b31c1f752;hp=808df6b507336b8f6d6e618a0cfa520d62a3b4fc;hb=5ee5ef31b5ff3fb7c904054cb9cac7478a727f7c;hpb=ebdd2b6cdb8119cf75f0dd0a3b283d271b3a547e
> 
> I don't know what the exact problem is, but reverting just this commit
> was enough to make everything work again (and its later modification in
> 6055f8a58 which doesn't make sense looking at the code as the function
> always returns 0 and str may still be NULL on exit, but adding a check
> for NULL str is not enough to stop unity3d from crashing).

The revert does not resolve the culprit. I already posted my comments to
https://github.com/alsa-project/alsa-lib/issues/27 . It's difficult to fix 
something without sources. The bug seems to be in the sound device enumeration 
in the commercial binary.

The alsa-lib's change just returns more devices than the previous version. It 
should not affect anything. The device list collected from the affected 
application in the comment bellow looks really suspicious:
   https://github.com/alsa-project/alsa-lib/issues/27#issuecomment-592920831

It appears that the code does really something unwanted. You can find 
workarounds in the issue.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
