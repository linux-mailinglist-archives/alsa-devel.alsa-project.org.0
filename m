Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B583D17BCA1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 13:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF55828;
	Fri,  6 Mar 2020 13:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF55828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583497197;
	bh=Wbxl2lgYfuXExjQFrge1vKIv4WDmZ1/wpMX4ZgH57ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvHWlZtPzuVMY3xyuo7BDefJ/rOVSxwz1NK/XJtNBdVawB+OOlkbb61Y3Qqy9n43w
	 vfi2i202hNAoCkucffW6FOfs6X4tMR0NnDAAHZ3BC+O5yw/IlGNBmBU2MOcQEInuom
	 J/JWvMPUzE4EuDVqmctJRLPJ7aGOWt1GUzhR2vOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2847F80125;
	Fri,  6 Mar 2020 13:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A0BF801ED; Fri,  6 Mar 2020 13:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E8CF80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 13:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E8CF80126
Received: by mail-oi1-f193.google.com with SMTP id r16so2311091oie.6
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 04:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zCzopvBe5pClIDQDJUrJo6Mdp8tlxa91qM1CJIBUoZU=;
 b=EP8bpsU0acsxF1lx0meKIFCQcki9fZRJ+peE32BkdEwYy8bzTElHQnVq8dgvwDeC76
 d5Ee6qEUq+jSap0nOMaT25hYB60NMc5n6D6V4vF/BEUoYMfFrmzTNnXtuygyUST/yBGY
 7VfdZCCtH6v82EwUnLr/sUQhQT2naqUPsI6QuPmMYU/2M+yLk146RmE0Ik8EyBNnnxES
 ZiDHjEgbn2paI9NqMjwLPkuvPKzFzg+sb7uP3SJtfUG8BobE1U71/2p4uhUp1nJRXJi2
 NYPaVbhbJ7/qkJIX3Sav+V/AbP01DPpe9uPxcFIdsTxTJ8wfVqrvkW5laSX58pKMdUwh
 Ikfw==
X-Gm-Message-State: ANhLgQ21pfajwuKPkecTgsog4zkqcMcj1/d21uWFg5UHJ9pnY+VvQl9f
 Hqo/3MeGSJ+rbuGdC8QTpK/g7F6eJvAVeGR30Io=
X-Google-Smtp-Source: ADFU+vv2jlvbLhAc6REVXuwMcnoIkqf+yF7o6TIX59QZjp7iyI4Ry7WdpVGYuGOEEDGnsDWTufmFHi8kMV3eEpcMQTg=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2240414oia.148.1583497083839; 
 Fri, 06 Mar 2020 04:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20200305175528.5b3ccc09@canb.auug.org.au>
 <fabd49c7-d72e-a5a2-7f2c-47a8bd6c36a1@infradead.org>
In-Reply-To: <fabd49c7-d72e-a5a2-7f2c-47a8bd6c36a1@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2020 13:17:52 +0100
Message-ID: <CAMuHMdUs00Qtm0CMBTougPyTZxS_cN+x8QWezs_OtPFWB0B2Pw@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 5 (sound/soc/codecs/wcd934x.o)
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

Hi Randy,

On Thu, Mar 5, 2020 at 5:49 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 3/4/20 10:55 PM, Stephen Rothwell wrote:
> > Changes since 20200304:
> >
>
> on x86_64:
>
> CONFIG_MFD_WCD934X=m
> CONFIG_SND_SOC_WCD934X=y
>
> ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_trigger':
> wcd934x.c:(.text+0x754): undefined reference to `slim_stream_prepare'
> ld: wcd934x.c:(.text+0x768): undefined reference to `slim_stream_enable'
> ld: wcd934x.c:(.text+0x797): undefined reference to `slim_stream_unprepare'
> ld: wcd934x.c:(.text+0x7ab): undefined reference to `slim_stream_disable'
> ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_codec_probe':
> wcd934x.c:(.text+0x4c6c): undefined reference to `of_slim_get_device'
> ld: wcd934x.c:(.text+0x4cd4): undefined reference to `slim_get_logical_addr'
> ld: wcd934x.c:(.text+0x4cfe): undefined reference to `__regmap_init_slimbus'
> ld: sound/soc/codecs/wcd934x.o: in function `wcd934x_hw_params':
> wcd934x.c:(.text+0x6027): undefined reference to `slim_stream_allocate'

This is fixed by:
https://lore.kernel.org/linux-doc/20200302062340.21453-1-masahiroy@kernel.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
