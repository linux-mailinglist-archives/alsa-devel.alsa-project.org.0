Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF937A596
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 13:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1062F17B7;
	Tue, 11 May 2021 13:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1062F17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620732024;
	bh=3965pDIxL3ePZ2py6vgy+3FF19ziZfQsspyiY3RjjYg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRF2T/J0JxwormQaNck98N1YNo/lWK9sCqdF2vtPP/pHWQmVnjz7zxvWe1xJWyDgQ
	 YaXnt/6sGF/cCuSnVxMzaEbI2UUk0yaN/V+LSsX0mSXULSfPYvevzZbhc98fYettnS
	 MHiM5YnfWuS4i8BCNWcOUkZMl3rgIctODN+vCH7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E46F8016B;
	Tue, 11 May 2021 13:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9913F80163; Tue, 11 May 2021 13:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5458DF80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 13:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5458DF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HEWeDWBk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19CD561363;
 Tue, 11 May 2021 11:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620731929;
 bh=3965pDIxL3ePZ2py6vgy+3FF19ziZfQsspyiY3RjjYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HEWeDWBkJCFFXTbE3xs724vpb7eYa3LrCSF3Lw+g8mQbYRHwjddabjl6rV11nKyAe
 5ZMT4xYx5cZMXxOfzugimPrQu9LsBYDU+sNoqmR7ioRzQkft4tb3zf9La0JY3ZTswg
 6X0SsIB6Zmn8sLkCCanPzVzlqcUQl658fBP+P4tci3n0ZenMJmtDAuhOKvwG06lCuS
 avfcmU5dxkJo91JTv6x0xxyPswG6zwHqUfEEfUQPsBm+hv0deDT8dtFDf/zEb/HKG+
 2P6j/loU6mCA+MWk7Q6WJNjSy8UwqWj4g0juHYqcH8iwCgR7VX+e7UXb1fhttdqAe9
 Kl+6KefOpCu1g==
Date: Tue, 11 May 2021 16:48:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: fix handling of
 qcom,ports-block-pack-mode
Message-ID: <YJpoFQkvbXLOe6ik@vkoul-mobl.Dlink>
References: <20210504125909.16108-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210504125909.16108-1-srinivas.kandagatla@linaro.org>
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org, sanyog.r.kale@intel.com,
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

On 04-05-21, 13:59, Srinivas Kandagatla wrote:
> Support to "qcom,ports-block-pack-mode" was added at later stages
> to support a variant of Qualcomm SoundWire controllers available
> on Apps processor. However the older versions of the SoundWire
> controller which are embedded in WCD Codecs do not need this property.
> 
> So returning on error for those cases will break boards like DragonBoard
> DB845c and Lenovo Yoga C630.
> 
> This patch fixes error handling on this property considering older usecases.

Applied, thanks

-- 
~Vinod
