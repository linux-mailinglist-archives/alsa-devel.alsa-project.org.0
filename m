Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1D76E9AD
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 15:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB901210;
	Thu,  3 Aug 2023 15:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB901210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691068353;
	bh=skXXTNpONJIhgpJJreenfYixIfgSYXTeNyg82h+LXYM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ico+HJu5Cgdk4RR8yzR9HhVpqHT0z5YlYD8Xzizo48yiSNyhZSHXX9QCSMqzNEqjR
	 a0hX64pM2KjChIrYtxV7DoPvkuVndaD57GWA8cLq93/0PTCMwUbKAwKN96a3sP0G66
	 qrZqH9TDSXUFfsR4VP4rGhKEv+XX3qMSEVEMr42E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46681F801D5; Thu,  3 Aug 2023 15:11:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5165F801D5;
	Thu,  3 Aug 2023 15:11:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18C9BF8025A; Thu,  3 Aug 2023 15:11:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49231F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 15:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49231F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=OgeQqTU3
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-790b080f2a0so30324139f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691068291; x=1691673091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lC0SW0eAGcjrPelcOslL8Ss4E31DBBOJeX5ruPDUDU=;
        b=OgeQqTU3eLsToIFQqpnPIA8g1WCwq6zItGL9mntQIrUxGhjbBitttp4rPonWdcsfxP
         iRu6lmPdnlStCJoOCDCEuv4opy0zlLNTWrDmAEXCgmXENtRx5rA/fBxUCmTnEEXn1s3d
         +b7fpiJVshrK7ErQ0MD+MO4FLFbHFFpyzV69Zs7aLy44fmoU9jTLoK5MvRuK820kS5RG
         J+SRnf5gQSlsbchEYrjWURjn7aZhSZjoQmyVb5mdk1f9ajw0rn3vuOWoAlhOae+REEzD
         zfGk59orqaoBC1o2Oruv8/rVXoVQYP4t+5ttTB6qg7JIglPFNGEO+kjJ6kcvnW4QH0jw
         r2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691068291; x=1691673091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lC0SW0eAGcjrPelcOslL8Ss4E31DBBOJeX5ruPDUDU=;
        b=WgzPmJKPsHv2L7fxE3MOztRPKOjn+qSIPb0VbM86NXg4qaRMxzEJXacfgMI/ARm5rP
         bpiyrauB9t9fYuY4xKrk8i1uZy+mgfpTcbnZVutEY2ChqlWDxUpgmQFxANRLLRtP9ztj
         CusOfK3UBiT5s5cBfmWWl3a9KJ1ltyYKnLtFmDiZ+7+/bsQI7MoTpQ005u8VFPEXx9Bu
         Qk75KqGJx/UHhU9Sv26zzh9Esh9zxyTwBGhT8lzimNZnDw9InWYMhear/6kiTeI5MQzd
         D1M5rhjzYYl1kor63k1EcqmjcNLOBDTajqKa21fR8WaZPi49IzXRB2D9Q1MiBHnwUgQR
         ELDQ==
X-Gm-Message-State: ABy/qLY/uFFRenCyVBM7SsoqEQCtP2QEKVwz/bPXfBZUeFkFyZNA0RNT
	n6yEoF7AgPhPo6A5aITWaYSHfsfQZ/XCeBlJgDk=
X-Google-Smtp-Source: 
 APBJJlEtqzIxYCVUFEvV5fgDCP81fGeD3GZpt6levaG9H4upWh9g5EvLMYrqL4ob+7IT6h4Vjry/EVcjmBnCK9V7HJM=
X-Received: by 2002:a05:6e02:1569:b0:348:c041:abd7 with SMTP id
 k9-20020a056e02156900b00348c041abd7mr15797226ilu.13.1691068290064; Thu, 03
 Aug 2023 06:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
 <87il9xoddo.wl-tiwai@suse.de>
 <CAA+D8AOVEpGxO0YNeS1p+Ym86k6VP-CNQB3JmbeT7mPKg0R99A@mail.gmail.com>
 <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
In-Reply-To: <844ef9b6-d5e2-46a9-b7a5-7ee86a2e449c@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Aug 2023 21:11:16 +0800
Message-ID: 
 <CAA+D8AOnsx+7t3MrWm42waxtetL07nbKURLsh1hBx39LUDm+Zg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org,
	m.szyprowski@samsung.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7IVZGQZFYQ2WOU535Q5M6632TYBXPZGK
X-Message-ID-Hash: 7IVZGQZFYQ2WOU535Q5M6632TYBXPZGK
X-MailFrom: shengjiu.wang@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IVZGQZFYQ2WOU535Q5M6632TYBXPZGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 3, 2023 at 1:28=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Aug 02, 2023 at 10:41:43PM +0800, Shengjiu Wang wrote:
>
> > Currently the ASRC in ALSA is to connect to another I2S device as
> > a sound card.  But we'd like to the ASRC can be used by user space dire=
ctly
> > that user space application can get the output after conversion from AS=
RC.
>
> That sort of use case would be handled via DPCM at the minute, though
> persuading it to connect two front ends together might be fun (which is
> the sort of reason why we want to push digital information down into
> DAPM and make everything a component).

Thanks.

ASRC M2M case needs to run as fast as possible, no sync clock control.
If use sound card to handle ASRC M2M case,  the user application
should be aplay/arecord, then we need to consider xrun issue, buffer
may timeout, sync between aplay and arecord,  these should't be
considered by pure memory to memory operation.

DPCM may achitect all the audio things in components and sound
card,  it is good. but for the M2M case, it is complcated. not sure
it is doable.

best regards
wang shengjiu
