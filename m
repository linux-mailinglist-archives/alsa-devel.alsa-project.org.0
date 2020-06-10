Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11E1F5E9F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 01:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862B61664;
	Thu, 11 Jun 2020 01:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862B61664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591830741;
	bh=J8VnJjY8kXdTFAnIiCcYxiThTgdaeHgHuG3NAZwB54E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OKm8uqxW0YUb3QD4RuZMjl6K48r8DH9qnvvjygEo+x1kA8ArKnis327B+maJBktx9
	 19VeypnXfk6LzlerCrsyYLta9ZnYxJWOJyItcpdnTT9HcdtpcD7EFbC5l/FRIGY+85
	 BnfBdDj0IAvcnT3xR9Zq75RlacEnWiqQEgJiGWTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B53AAF800E0;
	Thu, 11 Jun 2020 01:10:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14E30F8021C; Thu, 11 Jun 2020 01:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,PRX_BODY_14,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69768F80088
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 01:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69768F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="T2kGFNxr"
Received: by mail-yb1-xb36.google.com with SMTP id y13so2042918ybj.10
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 16:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq56PcmHg/cR1FuGPcTWftGqzJ7r0buKtASahmztDPI=;
 b=T2kGFNxrhC0/J6ZVMOtxNAbpaK6q8XRIBMfGrX8/EClx5s8+uixmYCRF2uNgaxlSUW
 lKXHZYVURdfEP3ujn2VgveNs5kQKZWaAdEzU/FMSF+xU2rjD+Am7dKYqzWq26iphUoMA
 f4fY9Ve8zgMApTPSmWxII3xqtIpDmmYK+QnRMozbUw/6wpd8CLHd12L7kZYwxaNJuRL0
 KwZpukzxF9k4KWVEVqGogWUO5uNwNx8yfawE7GCmLM5qZQTxcOW/uMECQJeHDpw+1Zil
 +boWdpMC3Q0VAgWerNmo0b639/mrJfo0F7coQCSGjzjNPsYBg10nWOHRjCktqYW7pYMk
 8FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq56PcmHg/cR1FuGPcTWftGqzJ7r0buKtASahmztDPI=;
 b=qywiFmZYbgnuE8YTZNxA6QM/ypGHqrhL588w6j1LTTcv7STv+LVduGFtltdt16mRyw
 IfbdeGYra9uURsiS9FszCg75pKeG04pgDn66fXd2bAaikVfsAeblSFI9HHtzcwvSWpJF
 7rmwp9C9W0ZaWaydPj0yN9a6Xf0gd1hkVzIMJj+tUlzcCP4mkOSb0Y13TDBkI7SJjMYU
 Tq6VBFScYgoxsRMs82WF0Yw1THT+YTt9C6XIxEUwNJW/GG7N7i+BdmBrqTXuCD/vl0pr
 XUzAYjudOYyw2+U/tYsJJH9Cx01STcMJLM0NxLodDmAFSRCO+5R0wOv2Li9kmopGJOYQ
 q5Jg==
X-Gm-Message-State: AOAM531T/ElJY4ApF37PV3qSF7bsbwBWRLHat730MN258Su8qUc/5IAk
 i+tDJaHfJ5BXtmrYMsBTSXZSQiL0SLnp9sYUQMhDNw==
X-Google-Smtp-Source: ABdhPJzgImG9rjhvwTx3VV4AIJqc3EknU7zl8tUMuXR2aw08lk4pLRTw/v49V2Oi1qUXjQyWQY9q/4PfQePPK6XSvQQ=
X-Received: by 2002:a25:cc50:: with SMTP id l77mr8999095ybf.53.1591830626622; 
 Wed, 10 Jun 2020 16:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190204093910.23878-1-perex@perex.cz>
 <20190326140928.GC10898@sirena.org.uk>
 <s5hva0567vs.wl-tiwai@suse.de>
 <CACL=Q7we61BwO81W7tQFvb9ohkBZkk34DSXL2B-Ky2B6zfWk1A@mail.gmail.com>
 <f5b429c6-803c-b624-6d39-5001c76e892f@perex.cz> <s5hd0lcppbn.wl-tiwai@suse.de>
 <CACL=Q7xSpeqyQzDyexCr+Nxs+nf3o9doaHGxiu-y8biK9w_9YQ@mail.gmail.com>
 <20200608134546.GG4593@sirena.org.uk>
 <CACL=Q7x43Udp_KA0C-N4+vcQ1MZ4NQt_xvf-nn6fRERRuz1tRg@mail.gmail.com>
In-Reply-To: <CACL=Q7x43Udp_KA0C-N4+vcQ1MZ4NQt_xvf-nn6fRERRuz1tRg@mail.gmail.com>
From: Phil Burk <philburk@google.com>
Date: Wed, 10 Jun 2020 16:10:15 -0700
Message-ID: <CACL=Q7z_B3vSd_KOpUq_BdpuhJSDifs+koDAkcBY=hHnsVv=Qw@mail.gmail.com>
Subject: Re: [PATCH 0/2 v4] ALSA: pcm: anonymous dup implementation
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, Leo Yan <leo.yan@linaro.org>,
 Baolin Wang <baolin.wang@linaro.org>
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

Hello Mark,

I wrote to Peter Huang at UniSOC

>  Did you ever get a chance to try the Linaro patches? Did they work for
you?



Peter wrote:

>  we have tried these patches, and they works. [snip]

>  And Baolin also suggests that his patch is too complicated and difficult
to maintain, and a better solution is list as below, this new patch I have
not tried.



[1]:

https://lore.kernel.org/patchwork/patch/1033206/



[2]:

https://www.alsa-project.org/pipermail/alsa-devel/2019-January/144925.html

https://www.alsa-project.org/pipermail/alsa-devel/2019-January/144924.html


It is hard for me to extract the relevant patches from those emails.


I would love to finish this project but I am not sure how. It seems we need
to:


1) Evaluate the patches that Baolin suggests as a simpler alternative.

2) Test them in an Android kernel with AAudio MMAP.


If you can provide a clear description of the latest set of patches then
maybe I can work with someone in-house to test this.


I am open to suggestions.


Phil Burk



On Mon, Jun 8, 2020 at 10:49 AM Phil Burk <philburk@google.com> wrote:

> Hello Mark,
>
> Thank you for keeping this moving forward.
>
> We sent the patches out to several SOC vendors for Android last year.
> They thanked us and said they would send feedback but never did.
> I pinged them again.
>
> If we cannot get the changes tested by partners then I will try to get
> them tested internally.
>
> For reference, this is being tracked internally at b/119712034
> <https://buganizer.corp.google.com/119712034>
>
> Thanks,
> Phil Burk
>
>
>
> On Mon, Jun 8, 2020 at 6:45 AM Mark Brown <broonie@kernel.org> wrote:
>
>> On Tue, Apr 23, 2019 at 01:11:50PM -0700, Phil Burk wrote:
>> > Hello Takashi,
>> >
>> > Sorry for the late reply. I got pulled off on some other projects.
>> >
>> > We will try to test this in-house but we will need Qualcomm's help.
>> > I will also try to get some of our SOC partners to help with testing.
>>
>> Did anything ever happen with this testing?  These anonymous mmap
>> patches never got merged.
>>
>
