Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CB10B0D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8424E1713;
	Wed,  1 May 2019 18:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8424E1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556727376;
	bh=E4oF5NfS+GKzuUMy/dkhf1akglYLyPA+6HXSLc8CBcg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOxDEFsWF4Rtml+pp1BKuP/kXOed7pqfztdzsaJr8DvXZovRy0E+iWU/r6QwPk8yk
	 HKtCUmePLtqZ0jaWQwgsogjX1/8dngKJ8ymiCo+Wr6S2DESJXFaw4jqbte+GBHaumL
	 kHKfnPX1MM9zrGgHkPJNhIibIu+Hnlps8u2ChxOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D03F89723;
	Wed,  1 May 2019 18:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC7E6F89721; Wed,  1 May 2019 18:08:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D73B1F896B7
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 18:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73B1F896B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pn8HFtZy"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E1F720644;
 Wed,  1 May 2019 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556726878;
 bh=+QIyFl4ZWzWfYiBsaC7r50ojqsjlAp1dymkvBkiQ/pY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pn8HFtZyku6oFfPBfqbOyEnDViKE0ERz1S/TFFCygWgf+O0jBRtXinLeWBs7QdMrv
 6PO4n1PpwjOlgXy8QgB4pwWJLJrY+1rFPNXUbSjplctvDKExyQQAaGzcBn/sKnGphB
 wSDCxl41/h+iv3bpPOmD9ZDqi7ZJUIYPVMmkbvM8=
Date: Wed, 1 May 2019 18:07:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190501160755.GC19281@kroah.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: Re: [alsa-devel] [PATCH v4 00/22] soundwire: code cleanup
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

On Wed, May 01, 2019 at 10:57:23AM -0500, Pierre-Louis Bossart wrote:
> SoundWire support will be provided in Linux with the Sound Open
> Firmware (SOF) on Intel platforms. Before we start adding the missing
> pieces, there are a number of warnings and style issues reported by
> checkpatch, cppcheck and Coccinelle that need to be cleaned-up.
> 
> Changes since v3:
> patch 1,3,4 were merged for 5.2-rc1
> No code change, only split patch2 in 21 patches to make Vinod
> happy. Each patch only fixes a specific issue. patch 5 is now patch22
> and wasn't changed. Not sure why Vinod reported the patch didn't
> apply.
> Added Takashi's Reviewed-by tag in all patches since the code is
> exactly the same as in v3.

These all look good to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Vinod, want me to just pick these up from the list as-is so we can get
them into 5.2-rc1?

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
