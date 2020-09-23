Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F2275503
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 12:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32475174C;
	Wed, 23 Sep 2020 11:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32475174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600855247;
	bh=gXbJ4m3EOZZIo68OmhBK/pSuASydiqJQCDYHTsm+A+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KnLyVKB7MEzC4NCA3+0P7LUoLdoGjHu9fcJC3lZhNfwxq+cJ3Y1l3Ws5z+RHV5dDR
	 IQBopCge6MbeYjINYd311OYwJmNPFmdEcrya+mxnY+zbuzOw5ijNBvWD+hynS9yNAx
	 0jJV7LjivuQbV6SZ+4xHFPTqjM11ZiWGf41bRF1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AC0FF80162;
	Wed, 23 Sep 2020 11:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 778DDF801EC; Wed, 23 Sep 2020 11:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19A2F80162
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 11:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19A2F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q7moUM9h"
Received: from localhost (unknown [122.171.175.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 073932076A;
 Wed, 23 Sep 2020 09:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600855187;
 bh=gXbJ4m3EOZZIo68OmhBK/pSuASydiqJQCDYHTsm+A+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q7moUM9hDNa6yVYV/Akfr9mwsSyjdfx8/42T8ZXZRBMg90PB2MQuTDYLxRv1bb4qM
 IoNY7sguQBc5ZM1dFosz2A7rqM5uKycTMqJFhpk+1lhsN8xevBwjEs/HupwvNbvuq6
 6Jm3p0c6Mmh5nivWGzz+jIrZfPesiZ8AMOnbCjY8=
Date: Wed, 23 Sep 2020 15:29:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] soundwire: enable Data Port test modes
Message-ID: <20200923095939.GE2968@vkoul-mobl>
References: <20200920193207.31241-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200920193207.31241-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 21-09-20, 03:32, Bard Liao wrote:
> Test modes are required for all SoundWire IP, and help debug
> integration issues. This series adds debugfs support and data
> port test fail interrupt to enable data port test mode feature
> on Intel platforms. 

Applied, thanks

-- 
~Vinod
