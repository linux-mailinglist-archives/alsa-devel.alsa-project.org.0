Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7720112DA
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 08:00:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 382A3177D;
	Thu,  2 May 2019 07:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 382A3177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556776815;
	bh=7WC8TjI2GPDWqtmzM4Otc4ejlCdJGPMlwqUkHcSvFfg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q898pZ3EePnaHu7TQoMbI4eK07pTwMrxMRfsixB+tau/TCRBnyZ70DDMPJalxh64q
	 XMQhdq5E2RzsFTLf4qhPVezylv+FKQD6ZWg4Kd2ESu9pynvwX6BHbNHxV1SmhEDwyw
	 KvvN2ZTG5M9A6cZICsR2CroLrsi0ijowgutJnWwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D86F896C7;
	Thu,  2 May 2019 07:58:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 276BDF896AA; Thu,  2 May 2019 07:58:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DF72F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 07:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DF72F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G+GHLooM"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 940062081C;
 Thu,  2 May 2019 05:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556776701;
 bh=VVm1IT8lHYMG8BSjGXWoh+S3MS5Pme6RzDKRC1QF4oI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+GHLooM/7U0+4+BYVcIrg/iHD0dyRhMeGbsrKlw6pPL9J+QrCmvb5Ugs8aXB2x/5
 awBmo6gka8d4mBFIBk3ZCiRWiNUyqVVBVxMxhNzjkE66f60oSN6N+YIZpONOkVLYF3
 Jq4AhjcL5a4NnaJJwGtxyKkR07dvL+9EOy88+ZmE=
Date: Thu, 2 May 2019 11:28:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502055812.GG3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com
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

On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> SoundWire support will be provided in Linux with the Sound Open
> Firmware (SOF) on Intel platforms. Before we start adding the missing
> pieces, there are a number of warnings and style issues reported by
> checkpatch, cppcheck and Coccinelle that need to be cleaned-up.

Applied all expect 2, 3, 6 and 22

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
