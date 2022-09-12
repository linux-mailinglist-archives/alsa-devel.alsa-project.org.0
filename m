Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339805B59D7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 14:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFF786F;
	Mon, 12 Sep 2022 14:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFF786F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662984133;
	bh=RPWT9rKsWP9FM2ux9RvEk+SvbNcKtBbwIAIZlTXQpKE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVqlq53a1ff6KAA7V/eeJkko2bI69/J81+6rRlW1cUFk60FpalVCQlnovRmeKDsMt
	 70wPg7NLrhe77DrTGsGvXMcUuz1fF/fjrv0iIXltwxR14QWNHN/+YFh1KnVOuC1+m1
	 b8CIVtWetRRwv/7FYpE7EIlMIhmFktO88e+UkQFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83656F8053C;
	Mon, 12 Sep 2022 14:00:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D329DF8053C; Mon, 12 Sep 2022 14:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EB22F8053C
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 14:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EB22F8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ELR4svMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662984012; x=1694520012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RPWT9rKsWP9FM2ux9RvEk+SvbNcKtBbwIAIZlTXQpKE=;
 b=ELR4svMe5o/VtpOm7LPbmZ0p1nkICOgwYhZBS8d503CuL/LyfMkt7f9E
 WkuNN8aWaCVxI0zyZjXaXgvQXiKLT19lhq+tkZuIg9LHgkCCmERH26py4
 a0fpNj+VFeBQArUI9x+IyOZ39sY6NqwccLjh0pG0k+vTDm1TyxztMWXOU
 /cUGMA9U2fZ/E49tUDBRH+H+D4vsdzfk0ikOHPvueza92KGy7NOsBeVe8
 +hCEXi/ouQdk3u+fXHQ8PsS/6pIZeyh3r1UFoC2oykUZ1IRpdvJUzYS5o
 Nn+IdAywbHnb7pOsmxgsHX1vVf4+H4wL5hwDopwjV42cUabNtzYXowpCv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="280864762"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="280864762"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="705126482"
Received: from vtsymbal-mobl.ger.corp.intel.com (HELO [10.252.32.67])
 ([10.252.32.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:00:05 -0700
Message-ID: <72cd1004-e952-b167-e08d-2b5623b638fd@linux.intel.com>
Date: Mon, 12 Sep 2022 13:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/5] soundwire: bus: Don't re-enumerate before status
 is UNATTACHED
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20220907085259.3602-1-rf@opensource.cirrus.com>
 <20220907085259.3602-4-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220907085259.3602-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 9/7/22 10:52, Richard Fitzgerald wrote:
> Don't re-enumerate a peripheral on #0 until we have seen and
> handled an UNATTACHED notification for that peripheral.
> 
> Without this, it is possible for the UNATTACHED status to be missed
> and so the slave->status remains at ATTACHED. If slave->status never
> changes to UNATTACHED the child driver will never be notified of the
> UNATTACH, and the code in sdw_handle_slave_status() will skip the
> second part of enumeration because the slave->status has not changed.
> 
> This scenario can happen because PINGs are handled in a workqueue
> function which is working from a snapshot of an old PING, and there
> is no guarantee when this function will run.
> 
> A peripheral could report attached in the PING being handled by
> sdw_handle_slave_status(), but has since reverted to device #0 and is
> then found in the loop in sdw_program_device_num(). Previously the
> code would not have updated slave->status to UNATTACHED because it had
> not yet handled a PING where that peripheral had UNATTACHED.
> 
> This situation happens fairly frequently with multiple peripherals on
> a bus that are intentionally reset (for example after downloading
> firmware).
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 1cc858b4107d..6e569a875a9b 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -773,6 +773,16 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  			if (sdw_compare_devid(slave, id) == 0) {
>  				found = true;
>  
> +				/*
> +				 * To prevent skipping state-machine stages don't
> +				 * program a device until we've seen it UNATTACH.
> +				 * Must return here because no other device on #0
> +				 * can be detected until this one has been
> +				 * assigned a device ID.
> +				 */
> +				if (slave->status != SDW_SLAVE_UNATTACHED)
> +					return 0;
> +
>  				/*
>  				 * Assign a new dev_num to this Slave and
>  				 * not mark it present. It will be marked
