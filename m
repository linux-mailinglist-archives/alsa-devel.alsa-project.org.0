Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7161129D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 07:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 467D21769;
	Thu,  2 May 2019 07:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 467D21769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556775083;
	bh=7uo2M/B41kWlsm9LI3NVa0n5m0JsNG+f9QcHNeTTqPc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HIf7I21mAVf/MQuyylGkRjlw7JVm+gt7oHu4zWY1RMtOk/L1q5eksdpM5HYnCud2F
	 iZH8LJMMd0R7M7hl+EQEeBOrCr+zGW7zszJFW27QYR6vVJhxIiP0arPlU2pI6bJTv9
	 jBThUv7UMChrJkRxKH6zKdSOBCEFv8MliEbx2m80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 281B6F896FA;
	Thu,  2 May 2019 07:29:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055BEF896FA; Thu,  2 May 2019 07:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E526CF896EA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 07:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E526CF896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vE8lDiI7"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B1112089E;
 Thu,  2 May 2019 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556774753;
 bh=svo261ePVl1LIloKIObODZ39QGmPxBU9BQXRPFDEf5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vE8lDiI7T2hTUwHxxGkhdGThq/gA/6/DqSa7gfKo3DV5R32TpwVWWcnra7kcuWQgz
 ypG0Jm1dGNy3imzC/y/A7K7tXCI748Yozh6d7qak9rak2k0hGZUMgJkZNZLEGZRlKG
 OsI7UIPVh2Ure05lGhSBoV7a/7nBPmlTOs3zA1jM=
Date: Thu, 2 May 2019 10:55:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190502052544.GB3845@vkoul-mobl.Dlink>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190501155745.21806-4-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 03/22] soundwire: fix alignment issues
	in header files
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
> use Linux style
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.h            | 12 ++++++------
>  drivers/soundwire/cadence_master.h | 18 +++++++++---------

Again this touches core and lib.

Btw I applied the patches to check for alignment and they look good on
that part.

Thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
