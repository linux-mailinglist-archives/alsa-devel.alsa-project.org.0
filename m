Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E302E7F8B
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:03:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B8316ED;
	Thu, 31 Dec 2020 12:02:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B8316ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609412595;
	bh=eBizkGspz5n53OqUrHFiSqdRKLs+PAGUiZURbEGysxw=;
	h=Date:To:From:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=ScdEjtX2rC4GT+FIekTeWXFpE7UZUY1CarhcvV8OWdYGzOEfKGy7LqQ2APJFg+eKF
	 vpuNkXxhoAx88uMALxhlnakumH9GMjMRVrNBZOtjTGh8j0oImRHXijVfbbKoZCEG/0
	 u/sJOqx3RkDQGK7B6v/2NrZD1EIOe0bM+6UsjWLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20FE9F80129;
	Thu, 31 Dec 2020 12:01:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23BC4F8022B; Sun, 27 Dec 2020 14:59:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD18F80085
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 14:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD18F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="DlSga1RD"
Date: Sun, 27 Dec 2020 13:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1609077564;
 bh=YljSvU7AD7QZcNa1WxrVV3YXtj4LJS3zWAnWwLu+YdA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DlSga1RDI35jH7OyuyfnRdQpU7t7h0g7Lgf+e3vNkYtFTSvjV1Gfp+2fLnNS0gZWP
 35nYnspdqU+KhExqPaBNCaLSH37GZu2IwH48o4KjmMVRXfvNXU15gztsWd++c8q+bH
 L0ZXyFfRV/dzkr6+oelyu/IENWuzVz86BumTwgEg=
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
From: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@protonmail.com>
Subject: Re: [PATCH] docs: Fix reST markup when linking to sections
Message-ID: <C83MDQBAV3L7.2F306EF3F3Z6H@ArchWay>
In-Reply-To: <20201227105949.549cc6ea@coco.lan>
References: <20201226131759.724711-1-nfraprado@protonmail.com>
 <20201227105949.549cc6ea@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:01:39 +0100
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lai Jiangshan <jiangshanlai@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, andrealmeid@collabora.com,
 Joel Fernandes <joel@joelfernandes.org>, Stephen Boyd <swboyd@chromium.org>
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
Reply-To: =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun Dec 27, 2020 at 6:59 AM -03, Mauro Carvalho Chehab wrote:
> Well, docutils define two types of references at:
>
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#refere=
nce-names
>
> The first one are "simple reference names", defined as:
>
> ``Simple reference names are single words consisting of
> alphanumerics plus isolated (no two adjacent) internal
> hyphens, underscores, periods, colons and plus signs;
> no whitespace or other characters are allowed.``
>
> On this type, "-_.,+" characters are allowed. "%" and "#" aren't.
>
> The second one is "phrase-references", defined as:
>
> ``Reference names using punctuation or whose names are phrases (two or
> more space-separated words) are called "phrase-references".``
>
> Here, the spec doesn't specify the charset associated with
> "punctuation".
>
> As this kind of reference is auto-generated from the chapter titles,
> I would expect it to allow all ASCII punctuation characters
> (e. g. all non-alphanumeric symbols between 0x20-0x7f).
>
> So, a reference like those:
> #Summary
> #Forcing%20Quiescent%20States
>
> Violates the spec, as it would be a simple reference with invalid
> chars, but:
>
> #Forcing Quiescent States
>
> Should be valid, according with the spec (still, while doing such
> cleanup, I would remove "#").
>
> I would add something like the above at the patch description.

Indeed, some of those references aren't even valid according to the spec, b=
ut
that isn't even the real issue. The issue is that they only work in html. T=
hey
*don't* work in the LaTeX pdf (already supported) and in the rst2pdf's pdf =
(not
yet supported).=20

Even "#Forcing Quiescent States" only works in html, and doesn't in pdf.
"Forcing Quiescent States_", on the other hand, works in all of them. More
details below.

I should have been more clear in the commit message about that, and I will =
for
v2.

> > @@ -596,7 +596,7 @@ maintain ordering. For example, if the callback fun=
ction wakes up a task
> >  that runs on some other CPU, proper ordering must in place in both the
> >  callback function and the task being awakened. To see why this is
> >  important, consider the top half of the `grace-period
> > -cleanup <#Grace-Period%20Cleanup>`__ diagram. The callback might be
> > +cleanup <Grace-Period Cleanup_>`__ diagram. The callback might be
> >  running on a CPU corresponding to the leftmost leaf ``rcu_node``
> >  structure, and awaken a task that is to run on a CPU corresponding to
> >  the rightmost leaf ``rcu_node`` structure, and the grace-period kernel
> > diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/D=
ocumentation/RCU/Design/Requirements/Requirements.rst
> > index 1ae79a10a8de..d4125caf394e 100644
> > --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> > +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> > @@ -45,7 +45,7 @@ requirements:
> >  #. `Other RCU Flavors`_
> >  #. `Possible Future Changes`_
> >
> > -This is followed by a `summary <#Summary>`__, however, the answers to
> > +This is followed by a `summary <Summary_>`__, however, the answers to
>
> Hmm... why are you ending "Summary" with a "_"? This should be
> equivalent to:
>
> `summary <summary>`__

Actually, that doesn't work. To reference a target in rst, like a section, =
an _
is needed at the end of the reference (and when it is a named link, this ha=
ppens
inside the <>). Take a look at [1].

While reading [1], though, I noticed that it should also be possible to not
have the link anonymous, that is, to use _ instead of __ at the end. And th=
at
fails in rst2pdf specifically, so that's an issue I'll report there.

> In this specific case, however, you could use, instead[1]:
>
> summary_
>
> as there's no need to use an indirect hyperlink target here.

You're right, this does work. I didn't realize these references were
case-insensitive. So for v2, I'll also see if there are any other reference=
s in
my patch whose text only differs the target in casing, and use this simplif=
ied
syntax for those.

Thanks,
N=C3=ADcolas

[1] https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#embe=
dded-uris-and-aliases

