Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D583B8DC8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 08:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5093169B;
	Thu,  1 Jul 2021 08:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5093169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625121391;
	bh=qNXXtzKMiWGVac67QeWi8xW4wnPq3w3vDczolGKPMI8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEDlyinltbIDmDmMtpcbc5lhqcZCBFtHvk0VLTW5wb8IzoNooT3xYxm/QXq+BeMCk
	 HoI1mdie67xBpW48DTHo72EnZyWS1HHMn36nv8VQj0xAGBSy9MRRSHjbiBAcOnx9BZ
	 Rwcg7cZ8M1j/MNmBrdyV86SGoz9jtcTKfiBrdTFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF77F802D2;
	Thu,  1 Jul 2021 08:35:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B014CF802D2; Thu,  1 Jul 2021 08:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B38C1F80259
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 08:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38C1F80259
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <jeremy.szu@canonical.com>) id 1lyqHj-0006KR-MU
 for alsa-devel@alsa-project.org; Thu, 01 Jul 2021 06:34:51 +0000
Received: by mail-wr1-f71.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so2095215wru.6
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 23:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pqHVyg8UF47Dyl4T8QTNzcygmIy+wqtlN3mxo+BDvCc=;
 b=t3QiKfDBG0DZlln2intO0UbKZUC7VcovJzWrv3PFotlWKAZWojGW0qvcjbmz70OyQD
 ffml62tQ1PyrcK3J2S6N5Nhn4sfKXxRwJqd9FeKPC6XqB9qe4pUp1znNrNDtWgE3rpyA
 AgAH4yOUdFnJcF5ViA3jY2SR9V4S341xmx77S2j7eTZ6xUs79PKwPMfSJ6wWxsrU4JDy
 i9vsxBxNw/ZnLJQPOYzeGQrRqcCaBD+pe9u9NFi7lpCQ2nIyRZ/KQKu+V3GQqqtdTlON
 6UJEs4yoa3M7uwenkuVl0eqPcsnucNZYLoIQ8uzHk999oFnEG2frZfDN5ErA/WQPnw+K
 OMOw==
X-Gm-Message-State: AOAM532/ZtGd4BshN9j90hniTS4mTsvkz8lvAsQt5QofOd4kCW0noAhq
 AbE4eaAbr00LkYYkR1U4jFVfz9NkC5wb9dDzP/MhvxCzbdoECeSw5UIUuGnFiVzNhND6L+XyekA
 Hr608xu5P3tV0F0EAz+X3drUtOSE4mYOkJ6+itQ2uXlC0RKQkUIqEd0Ug
X-Received: by 2002:adf:c843:: with SMTP id e3mr44289711wrh.25.1625121291406; 
 Wed, 30 Jun 2021 23:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI8IIXy6IxZd/acqBJCs8s2mL7QQB52remKdG39KcvNIhtkgzaKm//Xacru3uhJfwwiWY07xQwEU5S/uRqSNI=
X-Received: by 2002:adf:c843:: with SMTP id e3mr44289692wrh.25.1625121291214; 
 Wed, 30 Jun 2021 23:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210625133414.26760-1-jeremy.szu@canonical.com>
 <s5h8s2xkiw8.wl-tiwai@suse.de>
 <CAKzWQkzX-EdmY359W2D-vC-i+a-OH3-EQyEET6skAvbj6hwMfg@mail.gmail.com>
 <s5hsg0yilw9.wl-tiwai@suse.de>
In-Reply-To: <s5hsg0yilw9.wl-tiwai@suse.de>
From: Jeremy Szu <jeremy.szu@canonical.com>
Date: Thu, 1 Jul 2021 14:34:40 +0800
Message-ID: <CAKzWQkzbjT_XqpKZzFAKgUmrgp7-FHx18anxxLXm6i+bNcp1bQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook
 830 G8 Notebook PC
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Chris Chiu <chris.chiu@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, open list <linux-kernel@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jian-Hong Pan <jhp@endlessos.org>,
 Werner Sembach <wse@tuxedocomputers.com>, tiwai@suse.com,
 Hui Wang <hui.wang@canonical.com>, Sami Loone <sami@loone.fi>
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

Hi Takashi,

No problem, many thanks!

On Thu, Jul 1, 2021 at 2:33 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 01 Jul 2021 08:23:42 +0200,
> Jeremy Szu wrote:
> >
> > Hi Takashi,
> >
> > May I know where the tree containing this patch is?
> > I didn't see this patch in
> > git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git.
>
> My bad, I forgot to push out the tree before entering my vacation.
> Now it's out.
>
>
> Takashi
>
> >
> >
> > On Sat, Jun 26, 2021 at 12:29 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Fri, 25 Jun 2021 15:34:13 +0200,
> > > Jeremy Szu wrote:
> > > >
> > > > The HP EliteBook 830 G8 Notebook PC using ALC285 codec which using 0x04 to
> > > > control mute LED and 0x01 to control micmute LED.
> > > > Therefore, add a quirk to make it works.
> > > >
> > > > Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
> > >
> > > Thanks, applied.
> > >
> > >
> > > Takashi
> >
> >
> >
> > --
> > Sincerely,
> > Jeremy Su
> >



-- 
Sincerely,
Jeremy Su
