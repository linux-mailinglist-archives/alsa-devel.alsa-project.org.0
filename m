Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6054DCE44
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 19:58:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DE331788;
	Thu, 17 Mar 2022 19:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DE331788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647543480;
	bh=rw2khlPdM2Ty2JlnBb1J2MgouOC+DxOvzcwf+BY/7OU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Taot1iaKaxWcTxfSJJLMVQaLxmhhuhVRkgHoHewJ0EsfKFq7FC0z3D18iW0abGEp/
	 Af55H/DSOv4n6fvy8o+bk2f/bbDL/dF4cCw6AQolV+BhYpUgtd5Fnx8Z9eXRpQp/UC
	 WuaVMEBv5ub4vz5R/mVGFclySAvC1rROpR2GZO9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B1EF8014C;
	Thu, 17 Mar 2022 19:56:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 250F7F80124; Thu, 17 Mar 2022 19:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9762F80124
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 19:56:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9762F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="HeYHtJ7L"
Received: by mail-lf1-x12b.google.com with SMTP id s25so10529498lfs.10
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 11:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNUNjaBCVasZfpBbOFNsbgHTLCGoLifuHLYmJKwlzBE=;
 b=HeYHtJ7Lk2fsSlITrtcBvb02gBAgV1u/Sz4/x831laGr7/psVM2Vbs9QGHfqxX8ulj
 ETvly1hrDFAdBIkS6/pnOGOojuIuqFayBbrVkJA2Yg34jQUErKO5bfvQC8X7c1+Ld0U9
 QrOOBvFDNRMZ8/V6mj/D7xyEVdr1YXu71Zhpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNUNjaBCVasZfpBbOFNsbgHTLCGoLifuHLYmJKwlzBE=;
 b=3yD/KQEXL5qhk5jQJ+XoUWhYMUtoYA8qfrTpIvbFFBBFztk0rZg/CfDqyBEd4LsS4B
 hIwKIheuFknpv2ewHTqTtbHQ2igojPnCAc+5P7Naa6buuIz8G2zUz1LNmBK+Zkt11diN
 fw4h6xxCKlhgWty2J/4SJD4yiuvDfJfhmLipUFf8rGupXYHp/qRa9brn7EaplBDl/JjV
 i8cBASIy318RpJAHQu62ZtT23u1Lx6JEagLCNv3nBow8vTdCotEjgPMeU8SG7qs/Ddby
 Z68SvI9ZoG/3//6KDmvUe7zRJOplq2kIaXfTtTfPHyHccsDS1fItXlmDqj2RwO7cCQbG
 k5cw==
X-Gm-Message-State: AOAM532UD8zhQWIKDQEHHbgPr/rEiVJZpnOFF1MqhTbnj0MSDqXXTGNu
 w1vrGjfAwzlqOPA+7Yg66lXrGGnEVZQX4Ys/
X-Google-Smtp-Source: ABdhPJwXK38mBCV5rbMh2LR5PWO48RWUWvV5gubk5Ivy7jPQteocekI7YGd9SLlfAX/zWUhf+4ygmg==
X-Received: by 2002:a05:6512:281f:b0:445:c824:24bf with SMTP id
 cf31-20020a056512281f00b00445c82424bfmr3900423lfb.74.1647543400255; 
 Thu, 17 Mar 2022 11:56:40 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 v17-20020a2ea451000000b00247e30b50dfsm486764ljn.107.2022.03.17.11.56.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 11:56:38 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id c15so8454598ljr.9
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 11:56:37 -0700 (PDT)
X-Received: by 2002:a2e:804b:0:b0:247:e81f:87e9 with SMTP id
 p11-20020a2e804b000000b00247e81f87e9mr4044603ljg.176.1647543396246; Thu, 17
 Mar 2022 11:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000085b1b305da5a66f3@google.com>
 <CAHk-=wjLNbf7viXP74K59jK=sRkg6mUbj0i3qpQvy9_2S4Lbtg@mail.gmail.com>
 <s5h5yoc651j.wl-tiwai@suse.de>
In-Reply-To: <s5h5yoc651j.wl-tiwai@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 11:56:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh61USn+ATUDM-_hX+8p6Yhsq3RWHh+XR4BihfqFYJX8w@mail.gmail.com>
Message-ID: <CAHk-=wh61USn+ATUDM-_hX+8p6Yhsq3RWHh+XR4BihfqFYJX8w@mail.gmail.com>
Subject: Re: [syzbot] WARNING: kmalloc bug in snd_pcm_plugin_alloc (2)
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: syzbot <syzbot+72732c532ac1454eeee9@syzkaller.appspotmail.com>,
 alsa-devel@alsa-project.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Linux-MM <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>
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

On Thu, Mar 17, 2022 at 7:13 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> And, we want not only avoiding the overflow but also limiting the
> actual size, too.  Practically seen, more than 1MB temporary buffer is
> unrealistic, and better to bail if more than that is requested.

Looks sane to me, although I obviously can't judge how well that 1M
limit works since I don't know the uses.

Thanks,
              Linus
