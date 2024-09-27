Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2998898D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 19:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02147EF2;
	Fri, 27 Sep 2024 19:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02147EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727457045;
	bh=msPFs0oHddcTpnqpQnU8/vyIsstY5Hmuyz7ku4/n+Vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fqoO0Vcwz7ys5EvPb1Rw81POi+JRjIAZjwX4dURKysTQ/nD9hE4K6DBoZ7hG4skJo
	 /Rm0onI+g3844sSHlucHRbaG7fgDOzgp+A9e4i/YiWQnEjc9fQzm/HLyDVOxRb+Btt
	 zyjeu4of/ywyPV7ycDWyVDIJbLEYYKG4RHIDNdqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75B8BF805BB; Fri, 27 Sep 2024 19:10:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C89BF8010B;
	Fri, 27 Sep 2024 19:10:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70BD0F802DB; Fri, 27 Sep 2024 19:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B00FAF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 19:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B00FAF8010B
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7091558067eso1068512a34.3
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Sep 2024 10:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727457002; x=1728061802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoY6H2xihm8sOHd6/SknfHzEtRV3+jpw8m+Q4KMLP+g=;
        b=Oyr3IGBxFdqHUbMZLHvhx5CzGng7FjbwZ/kLA6kka96CCB4D87d8o1qtRYxiOLMxR1
         GwvT0x26mscykt/0YFRWjEk0AaMkCUEKQQYl2Qp0491G3YZPxGbtQEiuyPUOTdBGGZbp
         poirmC1TzGxSgPFV4YM3paT8L0LLhKKSs6MyUtKrdzpCypuwb3v/AEEq3+wrrQcucsDy
         BWVbHIn4fHCwDtukfUvwVvfeuzQodD1rzPU6n21ITBYRNhSLoeD41aclVHigrsl4l/nE
         9ncauKadsu+eGb/ObCwbrRPK8vuWHfMHsLhFrhZ6jmrFfzzHPtoN1P3XQc6DExt4Cemg
         BoKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmdeWYh1q1bgVl6K7TdHxN2oYirDGQg60c0pmMa0x+lj+Gdnw0q8XsaKwIC0YuqdNqNCp9sEa3YI3@alsa-project.org
X-Gm-Message-State: AOJu0YxTAzcclSFQPRAxAoKQ5BV8xnY6oGtrjsDnX0/UYdVbhotIVkXF
	/SQCVy4vqDMXiO/wLNVO+hCMmHpJUYL+qmOKnrcT0m54yYn3T5N49KY3tr9K
X-Google-Smtp-Source: 
 AGHT+IEk7id4sLuqmoTNrrbtDXavEOP3zlW0U1Gyxe+3ab7jQwTM7s8qVfImyxsst2du2Sybwj/x1w==
X-Received: by 2002:a05:6358:9998:b0:1bc:db2a:7a35 with SMTP id
 e5c5f4694b2df-1becbc9d7e2mr277408055d.15.1727457002139;
        Fri, 27 Sep 2024 10:10:02 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e25e638be8csm527638276.41.2024.09.27.10.09.59
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 10:10:00 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6dde476d3dfso20291497b3.3
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Sep 2024 10:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWT465bgOZEGPjoo5GK0Eis+FJbFlO+HXfsI3bcVNBLQ+NcjrZqvXbMJUx1FkiNuf2656oiJNe3Tdsh@alsa-project.org
X-Received: by 2002:a05:690c:112:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e24dc9c710mr22157267b3.44.1727456998718; Fri, 27 Sep 2024
 10:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be>
 <4455919.MSiuQNM8U4@phil>
In-Reply-To: <4455919.MSiuQNM8U4@phil>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 19:09:45 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Message-ID: 
 <CAMuHMdXVBfp0ZJ5Me93p1fB9-ac00WcAYOb9jkG=D+wm01j+qw@mail.gmail.com>
Subject: Re: [PATCH treewide 00/11] ASoC: Clean up {hp,mic}-det-gpio handling
To: Heiko Stuebner <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UXZ4SGXUWTTJGQEAITTNXN3KXGJX7VSA
X-Message-ID-Hash: UXZ4SGXUWTTJGQEAITTNXN3KXGJX7VSA
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXZ4SGXUWTTJGQEAITTNXN3KXGJX7VSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Heiko,

On Fri, Sep 27, 2024 at 4:45=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
> Am Freitag, 27. September 2024, 14:42:15 CEST schrieb Geert Uytterhoeven:
> >   - The second patch updates the Audio Graph and Simple Audio Card DT
> >     bindings,
> >   - Patches 3-9 converts various DTS files to use the new properties,
> >   - The last 2 patches convert Freescale sound device nodes to use the
> >     new properties.
> >
> > All patches can be applied independently,
>
> though I guess dts patches should wait till patch 2 gets applied
> somewhere, so that changed dts and changed binding can again find
> together in linux-next?

Yes, if we want to avoid introducing new dtbs_check warnings in linux-next.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
