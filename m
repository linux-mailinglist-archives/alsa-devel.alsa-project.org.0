Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486676F5067
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7526A13DC;
	Wed,  3 May 2023 08:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7526A13DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096808;
	bh=3NYwDNlVM38PNhi3rHJukoiDrX1975QXxtjMJh6hnqI=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hg+ZzK+MAsHHHNqHiqdUC1aw48nfFcg9xT/vUOAubgtLY6GDaFUFxCwYSPJq8nGWW
	 UXiMIBrY11nivgPW8W3Nz5EdRPj1AwVEtmQuTogQUDEwa0Gc0ej5GPFdcjFp9Mwml7
	 GyLbshAWNb+D5/dcNIZNNW69EILlyJsLUweTrdPc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5309CF80557;
	Wed,  3 May 2023 08:51:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2240CF8049E; Mon,  1 May 2023 15:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEB22F80087
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 15:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEB22F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=igYd+zxs
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-44e9f304247so604264e0c.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682946532; x=1685538532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NYwDNlVM38PNhi3rHJukoiDrX1975QXxtjMJh6hnqI=;
        b=igYd+zxsDMC2pbUwaH1pDL/17El8SJgJz5Y1isRIhjL3J6yPK3BaflkxoUT2MMmsFI
         1WPUiOtaHwxL7u7o8Bt7vwZZjObRZGZL3XZP0//Kd0pjQae6lRhxhTdxac3lAFfHCQRL
         Xm124kW3xTawS+cnKPq2KR5HTXDdrOa+brw4K1EOgSwzuBAdDPu8aZX6sXfM73cpYQXe
         WFk5feuWxnRymiC9ZEBfkH/YuUk6cQyivJghvTWOnabuK477T778iUamf1oV97En/UU+
         1GHcoUyhpwzcIjAyBGXFcNXFuG+4BjeckMao1sbPQix2+4T1VCFY3CTrscH0oyEu89MW
         ifCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682946532; x=1685538532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NYwDNlVM38PNhi3rHJukoiDrX1975QXxtjMJh6hnqI=;
        b=da8lRC0ubeQMOupCqQ4CAurepgk+n4G1ndqBaRJKGU6hprC9ZEv0BTqxWdJSkPdyi/
         gbzRRYh9lOB3D8FqooSDOqqIFCs3E8sW6Ld7aBpqrHF5zfAwK72t+kKkgO20CFsX2rCx
         ChHqNf0bHp8YoD2HQjzLr7EEFfaOaRlju7vguVorNHZKfCQvqeoeZASWpOp5krgWHWo3
         bGYdDs75Y72m9BmH8DCWx8OUwew2bqwOkIKG7K2FMbretcdJNO3hiw78I7rulWli7vR/
         c4YQUVPlulOeItw0/LkexiCMEeHSrxvZLeJixAN1LaLK3iVSiEpEcasIyy5BihVNAfgX
         eRYw==
X-Gm-Message-State: AC+VfDyX+a0rJYBlNbZDlHcKqklPA0kxz2w9eAzJlyfrGG7Qrg2y3C0V
	JbQDJM/tMBWynWYdfpervu3fE7doetEvZpgXSVU=
X-Google-Smtp-Source: 
 ACHHUZ7RW1jtGkDqZVkU9kZMJFBhSI9gSf13aBqrcgKZJhCwwsRQKbtUClZoXLWHjHFT3DZFKPe8IFWhIFEEMDveLgk=
X-Received: by 2002:a1f:3d43:0:b0:440:39a5:6c6b with SMTP id
 k64-20020a1f3d43000000b0044039a56c6bmr5041041vka.8.1682946532092; Mon, 01 May
 2023 06:08:52 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me>
In-Reply-To: <ZE9B4avbDtIXOu4O@debian.me>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Mon, 1 May 2023 21:08:41 +0800
Message-ID: 
 <CAAJw_Zt2G8RLG_+ak3c34v-PCsc2A235qQxa74EUa5ObzRmCsg@mail.gmail.com>
Subject: Re: linux-6.4 alsa sound broken
To: Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: jeff.chua.linux@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QZCL4DOXDPULOXITPITQAN5TE7AL6TMC
X-Message-ID-Hash: QZCL4DOXDPULOXITPITQAN5TE7AL6TMC
X-Mailman-Approved-At: Wed, 03 May 2023 06:51:20 +0000
CC: lkml <linux-kernel@vger.kernel.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>, Takashi Iwai <tiwai@suse.de>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Regressions <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZCL4DOXDPULOXITPITQAN5TE7AL6TMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 1, 2023 at 12:36=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Mon, May 01, 2023 at 11:59:12AM +0800, Jeff Chua wrote:
> > Latest git pull from Linus's tree ... playing a simple sound file will
> > resulted in a lot of echo.
> >
> > Running on Lenovo X1 with ..
> > 00:1f.3 Audio device: Intel Corporation Alder Lake PCH-P High
> > Definition Audio Controller (rev 01)
> >
> > I've bisected and reverted the following patch fixed the problem.
> >
> > commit 9f656705c5faa18afb26d922cfc64f9fd103c38d
>
> Thanks for the regression report. However, where is your dmesg and/or ALS=
A log
> when the regression occurs? What is the playback test file?

There's no error in dmesg.

Test file is /usr/share/sounds/alsa/Side_Right.wav

>
> FYI, 9f656705c5faa1 ("ALSA: pcm: rewrite snd_pcm_playback_silence()") is
> originated as [1/2] of patch series that pokes around the auto-silencer. =
The
> other patch ([2/2]) got NAKed since autofilling buffer should have been d=
one in
> alsa-lib (still to be discussed) [1].
>
> Anyway, I'm adding this to regzbot:
>
> #regzbot ^introduced 9f656705c5faa1
> #regzbot title Much echoing when playing sound files on Intel Alder Lake =
PCH-P Audio Controller
>
> Thanks.
>
> [1]: https://lore.kernel.org/all/bb342e84-b468-8adc-6688-88da2c857da1@per=
ex.cz/
>
> --
> An old man doll... just what I always wanted! - Clara
