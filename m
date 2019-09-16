Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D2B4322
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:32:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E73E0167D;
	Mon, 16 Sep 2019 23:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E73E0167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568669553;
	bh=pRMJzj+Skt8z6QSC8knk711FyQsq1mZM5InL/Ra0zeM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqVq9fQmYyVLmgmellxJSF3xa7N/Kc0OecowNBT5cN+qjUhsDQnmycTRzUp+n1yPY
	 IyXlObzpHunpQDlPJuUbTndB+UzQFi2f1h5zTlzdKQ6tJRWxl2n5x5S4HMIukrsoag
	 QQoqRZqfsydRvZfEpHw96OsweYA3HWPc0B2/Zdn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D893F801DA;
	Mon, 16 Sep 2019 23:29:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D7C3F80506; Mon, 16 Sep 2019 23:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2183FF80148
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 23:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2183FF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="pyaEpRc6"
Received: by mail-qk1-x743.google.com with SMTP id x134so1622850qkb.0
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 14:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iq9EtsJWfH9qNtiOP6lwKiZtRwNS9gKp25aXdfHahLo=;
 b=pyaEpRc605j+NjNY2dvWrV5gM9Tg/6jchoWX0sxmW+QecEzRfXvDxJKOzynBSdrB1B
 Jv3ZOtWVUwKE8ojIVp5hr/Mc6RrSdaISdTz6sip07nz3ztfuNyko8wrZoLp68iGXe2zr
 tKFg749zy60gFMBoH9G/O/XqifFWKNvbdo2vyU80vvvgq5AUUP6dXoAdDlA017Kaqlw7
 Igckl8ULz+UwdlOxmhXov2vzLmdxTitSj67CpQ6cj8cps9+jlHdMFrQQLu+O5CGZqiJX
 f5umVwqx79lp8dkSdWbYNP21TC0+XrtK8BOKVdsKzIkRu9CpcYe2PxnrPXg4eZMNv8tG
 GlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iq9EtsJWfH9qNtiOP6lwKiZtRwNS9gKp25aXdfHahLo=;
 b=ZWrzx0DfdksDCM+iuoDy7xipK9o+UN6oAtcaGPRuvr14MBf9YQrw9WEjmF484NXPsM
 a/XFif+YHPG589glQZ9PX02pd0ljQuuTAdCWBLi1W39ytJUs2b43KSFOB0ALAjayZxLn
 cd8ek4ASYl25eM6OeNRK8iFVOY11fft2t0ETj0LjRFaGjvNNlec+/smISGee2CUOfSNz
 ulH8gJLcANWUm8wOj6ZUbrUSkd75wrw4V8bX/8aYWOd1+vmgLOc9HkFzeHZbxolhKZrn
 cLzukG3IUEeISFcAxb9L9bqoriS0CLwxNeFonlu2cBna/FNCRaBFGYgHgJHMHHfny8Ne
 R2rQ==
X-Gm-Message-State: APjAAAVLHM6VmQruO6AWBWya6AeEZDQT/M4c+8e3ibKdaPAP0AhyWFVA
 9QowwdHwb/R3oMGMi2sO5tpE7i1wIeAYFO7LA10ymA==
X-Google-Smtp-Source: APXvYqyR6XYQHZF5P0H44bTgameB53h1J4bEwog4kd0F9wsPO8IIzJPMdOQAMVnyVGsXr2sos7gxYO0r12VhgeFY8ss=
X-Received: by 2002:a37:a106:: with SMTP id k6mr432485qke.158.1568669383797;
 Mon, 16 Sep 2019 14:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190906194636.217881-1-cujomalainey@chromium.org>
 <20190906194636.217881-6-cujomalainey@chromium.org>
 <20190911102503.GV2036@sirena.org.uk>
 <CAOReqxhjf0YeUhCF9N8YOReZC11k01R+TR7N6J51fZV6YXBc4g@mail.gmail.com>
 <20190912092600.GF2036@sirena.org.uk>
In-Reply-To: <20190912092600.GF2036@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 16 Sep 2019 14:29:32 -0700
Message-ID: <CAOReqxi+tGx3wSjOLE0cdwpVMhqF8Aj0_PW=s_8JMd_Puws5CQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC 05/15] ASoC: rt5677: Auto enable/disable DSP
	for hotwording
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

On Thu, Sep 12, 2019 at 2:26 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Sep 11, 2019 at 01:22:20PM -0700, Curtis Malainey wrote:
>
> > The source of the switch is commit af48f1d08a547 ("ASoC: rt5677:
> > Support DSP function for VAD application") and does not explain the
> > original intent of the switch. I believe the original intent of this
> > commit is to keep the switch in sync with the VAD state. I do not
> > believe we use the switch ourselves.
>
> Well, I would assume that the control is used to allow users to
> enable and disable the VAD functionality at runtime.  As with the
> routing if it's been exposed to users we should continue to let
> them control it.

I will work to add variable inputs, in the samus use case it doesn't
make much sense to use the hotword without the pcm open since that
audio needs to be captured. How would userspace received the detection
without the pcm open?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
