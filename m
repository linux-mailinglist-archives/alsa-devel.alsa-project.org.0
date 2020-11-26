Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 657852C4E03
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 05:28:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F5B17CF;
	Thu, 26 Nov 2020 05:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F5B17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606364919;
	bh=9Ab23uvA6gXoRUJ95dH3UVCAG+CifoKA/aDKNyM0a8A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcVlQP/wZOfU8voKl6Kdi1qVN6IFQTidTDfSkaYrnfqu3HaKqM5KjyyhPh1FBZUoE
	 LcTfLXjp36H+3K275JcF6+5iqBf4sNm1vGb0VbgL9/Gq+qJwjHNHuJudUa33mVkk0w
	 E+QdTgrH+hp5LM5UcwMuAZhTK+DpQSuD3/s+MLMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 898F3F80166;
	Thu, 26 Nov 2020 05:27:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E305AF80165; Thu, 26 Nov 2020 05:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D88E7F80128
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 05:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88E7F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fLtI8KH5"
Received: from localhost (unknown [122.179.79.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C51521741;
 Thu, 26 Nov 2020 04:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606364811;
 bh=9Ab23uvA6gXoRUJ95dH3UVCAG+CifoKA/aDKNyM0a8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fLtI8KH5wUOVTxE+nyeGSuezEqsK9cAE8jeOLXlbIz2kEvhFGmE/9CSTPV059Kh9E
 vJB0YPH/jG+5eOGo8oa6nwmq+pkzRp13wRnULW4s46O7X0NKgIBWUdsJ5osuvf4Ekt
 FWEaez9fYQuTMifCzBS7flTgh7GbkYad1jMg4bys=
Date: Thu, 26 Nov 2020 09:56:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
Message-ID: <20201126042646.GH8403@vkoul-mobl>
References: <202011030351.iq9CBMO3-lkp@intel.com>
 <e0d74391-18ae-0493-b8a1-cbeb6f00bde8@infradead.org>
 <20201125055155.GD8403@vkoul-mobl>
 <6e298ed8-dc23-7a1f-1bb1-44ba2f43ee07@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e298ed8-dc23-7a1f-1bb1-44ba2f43ee07@infradead.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 25-11-20, 09:31, Randy Dunlap wrote:
> On 11/24/20 9:51 PM, Vinod Koul wrote:

> > From: Vinod Koul <vkoul@kernel.org>
> > Date: Wed, 25 Nov 2020 11:15:22 +0530
> > Subject: [PATCH] soundwire: qcom: Fix build failure when slimbus is module
> > 
> > Commit 5bd773242f75 ("soundwire: qcom: avoid dependency on
> > CONFIG_SLIMBUS") removed hard dependency on Slimbus for qcom driver but
> > it results in build failure when:
> > CONFIG_SOUNDWIRE_QCOM=y
> > CONFIG_SLIMBUS=m
> > 
> > drivers/soundwire/qcom.o: In function `qcom_swrm_probe':
> > qcom.c:(.text+0xf44): undefined reference to `slimbus_bus'
> > 
> > Fix this by using IS_REACHABLE() in driver which is recommended to be
> > sued with imply.
> 
>   used

right

> 
> > 
> > Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks I have added this and Srini's and pushed out now.

-- 
~Vinod
