Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 347142CC84
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 18:48:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39E41835;
	Tue, 28 May 2019 18:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39E41835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559062109;
	bh=cM+0iqGbob2L7gzTAR4R8bwC12yngm+qqOFSSeBwOKc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twX2TDN3z0udv96/iTym/HwNjP/5XiXHqM55bD6PcxuOkQLa0y+xS7mvdwrmf0/F/
	 h9l6KKbS7izSmqbrRVZRKbew0sJMpSlhJGyW3HbB1fvBCTsB3QUZg+KvvVZCKZJSEv
	 dQNkFCArtXfZX58E6aZJlYoIMPR2ngiHRNtehpsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38DDCF8970A;
	Tue, 28 May 2019 18:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5B71F89706; Tue, 28 May 2019 18:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32179F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32179F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="AUbjYG9w"
Received: by mail-lj1-x244.google.com with SMTP id h19so9978495ljj.4
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kKB7NHrLBU4Z841cvVIgo1Q1e5YrA3roQF/fMdFarSU=;
 b=AUbjYG9w+nYvONL9TGC+Xjw111Yj7cW3gPg1shi2iCxoxAmrZFRWUSasnl+Jm6y/am
 6sq0EPH1f3KTgAKF5m9dXw4M8zcj29wqZgHNspRJ54CBlBn65d42/lT3XzpdEF+ejDKW
 1wkgrrRGUSADCIZEhjF4W+Xys9Zynly+FfqhiFdy2Cz+6gfUKh+xLS26Yd6qmVCgDfKf
 cndp/tmOA3bo7pLQMHNmU3dQBwVwZXIBB4pwkpoFOpSQEq4Wus34gJH7IWn/eCieiEel
 PnI1ce3NTy93Xf73Eu+gMZR9v83BZjIrI6bihY2ll1Fru/dV7qkvnncYqmRpF9NToNUY
 2HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kKB7NHrLBU4Z841cvVIgo1Q1e5YrA3roQF/fMdFarSU=;
 b=am/LBmnhft/wewmK/0g6d33wnQBW0TFuDOMZV4ExGdtDtMH4deqG5C2Y+QxFlBNvG5
 01laRhAFUZbzYSehxHobuenXoMe7L4Rc3yqZUlz589KvIsCalERIgtqcvlqPacpzF668
 /Du5kzgzIcKNosw1VglmOrVIPCSQxHIFY75YGitLRE/OFHUwngKU14Hv9JiM03YrnP0B
 A1kk7SgUdrpWnOOiD0Oi9yv5shDaf3J/3hR4ThL1PTc3x4MBc9hcDwrwT6/RG6lOdMEb
 YBIHYyNHubf9/KUzuTb5iktdWAlyBNacHYCd5hrJLQW26UAe/1ApKhNgnqNhGWM1o76r
 svdg==
X-Gm-Message-State: APjAAAXEKuVmh0U8QJv6b0hwwQrAuKTZbJj5042QhHfyum3nhFxO6Hru
 UiP5AHelhqKnWupvBs0NUjHiB5TTYF0LcdpcP5Tfog==
X-Google-Smtp-Source: APXvYqyUboDddANY/rnvVIhtQ3CS20ZGz90EjsbjKtHCRsbNRxBo0WnfMFfp6C51V3Lzjwed+yUlxrzpUehE2HWxOdA=
X-Received: by 2002:a2e:82c5:: with SMTP id n5mr29271900ljh.175.1559061999677; 
 Tue, 28 May 2019 09:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
In-Reply-To: <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 28 May 2019 09:46:25 -0700
Message-ID: <CAOReqxiVuVKSbKa8f_f_ZPewSVT+ib6iOW-jZsQJAaoyU7CxqA@mail.gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, Connor McAdams <conmanx360@gmail.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Merging the new firmware files for CA0132 into
	alsa-firmware
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, May 28, 2019 at 9:39 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 28. 05. 19 v 16:54 Takashi Iwai napsal(a):
> > Hi,
> >
> > it seems that Connor's previous attempt to put a couple of ca0132
> > firmware files into linux-firmware tree didn't go through,
> > unfortunately.  And now I'm thinking of taking them into alsa-firmware
> > package as a stop-gap.  We already distribute other ca0132 firmware
> > files, so the addition shouldn't be a big problem.
> >
> > Jaroslav, what do you think?
>
> No problem. The same situation is for the SoC SOF firmware files (drivers are
> in kernel, firmware files are missing). Perhaps, we can release those files
> quickly in alsa-firmware and then migrate them slowly to linux-firmware.
>
>                                         Jaroslav
>
I have some firmware I need to add for the RT5677, should I also just
add this to alsa-firmware instead of straight into linux-firmware?
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
