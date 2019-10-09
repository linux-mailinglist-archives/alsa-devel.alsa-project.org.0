Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE1D17BF
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 20:50:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93B0A843;
	Wed,  9 Oct 2019 20:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93B0A843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570647017;
	bh=faGLf2dmsSg04vyeYhDWFlc+Fq3rx2gl3VrhYy52TBU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HiB/XjMO5tm9gkXjE7nsJoqtVziEwMPy00nwtsjOOJcXeg/FXZ8y2o6ZWWTDnxosK
	 0Y4FX9TFtmfCRgzVmU2cXWWyDuhpZ0HJ0/Iff3HrEshoVbhDAeGjbb19Vtjz7chmkX
	 iAIFVGWoC6lCc9j+U5DOLrA21JimkmTsF071HbbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF3CF802BD;
	Wed,  9 Oct 2019 20:48:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7454CF802BE; Wed,  9 Oct 2019 20:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C0B8F80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 20:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C0B8F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YQQS2hKz"
Received: by mail-wm1-x32c.google.com with SMTP id f22so3700013wmc.2
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 11:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CYbHs95a77bMt40gHTS2cRoxxPLDUapkB7+2+LM0GQ=;
 b=YQQS2hKzB7EkyCfK+cb8lcrevDQREF1KdDsVEzS/L6CHVwtAwzdJdN4VUC0SmvXW7D
 DEOxR+yFkOqctP5jNeCBl/wmqp/mDzaEJ327M9fUUR8+OhFQ+0t0KQNsZa8eIQqSJyQU
 zcooUZRKP9Xpubn5v+1xA7ECi/M9LXBiXqueQlm0knEa7YlyEQxq04x1zjR9gnCWuYa9
 etDYqwYANKX8j8+bhFbTgImZD6Qp0g6U2C/jAUVJd/L0ZdKzazs5hRXQq47DpW+Y/GA8
 jMkfnFoWNhikDf75LN/0XeQlClysoZS4apjEAqRJ4R7gBkQKXQYw55pVDnTCKTsGywsl
 U9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CYbHs95a77bMt40gHTS2cRoxxPLDUapkB7+2+LM0GQ=;
 b=tXiD/0MfCsI9/iVty4brXzV/QKx/qBezNijlP4T97Z6V0aIQ6eB4PD5bNe4q99PNLr
 1WMy46JIRxB1iX0mxYoE7GQcboJT8YWCcz9WaQGRRfzj8AVp7B0Hbx6PYv4O2HgOY7a2
 bF/ppbVC15PEUNWct5oCLbfznbdqb8k53Ez3jirgflnhgWHIXQW3weBKtfhyzT7lRCWT
 tq6drmmz5BYtvWV6ZlfxZQ9aA6PipYIiiwK4faAUESwfX4PjYwiBQI1+YBwwikHkr3Fd
 IgoA9l9NBeQW+UB5mCQPkLoFFV8ZivU8JEU7mz15NSJXpnX3fwlZUDJWB9ZdA5EIJQok
 Awiw==
X-Gm-Message-State: APjAAAX5VhkOs7tdevmOJY1CNIyNX7SnDuHAS6T72LLOJvaKfC3BR0E4
 pC0rIIbFB+n1bUXXv9C3UwCd390swXXzWRhGYmQ=
X-Google-Smtp-Source: APXvYqwKdp7RJBbUzp1GWUbjwYiQi7xForTI/hjjCE78Kl5nKKTLYhCVNYpOCuFvOaJDeQScwjS06LBHVEXb2D6A9Vo=
X-Received: by 2002:a05:600c:c1:: with SMTP id u1mr3455092wmm.87.1570646906342; 
 Wed, 09 Oct 2019 11:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191009181356.GO2036@sirena.org.uk>
In-Reply-To: <20191009181356.GO2036@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 9 Oct 2019 21:48:14 +0300
Message-ID: <CAEnQRZAR1b-CHHVEv0ia92vYu38fWkwgW3mdwJFhEQsHk2j5+A@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Guido Roncarolo <guido.roncarolo@nxp.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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

On Wed, Oct 9, 2019 at 9:15 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi,
>
> As in previous years we're going to have an audio miniconference so we can
> get together and talk through issues, especially design decisions, face to
> face.  This year's event will be held on October 31st in Lyon, France,
> the day after ELC-E.  This will be held at the Lyon Convention Center (the
> ELC-E venue) and will be free of charge to attend, generously
> sponsored by Intel.
>
> Thus far for the agenda we have:
>
>  - Use case management enhancements (Curtis)
>  - DSP framework integration (Liam?)
>  - Soundwire status (Pierre?)
>  - Componentisation status/plans (Me)

Hi Mark,

Thanks for taking care of this.

My topics:

- SOF driver: ACPI / DT unification
- SOF driver: Handling built-in driver use case

>
> As with previous years let's pull together an agenda through a mailing
> list discussion - if people could reply to this mail with any topics
> they'd like to discuss we can take it from there.  Of course if we can
> sort things out more quickly via the mailing list that's even better!
>
> If you're planning to attend please fill out the form here:
>
>     https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link
>
> This event will be covered by the same code of conduct as ELC-E.
>
> Thanks again to Intel for supporting this event.
>
> Thanks,
> Mark
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
