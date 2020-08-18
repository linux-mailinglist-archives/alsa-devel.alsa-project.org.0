Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E69247E6D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 08:29:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1671A172F;
	Tue, 18 Aug 2020 08:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1671A172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597732172;
	bh=JSK9ci9WhE9/2a+BcV+RJI/GZdayBc/8ZdvTiCoeTGw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcOgkx93IbErg58qyyOkIsRdg1LEavSBf39f757ZaSTJQ6JReStaBpTjTU3CKAg8f
	 imxJKLP15ceACMYi3S3yIAtjmo7XnswtjOfgOgLGGiiBVEQe83TYgtpDK2KPvPmC+d
	 Pd/7gjpY8bXoz30VNfg+kQhMUFzDCvWr/B3uj/WY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 410B0F80114;
	Tue, 18 Aug 2020 08:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4814AF8023F; Tue, 18 Aug 2020 08:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE2C5F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 08:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE2C5F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wGw3PcUk"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B66B20825;
 Tue, 18 Aug 2020 06:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597732053;
 bh=JSK9ci9WhE9/2a+BcV+RJI/GZdayBc/8ZdvTiCoeTGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wGw3PcUkzKlVCGYV8eKWpkIal8/JUgTDCMtBdO7CCK31U/1VWTvCMAuy5BlpYJM1s
 ZKEEwXShBPr8QzhBWt6npd96Ftf4aS0BGnD/aGbueLot1Sqnwy9ehLXW1UwdYu1rFk
 iivNWMnAt4cQVMj3Ks84ZeiibfC1L3ZhkH2m4ask=
Date: Tue, 18 Aug 2020 11:57:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 09/13] soundwire: intel: add CLK_STOP_BUS_RESET support
Message-ID: <20200818062729.GS2639@vkoul-mobl>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200721203723.18305-10-yung-chuan.liao@linux.intel.com>
 <20200817114729.GP2639@vkoul-mobl>
 <8aac898f-92d3-c907-ebb8-4642a618645b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8aac898f-92d3-c907-ebb8-4642a618645b@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

On 17-08-20, 09:30, Pierre-Louis Bossart wrote:
> 
> 
> 
> > > +	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
> > > +		ret = sdw_cdns_clock_stop(cdns, true);
> > > +		if (ret < 0) {
> > > +			dev_err(dev, "cannot enable clock stop on suspend\n");
> > > +			return ret;
> > > +		}
> > > +
> > > +		ret = sdw_cdns_enable_interrupt(cdns, false);
> > > +		if (ret < 0) {
> > > +			dev_err(dev, "cannot disable interrupts on suspend\n");
> > > +			return ret;
> > > +		}
> > > +
> > > +		ret = intel_link_power_down(sdw);
> > > +		if (ret) {
> > > +			dev_err(dev, "Link power down failed: %d", ret);
> > > +			return ret;
> > > +		}
> > 
> > no cleanup on all the error cases here?
> 
> See above the 'else if' test, the clock stop on suspend will be followed by
> a bus reset on resume. this is essentially a complete bus restart.

ok

> The only open here is whether we should actually return an error while
> suspending, or just log the error and squelch it. We decided to return the
> status so that the pm_runtime suspend does not proceed: the state remains
> active which is easier to detect than a single line in a dmesg log.

right, returning makes sense and is done correctly above

-- 
~Vinod
