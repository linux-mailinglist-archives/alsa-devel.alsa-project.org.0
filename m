Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465E7A7E3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A207B17F8;
	Tue, 30 Jul 2019 14:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A207B17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488839;
	bh=YFJhO9C1SwSC8NEw+7EIuiA2h6InSAtmmUdtkfcl4TQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZNowNjlwsF8DLaY08NJ/N+bafMC9OhAai8XOn1CKKEIYtMtcjKffjtWU3WXnBk4p
	 r1FEuOMeOCIh7Lr7W8gyJHkGTDqdMVpjzhC+IxhxCV5QWXNe6YXsMcObyV85qx0bcV
	 WaT7TyZAYzbb+AkdAuUENW4jyNUDqXU1n7PmiqGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57540F805A0;
	Tue, 30 Jul 2019 14:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93CC4F8058C; Tue, 30 Jul 2019 14:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 865A3F8053A
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 865A3F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T/gPmxwA"
Received: by mail-wm1-x341.google.com with SMTP id p74so56886580wme.4
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 05:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QkeDROUoXwLlgXXy7EUAOuurhZkrp9WRpgXOGNLEWM0=;
 b=T/gPmxwAUp1gwuwZ+lZZAegOVF1OVZW3X1kwn+rTAnsGZq6abftG3LmGS1RrfZtxPg
 LvbOyQfNw2DH5YI6ZPkvXndlREF4NA1h8MI6dSTyq2SMkW3ToqApLKO2f1k76PA8D2NO
 bm1+e2FZhgkJ1xTXb7yswKfT3W/pk2ksXMRk9SxwxlXaoyuL5rmLlF+0oON5uCcuVotH
 qD2cGwuja3T/CkPL1+7j1VFD0FBza0113BJ47NVvkwZ+d79aZMa8/IE1N0btyhrAXwVR
 O8W9Z/KsVEZ+Y3cBAusYXHnMtygCTE1WvA9pWYQ5HOX8wcqDMK97ezErT5GhAw31h1H7
 bQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QkeDROUoXwLlgXXy7EUAOuurhZkrp9WRpgXOGNLEWM0=;
 b=C2ZIone/fvlNDtig3AvyHG1+VJSLyKg9jHyBmhFeNiYS4498Ro9jwpcLUGtkDAy2zq
 OHVeaUQu0RiCFCEGapcZZiGF/FDq6rfDGfa44pRIqDbbI1MLhAFqHZf0pzZpC7BJDZiN
 NEw0vWVgixWiFlN+K0onKMlTTISvCBVHZjbYwpVx3z9NqwBYbW3f+mgW1gAAl0h315tx
 VdvfCaiXWHR+RD7X9qNwk4jVMcq3fqRDMRqkzDtkOWH6Amq/J0bwFOtMqDoPkphcG7NY
 juFuwo4k17AdHZjLX+5eqn/0cvRXNdlFQwN0YnLMpPFmleKY7TYeTbMFOp4t23kz6xwn
 Hedg==
X-Gm-Message-State: APjAAAXnotrQSeRDZ/s6WYm2v2E5nqFxpihSUI36EHJei2Uc8YSG3wYM
 dMsc84Uvs9APVFU62D9AwyIbtbWwNt6xKq4/Ka4=
X-Google-Smtp-Source: APXvYqyL7oSgEhIDgDjdxzWP0gzpWYtndYfnKUEaOl4e/hwGHH45JozOs5Bs8578NNYNXrXZ/NwMJICP7T6km6HdAlw=
X-Received: by 2002:a1c:c188:: with SMTP id r130mr99724413wmf.73.1564488621402; 
 Tue, 30 Jul 2019 05:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-8-daniel.baluta@nxp.com>
 <20190730080135.GB5892@Asurada>
 <CAEnQRZAUOzmP2yPb4utyDTnYUDNyqesXJPb5-Ms0tfPy8TMBig@mail.gmail.com>
 <20190730120455.GA4264@sirena.org.uk>
In-Reply-To: <20190730120455.GA4264@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 30 Jul 2019 15:10:10 +0300
Message-ID: <CAEnQRZAfsQBjKcJm9e7VJ7aOLSBzgOQC+HWNs0XSLAT2L-GudA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Viorel Suman <viorel.suman@nxp.com>,
 Timur Tabi <timur@kernel.org>, Rob Herring <robh@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mihai Serban <mihai.serban@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 7/7] ASoC: dt-bindings: Introduce
 compatible strings for 7ULP and 8MQ
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

On Tue, Jul 30, 2019 at 3:05 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jul 30, 2019 at 03:02:30PM +0300, Daniel Baluta wrote:
>
> > I removed the 'or' on purpose because I don't want to move it
> > around each time we add a new compatible.
>
> > Anyhow, I can put it back if this is the convention.
>
> You could convert to the YAML binding format and sidestep the problem a
> different way!

Someone needs to do that in the end, so will try to change to yaml
with the next version
of the patch series.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
