Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2713B903
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 18:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CFE16A9;
	Mon, 10 Jun 2019 18:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CFE16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560183028;
	bh=9fPz/KaQjae7FhXqM7w5Qx/VYuSnZMynM9fAiKzHP08=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RmBLC14PG35JKpv2MZyD/JoBw10Uzy47dyft6Z6zPYugtgr5+KNXACVkzoshaxFf7
	 FFv3auijA3AOfF+TolqrOQEYQxwb4SSVIIy6C/HDTLc3s8m02Z1CHldCZl7YwQEc0m
	 Wrv8dcG6PxX33WVm3juO1qwH8lRrGXOMqZmsgQ6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 619B0F896CE;
	Mon, 10 Jun 2019 18:08:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B7D8F896E0; Mon, 10 Jun 2019 18:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03CF1F8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 18:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CF1F8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G2Fzh1/l"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E849206C3;
 Mon, 10 Jun 2019 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560182916;
 bh=ZtNUSzbFWBP+Y9CmJmQq8BDR93VCYjkpf3T7ltz/JGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2Fzh1/lSxF4hdh72/5IKUFKc0LsnhwOcBrgXN21ajtqxRf5vcozIdqP7b7RuOweF
 6+pNnGuUHanfp7JksppV9zwROfrE2FwXOiuGSveaiW3cWoX6E035XZ6Yopl6EmpqV7
 TKE5dBCsvyJxyaUOxpnBjA6F8tzjL7GYc8FNuLrU=
Date: Mon, 10 Jun 2019 18:08:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190610160828.GA21088@kroah.com>
References: <20190607095633.GD9160@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607095633.GD9160@vkoul-mobl.Dlink>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [GIT PULL]: soundwire fixes for v5.2-rc4
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

On Fri, Jun 07, 2019 at 03:26:33PM +0530, Vinod Koul wrote:
> Hey Greg,
> 
> Please consider pull to receive fixes for soundwire for 5.2. We have 3
> fixes done by Srini and all are in linux-next
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.2-rc4

Pulled and pushed out, thanks.

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
