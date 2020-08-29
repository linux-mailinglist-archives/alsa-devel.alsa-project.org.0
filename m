Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D25E2566FC
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Aug 2020 13:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2162218E6;
	Sat, 29 Aug 2020 13:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2162218E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598698962;
	bh=WGE/Ni8OgdnjEaI12x6E3/36gjTN5CWhg+VbB/qhaqE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=I/X8UJaR2lTCR6KUVYF7PWRSKlbiRXWw98K4PsJA1AZxCEIfDBPQaeSZSbHBcLX7V
	 nd6G820dAEiAIWB6WD0UX/CTfMhiGa+QCfrx2etjyJSHEk7hMrVEgYsrJl5jHI+NmC
	 GJ/Ur2z51XqbPJhfrTITG4WAgP19ox+pGq6UII78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B6DEF80260;
	Sat, 29 Aug 2020 13:01:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE000F8025A; Sat, 29 Aug 2020 13:00:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9102F8012E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 13:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9102F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bJnOvrmE"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 581F4207DF;
 Sat, 29 Aug 2020 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598698851;
 bh=WGE/Ni8OgdnjEaI12x6E3/36gjTN5CWhg+VbB/qhaqE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bJnOvrmEP3qQTbfhE1/jw5kbaTMAOYtleMdzUUT9cIxQMOjn8Lq4dVhAkOnXeTBe6
 O8LO8m0Bx55WrC11vqnNdsdNgnHwCGsUBTLE326hyT/40/2POv3i/v3US8LT0hMYH/
 SKGboRGHLqFc9fsyw21UAySMuQUwNNecQzpVHVVs=
Date: Sat, 29 Aug 2020 16:30:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 09/11] soundwire: intel: add dynamic debug trace for
 clock-stop invalid configs
Message-ID: <20200829110047.GC2639@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5d8a731-d753-060a-f224-63de3b29b7d2@linux.intel.com>
 <20200818024120.20721-10-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 28-08-20, 09:54, Pierre-Louis Bossart wrote:
> 
> > > > > Detect cases where the clock is assumed to be stopped but the IP is
> > > > > not in the relevant state, and add a dynamic debug trace.
> > > > 
> > > > you meant a debug print..and it looks like error print below (also in title).
> > > 
> > > I don't understand the comment. Is the 'trace' confusing and are you asking
> > > to e.g. change the commit message to 'add dynamic debug log'?
> > 
> > Question is what is dynamic about this?
> dev_dbg() is part of the kernel dynamic debug capability...
> 
> https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
> 
> Not sure what you are asking here?

:-| where is dev_dbg() ?

See [1]

On 18-08-20, 10:41, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Detect cases where the clock is assumed to be stopped but the IP is
> not in the relevant state, and add a dynamic debug trace.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 7c63581270fd..b82d02af3c4f 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1964,6 +1964,11 @@ static int intel_resume_runtime(struct device *dev)
>  			}
>  		}
>  	} else if (!clock_stop_quirks) {
> +
> +		clock_stop0 = sdw_cdns_is_clock_stop(&sdw->cdns);
> +		if (!clock_stop0)

[1]

> +			dev_err(dev, "%s invalid configuration, clock was not stopped", __func__);

                        ^^^^^^^

> +
>  		ret = intel_init(sdw);
>  		if (ret) {
>  			dev_err(dev, "%s failed: %d", __func__, ret);
> -- 
> 2.17.1


-- 
~Vinod
