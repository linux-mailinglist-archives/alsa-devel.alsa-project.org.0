Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0D12CC15
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2019 04:12:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D6F16FF;
	Mon, 30 Dec 2019 04:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D6F16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577675524;
	bh=DqoVcgF/p7VViq/kZPjLoLsA5jQJb65HWVEz9VDaCT0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YSDrUpNay0Ot3QxE6KkQhlvG5tsGshBm2+bM2zD8yGqw1xCNWWLnKHC7A8T0fNj69
	 Eyqls7lCgjDs1ety9bw50D2+hz/YDG2lSdpq2P9RiNRgO4bcYmgATS/gSigCvqQC2D
	 nNXqO/csvTdnK2rBLPcrE7cLpeYso9NioqIUmw5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE6BF80126;
	Mon, 30 Dec 2019 04:10:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69AB3F8015F; Mon, 30 Dec 2019 04:10:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5697F8011E
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 04:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5697F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="mC8RgrJt"
Received: by mail-ot1-x343.google.com with SMTP id 19so32089576otz.3
 for <alsa-devel@alsa-project.org>; Sun, 29 Dec 2019 19:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=81fRmvyWTv5k/sEdvZr3Z/mRekQZD2TNFxEA5JN8n3A=;
 b=mC8RgrJtOgc8rzUx31JyYW7Afc0uU0dmZaffNviHyn4/1i1PlE7Wgb0GCVXIjGKN1n
 aHk40A46zhiGi2ifDG/6zdblfzGFwPzF50XwO3zoV1K8XH1r4o/I7JzOJA5Jr18b30qx
 05mvDjlBms7NBx29DEcxB18iQ9u8ynj/WDLyCHpMgn073+8qvoUleQxFIzqvCF0EHJ8G
 4GAe9AGTYkkkC0jbgWD9YyV+xwcoazkRGbnU16Jgt7smEy5Ov+/BhwYq0S1OwoVMtYwj
 xDfxVnrJz3rKFfL1RXQ+s5++r5Lgsf8nvQsFd7ZcvE97uhurnrnxaMgexsxL+XBCyN9L
 60hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81fRmvyWTv5k/sEdvZr3Z/mRekQZD2TNFxEA5JN8n3A=;
 b=VrRMyJsoEiLsGKohxw55V3zn4NZrYeIqpNHazERWL7PXYFjKQ15T5WPwd2eZiC3EC1
 j81X6xbZediNC6sDWGRzPWY2Jz8eT0fBuHKdZdt/1CSYxOYM0aJHFeAemH/kEXrC+vth
 iIkPgSCONg/eYA7g3XrlphI10NOocthD07aaDukMSYcDpgoTupKPkGDXOcYAbEQM+S0U
 X1fjE0ebtP3xITL4qegcSgFdIw0btLD/387dJVh6qthjSSTxGe88lvHj6hWyZPNEDJFV
 ZwokSxpmV6dpGhSrLWEpq/H/80gDcwcKSmgbUAYUXwwcVZIgn2udydGXiU17SPs87NVH
 rYcw==
X-Gm-Message-State: APjAAAXcCYUEYFqKBHoc0ZDMW0J4+Xa0RGtD++bVZoFO04in869HJY2a
 59tVX8ihMZW6iENX8SiK96Pq/7ljIkbJwJX1TsTBKg==
X-Google-Smtp-Source: APXvYqzJb+uB5liVLrHfYVKk67gMjY0PJ9sfI1BNzA+hrqawYhJ642k8YVlCYk/+pB5j9R7jBiNcCo2XAEgOZxWcOI8=
X-Received: by 2002:a9d:2c68:: with SMTP id f95mr72904555otb.33.1577675446489; 
 Sun, 29 Dec 2019 19:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20191227100825.75790-1-chiu@endlessm.com>
 <s5h4kxk6fkh.wl-tiwai@suse.de>
In-Reply-To: <s5h4kxk6fkh.wl-tiwai@suse.de>
From: Chris Chiu <chiu@endlessm.com>
Date: Mon, 30 Dec 2019 11:12:46 +0800
Message-ID: <CAB4CAwd=DNOqsRDEB5tRtN7yUgkM6fXi3yy5-PzW=3cCx=_45A@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Kailang <kailang@realtek.com>,
 tomas.espeleta@gmail.com, Linux Kernel <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v2] ALSA: hda/realtek - Enable the bass
	speaker of ASUS UX431FLC
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

On Sat, Dec 28, 2019 at 4:05 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 27 Dec 2019 11:08:25 +0100,
> Chris Chiu wrote:
> >
> > ASUS reported that there's an bass speaker in addition to internal
> > speaker and it uses DAC 0x02. It was not enabled in the commit
> > 436e25505f34 ("ALSA: hda/realtek - Enable internal speaker of ASUS
> > UX431FLC") which only enables the amplifier for the front speaker.
> > This commit enables the bass speaker on top of the aforementioned
> > work to improve the acoustic experience.
> >
> > Signed-off-by: Chris Chiu <chiu@endlessm.com>
> > Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
> > ---
> >
> > Notes:
> >   v2:
> >    - Use existing alc285_fixup_speaker2_to_dac1 instead of new fixup function
> >    - Correct the commit hash number in the commit message
> >    - Remove the redundant fixup ALC294_FIXUP_ASUS_INTSPK_HEADSET_MIC
>
> Could you rebase on the latest for-linus branch?  This patch isn't
> applied cleanly any longer.
>
>
> thanks,
>
> Takashi

Got it. I'll prepare a v3 to rebase on latest for-lnus.

Chris
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
