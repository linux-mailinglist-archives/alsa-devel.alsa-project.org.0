Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9970E90B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 00:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE4FE204;
	Wed, 24 May 2023 00:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE4FE204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684880701;
	bh=8mTAJOJyftZoVl7OI8gfE34nvkq733E8blhSnki+qW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+/tv5ln26CqBUVo/nXWiTfjTmyPrJyKIwq3tyjpdgA7yDk3kX6Ie4A4MOlW3T+rF
	 T+gS1n0fJXR6fTISM0ClHc4e3nM5Pj9EzY1UogmWRwmMwx6fYA8Yya51aGHu8HUzKn
	 +7Em0M31kaa8CJpOxdky8X8j/rG6b/PWMkUnoRQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE9B1F80544; Wed, 24 May 2023 00:24:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95BFFF80249;
	Wed, 24 May 2023 00:24:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35003F8024E; Wed, 24 May 2023 00:24:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36B47F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 00:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B47F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mIiV03u9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684880646; x=1716416646;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8mTAJOJyftZoVl7OI8gfE34nvkq733E8blhSnki+qW4=;
  b=mIiV03u9QFKM5HDrXYHZZ5nozRhu445lzUvIvmJ7VI0EBqy+smtwfI0r
   +sEjAD5hGBALsfFcvd3EvGTbDzHZay+Ad665XzxTgVyYd1tQ4fgrA/DUG
   KZ0cgEps4ioZT+TD2P4PlUVrF3TQkcaX0XW9Lgy0tyJtDduDijbLy8XvV
   lhbBYeGU6NWyjAkGVZeF0bG1vYN/2Py1+rmWAVYROb9J203jarMnVLp9B
   EdwDGqEJheSnXY8xZPxkIHkUoMDlEHeEif0TiVVgSijuJdsrx+bHyQBee
   1fKdU3+RvD6zNIOaNvZOw2mgDjcJayqC8hifsfcNG+2RCOt5IkPH71XFA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="355734590"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="355734590"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 15:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="848468210"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="848468210"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 15:24:01 -0700
Message-ID: <778b936a-6a79-d54e-95bd-033495087622@linux.intel.com>
Date: Tue, 23 May 2023 17:24:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] regmap: maple: Drop the RCU read lock while syncing
 registers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20230523-regcache-maple-sync-lock-v1-1-530e4d68dfab@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230523-regcache-maple-sync-lock-v1-1-530e4d68dfab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B4HQXWBLSQKBZC4EVDK57RADGPCY53GA
X-Message-ID-Hash: B4HQXWBLSQKBZC4EVDK57RADGPCY53GA
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4HQXWBLSQKBZC4EVDK57RADGPCY53GA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/23/23 17:18, Mark Brown wrote:
> Unfortunately the maple tree requires us to explicitly lock it so we need
> to take the RCU read lock while iterating. When syncing this means that we
> end up trying to write out register values while holding the RCU read lock
> which triggers lockdep issues since that is an atomic context but most
> buses can't be used in atomic context. Pause the iteration and drop the
> lock for each register we check to avoid this.
> 
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Closes: https://github.com/thesofproject/linux/issues/4371
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/base/regmap/regcache-maple.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
> index 9b1b559107ef..c2e3a0f6c218 100644
> --- a/drivers/base/regmap/regcache-maple.c
> +++ b/drivers/base/regmap/regcache-maple.c
> @@ -203,15 +203,18 @@ static int regcache_maple_sync(struct regmap *map, unsigned int min,
>  
>  	mas_for_each(&mas, entry, max) {
>  		for (r = max(mas.index, lmin); r <= min(mas.last, lmax); r++) {
> +			mas_pause(&mas);
> +			rcu_read_unlock();
>  			ret = regcache_sync_val(map, r, entry[r - mas.index]);
>  			if (ret != 0)
>  				goto out;
> +			rcu_read_lock();
>  		}
>  	}
>  
> -out:
>  	rcu_read_unlock();
>  
> +out:
>  	map->cache_bypass = false;
>  
>  	return ret;
> 
> ---
> base-commit: 44c026a73be8038f03dbdeef028b642880cf1511
> change-id: 20230523-regcache-maple-sync-lock-57ea356dc60b
> 
> Best regards,
