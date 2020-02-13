Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD215BCD5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 11:31:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 679E61673;
	Thu, 13 Feb 2020 11:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 679E61673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581589869;
	bh=PhT+k4E3plDMKMafhy6wmReSy8x4+S8oMHHSqf5z61g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OW1P/Zj4+U6lW2rnFFUqBPcYdR8IFgxhHsH6bAwkVndL0tiKR0/Xe6vkMnZ4o/Ggb
	 /pYJ7cGNgby5uByDOEyeZxDxW+UC6nfmfb7a+p5Il5Go9IlmBcqghKuq5S8UZmlFQ1
	 Fd7PambW6yEAD6G32NCZ59TYyqCPrNvSFDyp5fcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD29F80138;
	Thu, 13 Feb 2020 11:29:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2256DF80145; Thu, 13 Feb 2020 11:29:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D3AF80138
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 11:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D3AF80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KIgwxVl4"
Received: from localhost (unknown [106.201.58.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E83E320873;
 Thu, 13 Feb 2020 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581589756;
 bh=C+n8gkGa1BrkuFQo4Be8BYQ2BPP8MlNxfJQPsD8YUac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KIgwxVl4CVgxmncvBodw4ff3mLXhjEUUoiQZEiL1ht9+bdPeXNFToVgf2/tACq4rS
 9QAciZqn5Ck6g0vX0Z6SVQwpaspLdGNybti1ZfXSFQMchWKJjkh3pf8F0/nnt1pKc2
 3wsb8b0VfSa6Vi97kLXZmyeGg+MLpn8sye+RApRY=
Date: Thu, 13 Feb 2020 15:59:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200213102911.GE2618@vkoul-mobl>
References: <20200114235227.14502-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114235227.14502-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 0/5] soundwire: stream: fix state
 machines and transitions
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

On 14-01-20, 17:52, Pierre-Louis Bossart wrote:
> The existing stream support works fine with simple cases, but does not
> map well with ALSA transitions for underflows/resume where prepare()
> can be called multiple times. Concurrency with multiple devices per
> links or multiple streams enabled on the same link also needs to be
> fixed.
> 
> These patches are the result of hours of validation on the Intel side
> and should benefit other implementations since there is nothing
> hardware-specific. The Intel-specific changes being reviewed do depend
> on those stream changes though to be functional.

Applied, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
