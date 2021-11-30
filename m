Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939F4630AC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 11:08:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2FA1F93;
	Tue, 30 Nov 2021 11:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2FA1F93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638266908;
	bh=1u2P8VcDBaxTuHrNOVkt0WLqI+w0XF8E6zJqlLLrur8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pm8nY7IHVqNi7jRPw5Fwh+FxxdjpkDvFyIVUZaBFWTRGWfJtjNOXFY7m36jZZrCUH
	 p5QlSPurITe/2lhn6tjdao9sW0HqwBAqjaQ5Xemltns4VTLu+eLV8ZWfusjeRfJDJW
	 N3IiB/gDfHVTUQGCvYr2UYveZX188mUqM+AvyVsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50DBF802A0;
	Tue, 30 Nov 2021 11:07:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E22DAF80113; Tue, 30 Nov 2021 11:07:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24CE3F80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 11:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CE3F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="aLT77dDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1638266820;
 x=1669802820; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-transfer-encoding;
 bh=UCgk7kbDQh7QdhPkOEMiahIQV6+21NZJki0/IukQ16o=;
 b=aLT77dDjbubA+nhN37fBPTQtRmmvAkDk4pCw0hMOvuxKXyANsg1Z9ivx
 NGCdgwDRscHJjBX8tF15ZrvIj053SPSuDgUMAd2+Vw3uKLSom4CNV4Cm2
 O8vL431ublpRYua2xirqKTBTT5viTeVZ5hkIVVWS1pS1JA8TXEVhhmbUn
 f/PKR+VTp0S6J4otl+ZeykdnHplj/ar+O5rh5Muu9KDBzlsZSvWDKBytm
 dyCwhNDq0ty1cv9UJeIOnKePEcsd1WJn6PFThtm5F8z3pyweMCe3jjl4F
 cZZSJ2ml5+9ntxLWD1YJ/nFfhs2s7i4w2og5+YVgdpRtXDVmG2V+YHmNO w==;
Date: Tue, 30 Nov 2021 11:06:52 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: use dev_err_probe
In-Reply-To: <20211130093617.103147-1-jbrunet@baylibre.com>
Message-ID: <alpine.DEB.2.21.2111301104440.30606@lnxricardw1.se.axis.com>
References: <20211130093617.103147-1-jbrunet@baylibre.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail08w.axis.com (10.20.40.14) To se-mail07w.axis.com
 (10.20.40.13)
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


On Tue, 30 Nov 2021, Jerome Brunet wrote:

> Use dev_err_probe() helper function to handle probe deferral.
> It removes the open coded test for -EPROBE_DEFER but more importantly, it
> sets the deferral reason in debugfs which is great for debugging.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  sound/soc/meson/aiu.c               | 17 +++++++----------
>  sound/soc/meson/axg-fifo.c          |  9 +++------
>  sound/soc/meson/axg-pdm.c           |  9 +++------
>  sound/soc/meson/axg-spdifin.c       |  6 ++----
>  sound/soc/meson/axg-spdifout.c      |  6 ++----
>  sound/soc/meson/axg-tdm-formatter.c | 18 ++++++------------
>  sound/soc/meson/axg-tdm-interface.c |  9 +++------
>  sound/soc/meson/meson-card-utils.c  |  4 ++--
>  sound/soc/meson/t9015.c             |  8 ++++----
>  9 files changed, 32 insertions(+), 54 deletions(-)
> 
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index ba15d5762b0b..37036adf14ce 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -219,31 +219,29 @@ static int aiu_clk_get(struct device *dev)
>  
>          aiu->pclk = devm_clk_get(dev, "pclk");
>          if (IS_ERR(aiu->pclk)) {
> -               if (PTR_ERR(aiu->pclk) != -EPROBE_DEFER)
> -                       dev_err(dev, "Can't get the aiu pclk\n");
> +               dev_err_probe(dev, PTR_ERR(aiu->pclk),
> +                             "Can't get the aiu pclk\n");
>                  return PTR_ERR(aiu->pclk);
>          }

A minor thing, but dev_err_probe returns its err argument, so this 
construct can be written more tersely as:

		return dev_err_probe(dev, PTR_ERR(aio->pclk),
                                     "Can't get the aio pclk\n");

and that also seems to be in common usage when browsing existing code.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
