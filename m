Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7735F770332
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 16:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF83B829;
	Fri,  4 Aug 2023 16:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF83B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691159787;
	bh=CXyuzaTJsPS/0dlOysVNSshlLivC8bZRP0IFgxjRqxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ruH6bQAmLxOOsCp7T0pmax0ty+BP+mr4Lc22C5G0BuSxRK13NCDyYcIgE0cBVXu/A
	 v8MEdyP1b/76eqhco5RcuX542uQM8YwzTqjR3f2Nf85NZnnIvdjLJ5noNrUrJy3eQK
	 kjWObFRU4u0juRTRRK1V4gyNV6u5shCWR7p5urp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F27C5F80544; Fri,  4 Aug 2023 16:35:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE34FF80548;
	Fri,  4 Aug 2023 16:35:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DC4AF80551; Fri,  4 Aug 2023 16:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A541F80535
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 16:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A541F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=LcPVQZ5w
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6bc93523162so1845368a34.2
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159706; x=1691764506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr9Z/PzI9HVfpGi0e0FdNup5FU2IUBX9onswlfSPsGE=;
        b=LcPVQZ5wE7siq5FW59qb8nWpO4V01CM+9kF86z0Fy+12gp1eQiDGBDAV8kWpbYWpw9
         GoQO4B3wxgCFGfjlX7orV/syY1p+ELJHKbNc9tv8dv+e/sUaHZ5j24U4s42L71mLx+u9
         K0E7pLtUlI2jSu6CDqA9IHQ4NzLhxgh+Rm5N2pdFO8zpWOBH1s8X/VIGq8yGMn/OmKuE
         62+aop1XSDOpDAkArDCDuvT7zs1BUM/ff48djWJRyViwfsjGSA5HwoyEn23YYi7isc11
         kTRjG1G+u9ON6hwaX61oRdvs1WSI4IVwfq3ulQQYLI0mY2wH8SyoBaFR6YjJwXtLUI8z
         sE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159706; x=1691764506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr9Z/PzI9HVfpGi0e0FdNup5FU2IUBX9onswlfSPsGE=;
        b=KUsYoZbq/j29v9FeEHeCgwZIR/D6G2pLG7Tps7b0QfGOpEKBqvKGnYUdZ/JhDH9A0r
         DrEF/Vz3g5Y3ToNB4MIlGPjtz2qfw7biX9ol481HAAOgzMwesP+7Ed4KSZkvTdXFwWQ1
         tqpCR3Bb3phPVoWVQF1rDH7g+dTzhXzZm7u/In0jtYGjCHvXbtVS8n1WdzFJr0XzjLz5
         DgeExJt7V3tITroWdUXbZhchFJXX2vrWs8ewAPYYBAefx33v7VLDY1ZbbQfPrrPzr9Na
         xluRTILoZxcTFwJVWySTv2Yv4FXG9viNpDuE4cjOk9I12FdTC11K3rYZWLs0bxHClks9
         S3ag==
X-Gm-Message-State: AOJu0Yx2+zR8/fEFPPY4aASWObNvVItYEPKKfV876vl2LhVfRx6dhV/O
	kr/aPMdhpVu+nT2PzAcbg60/NTNUZT0yi+20vFU=
X-Google-Smtp-Source: 
 AGHT+IGV/8VJRNkNUBR9cFO9XXj7z8mINitdGs2OMD7YER7W6k+Fk1Q6l7uil2aiz+tXMY4mhSjqisJkCHKVv1y1DgE=
X-Received: by 2002:a05:6870:5607:b0:1bb:b13c:7f9c with SMTP id
 m7-20020a056870560700b001bbb13c7f9cmr2034071oao.57.1691159705998; Fri, 04 Aug
 2023 07:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
 <873536js7q.wl-tiwai@suse.de>
 <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
 <2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
 <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
 <485f99149508488080d563144454040e@realtek.com>
 <CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
 <2831c55638a5431ca9e37d9caf365ed2@realtek.com>
 <CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
 <3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
 <CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
 <009474f04d0b45c69a0e42e8622b7a86@realtek.com> <87h6rhcef2.wl-tiwai@suse.de>
 <0990300d759846d890de9c92fcad9a9d@realtek.com>
 <CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
 <878rctcavz.wl-tiwai@suse.de> <874jnhc9u4.wl-tiwai@suse.de>
 <CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
 <875y7vbxpg.wl-tiwai@suse.de>
 <CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
 <87wn0aa1s4.wl-tiwai@suse.de>
 <CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
 <87leg7x4h7.wl-tiwai@suse.de> <f4969213b5a14cc5a11befb4df861481@realtek.com>
 <87cz182hfk.wl-tiwai@suse.de> <4678992299664babac4403d9978e7ba7@realtek.com>
 <CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
 <1f83caa215ad4374aec8859c70044b00@realtek.com> <878rbjdofa.wl-tiwai@suse.de>
 <87o7jshxch.wl-tiwai@suse.de>
In-Reply-To: <87o7jshxch.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Fri, 4 Aug 2023 10:34:49 -0400
Message-ID: 
 <CABpewhEG9ViuoCwZHmTN0Up-3jwZ1M-jfC+dAqo0zhqLOZtQ6g@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang <kailang@realtek.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CDQIT4VP3FLBNREG255SHIYSHRMJUAH3
X-Message-ID-Hash: CDQIT4VP3FLBNREG255SHIYSHRMJUAH3
X-MailFrom: josephcsible@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDQIT4VP3FLBNREG255SHIYSHRMJUAH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 12:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> ... and now we receive a regression report due to this change :-<
>   https://bugzilla.kernel.org/show_bug.cgi?id=3D217732
>
> I believe the problem is that the patch disabled the 3kpull-low
> behavior too much while some codecs still need it.
>
> The patch changes like:
>
> @@ -3638,8 +3640,7 @@ static void alc256_shutup(struct hda_codec *codec)
>         /* If disable 3k pulldown control for alc257, the Mic detection w=
ill not work correctly
>          * when booting with headset plugged. So skip setting it for the =
codec alc257
>          */
> -       if (codec->core.vendor_id !=3D 0x10ec0236 &&
> -           codec->core.vendor_id !=3D 0x10ec0257)
> +       if (spec->en_3kpull_low)
>                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
>
>         if (!spec->no_shutup_pins)
>
> ... while the only place setting spec->en_3kpull_low is:
>
> @@ -10682,6 +10683,8 @@ static int patch_alc269(struct hda_codec *codec)
>                 spec->shutup =3D alc256_shutup;
>                 spec->init_hook =3D alc256_init;
>                 spec->gen.mixer_nid =3D 0; /* ALC256 does not have any lo=
opback mixer path */
> +               if (codec->bus->pci->vendor =3D=3D PCI_VENDOR_ID_AMD)
> +                       spec->en_3kpull_low =3D true;
>                 break;
>         case 0x10ec0257:
>                 spec->codec_variant =3D ALC269_TYPE_ALC257;
>
> Since spec->3n_3kpull_low is false as default, it means that, except
> for ALC230/236/256 and PCI vendor AMD, the flag is never set, hence
> it's no longer called.
>
> Shouldn't spec->en_3kpull_low be enabled rather as default?  Or which
> models can set it?

In both my original bug and this new bug, the problem was that we're
not calling it when we should be. Given that, wouldn't a simple fix be
to call it if either the old condition or the new condition is true?
E.g., something like this:

if ((codec->core.vendor_id !=3D 0x10ec0236 && codec->core.vendor_id !=3D
0x10ec0257) || spec->en_3kpull_low)

Joseph C. Sible
