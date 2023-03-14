Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D222F6B98AA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 16:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C656013A3;
	Tue, 14 Mar 2023 16:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C656013A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678806773;
	bh=r/gwDxIInUIGnJKMKV2lOBvy0u/2mPyd7nLcp+8UB8k=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RhZWxW/e61wB1t5w6l84K9J1qckMiDiV95BHap3/Xdt4RL7XmNsE1pMCn7QhOKfUI
	 m/aki71GYltBFO2qLYRIB2m9Dmhbh2DI6r7TWR1uC6RdFrrp68awt2CXCYnfbLsh9O
	 s2Nxk2jKmjay0rivNqiXzCQ7V9ZWV60XHNF3AHoE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B9EF8032D;
	Tue, 14 Mar 2023 16:12:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69A22F80423; Tue, 14 Mar 2023 16:11:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20CCBF800C9
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 16:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20CCBF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pNScj/9x
Received: by mail-ed1-x52d.google.com with SMTP id x3so63325740edb.10
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Mar 2023 08:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678806713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXRuEhAXUl4JYoPlY2aYTf9ibMIQc5U/+fDAPdswy5c=;
        b=pNScj/9xG7xyDpWMduo+rT2N7IPwtxIbqSLcvUVxhxzSqGoziGnGyfnjjdQAhSeIuN
         EDeK6tyUBTEhUbnruxt8eb7fOJGt09SWdUuL10+ogAeN5GrxGFumkP5vKhJMgFXfsRqS
         QOgTK+LcVMdga0xCmpKntyTh4XHP1Hen5Kd+ML0bGeRrmg2KQJFXFqMArK1qKT3cpS4f
         zdvyaZ3+nxPUE83o8MBkvVm5VKbWZFkjXUH2pNnAWYuw2tsA5KQUs510DpVAVvRwoH0J
         T59oRHojlJ1ikrHtPn3qAOcP8ijiEhrcKUvnWD3XFzJfPkb2Wwyq/iE5ghplxL3MvrqX
         VVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678806713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXRuEhAXUl4JYoPlY2aYTf9ibMIQc5U/+fDAPdswy5c=;
        b=aJCKv3oLXwLTM+Qc8uU0GtMnqeKf1HrmvLhw2Nnqw+5e8MHUwXIBn4UTOU35yAcOvD
         0kaFUwefcuirCdDRiKnrdomSKRjtMix6Q/5Oe4dd2OW7Kt/Xy5/+WseQ1X8e0ySQRYER
         SA1Wq7GpKxzhhxjjwKVLJwUmFoFHmCniK9FalGamIxSSMohPBZl4S94U/wcM+pAyIv9u
         MPmJY5hD1UXOrWEu+fGnpkpt/JbD9vue4yhx1hy0ql5QAVY4BlfPv05nO695MEFy0eTZ
         ojIaDKUnvyumHjYhP7JYl97OVlT/53R7/wi0F2XWB1KGEqL+Ac9q7wQht2aNFmz+TwoL
         2zmA==
X-Gm-Message-State: AO0yUKV4Q6hunLOwsJgfYOKyD3BycsioeVtFfn8Xb4zExldvfYsD6ZPd
	4o+++zNHsHbdwrEeHMmpkGdoChvytH6lWHKICDo=
X-Google-Smtp-Source: 
 AK7set8nMo3Q2g9uu4RE39ZBBoxGTqi6XDEOXs+ecJgseuyYdQIrqaoHvrmwc+o8hlAYqkyka1Ftzijuuqfr/Lhlnuc=
X-Received: by 2002:a17:906:198c:b0:8b2:94c1:9e8f with SMTP id
 g12-20020a170906198c00b008b294c19e8fmr1410395ejd.12.1678806712949; Tue, 14
 Mar 2023 08:11:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAEnQRZBoo+v9JRztP_on7c_C_Laei5w8XAdZ7zaHxmGYAaKSeA@mail.gmail.com>
 <d06bf4b3-9dd2-eba3-4880-6de0bfea1048@linux.intel.com>
In-Reply-To: <d06bf4b3-9dd2-eba3-4880-6de0bfea1048@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 14 Mar 2023 17:11:41 +0200
Message-ID: 
 <CAEnQRZC3Mbg8A5T_ytizNtg2wtB3_zbjwqeU8Gq1H_wo-qW8LQ@mail.gmail.com>
Subject: Re: dpcm_be_connect: FE is atomic but BE is nonatomic,
 invalid configuration
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NKMBFZGZ35LWVLZ5SZ3J47YIX2GNICOB
X-Message-ID-Hash: NKMBFZGZ35LWVLZ5SZ3J47YIX2GNICOB
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, Paul Olaru <paul.olaru@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKMBFZGZ35LWVLZ5SZ3J47YIX2GNICOB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 13, 2023 at 6:36=E2=80=AFPM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 3/13/23 10:10, Daniel Baluta wrote:
> > Hi Morimoto-san,
> >
> > I would like to know your take on the following issue.
> >
> > On I.MX with SOF we use simple-card and hit the following error:
> >
> >   sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE is nonatomic,
> > invalid configuration
> >
> > and I think it makes sense to have the BE nonatomic as set by SOF core.
>
> The SOF core does not change the BE, does it?

You are right on this. I think the problem is with the FE PCM in case
of Compress
stream, when the atomicity is not inherited from DAI link.

Which happens for uncompress stream.

Will send a patch!

thanks,
Daniel.
