Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27989112A8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 07:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EF271779;
	Thu,  2 May 2019 07:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EF271779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556775589;
	bh=ef9rngB4cklV2IJRZmtoJfVDpPa/cQ8wvN4VcSnJ2B8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZhgEWCA0sAERCNmsTp+C+h2yhJb8xxkQrD6ZqtyvSirr/bDrclpLy/RISqfhYTf4a
	 VJ+SFDVOjqrQiUIOWksTs2+GuQn1yeCz4BEfGayevgpOrFEfOj4kxI5ctXCcYW3SSh
	 ucGMHQeNRkwt3HyWte6Qc9E/QbspohrcuE8MnLdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D21AF896EA;
	Thu,  2 May 2019 07:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5DC0F896AA; Thu,  2 May 2019 07:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51FAEF80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 07:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51FAEF80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HTZNCRqx"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88F7220873;
 Thu,  2 May 2019 05:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556775475;
 bh=1DawRFLT7t05k8v0cV9BglVQshWM9ob5TgAeTumjZ+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTZNCRqxAwj7YMKiu8DsWogyCAiJIhuF0jiFeHK2QS4mnX7T4WhzvPKCPhcgvYhiw
 BUpCjng8msMo43DijBSVgEUUvtznjNbNizYGxVRD+OLZzrcsEN13LjYB4/2Uth1PrF
 OzD5qxyOnmOtZWIRSbvGP3dMAxL7ri0Unr01+Ius=
Date: Thu, 2 May 2019 11:07:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502053746.GE3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-23-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-23-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 22/22] soundwire: add missing newlines
 in dynamic debug logs
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

On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> For some reason the newlines are not used everywhere. Fix as needed.
> 
> Reported-by: Joe Perches <joe@perches.com>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c            |  74 +++++++++----------
>  drivers/soundwire/cadence_master.c |  12 ++--
>  drivers/soundwire/intel.c          |  12 ++--
>  drivers/soundwire/stream.c         | 110 ++++++++++++++---------------

Sorry this needs to be split up. I think bus.c and stream.c should go
in patch with cadence_master.c and intel.c in different ones


>  4 files changed, 104 insertions(+), 104 deletions(-)
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
