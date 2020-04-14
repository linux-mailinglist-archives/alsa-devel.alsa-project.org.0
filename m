Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FBE1A7165
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 05:02:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E7C169F;
	Tue, 14 Apr 2020 05:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E7C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586833334;
	bh=PzFwqu8nubp3PrgWQBVuMb06uokTEp4JMpU0VTZ09cU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nnO7eDonwwv90b2sDIoL/RHUAfjA9TV+Xjg+KJ7m7tAMRkUXgV88HxUNE9a5XGxof
	 1MEyohlRScYN3s8zmeo0YbB9pDblL0f3tkMvpN4fynVnfhvnJaJXehCm6oR5nrcwkr
	 U9VmCFyZBm3BND+yTnrowCt8W8qgBOh24MlUfdvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB006F80115;
	Tue, 14 Apr 2020 05:00:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832A1F8013D; Tue, 14 Apr 2020 05:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9F57F80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 05:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9F57F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l1z2pTrK"
Received: by mail-pj1-x1042.google.com with SMTP id a32so4687097pje.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 20:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bmrBJGYvPULTYsXID1n2ssFRwyCJcPGlCp+ffDZ2ue8=;
 b=l1z2pTrKK/Z24bQCWju9hYO5K6LvWpD5DCoSXiSBLwZQZhhqLNJWoTKQgkoRKDgqvS
 fGfrn44Syk3yqgAQT+0OHNxD38qhIvqRmOcHX2AIf/pJBV9I4jsBWyuIigF4kB57t1F5
 kkNWOJUdpFxyY8Z8j1+sJh7FDdYpGVtUV1tG0X0B1BFMhGwROxgCbFiuwXhyYrcC6NU+
 bquTjcpxjVMjaVjEnodWHqImGRm0YaH9oPuWfSFC4fMFcoSTo3Qd3dATP64+4irVrKYk
 Qr6a18t9b/XMXEruEs0P1w1FaiNO+ZI9ha7UQIbZWSfK0rRfKPOVy3b15IvbvjWy0LOA
 96ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bmrBJGYvPULTYsXID1n2ssFRwyCJcPGlCp+ffDZ2ue8=;
 b=etyvn5LVYEYmUT6dJYY64Ua87Inxmz1j9wBPIbKrCgOmUnKZyl5vW68+Y4pTe1PE6y
 9bneikUwLZUxmryvsojQFFEffpJ1k6gZCIFj+IRGPpOywcAsDXS5GTEOeUjcxIc7V3g4
 KwBh2svKPmcHFJ0fP35Dj/SxkSbo78QwqsH8ZbeTWpcOX4AWCUnYvlfeJtX+bMUOrhEU
 auwePVx34ycM8hCq6ZksnWX9HitKHr9DKLV9UDgXrrMbzXrts2tKWmwxQEqmGUd9VCez
 6xxwGHTuYMsLKXbvIFmI/pc+hfc5dxNSVGitimaBVqBF4E1t29A+N7jIQQb2RCPDZkyZ
 MuYQ==
X-Gm-Message-State: AGi0PubxCZo2hBs9VfZhrdoS8YEBGW2IxmQDeeE6Bfs4kyMasnrIJ97g
 5MZMgfCPVACFoxDUD5ag64E=
X-Google-Smtp-Source: APiQypKXuSLr1DLchZKjuBPOYZJBPpmlryaYyd6OhlIzheb4f5k8FxOq0gGgnslC+hA8mdo0s8KKyw==
X-Received: by 2002:a17:90a:6043:: with SMTP id
 h3mr6406198pjm.69.1586833209564; 
 Mon, 13 Apr 2020 20:00:09 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c84sm1464971pfb.153.2020.04.13.20.00.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 20:00:09 -0700 (PDT)
Date: Mon, 13 Apr 2020 20:00:17 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v7 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200414030017.GA10719@Asurada-Nvidia.nvidia.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
 <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
 <CAA+D8AN8OUtTftc_So-Z0_sjWt4RXq6fr4GpSy3Xh+YbkryfpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AN8OUtTftc_So-Z0_sjWt4RXq6fr4GpSy3Xh+YbkryfpQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Tue, Apr 14, 2020 at 10:21:29AM +0800, Shengjiu Wang wrote:
> On Tue, Apr 14, 2020 at 10:09 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Tue, Apr 14, 2020 at 08:43:07AM +0800, Shengjiu Wang wrote:
> > > There is a new ASRC included in i.MX serial platform, there
> > > are some common definition can be shared with each other.
> > > So move the common definition to a separate header file.
> > >
> > > And add fsl_asrc_pair_priv and fsl_asrc_priv for
> > > the variable specific for the module, which can be used
> > > internally.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > +static size_t fsl_asrc_get_pair_priv_size(void)
> > > +{
> > > +     return sizeof(struct fsl_asrc_pair_priv);
> > > +}
> >
> > Perhaps we haven't understood completely each other's point.
> >
> > Yet, would the following change work?
> 
> Should work, almost same

Function call involving branch instruction may fail CPU's branch
prediction and hurt performance, depending on the CPU arch. If a
variable simply does the job, we should avoid doing that.

> or do you want me to use variable to replace function pointer?

Yes. And please add my ack once you change it as the reset LGTM:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
