Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639A201D3B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 23:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497C61684;
	Fri, 19 Jun 2020 23:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497C61684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592603002;
	bh=pWv3uFlOKRR1oFy9CTi16KKmXGAdf8tt9xHWzpONWO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yx9t+g3+EjRMo5CcjTu2tMI22xYrdc/gFUz2G3Koj+YEa6rG70BhkvKp8s3lI665o
	 V7ojqqT/qezDQBkUMmFJK6t3UhUm/T0FW641GHfMNGJIpnooUx5qyLZJQRm8l1JHl6
	 SuzEjrCSNzQ62Gb81kfwK0ALbXhXv9kfE9BG2fSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77599F8025F;
	Fri, 19 Jun 2020 23:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6BC4F80255; Fri, 19 Jun 2020 23:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_167,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C55F800EF
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 23:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C55F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eWmHbF9H"
Received: by mail-qt1-x844.google.com with SMTP id d27so8366274qtg.4
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 14:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NhZ3NKlxFN6d3fikyJgKv4blLt+yRNAcXFBHzm033QY=;
 b=eWmHbF9H3cVTERZIpW55ZR1gaZnaB20I0PUEVFzfcuW+L/3xvl0Hue6dyXsf33dFUE
 BjhnZuM+WMNFAr+Bh3F18ctwYfo/qn66LXpwWMFA7+L7j8M6GZoj+4tNYyz/rmTuQGtb
 EafrzovbxpPjyHOIxx5nEnlowIjZs3/5JD1vXhK7VE8DbJmJKiRiKzAEq8wmfztiDU8I
 ybuxNSxB7DKhMiozGjh54ylU9pihojcIHouF3nF4UtQ1zU+EdGtN4gfpPvVmQkOj8wr3
 37Bea04Veo9YXCsdLJXn7vPvgmj+E33PkW9m+vuEl5oXe55KPc3LKtj8185DYmhUIvcR
 8suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NhZ3NKlxFN6d3fikyJgKv4blLt+yRNAcXFBHzm033QY=;
 b=IxtYHhN4AyV/6G2EqA/jX8pI04gj6sph29o7yqgFssApvqNnHjpK5VROZzC2+Ve3Z5
 7RzwGIB4EM5W7pGu7kas5laZL3fI8LLUITBRFuJ9O2T4M59IFRVNoiALBH+MvrOZsMG3
 hiOz9H1Z7fJ8YTnM1Vpaxxf8XnWjZyPZzTEdqdZRnI/IzjG8gfi+hNm0wyAo0xmkR5wT
 +5mvXUoeHS/qhGfmr4xVyes0wT3SOMghz67mw9npw/qzg8ZVxBz8kxq6MOj183NzIG5X
 aFIRJb4xIy+0kPK1WMo7n9ywZlbIeVoxcqp1PXF2CJ6WKvrBpUh71vxtW6a35PZTWqpm
 cmBg==
X-Gm-Message-State: AOAM5305voLi1oI1RE2FYhxdkTOyX3EXnq9YZI/qx7mcSB7kc4TDDh5/
 3G1U4YhwgYmTjepmhhmyjZaIbSsBjiDSNsKGY6g/8Q==
X-Google-Smtp-Source: ABdhPJzdxpezv18BdVjVR8rVVKiFtcBi3jtEdQWebZumw/pGh/8zEwckTM77W2Dvr++XnsV1aEZdtnvRkq3c1fFfPQc=
X-Received: by 2002:ac8:f7b:: with SMTP id l56mr5658912qtk.127.1592602891642; 
 Fri, 19 Jun 2020 14:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
 <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
 <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
 <49a16c64-5951-f327-c12a-d3264353b74b@intel.com>
 <685b8be3-4ff8-5012-c900-8521c2772121@linux.intel.com>
 <CAOReqxiTDafvSiUQFZuqhp1DYT_buaCp5oq01QDSgRm-YK57ng@mail.gmail.com>
 <91f8b0d8-6015-6090-40cf-0647eaa73686@intel.com>
 <CAOReqxh8TxfRm64eeQu5Ns-fbO2VuJGSGYQ9UmcYdPCHg_XAHw@mail.gmail.com>
 <971825d7-ce93-631e-d4a6-1c9fc883f018@intel.com>
In-Reply-To: <971825d7-ce93-631e-d4a6-1c9fc883f018@intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 19 Jun 2020 14:41:20 -0700
Message-ID: <CAOReqxjAK0sm=r8hdBYXm0zcUr3DfQpPMjsaXTURvwdBZvcc5Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: haswell: Power transition refactor
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ross Zwisler <zwisler@google.com>,
 Takashi Iwai <tiwai@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
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

