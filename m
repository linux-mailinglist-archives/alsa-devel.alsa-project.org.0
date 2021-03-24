Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3E347CCA
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 16:38:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25DE16A1;
	Wed, 24 Mar 2021 16:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25DE16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616600302;
	bh=um4bomVqQ2yJoGyNGBuY83Bs+0PURfJEENQtr73jsvk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lyUe8TdJpNpuRyz63GGW3RLhmTFMqJkBCAk5tjah89C++j5ihqvbf7Omf3EM0m5Xi
	 KGQTaYCZfxDOAZg5yhYjnrMt0V2rA2cFfBeQLPzdWlmT7r3Eq7sGWDfWMejPe3uv6R
	 qo5yKs2hKiuCkR2ZUwHvkR1mNcfiyhFHuRg4rIKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55401F800FF;
	Wed, 24 Mar 2021 16:36:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7093F80104; Wed, 24 Mar 2021 16:36:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9645DF80104
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 16:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9645DF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="NmEeirt6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28AAD619E5;
 Wed, 24 Mar 2021 15:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616600200;
 bh=um4bomVqQ2yJoGyNGBuY83Bs+0PURfJEENQtr73jsvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NmEeirt6LIWYbt7FbaQaVAKjzNYEH0R0YEGBeOxxyM1xaLIM11vjDMWsv/xD1QjcE
 IKcHhdvnN9qw9K/WiSHxLDQqCVwsDkkGHaLl+LAlXlrcL/GmW3e5ljmDQ97JnXIF9I
 +y9pyOkkyXrgjWhDB3qrehGsa59ciCcqX6GM86RI=
Date: Wed, 24 Mar 2021 16:36:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: move to auxiliary bus
Message-ID: <YFtchhxHDjfbyY46@kroah.com>
References: <20210323004325.19727-1-yung-chuan.liao@linux.intel.com>
 <YFmatyAoMZmBmkuZ@kroah.com>
 <777b4ca6-0d51-285d-549f-6ef768f2a523@linux.intel.com>
 <YFo0WW8hOsHesSFC@kroah.com>
 <35cc8d35-a778-d8b2-bee3-bb53f8a6c51e@linux.intel.com>
 <YFsG00+iDV/A4i3y@kroah.com>
 <357d9576-f79a-0ea6-eee4-292e27597565@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <357d9576-f79a-0ea6-eee4-292e27597565@linux.intel.com>
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
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

On Wed, Mar 24, 2021 at 09:55:01AM -0500, Pierre-Louis Bossart wrote:
> Note at this point it would mean an API change and impact the existing
> Nvidia/Mellanox code, we are using the same sequence as them

THere is no "stable api" in the kernel, so if something has to change,
that's fine, we can change the users at the same time, not an issue.

thanks,

greg k-h
