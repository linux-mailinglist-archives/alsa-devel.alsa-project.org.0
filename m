Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8073D9D617
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E4AC16CA;
	Mon, 26 Aug 2019 20:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E4AC16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566845938;
	bh=jN9PkDt8n41yhjNAYKJViszi64UO2lUka8begrIZ+C8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJqUhTpmeehLEI6QPgNIRUqgarB61OUdX0dv4CrbgV+bpErvkgaIkxxMTTkWPXhLr
	 xQq5kbcdD9mHuDyHpdwaTMWepZbafOeXbSiHiQ33j/ESeNmbvrZKzdf6PUxZDwpK2X
	 Sci++8Trp1z9ZsUybX31Bv+vA9kfNwausKDDjUEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B67CF805FF;
	Mon, 26 Aug 2019 20:55:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48F38F8038F; Mon, 26 Aug 2019 20:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99427F805E2
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99427F805E2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 11:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="185044437"
Received: from dmitra-mobl.amr.corp.intel.com (HELO [10.252.138.53])
 ([10.252.138.53])
 by orsmga006.jf.intel.com with ESMTP; 26 Aug 2019 11:55:25 -0700
To: Marcin Pietraszko <marcin.pietraszko@linux.intel.com>, perex@perex.cz
References: <1566820301-18671-1-git-send-email-marcin.pietraszko@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1b994f3b-6fae-27ca-8248-5847f6733e86@linux.intel.com>
Date: Mon, 26 Aug 2019 11:59:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566820301-18671-1-git-send-email-marcin.pietraszko@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/1] ASoC: topology: Fix variable overflow
 in split_format
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CC: Takashi and Mark.

On 8/26/19 6:51 AM, Marcin Pietraszko wrote:
> The 1 which was 32-bit long, when left-shifted by more than 31 caused
> an overflow, which resulted in some of the formats being not supported.

Looks like an alsa-lib patch?

> 
> Signed-off-by: Marcin Pietraszko <marcin.pietraszko@linux.intel.com>
> ---
>   src/topology/pcm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/topology/pcm.c b/src/topology/pcm.c
> index 5f586dc..00a35b9 100644
> --- a/src/topology/pcm.c
> +++ b/src/topology/pcm.c
> @@ -321,7 +321,7 @@ static int split_format(struct snd_soc_tplg_stream_caps *caps, char *str)
>   			return -EINVAL;
>   		}
>   
> -		caps->formats |= 1 << format;
> +		caps->formats |= 1ull << format;
>   		s = strtok(NULL, ", ");
>   		i++;
>   	}
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
