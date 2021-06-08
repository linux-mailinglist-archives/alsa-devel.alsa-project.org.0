Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D607C39FC33
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 18:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F6F11782;
	Tue,  8 Jun 2021 18:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F6F11782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623168915;
	bh=vtBDsdYwIjnuE/Qa12M8yH2abuabIVEFOBn5kcVFfpQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z53kRBI83MZO4fMg24nU33/Ox+Ru5ZqJacEDTA5BT/WgVjkvuYVKq8xC7OCyD1fSM
	 yzYNixKs1IffHeeqJsZGk6NZCN30t0iiiFCnrlFy8B6C2bvKNKtW0VnSWetutTHz2M
	 wf0abc/F0wZP9soIuuOkueIyEGaVw1WQ/Px1Crcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF0BEF80116;
	Tue,  8 Jun 2021 18:13:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 846C6F80218; Tue,  8 Jun 2021 18:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=KHOP_HELO_FCRDNS, RDNS_DYNAMIC,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.aaazen.com (99-33-87-210.lightspeed.sntcca.sbcglobal.net
 [99.33.87.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90197F8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 18:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90197F8019B
Received: from localhost (localhost [127.0.0.1])
 by thursday.test (OpenSMTPD) with ESMTP id ed953c64;
 Tue, 8 Jun 2021 16:13:39 +0000 (UTC)
Date: Tue, 8 Jun 2021 09:13:38 -0700 (PDT)
From: Richard Narron <richard@aaazen.com>
X-X-Sender: richard@thursday.test
To: Ryan Burns <rtburns@protonmail.com>
Subject: Re: alsamixer: use background color instead of COLOR_BLACK
In-Reply-To: <20210206224135.0B465F80171@alsa1.perex.cz>
Message-ID: <alpine.LNX.2.20.2106080841500.25665@thursday.test>
References: <1612651281048146009-webhooks-bot@alsa-project.org>
 <20210206224135.0B465F80171@alsa1.perex.cz>
User-Agent: Alpine 2.20 (LNX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Alsa-devel <alsa-devel@alsa-project.org>
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

On Sat, 6 Feb 2021, GitHub pull_request - opened wrote:

> alsa-project/alsa-utils pull request #77 was opened from r-burns:
>
> Hi! I have a cosmetic "improvement" I'd like to share. Scare quotes
> because this is possibly opinionated, but I'd still like to know what
> you think.
>
> I think on typical terminals, COLOR_BLACK is the same or quite similar
> to the background color, so this does not make much of a difference. But
> on "solarized" color schemes and similar, the COLOR_BLACK may be quite
> different from the background color, so in my opinion it looks odd to
> have the alsamixer panel stand out this way. For example, I'm using the
> "Nord" color scheme on a pitch black #000000 background, and here's how
> the mixer looks with/without this patch (blank terminal, htop, and
> ncmpcpp also provided for comparison):
>
> ![image](https://user-images.githubusercontent.com/52847440/107131140-dbf46500-6888-11eb-938a-9a3258bf7184.png)
>
> As you can see, the current alsamixer in the center looks a bit strange
> and sticks out
>  against my chosen background color and the other TUIs I'm using. Htop
> and ncmpcpp agree on using the builtin `-1` background color for their
> own backgrounds, but alsamixer uses COLOR_BLACK which stands out from
> the actual background. The alsamixer on the bottom right is using this
> patch, and blends in seamlessly.
>
> Again, this is just my opinion! Feel free to close if this is wrong or
> superfluous. Nonetheless, I thought I'd share this patch, in case anyone
> else feels the same way.
>
> Request URL : https://github.com/alsa-project/alsa-utils/pull/77 Patch
> URL : https://github.com/alsa-project/alsa-utils/pull/77.patch
> Repository URL: https://github.com/alsa-project/alsa-utils
>

This alsamixer patch made it alsa-utils 1.2.5 (and Slackware current) but
it gives me problems.

I have a terminal with a white background (XTerm default), so the white
characters do not appear at all and the yellow characters are extremely
hard to read.

My simple solution is to revert patch:
c867aa8a84a7e9fbf7f9547a3462f8521cfc69b0

Perhaps a better solution could be developed to allow the foreground and
background colors to be changed by the user?

Signed-off-by: Richard Narron <richard@aaazen.com>

--- alsa-utils-1.2.5/alsamixer/colors.c	2021-05-27 10:18:36.000000000 -0700
+++ alsa-utils-1.2.4/alsamixer/colors.c	2020-10-15 04:32:33.000000000 -0700
@@ -50,11 +50,11 @@
 		start_color();
 		use_default_colors();

-		get_color_pair(COLOR_CYAN, -1); // COLOR_PAIR(1)
-		get_color_pair(COLOR_YELLOW, -1);
+		get_color_pair(COLOR_CYAN, COLOR_BLACK); // COLOR_PAIR(1)
+		get_color_pair(COLOR_YELLOW, COLOR_BLACK);
 		get_color_pair(COLOR_WHITE, COLOR_GREEN);
-		get_color_pair(COLOR_RED, -1);
-		get_color_pair(COLOR_WHITE, -1);
+		get_color_pair(COLOR_RED, COLOR_BLACK);
+		get_color_pair(COLOR_WHITE, COLOR_BLACK);
 		get_color_pair(COLOR_WHITE, COLOR_BLUE);
 		get_color_pair(COLOR_RED, COLOR_BLUE);
 		get_color_pair(COLOR_GREEN, COLOR_GREEN);
