Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF526C3DF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 16:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF74C1680;
	Wed, 16 Sep 2020 16:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF74C1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600267848;
	bh=xciECLeowjq9oRm5zSpSaLEMfjQl3cjS16SOJpmO/h4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KInOaj00rVSW3HqMsfgUh7ZVoAKd2km3Z9nghk6l0C/hYmP02zIE0o/r0P/4znA20
	 uMa2Ni1x3l49U7EFS3b5olE26eZ15EMSp7w55GTB2QceEYdnxaDM6lheabmxOOdbne
	 CjomgnHZ7UlMmh8wfWkvxdcUQRZ7p5oQHKpE6bAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E36ECF800BB;
	Wed, 16 Sep 2020 16:49:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72DA9F8015A; Wed, 16 Sep 2020 16:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C7D0F800BB
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 16:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C7D0F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rk0IbZhm"
Received: from localhost (unknown [122.172.186.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4389F206B6;
 Wed, 16 Sep 2020 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600267741;
 bh=xciECLeowjq9oRm5zSpSaLEMfjQl3cjS16SOJpmO/h4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rk0IbZhmcjCCVrlZD0ocwFS4EDzxXZOajRd7LCMMZBzcOOU7iQStzKL4xNIogEJQB
 CZvsgOQ6+TLv8BVcwb18Ade8Stb1tL2cp3NnrxqKRQ7ENW2DQWJnFMUHGGygMSqZGB
 6VeqVJcZKJ5tMl4/nKvY5rD0Dl2aZcP0bUeI3Nbc=
Date: Wed, 16 Sep 2020 20:18:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/3] soundwire: qcom: clear BIT FIELDs before value set.
Message-ID: <20200916144852.GS2968@vkoul-mobl>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
 <20200916092125.30898-2-srinivas.kandagatla@linaro.org>
 <20200916124634.GM2968@vkoul-mobl>
 <24401c7c-b12c-0924-9d8f-fde633d15918@linux.intel.com>
 <20200916142929.GR2968@vkoul-mobl>
 <42bbf464-2bc9-2b13-5f08-a19ad1848277@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42bbf464-2bc9-2b13-5f08-a19ad1848277@linux.intel.com>
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 16-09-20, 09:36, Pierre-Louis Bossart wrote:
> 
> 
> On 9/16/20 9:29 AM, Vinod Koul wrote:
> > On 16-09-20, 08:18, Pierre-Louis Bossart wrote:
> > > 
> > > > > According to usage (bitfields.h) of REG_FIELDS,
> > > > > Modify is:
> > > > >     reg &= ~REG_FIELD_C;
> > > > >     reg |= FIELD_PREP(REG_FIELD_C, c);
> > > 
> > > 
> > > if this is indeed the case, all the code in cadence_master.c is also broken,
> > > e.g:
> > > 
> > > 	dpn_config = cdns_readl(cdns, dpn_config_off);
> > > 
> > > 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_WL, (p_params->bps - 1));
> > > 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_FLOW, p_params->flow_mode);
> > > 	dpn_config |= FIELD_PREP(CDNS_DPN_CONFIG_PORT_DAT, p_params->data_mode);
> > 
> > This should be replaced with u32_replace_bits(), i am sending the fix
> 
> wondering if we should replace all uses of FIELD_PREP with either
> u32_insert_bits() or u32_encode_bits() then?

That might be overkill as in the rest of the cases we have

        foo = FIELD_PREP();
        foo |= FIELD_PREP();

so the first one would set the bitfield and clear the rest

Thanks
-- 
~Vinod
