Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3650E2C6C7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 14:41:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1A7C17E6;
	Tue, 28 May 2019 14:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1A7C17E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559047308;
	bh=QmD0Mp8y3BTf+qW/IrDlxPLAFCXLHbrypra/hFDMjIw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfnHIqqX08v8kOoe7furullpo0+nw9BUuDQixcGwK+uSKhYAmRDaiD86oGLDAm4VI
	 q872IY2EObdQtIU3zc3YSSiAF5gKaTCEhs6ccRAi1/n8HrXxUQpAP4GFOLqIGz11nw
	 ytRcdamgc+4q0Y45/dxvj2Sgad77B7NIIi3jUFag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 598E5F896B8;
	Tue, 28 May 2019 14:40:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8309EF89706; Tue, 28 May 2019 14:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 494CEF8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 14:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 494CEF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NHfXJIyt"
Received: by mail-ed1-x543.google.com with SMTP id g57so16719787edc.12
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ybsMUgY6ounJuaGDtEKhAz+yC4cA28XUN/3YPkPsJiU=;
 b=NHfXJIytPkkYgJ6rar0p4QA9KmqbIkxKsQ0CHv26Br6zjd6780zyDBv19RY/Winab9
 lMf6H5okEJ2jEqcNbR0ApwdBAMFcKg1oOK2kd6e2xaOcE/VJ1qqYmkFA165hAMBNH55b
 wMOdPYxgSh4aQ97AFz73SKI/zi+9OAO7hM46m8Z/kcXS5UrDzaLjzT8RGktH5cOTHGIV
 lXqMWRs+dXQeItJ6SZPReiyJtb9p48f2isx3NR87g1eWDce88MfLS+XnSEyM7J2o7guf
 ytPjeyC9Zk63P/3zCc4kIDmyqf/ujmHbAGdLIPekeNHUnOXwiFvxBDUwktm1lUewEWKE
 gsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ybsMUgY6ounJuaGDtEKhAz+yC4cA28XUN/3YPkPsJiU=;
 b=KfBvFN5MKRdw3iakqNIE12jJPRpWw7ADHtIJMEXo2W+IfhVPytSaYitHKeft4rG38+
 99NXWeI50ZJLLg5GHsQEmc1gg0Zq+/XNFWLE6YYw7q7HA/JZt78lJFmptI2GaRZxfU5S
 f9SWRo53ExyHkSxR7LAlgy+vIHnyJm6MM84/+uS5v3if2HMExMSIpbmG5h3lZf72jjEK
 BvyS9EEnxpCFuPWENYQNMres/BG1nKFOWYlY96IoJj3E+f4NirekT50YbCCuNrO1aYEr
 zg8cRmCksptdwUleh5jmEZD0LdcKQyOgaVLXwFX16hykXJbSDe0xe/4cEgYOKa5e/yKR
 jiIw==
X-Gm-Message-State: APjAAAXKvoOL2tqjnO+rWkZ2ZZ+0QO9RMZGpU/NV3TUK/aMYFvV31W8c
 ByLCm2QijFmj4dgKPi/1hyAczAZXe0sXfvCaAwo=
X-Google-Smtp-Source: APXvYqyiW3RuSm/Q5M7JS9tflgiot/Qc9jsuaXF8ZguxiXKGN8hQI2qQzZtasetqxOX7iKiUAzBfDfkTceixKP5vhV8=
X-Received: by 2002:a17:906:f194:: with SMTP id
 gs20mr15974716ejb.177.1559047196254; 
 Tue, 28 May 2019 05:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190420154038.14576-1-daniel.baluta@nxp.com>
 <20190421053749.GA5552@Asurada>
 <CAEnQRZDs_gnS8ehjM2M_y+Yw0Ge-Sq=A2c9BV-g=P_d0+O40hQ@mail.gmail.com>
 <20190421080439.GA8784@Asurada> <20190421082627.GB8304@Asurada>
In-Reply-To: <20190421082627.GB8304@Asurada>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 28 May 2019 15:39:44 +0300
Message-ID: <CAEnQRZD6nNH04xZjpSi7ozL=sNJvJdkEAGAYQStJESeu_2R=Eg@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl: sai: Fix clock source for mclk0
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

On Sun, Apr 21, 2019 at 11:26 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Apr 21, 2019 at 01:04:39AM -0700, Nicolin Chen wrote:
> > On Sun, Apr 21, 2019 at 10:26:40AM +0300, Daniel Baluta wrote:
> > > > Firstly, according to your commit message, neither imx8qm nor
> > > > imx6sx has an "mclk0" clock in the clock list. Either of them
> > > > starts with "mclk1". So, before you change the driver, I don't
> > > > think it's even a right thing to define an "mclk0" in the DT.
> > >
> > > From what I understand mclk0 means option 00b of MSEL bits which is:
> > > * busclk for i.MX8
> > > * mclk1 for i.MX6/7.
> >
> > MSEL bit is used for an internal clock MUX to select four clock
> > inputs. However,  these four clock inputs aren't exactly 1:1 of
> > SAI's inputs. As fas as I can tell, SAI only has one bus clock
> > and three MCLK[1-3]; the internal clock MUX maps the bus clock
> > or MCLK1 to its input0, and then linearly maps MCLK[1-3] to its
> > inputs[1-3]. So it doesn't sound right to me that you define an
> > "MCLK0" in the DT, as it's supposed to describe input clocks of
> > SAI block, other than its internal clock MUX's.
>
> Daniel, I think I's saying this too confident, though I do feel
> so :) But if you can prove me wrong and justify that there is an
> "MCLK0" as an external input of the SAI block, I will agree with
> this change.

Looking inside the RTL for SAI on i.MX8 I found that there
is a MUX with 4 inputs exactly as RM says:
- bus
- master clock 1
- master clock 2
- master clock 3

My point is that the DT is modelling the internal clock MUX
used for SAI to select its clock source.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
