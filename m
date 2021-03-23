Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9138346B3E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 22:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9E31672;
	Tue, 23 Mar 2021 22:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9E31672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616535664;
	bh=XL/v0Px2Wk94O/3D1JI2t7DTsUuLnEmAPYIR1ZSWHf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mVEu9ibaZ0sNVwg7ZxCT4GwFAzI0GrWDMxYGLjqSo707L4Wy91eKDyLEXmQFCa5G0
	 oBngF5grcadFGBqD0ah3O04jPT9COWjn1PNPwNLqvOzV6eGpHhiaIaKNUDcYAExl+b
	 HD3Greq5YXYXvurYyC/6BKKwlZthqj3jZgzwCG4I=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81AC7F800EE;
	Tue, 23 Mar 2021 22:39:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E12A0F8025F; Tue, 23 Mar 2021 22:39:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D8FF80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 22:39:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D8FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="OVPlrxA8"
Received: by mail-qk1-x735.google.com with SMTP id i9so16023102qka.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 14:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOL5XkMPNo9TsQxLkYS4SVJzILn/JSQkph0vOgzse9Q=;
 b=OVPlrxA8OlZ7WYCRq93ir720QzY4+q1xDwTUDNpVVHcRzYYlFn1rX7zMwST5jXENqP
 IkKUcMCjAxj6F1HBpbE8AQ9FNmbXQ2Y7XQ55nLe+LLzLK8R2bAILQV70pUk0rKflj23c
 eoLza16RnLP0aUw1uAjwJ02pFO+I40zH0ZkZWbHfVa5yl1kEP228gPtgMFk2+j7EgjAh
 cerCVb9ux/gnhjPKQll+Rbsg8+tGSzV8npOXcLfCdAAvRChdufX0tkIQ8cGeUhpyDWD4
 wpI28nPuPwOCVrzI5opaaBA6NvNlAL6ibChP2zuRUiuNqFfEsQ/XkJIN0I4pzTYo2kDx
 0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOL5XkMPNo9TsQxLkYS4SVJzILn/JSQkph0vOgzse9Q=;
 b=TzMRmjgwFL0FborFIzYOmxVJuMf/+izZ03pwWEqs3CUNYo3AvYQ6caT6LiD4kV0HEH
 YDHzh+Nl7eNomRzNGiPFghqtk36U2mN5XwOU5JXJ6+8WZLO0Ne7YvC4J+xTdr6mziV/n
 p7INUC9k91DR7a66yY6y4A6e5t1yNaK4u4yUAaX9wPkY1YG4u5Z58TRR3dL3um0CuHwh
 Bu8PKYgT3vX4YgGASAmMKn4SJAoCw1GtEVayy2dnD34IQ7XYhhbQAymvkyMHQCzheAaZ
 lbArnaB51k7q1GK/7Sc2e7zfcIsLSo5J2U+XHxcvBwmjinWBvaTdbhKlh2PLR8IRgWCy
 wg7g==
X-Gm-Message-State: AOAM530qCpWMkxsWQfXK1GHWwakxCD3Z4dV2XihcZUeo8XfbKno3BRJ0
 87jXo0IoFlG/VPW8li0j9gE+wpQKDkfw5N3sTMS4SQ==
X-Google-Smtp-Source: ABdhPJwP9I59KXMHiXpFN8anLa8J1OiYIN/2g1Urgp77VWqxMMgG8b+gIZRRv8U7MvsvVATl9Id+tJPrpaLfNyRf1mU=
X-Received: by 2002:a05:620a:c8d:: with SMTP id
 q13mr117909qki.238.1616535556062; 
 Tue, 23 Mar 2021 14:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <s5h5z1nf47r.wl-tiwai@suse.de>
 <3820909c-29ce-9f3f-d1e6-c4611e06abe4@redhat.com>
 <s5h35wqff1m.wl-tiwai@suse.de>
 <a2018c94-8731-de29-e447-92457176a1b4@redhat.com>
 <s5hy2eidul2.wl-tiwai@suse.de>
 <a9a62884-da5b-ef2a-10ec-e414e6784677@perex.cz>
In-Reply-To: <a9a62884-da5b-ef2a-10ec-e414e6784677@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 23 Mar 2021 14:39:04 -0700
Message-ID: <CAOReqxh-ztd-FWvhoipUbkhzfhZCyH5KY8v1VwjswNFH7OnARg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 ALSA development <alsa-devel@alsa-project.org>
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

On Mon, Mar 22, 2021 at 7:16 AM Jaroslav Kysela <perex@perex.cz> wrote:

> Dne 20. 03. 21 v 10:48 Takashi Iwai napsal(a):
>
> >> With other OS you mean e.g. Android?  Android has device-specific
> >> init-scripts which can either call alsactl or directly do the
> >> echo-s.
> >
> > Also ChromeOS.  I'd like to get a general consensus before moving
> > forward.
>
> Where are ChromeOS people? They could join to the discussion which is
> floating
> few months now. Perhaps, the gmail's spam filter does not allow them to
> communicate with us ;-)
>
> Hi Sorry, i missed this was directly to dgreid and me. Will try to get up
to speed on this.

Curtis

>                                                 Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
