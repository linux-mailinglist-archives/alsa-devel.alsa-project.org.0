Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BB618F511
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:54:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2C171657;
	Mon, 23 Mar 2020 13:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2C171657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584968048;
	bh=DY88PuCHaTN9NSRxAloLDWETeF3AT38ZTE7EJ/TduhE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQ1fZEgtojrzdZGd2jK45mz2u/IEqjni7oPO7b1H8O8YO5whfxGXVcG9Y7jxZftgo
	 Mi/1cUPWJJGh/e0brX7GOPPgoxewEW0gboIcA0/EJKhliJ+5T6WCg/k3bxNYVau8o1
	 H87tbVrizvQ+O1YYtK6zhZfMElrKQMRsG5zq+6+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE549F80095;
	Mon, 23 Mar 2020 13:52:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FDC9F80158; Mon, 23 Mar 2020 13:52:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE283F80095
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 13:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE283F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pn7W7+/9"
Received: from localhost (unknown [122.178.205.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B322D2072E;
 Mon, 23 Mar 2020 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584967940;
 bh=DY88PuCHaTN9NSRxAloLDWETeF3AT38ZTE7EJ/TduhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pn7W7+/9n/QoCr2K/PZCRilbr4813vNBelF93mu4/AEv+W/1vwN0Mo2GCZkrD274f
 pxIwC1bXfRuRtFJrcfk7seOqMGRQmgyZCaUCZrO+bLzbAT87eH0/UHH6bvLoeHl+We
 K/Zgg0H8LdGdSTI42kLHlLGEP+pUOwkJSAqcUY5s=
Date: Mon, 23 Mar 2020 18:22:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
Message-ID: <20200323125215.GO72691@vkoul-mobl>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
 <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 Andy Gross <agross@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jank@cadence.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 20-03-20, 17:01, Srinivas Kandagatla wrote:
> 
> 
> On 20/03/2020 16:29, Pierre-Louis Bossart wrote:
> > Add new device as a child of the platform device, following the
> > following hierarchy:
> > 
> > platform_device
> >      sdw_master_device
> >          sdw_slave0
> 
> Why can't we just remove the platform device layer here and add
> sdw_master_device directly?

In the case platform_device is the OF device your controller gets probed
on.

My thinking on this is that drivers should not be directly creating
sdw_master_device but it should be done by core as this device is for
core to use and handle. Ideally I would love that sdw_master_device is
created/handled by core, preferably this be handled as part of
sdw_add_bus_master().

But Pierre is trying to solve the limitation of the devices given by
ACPI and trying to add sdw_master_driver to handle that. I am not
convinced that we should do that.

-- 
~Vinod
