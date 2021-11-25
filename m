Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7FC45D73D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 10:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1697A1831;
	Thu, 25 Nov 2021 10:32:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1697A1831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637832824;
	bh=uvwK6xkBqc0Znk7K/Ky4+OAVTT2Tgux5Kci1XFX8G7s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O8t1H1zzTh90XtozGjcLFefiaph189VM82R1+/n1iT8CQIBEtgZKzvDQ7S5WHpGTd
	 /4RF5blQdLnwAoG99662spgmrZsETKgTBpYielgMxnH+7pQGHpzOGaH4rwB2mH3/sk
	 AHsVCr6i/kitQqwGp2yXe+QjFM2QAcIyXOItuz/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C851DF80087;
	Thu, 25 Nov 2021 10:32:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA43F8049E; Thu, 25 Nov 2021 10:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61D2EF80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 10:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61D2EF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A22aw7jp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 563B76108B;
 Thu, 25 Nov 2021 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637832727;
 bh=uvwK6xkBqc0Znk7K/Ky4+OAVTT2Tgux5Kci1XFX8G7s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A22aw7jpeZpx4drvuc79ExTAHz6VeHUzufIvszz7ZaVx6vozqrYdGuHHB4ir0DkuK
 4DosN3et1ryeH2sSo99GI46FHAMGrBjfPt0qtOD8B9VjSAsNRfJ1lLuEMyJyhlHoGv
 DiaytizYSHxweQu8nu9uC6rol+SgVSBSEjRjgUudS+4ouGtjQrdd8dEfOOvDI0M0tk
 Lwu8GSBC4nwXXs69WFKA9Kb21m1eFmHQxaZcig1TBhzh82FgRakL2sHa7/Okr2+Wwy
 DmKF7mojkI+nVpmahE4/oqR+93nJWRLIZT+N2quZ9UqaNezklRPtuBCcngVQgzq7Oj
 3e7fssOTS3ObQ==
Date: Thu, 25 Nov 2021 15:02:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
Message-ID: <YZ9YEim/hc0C4zz9@matsya>
References: <20211115085403.360194-8-arnd@kernel.org>
 <202111251538.x6sJNCka-lkp@intel.com>
 <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a17=OEtgkfRpzK8+-N37XqecSHP=WMZsu16Ef-WMp-1HQ@mail.gmail.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
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

On 25-11-21, 09:25, Arnd Bergmann wrote:
> On Thu, Nov 25, 2021 at 8:57 AM kernel test robot <lkp@intel.com> wrote:
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/dma/qcom/qcom_adm.c:712:18: warning: no previous prototype for function 'adm_dma_xlate' [-Wmissing-prototypes]
> >    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> >                     ^
> >    drivers/dma/qcom/qcom_adm.c:712:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> >    struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> >    ^
> >    static
> >    1 warning generated.
> 
> I noticed this mistake slipped into v2 as well, the function needs to
> be marked 'static'.
> 
> Vinod, let me know how you want me to address this. Should I just fold
> the fix (see below)
> and the final Acks into the patch and send an updated pull request, or
> do a complete v3
> submission?

I can fold this while applying, the series lgtm, I will wait a day
before applying...

Thanks

> 
>       Arnd
> 
> 8<---
> diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
> index bb338b303af6..65697bee4db0 100644
> --- a/drivers/dma/qcom/qcom_adm.c
> +++ b/drivers/dma/qcom/qcom_adm.c
> @@ -709,8 +709,8 @@ static void adm_channel_init(struct adm_device
> *adev, struct adm_chan *achan,
>   *
>   * Returns pointer to appropriate dma channel on success or NULL on error.
>   */
> -struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> -                              struct of_dma *ofdma)
> +static struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
> +                                     struct of_dma *ofdma)
>  {
>         struct dma_device *dev = ofdma->of_dma_data;
>         struct dma_chan *chan, *candidate = NULL;

-- 
~Vinod
