Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58571F3EB4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 05:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21FF1689;
	Fri,  8 Nov 2019 05:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21FF1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573186038;
	bh=b3pbGnASKDTnTxJwX+HjQY2meibt3cPUYZn67W7SyR8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWITp2RGjBtLHQvj4etx42GB4VtssTFbjYX2qyQdxEAcWDpwyRqVu4UAXarNLAnAH
	 AK7aftUL/8uj2W5vERz60Yo0pV13Ub9AQZsyuP/iLqpim61qdzb7azRlP/Ah4G3EoB
	 JY60ubeJHZjGfIpP2fAOnfQwJieMDtYpHJtr210s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F20D8F8045F;
	Fri,  8 Nov 2019 05:06:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96EBFF8045F; Fri,  8 Nov 2019 05:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95A9AF80321
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 05:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95A9AF80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i5Jtz+oi"
Received: from localhost (unknown [106.200.194.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AEA720679;
 Fri,  8 Nov 2019 04:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573185954;
 bh=Dj8emM86/tTjC9nxzViGKG+zu6tt69/S9bXVf+wafks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i5Jtz+oizAUYd8Xbrc2MlJpnEQMHErcQCdfDsbKO4HBsSkO5kfaE0BFoHB+NfzQ7V
 zkCW0cltflX8DquLsUFU8xJykb68acgfwBMoI5GGbMOxKZkSgrrPzdZqFr0IHcl43b
 zLDLreAjFYPH3R0YuWaG+2tMh+IjUBUIfqTz76do=
Date: Fri, 8 Nov 2019 09:35:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191108040550.GU952516@vkoul-mobl>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-11-pierre-louis.bossart@linux.intel.com>
 <7a49fcce-5b36-81c1-6041-dda263ebb200@intel.com>
 <02ef59ba-66da-3ba9-1fe7-0b7e256e3ac1@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ef59ba-66da-3ba9-1fe7-0b7e256e3ac1@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 10/14] soundwire: intel: add prepare
 support in sdw dai driver
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

On 04-11-19, 15:31, Pierre-Louis Bossart wrote:
> 
> 
> On 11/4/19 1:45 PM, Cezary Rojewski wrote:
> > On 2019-10-23 23:28, Pierre-Louis Bossart wrote:
> > > From: Rander Wang <rander.wang@linux.intel.com>
> > > 
> > > It gets sdw runtime information from dai to prepare stream.
> > > 
> > > Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
> > > Signed-off-by: Pierre-Louis Bossart
> > > <pierre-louis.bossart@linux.intel.com>
> > 
> > While the patch looks good, the commit message is questionable. You may
> > simply state why it is added only just now. Judging from the commit
> > title, it has been added to make the sdw dai driver interface complete.
> 
> The commit message is not great but it's not wrong either...

And it doesn't harm to elaborate and explain things rather than have
reviewer play detective!

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
