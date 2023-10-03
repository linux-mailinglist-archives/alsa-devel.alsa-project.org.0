Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F57B68D5
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 14:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA7B83B;
	Tue,  3 Oct 2023 14:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA7B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696335422;
	bh=bJbHW+up/ZcidjJUwZmbFqVensrsc/Le+h0oBw4LFIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ME7I0KeqYKUBu7XK9bW28TbNlCMQLEohQSOY5DApDZQJvuBNTHAs5MqIBE0I4NVpu
	 xx0Qm8yfkzr0bQo50yEAV+3KEGmmhvpOOUQ5HqSKwBhn8Q7tuF/a/NjSXt/SnjQTtM
	 Rk2BSL1RDb48hdT4jf0HsPulB1/qzk9pkCMa2gB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B99BF80310; Tue,  3 Oct 2023 14:16:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AAD9F80310;
	Tue,  3 Oct 2023 14:16:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72775F8047D; Tue,  3 Oct 2023 14:16:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E796F80166
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 14:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E796F80166
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-59f4bc88f9fso9580817b3.2
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 05:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696335351; x=1696940151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlMz0Oi+kuJ548Zt58VQ4VcDGh2ache1586MwysmIBc=;
        b=WfCQod3QlX/psev7AOi1M+/GeS1+/XJoe1ZVJPeGVWalP2qaS3tE5TpluoVXQQ5vYQ
         3uKWX8rkdwA78s6BXprn6wc92McoAwMSEIkpElwBQLVBRO1/jBfaBKk+Umh5DYIku07/
         wNDV2NDL9tFXKGiLMy0/4gHYNhji96/O+7m7j3GccZvpnIeXj2GhwbjhgmXkK4QMF0Xa
         nX65UG//XQ3kHinxIEy17dp2egiQGI3hD/AE9suBwTWWjJVGxkCv8iai7WwVNbAynik5
         8ynPTycVW7+tlHP5w3ia23NPKqOWWKGH9yxb2kMMPHUdqW1LR135+hft0Yo0qhBRrsat
         mmnQ==
X-Gm-Message-State: AOJu0YwNaYF6d0wc4JLqsUzZUvEEbWOF1PuInWC9cwl39fcZ2JLMmZgC
	7EqoQVDizw6huvrkAMgLAhi7l01V8WOANw==
X-Google-Smtp-Source: 
 AGHT+IFEvgDWfTIy2QqML9/aq43zPqBifNt/wyUh7W3yJjlxmz6GYasrdDOqgGalC4S6RMUhHx9xiw==
X-Received: by 2002:a81:5e08:0:b0:579:f5c2:b16e with SMTP id
 s8-20020a815e08000000b00579f5c2b16emr14976011ywb.31.1696335350534;
        Tue, 03 Oct 2023 05:15:50 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id
 p189-20020a0de6c6000000b0057399b3bd26sm341141ywe.33.2023.10.03.05.15.49
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:15:49 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-59f7f46b326so9773757b3.0
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 05:15:49 -0700 (PDT)
X-Received: by 2002:a81:9250:0:b0:583:d1fa:1fc4 with SMTP id
 j77-20020a819250000000b00583d1fa1fc4mr13656081ywg.26.1696335349579; Tue, 03
 Oct 2023 05:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231002090434.1896-1-shenghao-ding@ti.com>
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
 <79c4d534ad20452c992d8ace138e4384@ti.com>
In-Reply-To: <79c4d534ad20452c992d8ace138e4384@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Oct 2023 14:15:36 +0200
X-Gmail-Original-Message-ID: 
 <CAMuHMdXRGxnGpVHiB+Zvxq+G4K-BL8JsJGbG+7CNtJiqGwHOsQ@mail.gmail.com>
Message-ID: 
 <CAMuHMdXRGxnGpVHiB+Zvxq+G4K-BL8JsJGbG+7CNtJiqGwHOsQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: fixed compiling issue in
 m68k
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Lu, Kevin" <kevin-lu@ti.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"mengdong.lin@intel.com" <mengdong.lin@intel.com>, "Xu,
 Baojun" <baojun.xu@ti.com>,
	"thomas.gfeller@q-drop.com" <thomas.gfeller@q-drop.com>, "Gupta,
 Peeyush" <peeyush@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: A4USK33UO5S7BRU3PVVOWOKKJ7C3WOT3
X-Message-ID-Hash: A4USK33UO5S7BRU3PVVOWOKKJ7C3WOT3
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4USK33UO5S7BRU3PVVOWOKKJ7C3WOT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shenghao,

