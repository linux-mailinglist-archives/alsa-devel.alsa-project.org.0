Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF7B20A1A4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4DD818EA;
	Thu, 25 Jun 2020 17:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4DD818EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593098105;
	bh=CueR9Na3oSNMrNDf4etI4TWybyKQDmYNKLVV0F5/YY0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0Wr0m7lF4Mh6hTxNshk//74V+fl+YC2amhjf4skMY0RCsbT2efZcCKqEOXDn0vvp
	 n7IEGuZRtGhijhj4tsJJeXuWFtD8fQvLtYFcqKLPo1sOOY04dgZM0xPuPPBMIdkfEs
	 OR/acW8wuAOn10lIdg3eOtkGZMU5jmPIVjKOC+fQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A78F80234;
	Thu, 25 Jun 2020 17:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8739F80259; Thu, 25 Jun 2020 17:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80034F80137
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80034F80137
IronPort-SDR: Mgl+BDBcxJuSyhDmpM205yM2Fu1yAuUFBIMSeBCMA3cFLuXpMNVledz6HpkkW3UvTJiySP9hZI
 Z0JB2Ceti1yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="163016134"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="163016134"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:13:08 -0700
IronPort-SDR: r8GJs/JzfLir59Av0kMvcsKrBdQPgLwI+FoXsrZJ53VS2aGUnrCLRgBTxqDi8F7gWagj4OTbn9
 9ve9NpLjKUEw==
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="279835685"
Received: from jmgutiex-mobl.amr.corp.intel.com (HELO [10.251.16.15])
 ([10.251.16.15])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:13:07 -0700
Subject: Re: [PATCH alsa-lib 1/8] topology: decode: fix channel map memory
 allocation
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <62beb112-eaa0-8d4c-76a7-9f873204edf0@linux.intel.com>
Date: Thu, 25 Jun 2020 09:16:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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



On 6/25/20 6:03 AM, Piotr Maziarz wrote:
> Without proper memory allocation behaviour was undefined.

Maybe elaborate to explain that memory allocated on the stack was 
referenced outside of the function scope?

> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> ---
>   src/topology/ctl.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/src/topology/ctl.c b/src/topology/ctl.c
> index 90241b6..c8c7e94 100644
> --- a/src/topology/ctl.c
> +++ b/src/topology/ctl.c
> @@ -1330,7 +1330,6 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
>   			      void *bin, size_t size)
>   {
>   	struct snd_soc_tplg_enum_control *ec = bin;
> -	struct snd_tplg_channel_map_template cmt;
>   	int i;
>   
>   	if (size < sizeof(*ec)) {
> @@ -1375,11 +1374,11 @@ int tplg_decode_control_enum1(snd_tplg_t *tplg,
>   		}
>   	}
>   
> -	et->map = &cmt;
> -	memset(&cmt, 0, sizeof(cmt));
> -	cmt.num_channels = ec->num_channels;
> -	for (i = 0; i < cmt.num_channels; i++) {
> -		struct snd_tplg_channel_elem *channel = &cmt.channel[i];
> +	et->map = tplg_calloc(heap, sizeof(struct snd_tplg_channel_map_template));

if (!et->map)
     return -ENOMEM;

> +	et->map->num_channels = ec->num_channels;
> +	for (i = 0; i < et->map->num_channels; i++) {
> +		struct snd_tplg_channel_elem *channel = &et->map->channel[i];
> +
>   		tplg_log(tplg, 'D', pos + ((void *)&ec->channel[i] - (void *)ec),
>   			 "enum: channel size %d", ec->channel[i].size);
>   		channel->reg = ec->channel[i].reg;
> 
