Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F0731E21
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 18:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C12C829;
	Thu, 15 Jun 2023 18:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C12C829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686847648;
	bh=PiVRmi1vjOZiGqiH/BFR7jdTY/8M9iyE6yzFyqVXpIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qTIqUes6+kWI1iRxlwiR3pdefJOEH6rSdgBX1FtZ5T834zQYkpSV8PF5KV7MvAFg3
	 sA2Mt+AsK4ngOcmazi3DWDpKor9rrnj6H1SRMXPZsfZfLErd24fWjTCcHCZOr02SNi
	 NC/ljahXF9TyR2hT78FDaUHADsM8UeHX3Ndvqj50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5C89F80130; Thu, 15 Jun 2023 18:46:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9F03F80130;
	Thu, 15 Jun 2023 18:46:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC069F80155; Thu, 15 Jun 2023 18:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9401F800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 18:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9401F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gpODunB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686847587; x=1718383587;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PiVRmi1vjOZiGqiH/BFR7jdTY/8M9iyE6yzFyqVXpIo=;
  b=gpODunB1fC4KsmvKF3QxN8Vj3crzpWeFNfTmf/nWoJKxD0hwyhaz3snW
   /rFCOsXgdmJ9FKsrXXF30UdvcHz5z6VEww2WUv6WCAABdvK1byutFhOO/
   A21qUuMBIctpwLYEEjQ+AA2fUfLGcyw7EfBFK9gYZDVpwf8sj1a9SFXoY
   B6SmRDBKRfcShXTOUSuIc7hoyeS1rQ0Wv8pxE1qRIOkciE6afo0/QgYQU
   D86q+bomn08W9rmdT/Oe9FHRpJxKP5K1t7w+n4GHdVK4VtSUD+cowma5y
   xMVq4PnZlomj/y0H99IZWO4lWRaOFCA2G/yub8/DofSIzVLo148jkOBvp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387506745"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400";
   d="scan'208";a="387506745"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857040434"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400";
   d="scan'208";a="857040434"
Received: from mrejmak-mobl.ger.corp.intel.com (HELO [10.252.36.104])
 ([10.252.36.104])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 09:46:21 -0700
Message-ID: <2f010db3-73be-2cdd-0aef-62ec212769c1@linux.intel.com>
Date: Thu, 15 Jun 2023 18:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] soundwire: bus: Prevent lockdep asserts when stream
 has multiple buses
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230615141208.679011-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230615141208.679011-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ACYNUL2SDCHQWN2LDFNKK7ZSK3UFTHZV
X-Message-ID-Hash: ACYNUL2SDCHQWN2LDFNKK7ZSK3UFTHZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACYNUL2SDCHQWN2LDFNKK7ZSK3UFTHZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/15/23 16:12, Richard Fitzgerald wrote:
> Give the bus_lock and msg_lock of each bus a different unique key
> so that it is possible to acquire the locks of multiple buses
> without lockdep asserting a possible deadlock.
> 
> Using mutex_init() to initialize a mutex gives all those mutexes
> the same lock class. Lockdep checking treats it as an error to
> attempt to take a mutex while already holding a mutex of the same
> class. This causes a lockdep assert when sdw_acquire_bus_lock()
> attempts to lock multiple buses, and when do_bank_switch() takes
> multiple msg_lock.
> 
> [  138.697350] WARNING: possible recursive locking detected
> [  138.697366] 6.3.0-test #1 Tainted: G            E
> [  138.697380] --------------------------------------------
> [  138.697394] play/903 is trying to acquire lock:
> [  138.697409] ffff99b8c41aa8c8 (&bus->bus_lock){+.+.}-{3:3}, at:
> sdw_prepare_stream+0x52/0x2e0
> [  138.697443]
>                but task is already holding lock:
> [  138.697468] ffff99b8c41af8c8 (&bus->bus_lock){+.+.}-{3:3}, at:
> sdw_prepare_stream+0x52/0x2e0
> [  138.697493]
>                other info that might help us debug this:
> [  138.697521]  Possible unsafe locking scenario:
> 
> [  138.697540]        CPU0
> [  138.697550]        ----
> [  138.697559]   lock(&bus->bus_lock);
> [  138.697570]   lock(&bus->bus_lock);
> [  138.697581]
>                 *** DEADLOCK ***
> 
> Giving each mutex a unique key allows multiple to be held
> without triggering a lockdep assert. But note that it does not
> allow them to be taken in one order then a different order.
> If two mutexes are taken in the order A, B then they must
> always be taken in that order otherwise they could deadlock.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c       | 15 +++++++++++++--
>  include/linux/soundwire/sdw.h |  3 +++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index b44f8d0affa6..dba920ec88f6 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -69,8 +69,17 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
>  		return -EINVAL;
>  	}
>  
> -	mutex_init(&bus->msg_lock);
> -	mutex_init(&bus->bus_lock);
> +	/*
> +	 * Give each bus_lock and msg_lock a unique key so that lockdep won't
> +	 * trigger a deadlock warning when the locks of several buses are
> +	 * grabbed during configuration of a multi-bus stream.
> +	 */
> +	lockdep_register_key(&bus->msg_lock_key);
> +	__mutex_init(&bus->msg_lock, "msg_lock", &bus->msg_lock_key);
> +
> +	lockdep_register_key(&bus->bus_lock_key);
> +	__mutex_init(&bus->bus_lock, "bus_lock", &bus->bus_lock_key);
> +
>  	INIT_LIST_HEAD(&bus->slaves);
>  	INIT_LIST_HEAD(&bus->m_rt_list);
>  
> @@ -181,6 +190,8 @@ void sdw_bus_master_delete(struct sdw_bus *bus)
>  	sdw_master_device_del(bus);
>  
>  	sdw_bus_debugfs_exit(bus);
> +	lockdep_unregister_key(&bus->bus_lock_key);
> +	lockdep_unregister_key(&bus->msg_lock_key);
>  	ida_free(&sdw_bus_ida, bus->id);
>  }
>  EXPORT_SYMBOL(sdw_bus_master_delete);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index c076a3f879b3..f523ceabd059 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -5,6 +5,7 @@
>  #define __SOUNDWIRE_H
>  
>  #include <linux/bug.h>
> +#include <linux/lockdep_types.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/bitfield.h>
>  
> @@ -907,7 +908,9 @@ struct sdw_bus {
>  	struct list_head slaves;
>  	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
>  	struct mutex bus_lock;
> +	struct lock_class_key bus_lock_key;
>  	struct mutex msg_lock;
> +	struct lock_class_key msg_lock_key;
>  	int (*compute_params)(struct sdw_bus *bus);
>  	const struct sdw_master_ops *ops;
>  	const struct sdw_master_port_ops *port_ops;
