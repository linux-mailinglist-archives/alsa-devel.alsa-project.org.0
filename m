Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E86D4B1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 21:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463601694;
	Thu, 18 Jul 2019 21:24:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463601694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563477897;
	bh=rK4fJd4vJmUi3BqtXp3s/opiLHZBA3nruqvwUsfz4wc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PiKHGPVxAYXGkqrRb/QSIGWBqn5YMdlzjeH3xSdgkDKH4KNxiisENdNG82X9ViMt6
	 oxjBv/QL3NSipNTVlRlUJwEPCVOYLPFSILQfN9CANO58SzQBaf1xCEMfCYNSd8kiV1
	 z0fmXyDbm44dhFgyV5zFw0zl6yojJE3gyIlOxoi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E9A5F80362;
	Thu, 18 Jul 2019 21:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06520F80362; Thu, 18 Jul 2019 21:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DE1FF800D2
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 21:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE1FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kCDSMv7l"
Received: by mail-wr1-x443.google.com with SMTP id p17so29846120wrf.11
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 12:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5R99+io0YTzXknSVruIMm2cdZaUiAq5RLwRKq1Er60I=;
 b=kCDSMv7lirS1odA0wSqoYmRvqPM0IB3lYZY2ggTf0TyNKJ/eCqeepMzCl5CeBKtbVv
 8pMMbejQMc6oixbPiCvT4Q3VU8x1ridHAxIE0XxQXjUP2pWfFqPiriVbEv8FdiKY0ipj
 tp3Dms3YfnqAC9pL1+Lw9b7B+bTqrrL3WGH+218sAuv2vyaKSKCrlDbuYkhgebuiim/3
 IdQLHacG11/hFeN5s9rlwEgtfn5V2kPvYdrcxqsx1WMTPXDIp5Lfk3HbIPqHC9ofN+xL
 ov0qMFJ0wsHx99Xv/JxeVhfPzLMbNCy5j4dJtO/YaYWGG942ssmKr8r0kTTR87bmqeNW
 9vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5R99+io0YTzXknSVruIMm2cdZaUiAq5RLwRKq1Er60I=;
 b=epqSGg7P8aA02dyiRMTTQo3O7iD6g5jeC9nZQMJXpGTXuyk4Kz8W3DsKEyjWGY839/
 FZLSBz/UHRY3n5oS+EEVFVCBzzvYJHj95bHt9CnWXfsklkK0tXN7tgmLzshFHxiSRSvF
 Q+4CxOVT5kRjq/01Clepuvt8XXNe5pYETvDKQX8P/8EdiarscFivQ5amZ9Pjd9iuN3MO
 K3BLuXF9NLtame/6Yff7Oy4xiTv6MaJXDueEsF1vv2VUCGe1Dpaz92SkR+KBoyd7QLhh
 daBO4GuT8TD84jsuFrMuV/hBXmh9L71v70mzkfgDGqAeMtYfNaaUFdr1zA+I0SH27sGV
 4Wyw==
X-Gm-Message-State: APjAAAUWBVAEgDS/RSH2W+z3koL29Lqal7W8QLYdeZ5sfmfH9kFVbfCm
 4MqLSfypjVL/EKE+myeozcEYepXM2YjdM2m9Mxs=
X-Google-Smtp-Source: APXvYqzPnq98mqaHA62eO6EiZWAxyFdDyyhS99Gkm8EtiSXSq0opAgdg35CgxnGuRZNr5AMAUJ5BbCD/1WDg9vxfhvA=
X-Received: by 2002:adf:db46:: with SMTP id f6mr600036wrj.212.1563477787134;
 Thu, 18 Jul 2019 12:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <9ebe242b-ceac-6064-5b8b-698068fa11f0@intel.com>
In-Reply-To: <9ebe242b-ceac-6064-5b8b-698068fa11f0@intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Jul 2019 22:22:54 +0300
Message-ID: <CAEnQRZDk-O9B2iyjO=cnmqff6praf-SqNFsR=SM2Et-5Xxui5Q@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 18, 2019 at 10:12 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2019-07-17 12:56, Lucas Stach wrote:
> >   static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
> >       .use_imx_pcm = false,
> > +     .has_version_registers = false,
> >       .fifo_depth = 32,
> >   };
> >
> >   static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
> >       .use_imx_pcm = true,
> > +     .has_version_registers = false,
> >       .fifo_depth = 32,
> >   };
> >
> > +static const struct fsl_sai_soc_data fsl_sai_imx8m_data = {
> > +     .use_imx_pcm = true,
> > +     .has_version_registers = true,
> > +     .fifo_depth = 128,
> > +};
> > +
> >   static const struct of_device_id fsl_sai_ids[] = {
> >       { .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
> >       { .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
> >       { .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
> > +     { .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8m_data },
> >       { /* sentinel */ }
> >   };
>

Hi Czarek,

> These datas are populating quite rapidly. If you're planning for adding
> more (and/ or appending additional fields), declaring helper macro could
> prove useful.

There would be definitely more fields inside *_data structures. Anyhow,
not sure what do you mean by declaring a helper macro.

Can you provide an example and how would that be helpful?

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
