Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1737F3026
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 15:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EDE8DEF;
	Tue, 21 Nov 2023 15:03:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EDE8DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700575421;
	bh=076XLaGHctr4AHjATC8e5T6y2t2kocB2KdlQ8WYgjnk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VcM2re+3o3IIdNeJn2uf8jFrdiTE69UEUrcTc1uPQO9NBgvZQcnHRZAE7DV8sOfzx
	 nIXN2VKLjiJw6z2Nz88+g23SDKaAlX+Fq6yyzmjgeFgdQZU6GtvGO3GuB6PG+ys8WQ
	 I6Dops+bD4Aji006i5v3yHBQ0mt/zcOoxFstRG/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC5AEF80564; Tue, 21 Nov 2023 15:03:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 260A8F8055A;
	Tue, 21 Nov 2023 15:03:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17EC8F802E8; Tue, 21 Nov 2023 15:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0546CF80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 15:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0546CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QVBT/new
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5437d60fb7aso8118627a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Nov 2023 06:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700575376; x=1701180176;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Okt0Vk7fLF6tTfkiXuwS51yIO92AetNhg7I/Fs4g5s=;
        b=QVBT/newvEArdU6Sg5djApigeeyS9jRvrEXsyDfYZYvNFL7YqvHlkSYaJ39PxNF+j+
         Emy1O8UWRw9OdPPrz6A99pJPHtBcNJpvhSg7f2wwvn7RX0whGutJrX7ZELQOe2iwBIK6
         v0jVC6RKlKxrQH52xLt+oY6MVXfqQfnef+jzN0JiZkat20aiWN5MB10QGHLpJIsBR8pl
         6y/WZZWeiLMzcX083bhycl1hNXMRdw36ZctQWO6vnMaqW+Ije4LdwrylvnO+PcQR3uy+
         tnR20ox1iXGli3TGK9LVRO58XU6Xngr9noXiVyGSy36rmAUzgoDn8iyv70aJFk3daD4/
         BeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700575376; x=1701180176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Okt0Vk7fLF6tTfkiXuwS51yIO92AetNhg7I/Fs4g5s=;
        b=SI/2eIxldN3coKrOp9MuZT5pKfHOXnTqhzvmNunTYc1e+N8LSaC115iyPFW5HL5fWa
         hKYmyJZjv0XgxZ4M3xXkJHo9ojRDR+vFu5WUXvrtR+LjxOgoKE96IlIOCnUXl4bXETHl
         5WKRjqoak7LPlxe9cfGm/hnPfdTQ5fK4+y+grA396p6JXyc5+LG5terzBtVDLoRGbTl4
         lt3lSRP7jFOtsRelM+P3d7VZavmukLlY/ROUWykvwv5raTGAN9R5VCPTAvY/qlU2ZC5L
         +9wYlikTS+KRTCT4W1X1z1Caff+URS1pRRijGf98oy/7l1Z/SVvOzhH+55Em+kYLinfT
         cuDg==
X-Gm-Message-State: AOJu0YxKrUbveimCuo0X3o91Gioi3MoQIR95mYe+UnVUl/1EshgwH7u0
	4+9JnlQY5Vxx1XPqiJIud1WlPRRbAi7AH1/Q4ew=
X-Google-Smtp-Source: 
 AGHT+IEzLuupufRrOkNgN2ws6o5MMFZCEg2Qwce2Gcw9cxG7jatiU0cWqzY9M+OaDjl4qFC7NDP8LqLiVwpcn/S+8L0=
X-Received: by 2002:a17:907:5095:b0:a00:8706:c82e with SMTP id
 fv21-20020a170907509500b00a008706c82emr3109200ejc.18.1700575375887; Tue, 21
 Nov 2023 06:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20231117163900.766996-1-daniel.baluta@oss.nxp.com>
 <874jhh2g8s.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBb0ZJk7aTaji-xH2jEs7QiTaoXTuS5_K-ruSaxpEnWdw@mail.gmail.com>
 <TYCPR01MB109142FEC8F77CFFE3930456CD4B4A@TYCPR01MB10914.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TYCPR01MB109142FEC8F77CFFE3930456CD4B4A@TYCPR01MB10914.jpnprd01.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 21 Nov 2023 16:02:43 +0200
Message-ID: 
 <CAEnQRZD8zbgRzBrx+iHTbDqG5tOedNLyJByNNtSHTRtxFsgyGw@mail.gmail.com>
Subject: Re: [RFC PATCH] ASoC: simple-card: Use dai_id from node description
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iuliana.prodan@nxp.com" <iuliana.prodan@nxp.com>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: K4QBV3M7TJQRJ5ART66WD67RJ4WYIL2R
X-Message-ID-Hash: K4QBV3M7TJQRJ5ART66WD67RJ4WYIL2R
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4QBV3M7TJQRJ5ART66WD67RJ4WYIL2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Nov 21, 2023 at 1:04=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Hi Daniel, Mark
>
> > > > -     args.args_count =3D (of_graph_get_endpoint_count(node) > 1);
> > > > +     args.args_count =3D (of_graph_get_endpoint_count(node) >=3D 1=
);
> > >
> > > If my understanding was correct, for example you want to use 2nd DAI
> > > but your DT has only 1 port (thus, it is using reg property) ?
> >
> > Yes.
>
> But hmm... in your case, you need to setup 2ports, and use 2nd port
> is assumed approach.
> Why you don't setup full port ? Do you have some reason ??

I'm not sure I understand what is a full port setup. But let me
describe my scenario so that we have a common ground.

I want to use audio-graph-card2 machine driver to setup Sound Open
Firrmware cards.

Here we start with a normal link with the following components:

Component 0 (DAI) : 3b6e8000.dsp (See sound/soc/sof/core.c: 280)
                                  -> for imx8m this has 3 statically
defined DAIs
See sound/soc/sof/imx/imx8m.c:

static struct snd_soc_dai_driver imx8m_dai[] =3D {
{     // DAI with index 0
=C2=BB       .name =3D "sai1",
},
{      // DAI with index 1
=C2=BB       .name =3D "sai3",
},
{ /   // DAI with index 2
=C2=BB       .name =3D "micfil",
},
};

Component 1 (Codec): wm8960-hifi
                                    -> with 1 DAI

static struct snd_soc_dai_driver wm8960_dai =3D {
=C2=BB       .name =3D "wm8960-hifi",
};

Now, I want to write a DTS description where my DAI link uses
Component 0 (CPU) (with its DAI index 1) connected with Component 1
(codec) (with its DAI index 0).

So, for this I use the following dts snippet:

sof-sound-wm8960 {
=C2=BB       =C2=BB       compatible =3D "audio-graph-card2";
=C2=BB       =C2=BB       links =3D <&cpu>;
}

dsp: dsp@3b6e8000 {
    cpu: port@1 {
=C2=BB       =C2=BB       reg =3D <1>;
=C2=BB       =C2=BB       cpu_ep: endpoint { remote-endpoint =3D <&codec_ep=
>; };
=C2=BB       };
}

wm8960 {

=C2=BB       port {
=C2=BB       =C2=BB       codec_ep: endpoint { remote-endpoint =3D <&cpu_ep=
>; };
=C2=BB       };
}

So, property reg =3D <1> refferes to DAI with index 1 associated with
component DSP.
