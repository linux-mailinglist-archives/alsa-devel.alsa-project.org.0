Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B50CB30FF76
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 22:45:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CDE91661;
	Thu,  4 Feb 2021 22:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CDE91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612475146;
	bh=ZdKJB4+LlsJgdRer2j/VwaPk7Goc5iGQIRPqzcRA/EE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ka2xqFbAjchNdomaXGIaBMxbk1yteLnHkPyJVpcWtOMOs1be9yR7Oh0kYuuwdVMgM
	 VJy1olVKCUTzdsSHS8/rXWIMhmX6ydH/PpxL7jgNJC109WyIMxvDKfOtyFWzqs7yXx
	 o46wS/RtUQJTiR/wUJ7J2Gjl1SUTPZMeQsiBwUYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70AEAF80154;
	Thu,  4 Feb 2021 22:44:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E58EF80171; Thu,  4 Feb 2021 22:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44BCBF80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 22:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44BCBF80154
IronPort-SDR: pzUXAFxRBCHcqTC0GiwtcaLx4vS+2p/xa9Uxqp4MnLiR+nkNW1nU0NE4Cc2Uvkk4nTwhI20ckv
 h+KG/8JfqbAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="168450756"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="168450756"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 13:44:06 -0800
IronPort-SDR: CWb7u7BXXS8jTpIEo/5O3/wDsgcX/ML0vin+jDU6IcCQv+SNsMwMvoEDEMMWs45Jdy+kZtcyDu
 NLfWydNSDRWw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="373036855"
Received: from rkmohamm-mobl.amr.corp.intel.com (HELO [10.209.0.93])
 ([10.209.0.93])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 13:44:03 -0800
Subject: Re: [PATCH v5 3/5] ALSA: usb-audio: Avoid unnecessary interface
 re-setup
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210108075219.21463-1-tiwai@suse.de>
 <20210108075219.21463-4-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <87fd2b96-1e4f-aa1a-3048-9c57351519b6@linux.intel.com>
Date: Thu, 4 Feb 2021 15:44:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108075219.21463-4-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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



>   /**
> - * snd_usb_endpoint_free: Free the resources of an snd_usb_endpoint
> + * snd_usb_endpoint_free_all: Free the resources of an snd_usb_endpoint
> + * @card: The chip
>    *
> - * @ep: the endpoint to free
> - *
> - * This free all resources of the given ep.
> + * This free all endpoints and those resources
>    */
> -void snd_usb_endpoint_free(struct snd_usb_endpoint *ep)
> +void snd_usb_endpoint_free_all(struct snd_usb_audio *chip)

this causes warnings with make sound/ W=1

   CC [M]  sound/usb/endpoint.o
sound/usb/endpoint.c:1459: warning: Function parameter or member 'chip' 
not described in 'snd_usb_endpoint_free_all'
sound/usb/endpoint.c:1459: warning: Excess function parameter 'card' 
description in 'snd_usb_endpoint_free_all'

the following diff removes it, but I don't know if the description is 
good enough...

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8e568823c992..4d1c678a0d80 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1451,7 +1451,7 @@ void snd_usb_endpoint_release(struct 
snd_usb_endpoint *ep)

  /**
   * snd_usb_endpoint_free_all: Free the resources of an snd_usb_endpoint
- * @card: The chip
+ * @chip: The chip
   *
   * This free all endpoints and those resources
   */

