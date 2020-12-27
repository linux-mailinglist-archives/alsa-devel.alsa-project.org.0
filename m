Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29F2E30AB
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 11:01:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7514017F0;
	Sun, 27 Dec 2020 11:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7514017F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609063306;
	bh=dMiLn604HhYMXIlBTtFtN+fZtNjX1n/LFmtJGuWfWjI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vSRSAwatIL4ADTzhPFYxBdxkbwujcnQ5dO56HiYvMHnfW08fYuEwDZ1+nBGvq9NXZ
	 dgO85xG6GX36TMzRTBUzcXlnDDaXqbVxADLh0aM1nHyR+1NFNaZ4hTtzUbN6R7EbLa
	 hIQkgk+TMH8AfAS3LH9nGHzx1vMVeIg+edg9T7jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD8C8F80169;
	Sun, 27 Dec 2020 11:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3D3EF8022B; Sun, 27 Dec 2020 11:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE98F80085
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 10:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE98F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B/nhD4qQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76E0520897;
 Sun, 27 Dec 2020 09:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609063196;
 bh=dMiLn604HhYMXIlBTtFtN+fZtNjX1n/LFmtJGuWfWjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B/nhD4qQxL5DHUuYBILLMPqnJJbfzFVNKKvJlI4T87kfOVSGE1UTpjC9DpGloXU+1
 rtq9apgbJUb0xNIaMJzK2TqA3TdRHdGxX3bUpBydN7ugF6y4LlbOjFB96EYMCl7tI/
 RnEB4FiRDtc3NpvVNJrxT/Vb3tHEg2cMt7eXU9fBJrqJixD3iCSbpueduh0Anraza7
 I2vJ21qDQdqKcaQHY2KKiq35JB6lcaEy9267eERRzhABbMPUoBrWVnZqtGHS2mCJgj
 rNLpCql5ydfdHqwPixGvDuyqtmZSeWASGDtbUYcKD8bJYwW1yc2N2BzfphzTJdEZvK
 t29EqMJC3G1RQ==
Date: Sun, 27 Dec 2020 10:59:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Subject: Re: [PATCH] docs: Fix reST markup when linking to sections
Message-ID: <20201227105949.549cc6ea@coco.lan>
In-Reply-To: <20201226131759.724711-1-nfraprado@protonmail.com>
References: <20201226131759.724711-1-nfraprado@protonmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Em Sat, 26 Dec 2020 13:18:58 +0000
N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com> escreveu:

> During the process of converting the documentation to reST, some links
> were converted using the following wrong syntax (and sometimes using %20
> instead of spaces):
>=20

The patch itself looks ok, although the description has an issue (IMHO).
Also, some references can be cleaned.

See below.

>    `Display text <#section-name-in-html>`__
>=20
> This syntax can work in html, but isn't the one described in docutils,

Well, docutils define two types of references at:

	https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#referen=
ce-names

The first one are "simple reference names", defined as:

	``Simple reference names are single words consisting of
	  alphanumerics plus isolated (no two adjacent) internal
	  hyphens, underscores, periods, colons and plus signs;
	  no whitespace or other characters are allowed.``

On this type, "-_.,+" characters are allowed. "%" and "#" aren't.

The second one is "phrase-references", defined as:

	``Reference names using punctuation or whose names are phrases (two or mor=
e space-separated words) are called "phrase-references".``

Here, the spec doesn't specify the charset associated with "punctuation".

As this kind of reference is auto-generated from the chapter titles,
I would expect it to allow all ASCII punctuation characters
(e. g. all non-alphanumeric symbols between 0x20-0x7f).

So, a reference like those:
	#Summary
	#Forcing%20Quiescent%20States

Violates the spec, as it would be a simple reference with invalid
chars, but:

	#Forcing Quiescent States

Should be valid, according with the spec (still, while doing such
cleanup, I would remove "#").

I would add something like the above at the patch description.

> and it also doesn't work on pdf. The following syntax should be used
> instead:
>=20
>    `Display text <Section Name_>`__
>=20
> The usual toolchain doesn't mind this unusual syntax, but it causes
> errors when trying to build using the not-yet-merged rst2pdf:
>=20
>    ValueError: format not resolved, probably missing URL scheme or undefi=
ned destination target for 'Forcing%20Quiescent%20States'
>=20
> Fixes: ccc9971e2147 ("docs: rcu: convert some articles from html to ReST")
> Fixes: c8cce10a62aa ("docs: Fix the reference labels in Locking.rst")
> Fixes: e548cdeffcd8 ("docs-rst: convert kernel-locking to ReST")
> Fixes: 7ddedebb03b7 ("ALSA: doc: ReSTize writing-an-alsa-driver document")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@protonmail.com>

...

> @@ -596,7 +596,7 @@ maintain ordering. For example, if the callback funct=
ion wakes up a task
>  that runs on some other CPU, proper ordering must in place in both the
>  callback function and the task being awakened. To see why this is
>  important, consider the top half of the `grace-period
> -cleanup <#Grace-Period%20Cleanup>`__ diagram. The callback might be
> +cleanup <Grace-Period Cleanup_>`__ diagram. The callback might be
>  running on a CPU corresponding to the leftmost leaf ``rcu_node``
>  structure, and awaken a task that is to run on a CPU corresponding to
>  the rightmost leaf ``rcu_node`` structure, and the grace-period kernel
> diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Doc=
umentation/RCU/Design/Requirements/Requirements.rst
> index 1ae79a10a8de..d4125caf394e 100644
> --- a/Documentation/RCU/Design/Requirements/Requirements.rst
> +++ b/Documentation/RCU/Design/Requirements/Requirements.rst
> @@ -45,7 +45,7 @@ requirements:
>  #. `Other RCU Flavors`_
>  #. `Possible Future Changes`_
> =20
> -This is followed by a `summary <#Summary>`__, however, the answers to
> +This is followed by a `summary <Summary_>`__, however, the answers to

Hmm... why are you ending "Summary" with a "_"? This should be
equivalent to:

	`summary <summary>`__

In this specific case, however, you could use, instead[1]:

	summary_

as there's no need to use an indirect hyperlink target here.

(the same applies to a few other similar cases on your patch)

[1] https://docutils.sourceforge.io/docs/user/rst/quickref.html#hyperlink-t=
argets

Thanks,
Mauro
