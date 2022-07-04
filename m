Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA1564D66
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 07:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A03CE16DC;
	Mon,  4 Jul 2022 07:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A03CE16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656913466;
	bh=7DfuY5XxRaCJ/JJc77L8f/sUPg9aXEsMmG4x+Akyq3w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvezzujXuNkKVQgfcviSDeoaWE+3VEByw70LL7DQme3NWq/Ic/4YSQykZkWEYc0dR
	 Gaz4c3jcFGqWJivqko+cVyhEzKRV4YZ8O9C5gYlTJB2dNyOjcesqDHdUIjBeVToglH
	 IbcHtbzVL2trqiE7jMXjk2Qi7/fBHOv0rE+pr2lE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD1DF80165;
	Mon,  4 Jul 2022 07:43:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3483F8014E; Mon,  4 Jul 2022 07:43:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3A44F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 07:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3A44F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ekLrtKc7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0556B61460;
 Mon,  4 Jul 2022 05:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E64C3411E;
 Mon,  4 Jul 2022 05:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656913395;
 bh=7DfuY5XxRaCJ/JJc77L8f/sUPg9aXEsMmG4x+Akyq3w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ekLrtKc7kfUwIrnVZDU5MnNeb9hcL0VpyOERthDddi580aA0XvmNZPYDOhTRYKuV2
 nV/UECsUw5EViHBeFl+4a6TMZTjyvNlB5l4yW1vsmuxRdLsB3PqFMgt4Jiu7hBJRV8
 iqgs/9DCOUXeJbNUSqudYTeJDRQ4d3ow2w09cxv2O39urniJiOlUCZE41+hG/C2dkJ
 1NmD6IOg9+85fXgpbAUifSM6DA2ZHBuLM/4x6Vk3D5tVi1lqU6MsEETy6l3rWr41kp
 U3IYn6hbhko40PIR6PNkc7TAbunhoQ0Zabs4Jlo7I33puv1TSSopCW7xSrfikLPyz1
 MwSPmOmPrvNdg==
Date: Mon, 4 Jul 2022 11:13:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: bus_type: fix remove and shutdown support
Message-ID: <YsJ97kNAmz7U+42m@matsya>
References: <20220610015105.25987-1-yung-chuan.liao@linux.intel.com>
 <YrQca7YH8v6XCl02@matsya>
 <a861f3b2-dec4-982d-0939-1dfc18dd2f53@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a861f3b2-dec4-982d-0939-1dfc18dd2f53@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com
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

On 23-06-22, 09:54, Pierre-Louis Bossart wrote:
> 
> 
> On 6/23/22 02:55, Vinod Koul wrote:
> > On 10-06-22, 09:51, Bard Liao wrote:
> >> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>
> >> The bus sdw_drv_remove() and sdw_drv_shutdown() helpers are used
> >> conditionally, if the driver provides these routines.
> >>
> >> These helpers already test if the driver provides a .remove or
> >> .shutdown callback, so there's no harm in invoking the
> >> sdw_drv_remove() and sdw_drv_shutdown() unconditionally.
> > 
> > Okay sounds good
> > 
> >> In addition, the current code is imbalanced with
> >> dev_pm_domain_attach() called from sdw_drv_probe(), but
> >> dev_pm_domain_detach() called from sdw_drv_remove() only if the driver
> >> provides a .remove callback.
> > 
> > Am not sure I follow what is imbalance, pm_domain_attach/detach?
> 
> Yes, the dev_pm_domain_detach() is done conditionally, depending on the
> presence of a driver .remove callback, that's not so good.

Sorry am bit confused now, this is what I have in sdw-next

static int sdw_drv_remove(struct device *dev)
{
        struct sdw_slave *slave = dev_to_sdw_dev(dev);
        struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
        int ret = 0;

        if (drv->remove)
                ret = drv->remove(slave);

        dev_pm_domain_detach(dev, false);

        return ret;
}

I see that dev_pm_domain_detach() is called unconditionally and not
dependent on remove method which seems right to me.

The code seems same since 9251345dca24b

-- 
~Vinod
