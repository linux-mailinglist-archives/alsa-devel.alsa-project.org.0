Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E253C7349
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 17:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 041F5169D;
	Tue, 13 Jul 2021 17:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 041F5169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626190228;
	bh=gOuRZDOYmljkDFmtMTw25gvRbfMAOMwp1yboCXsmffI=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMVU9/4rAw/dOXh2RhqJ6c/tF/EgwtgRdafqk969FtJpLG4ANT2gYVdkwP27bMUO5
	 RpjkR+dqMLEB9vjhtMSwzEU9Kjj7BLXCtcKsikliFTMnb5Lk6w1sZHkXMjSIx+WKw7
	 uGh/8QGXVUJauuFMWzsQMqV3s76808vsZCqlxysA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7611F80430;
	Tue, 13 Jul 2021 17:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39F59F80430; Tue, 13 Jul 2021 17:28:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 344A0F800ED
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 17:28:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 344A0F800ED
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="209999106"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="209999106"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 08:23:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="493853545"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.79])
 ([10.237.180.79])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 08:23:27 -0700
Subject: Re: [PATCH 15/51] ALSA: ens137x: Allocate resources with
 device-managed APIs
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210713142857.19654-1-tiwai@suse.de>
 <20210713142857.19654-16-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <e7601f56-fd97-7c86-362e-778c6b1c3f65@linux.intel.com>
Date: Tue, 13 Jul 2021 17:23:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142857.19654-16-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/13/2021 4:28 PM, Takashi Iwai wrote:
> This patch converts the resource management in PCI esn137x drivers
> with devres as a clean up.  Each manual resource management is
> converted with the corresponding devres helper, the devres helper is
> used for the DMA buffer page allocations, and the card object release
> is managed now via card->private_free instead of a lowlevel
> snd_device.
> 
> This should give no user-visible functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/pci/ens1370.c | 115 +++++++++++---------------------------------
>   1 file changed, 27 insertions(+), 88 deletions(-)
> 
> diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
> index 728b69dad21b..2651f0c64c06 100644
> --- a/sound/pci/ens1370.c
> +++ b/sound/pci/ens1370.c
> @@ -414,7 +414,7 @@ struct ensoniq {
>   	unsigned int spdif_stream;
>   
>   #ifdef CHIP1370
> -	struct snd_dma_buffer dma_bug;
> +	struct snd_dma_buffer *dma_bug;


You seem to touch all uses of this variable and it seems like it has a 
typo (dma_bug -> dms_buf), not sure if it can be corrected in this patch 
or separate one.

