Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02E647F50
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 09:35:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4277212A;
	Fri,  9 Dec 2022 09:34:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4277212A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670574908;
	bh=KgzqwHAUo4UlqMKoDx7vj0kvtzbIgoQfXRK9zwxkBaA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XrhTf+fBQxz2HuxnKMAA0yUPfa6+a0zoSK7mOBDz6JdwbFCwFtx+S1LjEJv4GQV3Q
	 4+/DhGon21JbJo4SLnBke+SJCeZc7MdT+9o8u3snjvOaBo2fKHkhntycjnBTH/yrrb
	 +KjT2EPZeohHppnczLmN95Tnl4JYGTDjR9EVW0s0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B185F80007;
	Fri,  9 Dec 2022 09:34:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE4E0F8022D; Fri,  9 Dec 2022 09:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-07.comm2000.it (smtp-out-07.comm2000.it [212.97.32.77])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E589F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 09:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E589F80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=wk7KyBzc
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-07.comm2000.it (Postfix) with ESMTPSA id E1D5E3C7F0C;
 Fri,  9 Dec 2022 09:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1670574847;
 bh=KgzqwHAUo4UlqMKoDx7vj0kvtzbIgoQfXRK9zwxkBaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=wk7KyBzcyfUEO0FlF+jzBzQEVQBAFC+mCBr0RhLc436pYljKF0XLms1bPio/UWkCz
 tQ/9jK1ueaO1l9rnMEW72YMmAWrQ9VvX0cMDvQH9XamGo3lk0QgOU8L7jlPz7dtAtR
 lRxn4ppsK+hknGi75xOFwt6c/FNPlXD8EzgQbFaTK1/7hDn3zeNwfHmGw0oEvlN5qX
 Aa9h3uv+/BX3cZPj9KxTX/fGLjENR022uwjP0ouUcQYAb7/4N1ngs9EI9TS6K2ApoZ
 F5w0qSuiz2Dl15kZUS4bT0Id7N4khOyc6bnbfC7xdxFtSgYkRh0P42FlMjLfCi0y1C
 kCGQI6C1G0s5Q==
Date: Fri, 9 Dec 2022 09:33:52 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Mark Brown <broonie@kernel.org>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: Simple card and PLL/FLL
Message-ID: <Y5Ly8E68N4qubJw8@francesco-nb.int.toradex.com>
References: <4172f4b2-9198-dfc8-a2b0-d75a95265e14@gmail.com>
 <Y5DPbhXQazD8OWX1@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5DPbhXQazD8OWX1@sirena.org.uk>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, emanuele.ghidoli@toradex.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Mark and Emanuele

On Wed, Dec 07, 2022 at 05:37:50PM +0000, Mark Brown wrote:
> On Wed, Dec 07, 2022 at 01:41:24PM +0100, Emanuele Ghidoli wrote:
>
> > I guess what is the "right/better" implementation? Have we to add the
> > set_pll call in simple-card? Or have we to add it to e.g. fsl_sai driver?
> > Or, in some way, the wm8904 codec driver is approaching in the right way?
> >
> > Is there any documentation that explain all of that (I have already looked
> > at Documentation/sound)? Any driver that is considered well written and
> > complete I should use as a reference?
>
> It's kind of a taste thing.  There's some devices where the clocking is
> sufficently complicated and flexible that definitely needs a set_pll()
> ...
> for simpler devices like the WM8904 where there's an obvious thing to
> do it's much easier to just hide that from everything outside the
> driver and only deal with the input clock.

Thinking about asoc_simple_hw_params(), what about the fact that
asoc_simple_set_clk_rate() ask for a specific clock rate and assume that
the actual output frequency is the one requested?

After that we are potentially passing to the codec driver a wrong
information, we should likely have a way to pass the actual clock that
could be different because of limitation on the PLL/dividers.

Francesco