On Tue, Oct 3, 2023 at 12:47=E2=80=AFPM Ding, Shenghao <shenghao-ding@ti.co=
m> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Tuesday, October 3, 2023 3:24 AM
> > To: Ding, Shenghao <shenghao-ding@ti.com>
> > Cc: broonie@kernel.org; robh+dt@kernel.org;
> > andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com; perex@perex.cz;
> > pierre-louis.bossart@linux.intel.com; Lu, Kevin <kevin-lu@ti.com>;
> > 13916275206@139.com; alsa-devel@alsa-project.org; linux-
> > kernel@vger.kernel.org; liam.r.girdwood@intel.com; mengdong.lin@intel.c=
om;
> > Xu, Baojun <baojun.xu@ti.com>; thomas.gfeller@q-drop.com; Gupta, Peeyus=
h
> > <peeyush@ti.com>; Navada Kanyana, Mukund <navada@ti.com>;
> > tiwai@suse.de
> > Subject: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: fixed compiling issue=
 in
> > m68k
> >
> > Hi Shenghao,
> >
> > Thanks for your patch!
> >
> > On Mon, Oct 2, 2023 at 4:38=E2=80=AFPM Shenghao Ding <shenghao-ding@ti.=
com>
> > wrote:
> > > fixed m68k compiling issue: mapping table can save code field; storin=
g
> > > the
> >
> > Please replicate the actual error message from the compiler, so it is r=
ecorded in
> > the commit description, and easy to find when someone searches for the =
actual
> > error message
> >
> > From the Reported-by (which is not included in the actual description, =
as it is
> > below the "---"):
> >
> >        {standard input}: Assembler messages:
> >     >> {standard input}:992: Error: value -148 out of range
> >        {standard input}:992: Error: value of ffffff6c too large for fie=
ld of 1 byte at
> > 0000045f
> >
> > > dev_idx as a member of block can reduce unnecessary  time and system
> > > resource comsumption of dev_idx mapping every time the block data
> > > writing to the dsp.
> >
> > I am sorry, but I don't understand what this means.
> > Can you please elaborate?
> >
> > Also, can you please explain what the real issue is?
> > (My first guess when seeing the error message before was that a  signed
> > integer is truncated to an unsigned char or so, but I couldn't see  imm=
ediately
> > where that is happening)
> Sorry to late feedback. I had been troubled by this issue for several wee=
ks. At first, I also think it would one of variables overflow, according to=
 the compiling error message. However, after investigation, no result came =
out. In fact, compiler will report the line number where the variable overf=
low is, if there was risk on the variable overflow. Yet, this compiling err=
or did not report any line number. Finally, I didn=E2=80=99t realize that i=
t would be the code section overflow until that compiling error message mag=
ically disappeared, one day I removed some functions in the tas2781-fwlib.c=
. So, I began to simplify some functions in the code.

I managed to reproduce the issue with the m68k cross-compiler from
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/13.2.0=
/

    | sound/soc/codecs/tas2781-fmwlib.c:779:            switch (block->type=
) {
            subq.l #1,%a0       |, tmp56
            moveq #36,%d0       |,
            cmp.l %a0,%d0       | tmp56,
            jcs .L122           |
            move.l %a0,%d0      | tmp56, tmp59
            add.l %d0,%d0       | tmp59
            move.w .L95(%pc,%d0.l),%d0  |, tmp60
    .L125:
    | sound/soc/codecs/tas2781-fmwlib.c:827:            switch (block->type=
) {
            jmp %pc@(2,%d0:w)   | tmp66
            .balignw 2,0x284c
    .L95:
            .word .L109-.L95
            .word .L113-.L95

            [...]

    | sound/soc/codecs/tas2781-fmwlib.c:827:            switch (block->type=
) {
            moveq #36,%d0       |,
            cmp.l %a0,%d0       | tmp77,
            jcs .L122           |
            move.l %a0,%d0      | tmp77,
            add.l %d0,%d0       |
            move.l %d0,%a0      |, tmp65
--->        move.w .L95(%pc,%a0.l),%d0  |, tmp66
            jra .L125           |

Looks like the compiler is sharing the jump table at L95 for two
different switch() statements, but the PC-relative offset to refer to
the table is too large when using -m68000.  It works fine with -m68020.

Probably a compiler bug?

> > > Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> > >
> > > ---
> > > Changes in v1:
> > >  - | Reported-by: kernel test robot <lkp@intel.com>
> > >    | Closes:
> > >    | https://lore.kernel.org/oe-kbuild-all/202309222048.RnSqEIK5-lkp@=
intel.com/

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
