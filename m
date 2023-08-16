Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CCD77ECFE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 00:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3994207;
	Thu, 17 Aug 2023 00:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3994207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692224405;
	bh=CCY8LW7AC+cu0J3nrJntXhPoEyBRAlK45dAy+ctIYTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KZIH3FJVjoJJWsVt7nOy69fPJ78OQxZISv75b2hbMs79kmUtiMxY6MbL7P9hSeEeZ
	 k5Gu7PC9O6i3BmdSPa7cOBR6CpiqlWjO8hmAU40+cBHgI2S8kTm9AznTfyliG1Sr/b
	 pWMYI7MVhbfcNN10O5dNDQIFPCh1Jj8ewZwqST9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D1E1F80254; Thu, 17 Aug 2023 00:19:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D79CDF80027;
	Thu, 17 Aug 2023 00:19:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0DBCF8016D; Thu, 17 Aug 2023 00:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76FB1F80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 00:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76FB1F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=tRZSAgCQ
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6884310ee75so2846174b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 16 Aug 2023 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692224343; x=1692829143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybLFVTogZ7Y52PEXhw7lbhkSZOQthoF9kX0dT/I7XrI=;
        b=tRZSAgCQ91uepvVTcBbkrSyXvv+fmWetGZws1toICsM0IFmG22xcdbBvCE3ukqRtSg
         XEzb5zGYVYGdYVqRKf0pmEQ2Kng4EcJwIY6o+Dn1VRleXDhe0ZWx1bKJD84IfJawruP2
         ee/mwQCyzNKRDq8QSyvG5aV+G4B9H3k75A0zPAiGDVV+CmYq+zbxw5wcTS50EROYb7MD
         M4sbRxVg4+H9ELdoMKYGADIo4C1xl4hMFsZ69vsZH5Iykqs2c6KhtImOFsXj8pzq9ayZ
         +9MASjG9Pbcfn8TmIDIGUlHPcj+SnUGyBJYrx38FzA1H529TOWmGmlJq3VSUf/OdYDbj
         atTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692224343; x=1692829143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybLFVTogZ7Y52PEXhw7lbhkSZOQthoF9kX0dT/I7XrI=;
        b=EIi8eqsVbGe16nNNf1PZCSS+X8HuS6WU9/KtZGBOzTo9s6gmQ24aKDoY1lVmesFETB
         TIIE1AuZgRNUnPLL9ALqRKxKA3iKG8TgZix7/LeNNRRWc7xTSmfj6sdJgzGvdUvbqXjz
         KKp+XRw9fCK61+BKU8qD8Rx9mO+QVU5lV6bN31AgnxrciowyOSKM8j+RTXrW0aP+FuNa
         TixBUMepkIA/uVQIYS0L/s6C13m4/vF2aaUXiZ/YlwzCeu9bYUAEqEB0s2FGhEPpB2t6
         SRirhfsGj8rCnLfrSASFZeDFag2LI9u7UcpforKPaKoTYtfq2HAax8k/oEoqudsLLU3W
         Ehog==
X-Gm-Message-State: AOJu0Yz5vF5OXzKjzebEulxdg0y9/Pqs9UpqycxT8v4xd9DThNVEdPsj
	ZcLgwkwkKEoaEnNTdphDeBrwVfFXeXHxICW21nrvUg==
X-Google-Smtp-Source: 
 AGHT+IHVe64HFpzL15x0E5xFl81NuttAgZA8yQ7J9awFLYVjx+sze7AVpEHbGq0TqQJdKU13Pt24dwBdSgBdbk1y/ks=
X-Received: by 2002:a17:90a:6acb:b0:260:d40f:6ade with SMTP id
 b11-20020a17090a6acb00b00260d40f6ademr2822036pjm.15.1692224343356; Wed, 16
 Aug 2023 15:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230816160252.23396-1-tiwai@suse.de>
 <ec4b2bf5-1357-916d-c7e7-644ead01433d@perex.cz>
In-Reply-To: <ec4b2bf5-1357-916d-c7e7-644ead01433d@perex.cz>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 16 Aug 2023 15:18:52 -0700
Message-ID: 
 <CAOReqxiFx=o9zpf5NV6sFjAHKchpHbf_wX_5pSqRiL1su_GHSw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] ALSA: Don't embed struct devices
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NRATKCZQO2VLSE6HCMFLK3ZFBKSJRPZY
X-Message-ID-Hash: NRATKCZQO2VLSE6HCMFLK3ZFBKSJRPZY
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRATKCZQO2VLSE6HCMFLK3ZFBKSJRPZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 16, 2023 at 9:45=E2=80=AFAM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> On 16. 08. 23 18:02, Takashi Iwai wrote:
> > Hi,
> >
> > this is another set of patches to attempt papering over the UAF
> > problems that are seen when the delayed kobject release is enabled, as
> > initially reported by Curtis:
> >    https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey@chro=
mium.org
> >
> > There was a previous patch set with a different approach (using the
> > device refcount dependencies), but this is a sort of step-back to the
> > old way.
> >    https://lore.kernel.org/r/20230807135207.17708-1-tiwai@suse.de
> >
> > After discussions and evaluations, we agreed that decoupling the
> > struct device from each sound component object is the safest (and
> > easiest) way as of now.  For applying the changes more consistently, I
> > introduced a new helper for the struct device allocation and
> > initialization, and applied all components.
> >
> > A couple of more changes for card_dev refcount managed aren't included
> > in this patch set, though.  They might be good to have, but this patch
> > set should suffice for the currently seen UAF problems.
> >
> > For a long-term solution, we may restructure the device management,
> > then the struct devices may be embedded again in each object.  But,
> > it'll need lots of other changes and cleanups, a big TODO.

I agree I think we should apply this as proper fixes will be a big
lift. Thanks for refining them.

> >
> > The latest patches are found in topic/dev-split branch of sound.git
> > tree.
> >
> >
> > Takashi
> >
> > =3D=3D=3D
> >
> > Takashi Iwai (9):
> >    ALSA: core: Introduce snd_device_alloc()
> >    ALSA: control: Don't embed ctl_dev
> >    ALSA: pcm: Don't embed device
> >    ALSA: hwdep: Don't embed device
> >    ALSA: rawmidi: Don't embed device
> >    ALSA: compress: Don't embed device
> >    ALSA: timer: Create device with snd_device_alloc()
> >    ALSA: seq: Create device with snd_device_alloc()
> >    ALSA: core: Drop snd_device_initialize()
>
> For all commits:
>
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>

For all

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Tested-by: Curtis Malainey <cujomalainey@chromium.org>
