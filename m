Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172E11989FE
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 04:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C869166D;
	Tue, 31 Mar 2020 04:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C869166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585621832;
	bh=7vfQJf1PF8WlqHzFsgz+DqwBnBE57TCuBKUkiuh/2Ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBlsN7GnSNAFLyE3Uo4ZCpxOkm7nIGBpjIKAKdZd3ubSbEpmOoZNC91hpZ+jcf8Aw
	 Htd22BLAenFTfJ4MPQtFCnMpBgH7cW2/QSYfbk1B1CpZPZzV8dQEFKywdNObv53I2u
	 ApXvRWxy6u5PFKBcQdizNL27ttmqfAIfCbaf7hyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B105EF8010C;
	Tue, 31 Mar 2020 04:28:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C534F80146; Tue, 31 Mar 2020 04:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE637F8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 04:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE637F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XbufxDdy"
Received: by mail-qt1-x842.google.com with SMTP id m33so17111781qtb.3
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 19:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Eswrbi+TW9i4zBrNR421oAkiEgU39P/E20ccg2jKp0=;
 b=XbufxDdyKxF6IxecIKX1ZwR3v13NTl1c0irTPT13iVOAemS1d4QQGPNdE8aX5ZJR7a
 PRYP7DhKw5BCgxY7SGSzYWNZgaGcWWSc6YGqUcJQu60Lfm4Q4OSUxTA+2thEsMP1fxNR
 VJwh3EmB3AOXnRQbyYLd1sv5QNoWFYPHe3e7QaLHgo50B+O0+HGrMpsHrGHsmsEZZO9I
 kg+3wYBZar0w5tO557g0O7FJMVrKJPzT9zL6YdvW2GEVYbw5IdwhUXKbWcQbdUPqfswu
 eBRpuqpc4K2baE54CChc6Yg8aq9BWGgIZ1HFGX7tAWIF3k1mIqsNGhpbsGFO+pMH5Jui
 8/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Eswrbi+TW9i4zBrNR421oAkiEgU39P/E20ccg2jKp0=;
 b=dNNiSZu8kMhe+pGH1MZVdAEirLUIGI5nEgU+GnTJcJ/lBDg6CN8XtB811Y9elE0GNS
 Qhkp3DyMmMQ495cRNXqpJZsEzaWMs+V6bgvh5ZcCY6Rc4tb9GuOl+pE0Dlj/Wwuj/vAr
 hk64PEUhR8tcOVGGWCWxOGHFLHUrJNlN2FV4FlTpnm7TyGZK3s0SV5ITq0u79+mpWyym
 1JCpotX5ADBrNTrJjXswxojaw9hV8D9RLUAehY3q6DCmo6WUl+36NtH5s8IJyoErgnPj
 uLAQCBRa/eIgRspajtvcWqOjTLvmct1LNEaDO/SOLqK/BJpnX4EtJQnF1+AiGOvsZ2y5
 cxCw==
X-Gm-Message-State: ANhLgQ2g/xug78J6gJXy6u4BBu3NbYEra03EMjHluQ6hwu9a/1TLMcJz
 ayLQOuvXNjs+qp0chfUiNz/vTIgZLxm4cWb4Deo=
X-Google-Smtp-Source: ADFU+vsVu3tV6CH4YdMfKECtdWJWGuZrgZY25WwzSudJxQGrid6FAxBQVVLlDNJ6nM/kHaMida9sj9zwiJxjuWI1mgI=
X-Received: by 2002:ac8:6f4e:: with SMTP id n14mr2947163qtv.121.1585621716954; 
 Mon, 30 Mar 2020 19:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
 <20200320173213.GA9093@bogus>
 <20200323212038.GA7527@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200323212038.GA7527@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 31 Mar 2020 10:28:25 +0800
Message-ID: <CAA+D8APu0JYqnUvY+fCYTcZ9U1BCv-zU8J4Zt-5doZcNkgaXFQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl,
 asrc-format
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

Hi

On Tue, Mar 24, 2020 at 5:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, Mar 20, 2020 at 11:32:13AM -0600, Rob Herring wrote:
> > On Mon, Mar 09, 2020 at 02:19:44PM -0700, Nicolin Chen wrote:
> > > On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > > > In order to support new EASRC and simplify the code structure,
> > > > We decide to share the common structure between them. This bring
> > > > a problem that EASRC accept format directly from devicetree, but
> > > > ASRC accept width from devicetree.
> > > >
> > > > In order to align with new ESARC, we add new property fsl,asrc-format.
> > > > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > > > can accept format from devicetree, don't need to convert it to
> > > > format through width.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > index cb9a25165503..780455cf7f71 100644
> > > > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > @@ -51,6 +51,11 @@ Optional properties:
> > > >                     will be in use as default. Otherwise, the big endian
> > > >                     mode will be in use for all the device registers.
> > > >
> > > > +   - fsl,asrc-format     : Defines a mutual sample format used by DPCM Back
> > > > +                   Ends, which can replace the fsl,asrc-width.
> > > > +                   The value is SNDRV_PCM_FORMAT_S16_LE, or
> > > > +                   SNDRV_PCM_FORMAT_S24_LE
> > >
> > > I am still holding the concern at the DT binding of this format,
> > > as it uses values from ASoC header file instead of a dt-binding
> > > header file -- not sure if we can do this. Let's wait for Rob's
> > > comments.
> >
> > I assume those are an ABI as well, so it's okay to copy them unless we
>
> They are defined under include/uapi. So I think we can use them?
>
> > already have some format definitions for DT. But it does need to be copy
> > in a header under include/dt-bindings/.
>
> Shengjiu is actually quoting those integral values, rather than
> those macros, so actually no need copy to include/dt-bindings,
> yet whoever adds this format property to a new DT would need to
> look up the value in a header file under include/uapi. I's just
> wondering if that's okay.
>
> Thanks
Shall I keep this change or drop this change?

best regards
wang shengjiu
