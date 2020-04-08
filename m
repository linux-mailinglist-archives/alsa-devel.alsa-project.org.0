Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6BB1A278B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 18:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8011663;
	Wed,  8 Apr 2020 18:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8011663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586364865;
	bh=4yCXTf43uBNqiLCcxRPdhdzXfmZB5L9Xuwtg74Ufb3s=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BzhEuD/0GoRy61ZjdPDqNEQr1riUzWdHmb4+GI3A/0WY/xAuoSB83lE0cbPkex0gh
	 NdB/rYG3/bJQRj+4tofNZlCMVtbnEmgw/88P86pY4ukAxnhl0dlbSoRIyErzeJmXvL
	 SCO9HxEF0jIWhM1M1Pgcm3f7ryd1TbejF3HMUeN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D85EAF80105;
	Wed,  8 Apr 2020 18:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D5A1F80143; Wed,  8 Apr 2020 18:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 709A8F80105
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 18:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709A8F80105
IronPort-SDR: VG6WSLJ6PfBNmngC7Xr1Isr1MMz69dprKpqy5EnWRCpo+soXHkAkFCaBrKaep63sjTh/RBsp2T
 yJ95eBiALpew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 09:52:28 -0700
IronPort-SDR: yitxkepZ3b8f8H1BdGYLf6nkY4x4WuOsVc1a0aWY+qaTsEQe6VP4E8qUgQxICfiKX7yjfNjl5T
 yNOizh0HMEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="253845686"
Received: from ktseng-mobl1.amr.corp.intel.com ([10.252.143.39])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2020 09:52:27 -0700
Message-ID: <0021e9d8401927e1e42516c11d2789a8ecd93385.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/6] ASoC: topology: Propagate error appropriately
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>, Takashi Iwai
 <tiwai@suse.com>
Date: Wed, 08 Apr 2020 09:52:26 -0700
In-Reply-To: <2022e6f2-e3d0-746d-1d98-be4ea8e5d8f1@linux.intel.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
 <e345ffe1-1593-49c0-32bd-4637bc1764da@linux.intel.com>
 <a7b5e659-01c9-f966-2d26-cac8d10b96bb@linux.intel.com>
 <f924fe56-0395-11af-244f-7074b7a704e5@linux.intel.com>
 <2022e6f2-e3d0-746d-1d98-be4ea8e5d8f1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 2020-04-08 at 16:46 +0200, Amadeusz Sławiński wrote:
> 
> On 4/8/2020 4:20 PM, Pierre-Louis Bossart wrote:
> > 
> > > > Looks good to me
> > > > 
> > > > Reviewed-by: Pierre-Louis Bossart <
> > > > pierre-louis.bossart@linux.intel.com>
> > > > 
> > > > We probably want Ranjani to double-check this series though.
> > > > 
> > > 
> > > Hi Ranjani, can you take another look, I would like for this to
> > > get 
> > > merged before I forget about it ;)
> > 
> > Ranjani provided her Reviewed-by tag on March 30 - likely our
> > emails 
> > crossed.
> 
> That's probably what happened, I only asked, because "double-check" 
> comment above caused me to think it may need another look. Thanks,
> for 
> confirming it's good.
Sorry for the confusion, Amadeusz/Pierre. Yes, I didnt want to reply
and add noise as I had already reviewed the series.

Thanks,
Ranjani

