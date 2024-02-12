Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 051D7851760
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 15:54:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6BAB65;
	Mon, 12 Feb 2024 15:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6BAB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707749685;
	bh=NkwRjZxa0/AtcMo1/jowb91fxYW5bjzaFfRIJf9CD1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NyTTBzNjkIK3Ro9kOUUoDHjbKD7a7zy/CSVDTjmwiRYMd4w53ndJTEgbLI92qfGdE
	 w3kiGxVY2SH4TbVvu1vs1CE9zLUEX268YkTufYs3F944fQcv8GMujaB0zxIhA1CQDg
	 ZrRnuKRwfsfkzutk5JB8oF3dh3sMI3IaEfPOEZuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF9BF8057B; Mon, 12 Feb 2024 15:54:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F796F8059F;
	Mon, 12 Feb 2024 15:54:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C6DFF8025A; Mon, 12 Feb 2024 15:54:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B733F8015B
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 15:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B733F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ElhfJie2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707749644; x=1739285644;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NkwRjZxa0/AtcMo1/jowb91fxYW5bjzaFfRIJf9CD1c=;
  b=ElhfJie2/p0H/P0+4S/jWKPbj7IPje80MbfVHaLtoJRH9zvtJXKQvZfe
   dBhQgmeGATkXwLMAfuKIBumm56z9dBejvd21rLnImHC3o5h8DFxJzTNKZ
   jJ62qu99URXrBc1lCH4pl4PTX8/VPlUaYRdYquJEwnBs9A4kCNTA1Jv6e
   8D69BVTalLFjnqtVSLWhQmeLdvLHGrJuARhjZp3muFqBxw79Tel4SC0WJ
   IW7Y5g7jmtNPYPBj7Y5ODU8piDy5QW7phtWx0W8M5WJrXyOXcglHA44Hy
   faeNzPfyCW5SH16wwNfAX/SFOQXLFPT/HRV/fTNmhkkmcAFv+8ZX5MEJH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1850453"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000";
   d="scan'208";a="1850453"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000";
   d="scan'208";a="2582267"
Received: from rvarada-mobl.amr.corp.intel.com (HELO [10.212.76.202])
 ([10.212.76.202])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:54:00 -0800
Message-ID: <83c8bfa3-4377-4198-b48e-351f9a9f63ed@linux.intel.com>
Date: Mon, 12 Feb 2024 08:49:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: fix double free of pointer
Content-Language: en-US
To: Daniil Dulov <d.dulov@aladdin.ru>, Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240211150937.4058-1-d.dulov@aladdin.ru>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240211150937.4058-1-d.dulov@aladdin.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AU2MYCTOC7RLHBVNLOPI2KLNJEYBVXTF
X-Message-ID-Hash: AU2MYCTOC7RLHBVNLOPI2KLNJEYBVXTF
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AU2MYCTOC7RLHBVNLOPI2KLNJEYBVXTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/11/24 09:09, Daniil Dulov wrote:
> If sdw_ml_sync_bank_switch() returns error not on the first iteration,
> it leads to freeing prevously freed memory. So, set the pointer to NULL
> after each successful bank switch.
> 
> Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
> ---
>  drivers/soundwire/stream.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 304ff2ee7d75..d650e6f0f8e7 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -833,6 +833,7 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>  				"multi link bank switch failed: %d\n", ret);
>  			goto error;
>  		}
> +		bus->defer_msg.msg = NULL;
>  
>  		if (multi_link)
>  			mutex_unlock(&bus->msg_lock);

Not following what the issue is...

On success, sdw_ml_sync_bank_switch() frees the buffers with

	if (bus->defer_msg.msg) {
		kfree(bus->defer_msg.msg->buf);
		kfree(bus->defer_msg.msg);
		bus->defer_msg.msg = NULL;
	}

So if there is an issue on the second iteration, then the loop will
detect already freed memory in the previous iteration and skip it:

                /* Check if bank switch was successful */
		ret = sdw_ml_sync_bank_switch(bus);
		if (ret < 0) {
			dev_err(bus->dev,
				"multi link bank switch failed: %d\n", ret);
			goto error;
		}

error:
	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
		bus = m_rt->bus;
		if (bus->defer_msg.msg) { <<<< TEST FOR FREED MEMORY
			kfree(bus->defer_msg.msg->buf);
			kfree(bus->defer_msg.msg);
			bus->defer_msg.msg = NULL;
		}
	}

It could very well be that I need more coffee on this post-SuperBowl
Monday morning, but I just don't see the problem.
