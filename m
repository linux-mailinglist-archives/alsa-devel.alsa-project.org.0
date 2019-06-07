Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8999A38E60
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 17:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 134FF1660;
	Fri,  7 Jun 2019 17:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 134FF1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559919880;
	bh=J+jF/kc23FoH2AuIQacUoQtn0DLq2mC7haWad0JQv8c=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/TOTH75/WuzoLkwNeFe3p3C03Up/VNXN1nj0p1ZWdYgU70/qmRXzmCs/ql6JwUE4
	 IZwWtaO9CeW0BvxLwVrDkmrN/0X1TIRlNNzyiFvOvvtpKi+bsw1+eIe7eQGzwhAWEc
	 SXGyyUiV5sUrW/PwXtNbehcNzHgoazT5/GBbPdMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E86CF896DD;
	Fri,  7 Jun 2019 17:02:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D441F896CE; Fri,  7 Jun 2019 17:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_MED,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B46A6F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 17:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B46A6F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="lPNt3Hh5"
Received: by mail-oi1-x241.google.com with SMTP id s184so1640096oie.9
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaAfg4J9H1a+6PM/cyTDTEcsju8fsO+hFEec8mPV3q4=;
 b=lPNt3Hh5r6Muen/3jQIg1dhC6bS4DhCZ5NPCAmLNWvV82Zbc9dwGiIYOuNzZru8u6i
 OTlO5SLOVKkVeU/iqg16h4Ab3vKX3KaFFKtjPAjC8X0t4f7pysCrnQSls9zLQwCWI2TC
 qBGjJISnq6d8BKpzPcZVcsHFRhfreAFrDQZ3vT/oL762NC9HsGarq+HLa/4ClYJCLJwL
 i8cnEB5WBNLNeDIWDjLLBnzRh4c9eWHAL7OoJc/0MWk8QcRuA7+MLUIxpwz4C9kwF82M
 mLpI779/eDHImlIvXUvsJ29/ndErNubjgubCIcs1kc0cKrWUPFKDJZztMo4QyA+YveJr
 7UoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaAfg4J9H1a+6PM/cyTDTEcsju8fsO+hFEec8mPV3q4=;
 b=jAd+yU8RJjH8kdi/IGHw2JJHEx6Oy1lY5Brh1z/PQxb4dRvjg1t4zz1e2zcHXyuAlL
 RnHQ4IdFUfBveLJ/IEwJqObqKq6E6yWjvvsUPYxm00plz7lhQlPMei84GDnJxocx559x
 LM7J/VcO6pK8I7QVj498wYgm+CSCJ1zaEskXQMoGEw1pKHjEwmtkaKW9ZskP9sqjIXs8
 3gC58ftTYXbSZuCIiKBOhmWCbkAWLgtHXJfPmnwTwASIMZiwnQzgfY7tJ1IyKxSj1FS+
 g3Uf9k0lzn2kz4cup5dzuy/qez/YyjEmndNzg1qOUOHsyGZ/Gl4MtVI42SuoyFgy0Am6
 TW1A==
X-Gm-Message-State: APjAAAWtgVq1TnUB+vPJiDOXhPIE1edEBat6yCwJ3vNsJwfOBrcvlT+0
 3aQEkf5QvzdkmzB4ykjbGLNNMquP25v/3n1+9UNPXg==
X-Google-Smtp-Source: APXvYqxc0lUj3zoHP4DKLWKXXlN8D/0Jh8gnsuIKdp44o2Jy7OGaTS+t0GWoDBXlW9CPHDJ7cPJfYrfY88KVdpllVM4=
X-Received: by 2002:aca:544b:: with SMTP id i72mr4119435oib.174.1559919768572; 
 Fri, 07 Jun 2019 08:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190607141821epcas2p120786c8cc5a1f1b71dbd1828b0a9d837@epcas2p1.samsung.com>
 <20190607141745.759-1-s.nawrocki@samsung.com>
In-Reply-To: <20190607141745.759-1-s.nawrocki@samsung.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 7 Jun 2019 23:02:37 +0800
Message-ID: <CA+Px+wUOjG9YvDrPud7TH1xdBVDX50Y9f3mA8hgyFQBVTgM==A@mail.gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, kuninori.morimoto.gx@renesas.com,
 b.zolnierkie@samsung.com, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Fix freeing of incompletely
	initialized snd_soc_dapm_context
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

On Fri, Jun 7, 2019 at 10:18 PM Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
>
> When soc_init_dai_link() call at the beginning of snd_soc_instantiate_card
> function fails soc_cleanup_card_resources() and then snd_soc_dapm_free()
> gets called with an incompletely initialized card->dapm. In particular
> card->dapm.card is NULL and it gets dereferenced in dapm_free_widgets().
> Also dapm->list is invalid and there is an invalid pointer dereference
> from list_del().
>
You don't need to do this.  In my original patch
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-next&id=70fc53734e71ce51f46dfcfd1a1c319e1cfe080c),
soc_cleanup_card_resources() should not be called if
soc_init_dai_link() returns fail.

I found there is a merge conflict.  Kuninori Morimoto removed some
legacy code (i.e. soc_cleanup_platform() -> soc_cleanup_legacy()) at
the same time (https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-next&id=adb76b5b9c4740a11f6ad6c68764515961ae8ade).

But, the conflict was not fixed correctly
(https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-next&id=a8e992342ce4cd173d437d0aa4eecc9e30489f72),
the soc_cleanup_platform() turns to soc_cleanup_card_resources().

Based on current for-next branch, we could simply remove the
soc_cleanup_card_resources() call.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
