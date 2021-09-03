Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B36400184
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 16:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 153E31896;
	Fri,  3 Sep 2021 16:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 153E31896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630680674;
	bh=6khhLbB0d83/bhVo4iwllcCAMt8MOQulfPNEvLjuiwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cEkM2f0nyU/nD4TIo7z5p1fKDR53rhN6V0KnP2V3sHfJd6DymtJI7ARFe61J/bb40
	 gJ1bPh//4100JggIdJCwLE7szwM1p4JhXG/+rluXqF6dLJEzJHFLN4sq4LUPVEzCkt
	 Jz6i/In04f4Mt3uRhyIGSG5nuJ7QieYpITFhHtcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE8BF80227;
	Fri,  3 Sep 2021 16:49:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 676C7F80254; Fri,  3 Sep 2021 16:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 151BFF8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 16:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151BFF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l5v/CVr7"
Received: by mail-wr1-x432.google.com with SMTP id u9so8578209wrg.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSZsYJo1TwLrOI6mOU5kddR0wUijI2KCqfg09r8Ks7Y=;
 b=l5v/CVr7CgrXHirQq5mOZV5zF5GFIoFObhSZIHcq2UYp8b7ubfcoWcm8YnAL4OwX+w
 +SIeYmhC1mraCOv5g6UB2pEL6cA+MKZKu51+j59ZWKlkSbU1PtzG9QSeMxIREbvP/TzY
 YOC+wzvbDcVB+dF9OFgRilwWfzNg6wTQi2PprFzSKQOjIzRKra0kUqO9fD632E9BWMdM
 m9CVMKJ9r7vUkZc2I62U22ap48W3TEcrn24I9vetW1i83tGcv8npzjcO9SviQmZfDan4
 RUxe/R+Rz9KEZGdRPlIRxGtXIK5Pc0RXQaEXwf23BdcSA4pA8z69rUzY0xNguiyuWLxk
 Mzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSZsYJo1TwLrOI6mOU5kddR0wUijI2KCqfg09r8Ks7Y=;
 b=eyXVNNk56jJaT5LuCK6N/14WHrx6o7RP/6y0m1vquGr4Qc7P1r9S8cxA8Nw2PQLymu
 G/jEHt80NSjY10bD1zKRzz8pHJE7AHQpiz1YIeRZFaDAKrIqwthkWorNFtDyJUXg06rF
 YBh220mCTSYVOW+y+42QYPQnyj5Uz01EOssr6xKvVYcbybiwhmAF1ldGTOPIek5nQEDT
 YVA2mai3iAC91PXrflMuhRuf2f46oB27A/h45cBQbb08mVsUBR/NHGrjGMRSWf7C/5zL
 cjBGZ1TK25Z5XxMSKkU+g6+GVomrC/rYOD16lt1fR2p0RMHOrDu8FsrhM2R00Xz3Tg+L
 o+yA==
X-Gm-Message-State: AOAM530oEk26G3sb9W+bonWlA9nReH5aMeD3oyHETlfux64+f+CDCjW7
 +IFB8Zz78jp/GWk+KAHM53179Zktpz+aZDzN3e8=
X-Google-Smtp-Source: ABdhPJxkF816f/hTx1Ho5iGqTqbkepANdHgYQJKfy+V1BgAY5r0WjyIBRC6EnKKQ73xhoZZHwYyvTz5LA2gywM7uL50=
X-Received: by 2002:adf:edc2:: with SMTP id v2mr4619556wro.255.1630680590698; 
 Fri, 03 Sep 2021 07:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210902123216.787025-1-daniel.baluta@oss.nxp.com>
 <20210902123216.787025-2-daniel.baluta@oss.nxp.com>
 <20210902144913.GE11164@sirena.org.uk>
In-Reply-To: <20210902144913.GE11164@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 3 Sep 2021 17:49:38 +0300
Message-ID: <CAEnQRZAfBwgfOM6w_azSw4n=qw2Cc2HPHSaTXmFa9LKXM_OQJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add code to manage DSP related clocks
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, peter.ujfalusi@linux.intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s-anna@ti.com,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Sep 3, 2021 at 2:27 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Sep 02, 2021 at 03:32:15PM +0300, Daniel Baluta wrote:
>
> > +     for (i = 0; i < clks->num_dsp_clks; i++) {
> > +             clks->dsp_clks[i] = devm_clk_get(sdev->dev, clks->dsp_clks_names[i]);
>
> Looks like this could benefit from the use of the clk_bulk_ APIs?

Indeed! I open coded exactly what clk_bulk API is doing! Will use it in v2.
