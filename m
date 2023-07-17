Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75420756EB9
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 23:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0D2AE9;
	Mon, 17 Jul 2023 23:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0D2AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689627988;
	bh=HsgfPc/ndOkSCsXX6gVh5hF8IwrW7I/85s3oH5K7d0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhQhE51V/ZokP2ZH972N+esFw4Da51lRLwXylgj9zHUXdLY0ettcHYQ9rpDlNSOmO
	 5uWnNzJZjOyQmd985V1YXajp27HRokhkdAdebB6+vKl/tInWYiMi3d5lNrlPKy0i+s
	 5jJeGMD2i2GUsoKCQVvQ/GTq6RXOeA/12QaFu264=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 035F6F80535; Mon, 17 Jul 2023 23:05:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D86F8032D;
	Mon, 17 Jul 2023 23:05:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 872E1F8047D; Mon, 17 Jul 2023 23:05:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F976F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 23:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F976F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mFzPuiGU
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56597d949b1so2723029eaf.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689627926; x=1692219926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awzkgsvZFBo842DWA8GT/abxr3wtZvlfdq0myNlPQ4k=;
        b=mFzPuiGUM3XUBeafgaWUcyhQG0QPZ4O9svf8FTOYItCo8R/TZ59+X/6HzsD1g/WYvy
         b1KXc/bEpADFYnFcxlzqDV7JkHpJD64k/G4lVHvHu3kRlffFJppqTljN5qcxQ/X+Ow46
         jN8QK8uNYyHzkFwYEs272eWNzpHYoWjbzb3Nb8pX0MPRBq7F/F9tuWNlFPkNoRR+m19/
         YqiszErwzKl6l5uWhrsGsS7QquDU5kCtJqY3oSvCHdL8p7RqeJgCkSzMZW9vAJTDIBZx
         QBQirr29HNXBPlF4mdiXzIdjtr597PNWLiJ7mhVK8UYR7YK9MFqnnxreNrsJtmqK0ZoT
         N15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627926; x=1692219926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awzkgsvZFBo842DWA8GT/abxr3wtZvlfdq0myNlPQ4k=;
        b=ZVlymW0PWd+FhD2431Htbv6mQ9P/CIYQJqIvZHuaqz6uByfmfBFTM4pOdYVj0wEgEC
         XcFIBI5UE4Lf888M2AOwviLY7tfpLCmqGbPnTgNoWNunHNZG4FcWDzc2Br2gytulBSNH
         afDSX9S9Ttn2yGFMVJh6J+0KEe4oLpt2730rxiGKAsFQNY6j135yyudWhxC+4sFE8J+M
         +/BeK7370HIi7rzSiASLDV6FRSSo7l4yLQHZ4Ya3iZl0ZnWcJMvSpX+ocUo7/KfJ/gSi
         oPBHco7kfwUCHk2TI5+WT3+hj3zqzBnRAfT+mdeW/OwcGQb54LjknkAPv5lwbrDxx5BC
         GMug==
X-Gm-Message-State: ABy/qLbwimuZVbygf0lnzBEnfKntvJygUeb8IQCJCusVbgnfw4IVPQuH
	vS3Ggria9fvqigyx+CYe5qg=
X-Google-Smtp-Source: 
 APBJJlFKSOND1F33J/v+4OdmvuxGHksMnvG+758Ztby9qh3hCqyUqoXyGkwOLkpopxnFYkuBPAAUfA==
X-Received: by 2002:a05:6808:1b24:b0:3a1:ee4b:b8ee with SMTP id
 bx36-20020a0568081b2400b003a1ee4bb8eemr14664284oib.53.1689627925732;
        Mon, 17 Jul 2023 14:05:25 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9fa1:c980:8323:c7fc:1b46])
        by smtp.gmail.com with ESMTPSA id
 x9-20020a056808144900b0039ee1de4e6esm127677oiv.38.2023.07.17.14.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:05:25 -0700 (PDT)
Date: Mon, 17 Jul 2023 18:05:15 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com,
	syzkaller <syzkaller@googlegroups.com>
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
Message-ID: <ZLWtCzdW8lbdzZ4Z@geday>
References: <00000000000098ed3a0600965f89@google.com>
 <87v8ekattg.wl-tiwai@suse.de>
 <ZLQ/zKgTGMHy/6Jn@geday>
 <CACT4Y+bXLZf9iAgiLcxo7coNsOCsn_1C26zuvNBa48qLp2Juxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CACT4Y+bXLZf9iAgiLcxo7coNsOCsn_1C26zuvNBa48qLp2Juxg@mail.gmail.com>
Message-ID-Hash: 35DMWDXV6ADY4DCNOUZJNNKB6GQ5R374
X-Message-ID-Hash: 35DMWDXV6ADY4DCNOUZJNNKB6GQ5R374
X-MailFrom: geraldogabriel@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35DMWDXV6ADY4DCNOUZJNNKB6GQ5R374/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 09:02:07AM +0200, Dmitry Vyukov wrote:
> 
> Hi Geraldo,
> 
> What exactly is cryptic in the report? Is there anything that can be
> done to make it less cryptic?

Hi again, Dmitry.

Perhaps also a bad choice of words. Cryptic borders on the undecipharable
while esoteric is the more proper word here. Those kernel hackers with
esoteric C and assembly skills like Takashi Iwai or you will quickly
infer that a kfree() is missing in such and such scope.

In my other message, I meant to say that such esoteric knowledge is
barely possessed by a novice kernel hacker, and they end up adding noise
to the lists specially if they are involved in the patch acceptance
process, specially as author of the patch, which I'm neither in this
case.

Now, if somebody were to apply LLMs to the build and checker bots and
actually get to a point where they were getting good patch propositions
from the machine rather than a bunch of hallucinations, that would be
quite the feat. It's only a faint dream right now, but you did
specifically ask for the "vision" :)

Thank you,
Geraldo Nascimento
