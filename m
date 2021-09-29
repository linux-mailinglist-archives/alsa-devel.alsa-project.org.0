Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0441C686
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 16:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34EBB16AE;
	Wed, 29 Sep 2021 16:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34EBB16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632925054;
	bh=PZz+ZH3Vreps/V6j5gmHb83bWeqVEB1W7ByJv0AFxwQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJQPFG4bL223qF8GYMF9g6EE4gcVehxTEp9kLSovs75pBTMf+Fjm1xUNOM+flkjKo
	 e4258AG/9uwAS5iATamCU4jLCsJasGJkPlnz/aAm8/oii+dHqSRKFxGR1pT9XmDoxH
	 6fGvYMtsIDZfXVctk3U5UggdjK55JUC7NIWjFOWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2890F80105;
	Wed, 29 Sep 2021 16:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76392F80227; Wed, 29 Sep 2021 16:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B41F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 16:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B41F80105
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="221743899"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="221743899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:15:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="588060112"
Received: from ibarchen-mobl.amr.corp.intel.com (HELO [10.209.150.234])
 ([10.209.150.234])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:15:47 -0700
Subject: Re: [PATCH v2 1/2] ALSA: hda: Reduce udelay() at SKL+ position
 reporting
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210929072934.6809-1-tiwai@suse.de>
 <20210929072934.6809-2-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <de3688c6-2246-a7ec-cfd9-6bc4cde0467b@linux.intel.com>
Date: Wed, 29 Sep 2021 09:15:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929072934.6809-2-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@kernel.dk>
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


> @@ -874,11 +896,7 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
>  	if (azx_dev->core.substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>  		return azx_skl_get_dpib_pos(chip, azx_dev);
>  
> -	/* For capture, we need to read posbuf, but it requires a delay
> -	 * for the possible boundary overlap; the read of DPIB fetches the
> -	 * actual posbuf
> -	 */
> -	udelay(20);
> +	/* read of DPIB fetches the actual posbuf */
>  	azx_skl_get_dpib_pos(chip, azx_dev);

I don't think extra read has any effect, it could be removed....

>  	return azx_get_pos_posbuf(chip, azx_dev);
>  }

The suggestion was to further simplify with

static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev
*azx_dev)
{
	return azx_get_pos_posbuf(chip, azx_dev);
}

i.e. same behavior on playback and capture. that's the recommendation
from Intel hw folks.
