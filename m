Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 742103B8DB9
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 08:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC301169A;
	Thu,  1 Jul 2021 08:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC301169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625120738;
	bh=UyCphYFdUEjeVYsQe8f1P41sEGMeMhoRcBWCMrffrkA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RjWCDOLeplGdDSl1oqozeefGV5EC0VinJSrhW7LgQaH60nVPO6JHcd4wrFFW7NB5R
	 WReIvucMABjoNWC4fHtvZ9tQQ/LBgaJq2X1yqb8q5h0bQJ9rHFxWbHENsPHc4vtNF7
	 ZNzT9REQNorYs2vkFYasEkMlLPHnqM+3AOd114n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49271F804AE;
	Thu,  1 Jul 2021 08:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13ED7F802D2; Thu,  1 Jul 2021 08:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C08F800E3
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 08:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C08F800E3
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <jeremy.szu@canonical.com>) id 1lyq77-0005kr-UT
 for alsa-devel@alsa-project.org; Thu, 01 Jul 2021 06:23:54 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1732859wmh.9
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 23:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TXdKYyIu+S7k+FvmITaCyj+OTI3RbufpPTCFCWcfng8=;
 b=Cc/4CzkRsLukc8dd1XwNUf5ddY/fedHE/W2KZI/kg/qne5igSj3HHSA+/XCAYpcJlT
 Aaux4eGS6Co1EEQmQ9r7PENk6DnxLJo6C6psMiw7i6YpxtqHjXoiiQcrhxQnoZcfzu7U
 94rgl4zmb3cBuvbqLNXPjX6av3IcKqL6ZmxlEH7zR7MVChHr0k4oU+JL3EaaPAqNMaVQ
 u0OM0vv8bSkAkxZW/TRA6Ok4NiefLEbYTJFeuE2t597o9El2G8RmpGmaPkN6veAdCYvq
 ssN8ryn0yTl9YzFi2OQGKaxSGzrdAlQepnx+TSInHZjbUI7TRUR95epIWa7wNhq6Hdqa
 J5gw==
X-Gm-Message-State: AOAM533GMWpfSroM9kP2iZQSbjF/F2HgwxjoGJOCiS+gAGdKpLEnan4m
 an+8lmB/RVSoncagZWkSxa9xg+WnjA3sfbx3JBA1ctQQwzuJXfYUn1BIPrxuFlpaCu0Bmhkv5IR
 FAgbjx7aZtU7y9xKnRHRaQ8LyN1lh6ydMMe46tKkuu4bx+ySyug6OcbDT
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr2084833wma.174.1625120633292; 
 Wed, 30 Jun 2021 23:23:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydxPVG9884cPbugTvj5HsOfiiAP8uk2JUcCkaGU2OHeP1ojJI4hRolPvQMYtQl82uPsoROQs7X3ekGttLLimc=
X-Received: by 2002:a1c:4b0c:: with SMTP id y12mr2084800wma.174.1625120633043; 
 Wed, 30 Jun 2021 23:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210625133414.26760-1-jeremy.szu@canonical.com>
 <s5h8s2xkiw8.wl-tiwai@suse.de>
In-Reply-To: <s5h8s2xkiw8.wl-tiwai@suse.de>
From: Jeremy Szu <jeremy.szu@canonical.com>
Date: Thu, 1 Jul 2021 14:23:42 +0800
Message-ID: <CAKzWQkzX-EdmY359W2D-vC-i+a-OH3-EQyEET6skAvbj6hwMfg@mail.gmail.com>
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

May I know where the tree containing this patch is?
I didn't see this patch in
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git.


On Sat, Jun 26, 2021 at 12:29 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 25 Jun 2021 15:34:13 +0200,
> Jeremy Szu wrote:
> >
> > The HP EliteBook 830 G8 Notebook PC using ALC285 codec which using 0x04 to
> > control mute LED and 0x01 to control micmute LED.
> > Therefore, add a quirk to make it works.
> >
> > Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
>
> Thanks, applied.
>
>
> Takashi



-- 
Sincerely,
Jeremy Su