On Fri, Jun 19, 2020 at 12:12 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2020-06-19 8:24 PM, Curtis Malainey wrote:
> > On Fri, Jun 19, 2020 at 1:34 AM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:
> >>
> >> On 2020-06-19 3:21 AM, Curtis Malainey wrote:
> >>> On Thu, Jun 18, 2020 at 6:19 PM Pierre-Louis Bossart
> >>> <pierre-louis.bossart@linux.intel.com> wrote:
> >>
> >>>>
> >>> We reverted this patch locally due to regressions and raised the issue
> >>> with Cezary on Github, we got no response.
> >>>
> >>> Curtis
> >>>> 8ec7d6043263ecf250b9b7c0dd8ade899487538a is the first bad commit
> >>>> commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a
> >>>> Author: Cezary Rojewski <cezary.rojewski@intel.com>
> >>>> Date:   Mon Mar 30 21:45:20 2020 +0200
> >>>>
> >>>>        ASoC: Intel: haswell: Power transition refactor
> >>>>
> >>
> >> Hello,
> >>
> >> This is the very first time I see hear about the issue. You raised no
> >> issue Curtis, instead, you did write a comment mentioning me in Closed
> >> thread thesofproject/linux which isn't even the driver issue relates to.
> > That thread was directed to getting that fixed, you were active on the
> > thread, regardless of whether the repo is or not. The bugs fell past
> > their SLOs that were sent to your team through issue trackers which
> > meant your team was not responding.
> >>
> >> If you scroll up a bit, in the very same thread there is a message
> >> notifying about official path for such issues. Said message was ack'ed
> >> by management before posting and that's why it's split from technical
> >> explanation.
> > And if you scroll down you see this comment from Ross
> > https://github.com/thesofproject/linux/pull/1842#issuecomment-606232124
> > We both attended meetings with your team where this request was
> > ignored. It took you only a couple of days to fix once we took this
> > approach yet it sat in the backlog for months. Forgive me if I have
> > little faith in your "official path." This was a major blocker for us
> > and it sat untouched.
> >>
> >> We've received no response from Harsha and Cedrik about the issue being
> >> risen. Official HSD-ticket is left unchanged since my feedback from 3rd
> >> April.
> > When someone tags you in a comment it is your job to read it as a
> > Github developer, regardless of the status of the thread.
> >>
> >> Help me help you - don't wait until problem escalates. Adhere to
> >> official protocols, notify early and stay in contact. Last time when
> >> your 'SOF github-IntelSST BDW' ticket finally did arrive at my desk, I
> >> drove back to campus, borrowed the only SAMUS we have and by the end of
> >> the week, the problem was fixed. Monday Mar30 you had the official
> >> response and patches applied.
> > Yes, after months of trying to get this fixed through the "official
> > path" and failing. Don't let the issue escalate outside the trackers
> > in the first place. Be active and respond to high priority requests. I
> > still have yet to see a response from intel regarding a solution on
> > any of the bugs regarding this issue. Our PM pinged Carol many times
> > during the course of getting this fixed with no response. I don't see
> > why I should post there when posting here clearly got a quicker
> > response. In fact your are actually CCed on the bug where the revert
> > was posted and you didn't even respond. Don't feed me lines.
> >>
> >> I've forwarded your issue to required entities within Intel so issue is
> >> tracked appropriately.
> >>
> >> Regards,
> >> Czarek
>
> Let's make something clear - none of people from our companies found on
> the list who actively post changes or review them are decisive. Neither
> me nor you, Liam and Pierre and whoever else you find missing. That's
> the truth.
Agreed
>
>  From Intel's perspective, I'm a resource. And those usually work with
> priority list in mind. If I were to take request from every mention/
> tag/ CC/ To, you'd be waiting at least till Feb next year as that's
> roughly my current schedule. Under no circumstances treat SOF github or
> google-partner account as mean for assigning Intel's resources to fit
> your needs.
This is a matter of philosophy but I do disagree with this given that
we have no access to your trackers but you do to ours, so that makes
bug tracking hard if we won't unify on a single bug. There has to be
collaboration somewhere.
> You may have different deal with OTC but I'm not even part of SOF
> project team Curtis, thesofproject/linux isn't in my scope. If you
> insist on details, my github account was added to SOF project to help
> them deliver probe feature for you guys. When in need, priority list is
> shifted and resources are allocated where necessary. So, considering
> I've been helping at least 8 diff projects within past months, these
> should demand my full attention daily from then on?
Project balancing is part of the job. I balance a similar workload but
does that mean that bugs can go unanswered. Acking is still better
than silence.
>
> No. That's management job - deal with issue prioritization as they see
> fit. I cannot speak for Harsha's, Cedrik's or Carol's teams and won't be
> defending them here. If what you say is true, it's sad official path
> failed so badly.
>
> Thanks for being honest though, Curtis. I prefer facing the truth
> upfront. While as a dev lead I cannot escalate anything myself really,
> I'll certainly make sure your message is sound for those who can.
Thanks for propagating this information.

Curtis
>
> Regards,
> Czarek
