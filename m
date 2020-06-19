Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5763201A5F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 20:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329D4167F;
	Fri, 19 Jun 2020 20:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329D4167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592591170;
	bh=H7qnri4xlNMJqqihThDp3JWUMvsyUTfHeNJuoKVG24g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=luNbHCKtYA7txXtOqtNyVGlA0CHxveq7wmq3e281NvBRMB05NSk9SQSAF2n/rsqBU
	 MW2MSoTX9bYD9O8JDoU03/I0hSNbj0i6/Rm+vvzh2NQiqAxsYV4QHpaA7/NWJAheVO
	 /J5BXkzTAdHftfprhJynRhZHS/OyZbgTIg/7j040=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57076F80255;
	Fri, 19 Jun 2020 20:24:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82977F80252; Fri, 19 Jun 2020 20:24:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_167,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90EECF800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 20:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EECF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JEJVM0/e"
Received: by mail-qt1-x843.google.com with SMTP id w90so7906583qtd.8
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 11:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GLxx9sw5EK2uJpRcdws63e4c3XFJvTUu8Cfv0/0uOSQ=;
 b=JEJVM0/ehLdOIq+7IOcze4q16ncXFrkWA63LkyTcPg1+dMaotZlvqG+xq5z5kMsJ23
 ZZEcPxMT8GwH3x6UMy97YtqTdfS7pkJMLTZDUYnTk3gPn9O756QJ+KSpdnPdjbw6WIIt
 971H/xpDS27bpeNtqOMclJTCLuE6BmbUQXnXEG0INHp0EIP/wJHFb+FhRMGow5PUGwqW
 0l1jBhrozXeSCWMyz6kS918hHPkIB5cjSEtflx4XusFK559yaxgWDJyq8kMvNFK9SqVp
 t8pixDIVn5XCUw9CRZ7tvvi7c3GdOdEjbk3ES4v3R8+QU0LxsmoaRn0mWJ4HfWp4loE/
 a2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GLxx9sw5EK2uJpRcdws63e4c3XFJvTUu8Cfv0/0uOSQ=;
 b=eT2mCO6YiNf+dYdV6SMRZ8HwbB83Bqw/Kt9W791z6JQMb1bP8z4WVwBTAqJQypYKsM
 0Sno0qk6gLtRWKH8Q9GGW0VUSsmBaKOg4C48kNOYbrVW0jQeF2f62Zlcb4tbqqLfaeeQ
 SnS/zHNTlznwksdLc4Is2VXPpopx0nZgtCC4lE4ctXF7MO/nLuJKuBVtLIfEleI+BKsm
 Sno0i9+8KLCT1SaBcsSDcbIi/qJfo0/EluMZzF4QZS0P4Dq393myKUde/oAXc4qp0/xF
 4tn8hoeb+ayoRWtD7hbVFOYBXe9oqbFLhmgzA98mXftcCFyVwUC5vRuKWwhhWfYn6sWz
 Tueg==
X-Gm-Message-State: AOAM53190cYttNF12Q3OeKJ7Ip0L6K4Fzc7hc5S2C6EwUTkRhsNddEKS
 HQBX5kFQS6OsS/Y0PPo951brCoaXYj8zRjCeHHqn4w==
X-Google-Smtp-Source: ABdhPJxwq/aT3nB9G30iE33/mEb9G1NTr3ApNcjM97Vl5jCKqJYEYJBc7yo2/Dzh9Q1HNjJ9fPeYZNszfvkzabMA6PI=
X-Received: by 2002:ac8:1c29:: with SMTP id a38mr4807142qtk.52.1592591059232; 
 Fri, 19 Jun 2020 11:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
 <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
 <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
 <49a16c64-5951-f327-c12a-d3264353b74b@intel.com>
 <685b8be3-4ff8-5012-c900-8521c2772121@linux.intel.com>
 <CAOReqxiTDafvSiUQFZuqhp1DYT_buaCp5oq01QDSgRm-YK57ng@mail.gmail.com>
 <91f8b0d8-6015-6090-40cf-0647eaa73686@intel.com>
In-Reply-To: <91f8b0d8-6015-6090-40cf-0647eaa73686@intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Fri, 19 Jun 2020 11:24:08 -0700
Message-ID: <CAOReqxh8TxfRm64eeQu5Ns-fbO2VuJGSGYQ9UmcYdPCHg_XAHw@mail.gmail.com>
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

On Fri, Jun 19, 2020 at 1:34 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2020-06-19 3:21 AM, Curtis Malainey wrote:
> > On Thu, Jun 18, 2020 at 6:19 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
>
> >>
> > We reverted this patch locally due to regressions and raised the issue
> > with Cezary on Github, we got no response.
> >
> > Curtis
> >> 8ec7d6043263ecf250b9b7c0dd8ade899487538a is the first bad commit
> >> commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a
> >> Author: Cezary Rojewski <cezary.rojewski@intel.com>
> >> Date:   Mon Mar 30 21:45:20 2020 +0200
> >>
> >>       ASoC: Intel: haswell: Power transition refactor
> >>
>
> Hello,
>
> This is the very first time I see hear about the issue. You raised no
> issue Curtis, instead, you did write a comment mentioning me in Closed
> thread thesofproject/linux which isn't even the driver issue relates to.
That thread was directed to getting that fixed, you were active on the
thread, regardless of whether the repo is or not. The bugs fell past
their SLOs that were sent to your team through issue trackers which
meant your team was not responding.
>
> If you scroll up a bit, in the very same thread there is a message
> notifying about official path for such issues. Said message was ack'ed
> by management before posting and that's why it's split from technical
> explanation.
And if you scroll down you see this comment from Ross
https://github.com/thesofproject/linux/pull/1842#issuecomment-606232124
We both attended meetings with your team where this request was
ignored. It took you only a couple of days to fix once we took this
approach yet it sat in the backlog for months. Forgive me if I have
little faith in your "official path." This was a major blocker for us
and it sat untouched.
>
> We've received no response from Harsha and Cedrik about the issue being
> risen. Official HSD-ticket is left unchanged since my feedback from 3rd
> April.
When someone tags you in a comment it is your job to read it as a
Github developer, regardless of the status of the thread.
>
> Help me help you - don't wait until problem escalates. Adhere to
> official protocols, notify early and stay in contact. Last time when
> your 'SOF github-IntelSST BDW' ticket finally did arrive at my desk, I
> drove back to campus, borrowed the only SAMUS we have and by the end of
> the week, the problem was fixed. Monday Mar30 you had the official
> response and patches applied.
Yes, after months of trying to get this fixed through the "official
path" and failing. Don't let the issue escalate outside the trackers
in the first place. Be active and respond to high priority requests. I
still have yet to see a response from intel regarding a solution on
any of the bugs regarding this issue. Our PM pinged Carol many times
during the course of getting this fixed with no response. I don't see
why I should post there when posting here clearly got a quicker
response. In fact your are actually CCed on the bug where the revert
was posted and you didn't even respond. Don't feed me lines.
>
> I've forwarded your issue to required entities within Intel so issue is
> tracked appropriately.
>
> Regards,
> Czarek
