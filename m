Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FE755DE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6821EF0;
	Thu, 25 Jul 2019 19:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6821EF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564076427;
	bh=V/vVz1EeQw1y900EEXRmBL1hkXM4aKYawdpizvY/HL8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGMAsAS1cowC+f5GY6IQJ3PxEbaoR404Jqd8nlCOp3lNHL3F/yysCMA9nvKM3k9iR
	 G1egKnbttDu2bBXqFtyyDufckyxUi3LOJi+FjyCFH0As/EwXDRz5pC1OBv3omIni6w
	 0qRiFgphiF+/8K8aWautomtQRtRy9DWjO9ufZWP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D14D1F803D0;
	Thu, 25 Jul 2019 19:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4647F803D0; Thu, 25 Jul 2019 19:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA62F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 19:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA62F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lOQLyh4Z"
Received: by mail-pf1-x443.google.com with SMTP id y15so23111634pfn.5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YcakAwhbTJoGYOpuC9oEF2WLvqGmsUfwK1z2nnLHMx8=;
 b=lOQLyh4ZNknNXbKWG97od/UX1813pei3SQYOlzqfOBssMSPnPm/s9PBy7maBCSRQR+
 6K6LuD8sKfW7wZdMb04oWNrprN/bwJU8opJUc/hN6RVCS3BW5KS+df7hEe4j5phFRaVN
 5xan32Z6xKmFJh4YvSrz+IewIJvJIywhpqXNvxm/g8UixovFxlF9XcS74wn/iNu5vDTN
 jcV59QX4f940eW515Aa+C5zzgAmgb/9KZ8wM7r6Bykq2UrPIOebXD5uUAOf3nZEITFr+
 pUKgyZ/lXzgKGxxqtAGOOqBOpVIGWe1OKpuQIC7HbaWSj1rH1Hcd2+0fPCBLbrtDmd9J
 +ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YcakAwhbTJoGYOpuC9oEF2WLvqGmsUfwK1z2nnLHMx8=;
 b=OwjL+Ddd1b9rjGITUlEZQPhHNQyitHcdbOKPeG2hrl33OD7GQieDX8pIiuCPSIfM4Q
 lfJzd+4h2QjgUIhbT/RKrhdQDdG/OoFkMkNlX0J3GQoJi+2ZQ3R0W1NiIb4N5pMIygKu
 X+mxUiGLTZC2xyH/hAvRE3n8EAW3bNqHN9oz21O7Tw50FdYOGN+sp5DB8g0XsSqWbkVT
 3gcXN1Mcdt5GQu123lS/1OYhEN5DrZgceOGPhzVCewrZ7YD+9sRADO4zMTBFURKFps0+
 E+dVOV47TfqtnOh9dPIdSMqN4orE6qE2n7bsA9f4splKa7h20zfd/2X2lzKbKQo+P36O
 Er5g==
X-Gm-Message-State: APjAAAX4vmBui0xtbvvlb7y7SL2PZf3zE2vkltt3OcO3VGFQxhHlIioR
 unfMSfoAHlmdABak0lCOa7Q=
X-Google-Smtp-Source: APXvYqzB6wcKueZqL/f5Yl4DSRC0xnwviVPYuE27V4XggjeaSOX7/Y1xUexB+LH0hHqnf6Kelh3OAQ==
X-Received: by 2002:a65:6415:: with SMTP id a21mr74594225pgv.98.1564076314666; 
 Thu, 25 Jul 2019 10:38:34 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id e10sm51619090pfi.173.2019.07.25.10.38.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Jul 2019 10:38:34 -0700 (PDT)
Date: Thu, 25 Jul 2019 10:39:19 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190725173918.GD31961@Asurada-Nvidia.nvidia.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-9-daniel.baluta@nxp.com>
 <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
 <CAEnQRZBW7LNZ7=c_h_ef4ZDcbFzEt61h4VAJSLo2Fb80kBqtpw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEnQRZBW7LNZ7=c_h_ef4ZDcbFzEt61h4VAJSLo2Fb80kBqtpw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 08/10] ASoC: dt-bindings: Document
 fcomb_mode property
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

On Thu, Jul 25, 2019 at 09:02:22AM +0300, Daniel Baluta wrote:
> On Thu, Jul 25, 2019 at 2:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Mon, Jul 22, 2019 at 03:48:31PM +0300, Daniel Baluta wrote:
> > > This allows combining multiple-data-line FIFOs into a
> > > single-data-line FIFO.
> > >
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 4 ++++
> >
> > This should be sent to devicetree mail-list also.
> >
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > > index 59f4d965a5fb..ca27afd840ba 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > > @@ -54,6 +54,10 @@ Optional properties:
> > >                         represents first data line, bit 1 represents second
> > >                         data line and so on. Data line is enabled if
> > >                         corresponding bit is set to 1.
> > > +  - fsl,fcomb_mode   : list of two integers (first for RX, second for TX)
> > > +                       representing FIFO combine mode. Possible values for
> > > +                       combined mode are: 0 - disabled, 1 - Rx/Tx from shift
> > > +                       registers, 2 - Rx/Tx by software, 3 - both.
> >
> > Looks like a software configuration to me, instead of a device
> > property. Is this configurable by user case, or hard-coded by
> > SoC/hardware design?
> 
> Indeed this is a software configuration and configurable by user case.
> Will think of a another way to specify it.

Yea, it needs to be put somewhere else other than devicetree.

Not sure sysfs is a good approach for ASoC components or can
be done via amixer control.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
