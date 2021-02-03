Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C530D841
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 12:15:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F49B176F;
	Wed,  3 Feb 2021 12:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F49B176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612350953;
	bh=yTTSZXtKOP0hXijrZvbt5YVyPq1ma21SJMRh676m8jg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L9HhtaOTzd3x1SkGgH+UBdyVbT5izLsaukR5XlIkqBDnPfqV2cD8w/P8VE7X+qM6v
	 gf32dVlH38XFEP4OM7a+hxtVXI/cLAFd5bnvRt8MuFLA4B0ND2V3qDew8v6qZ939Qx
	 M19Ovw0ot/0DAtkRji+l+gzmIWu1Dsafm3yQLc64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A21ECF80155;
	Wed,  3 Feb 2021 12:14:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03F4CF8015A; Wed,  3 Feb 2021 12:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A226F80155
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 12:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A226F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tXcNvsrz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 292C264E31;
 Wed,  3 Feb 2021 11:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612350854;
 bh=yTTSZXtKOP0hXijrZvbt5YVyPq1ma21SJMRh676m8jg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tXcNvsrz+kIcQR+uut/MCuVnjuYPcqBcZ7oa6UoHBqiHVZAg89LW74En1EayiYVec
 zeu4D8ycJzy0gmw0kWGIi4FdgdkCbK26VTIBcYqrVM/OimdiAXEtJjh+hLip2kt0QQ
 8FKXZ46sFBPzaAp8RZXQqhh4i+DbK/edPgfuykKJkoZNp/4T8W6bCOi2SKC0ze+xd+
 6zlJbElI+YyJ0HXzgeaveYF3qyJssyejrOi+xqfnhT/GFJgtnXM2TBbTyznlZ2rgJB
 6X52n0CjaIGPR6NFlXBhaltIsE4ii64Kfgb69ykQCiIL8LI4DX6lxT7Vgc/L0Nazts
 gHg739nMlPN6w==
Date: Wed, 3 Feb 2021 16:44:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
Message-ID: <20210203111409.GM2771@vkoul-mobl>
References: <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
 <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
 <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
 <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
 <20210201101414.GS2771@vkoul-mobl>
 <4b850685-1058-0e18-d3e8-e23e20086235@linux.intel.com>
 <20210202041853.GF2771@vkoul-mobl>
 <6eebbadd-d26b-9dba-f425-01988fb64bec@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eebbadd-d26b-9dba-f425-01988fb64bec@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 02-02-21, 10:43, Pierre-Louis Bossart wrote:
> 
> 
> On 2/1/21 10:18 PM, Vinod Koul wrote:
> > On 01-02-21, 10:10, Pierre-Louis Bossart wrote:
> > > On 2/1/21 4:14 AM, Vinod Koul wrote:
> > > > On 21-01-21, 17:23, Srinivas Kandagatla wrote:
> > > > > On 21/01/2021 15:12, Pierre-Louis Bossart wrote:
> > > > > > On 1/21/21 6:03 AM, Srinivas Kandagatla wrote:
> > 
> > > > > I totally agree!
> > > > > 
> > > > > If I understand it correctly in Intel case there will be only one Link ID
> > > > > per bus.
> > > > 
> > > > Yes IIUC there would be one link id per bus.
> > > > 
> > > > the ida approach gives us unique id for each master,bus I would like to
> > > > propose using that everywhere
> > > 
> > > We have cases where link2 is not used but link0, 1 and 3 are.
> > > Using the IDA would result in master-0,1,2 being shown, that would throw the
> > > integrator off. the link_id is related to hardware and can tolerate gaps,
> > > the IDA is typically always increasing and is across the system, not
> > > controller specific.
> > > 
> > > We can debate forever but both pieces of information are useful, so my
> > > recommendation is to use both:
> > > 
> > > snprintf(name, sizeof(name), "master-%d-%d", bus_id, bus->link_id);
> > 
> > I agree we should use both, but does it really make sense for naming? We
> > can keep name in ida and expose the link_id as a parameter for
> > integrators to see in sysfs.
> 
> That would mean changing the meaning of sysfs properties:
> 
> /*
>  * The sysfs for properties reflects the MIPI description as given
>  * in the MIPI DisCo spec
>  *
>  * Base file is:
>  *	sdw-master-N

Key is "The sysfs for properties" is for property files. I am not sure
how this implies for a number above. I was thinking of using ID for N
here and add a link_id file below which represents the link-id property

>  *      |---- revision
>  *      |---- clk_stop_modes
>  *      |---- max_clk_freq
>  *      |---- clk_freq
>  *      |---- clk_gears
>  *      |---- default_row
>  *      |---- default_col
>  *      |---- dynamic_shape
>  *      |---- err_threshold
>  */
> 
> N is the link ID in the spec. I am not convinced we'd do the community a
> service by unilaterally changing what an external spec means, or add a
> property that's kernel-defined while the rest is supposed to come from
> firmware. If you want to change the spec then you can contribute feedback in
> MIPI circles (MIPI have a mechanism for maintainers to provide such feedback
> without company/employer membership requirements)
> 
> So either we add a sysfs layer that represents a controller (better in my
> opinion so that we can show the link/master count), or keep the existing
> hierarchy but expand the name with a unique ID so that Qualcomm don't get
> errors with duplicate sysfs link0 entries.

Anyway we are late in cycle for this.. I am reverting this patch and we
can arrive at consensus and fix this for next cycle

Thanks
-- 
~Vinod
