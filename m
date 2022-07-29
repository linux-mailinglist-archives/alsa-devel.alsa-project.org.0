Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39792585201
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 17:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA76C1654;
	Fri, 29 Jul 2022 17:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA76C1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659106914;
	bh=FK3X/i4IKUVcxCucyjEQGyuf8/mNmgO73urDBUCLv3U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qm7Bq+cx4t7Z060RiF+dI2/f3tIAFPX34RNeSDJkzbaU5DKheLz2EWqa9npd/ZllR
	 d6yP8wtlN7K9hpkvTwA8yADAhl5eDoMgRmIa0VywV4UcHzAT4nPUmzrSnQMP7fXeNz
	 gqYVYuiYuGBehmjQ474gl820e40gusQOdLP2MqCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA6AF804B1;
	Fri, 29 Jul 2022 17:00:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41EB7F8049C; Fri, 29 Jul 2022 17:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C97F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 17:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C97F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UnEmMIIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659106852; x=1690642852;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FK3X/i4IKUVcxCucyjEQGyuf8/mNmgO73urDBUCLv3U=;
 b=UnEmMIIHIAWgKhQAmnMJh+Zyy75RVnm5PUZ7/S0Oy5lRQ7uHXnfrdKWK
 SMDgXIYUyghoci37ne29J+R7HaSlpeSeIjyDI+Xp+s6y9tuy2icfr8tz6
 oA/PAbUjddLkwO7NZDkKTpFP3BAEmiCfcQ7vRPEj/yqQFYY25eBLByNH8
 8mDzSeqPiLgbGeBaRMx7QpK31j9i6h1lS1kptD5tkax3vsjwxSj/LZ/ET
 asvck+LyMdFDESVhL1mBQXP9HybwUmEfZgLsNBRhn/5Gn3dN7T5geV73M
 FjaBX6lN9xY1Y03smLY2dx+lzcwyj/zSk3ovvCvzGpjW9WJrGbQjnP2pU w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="271822456"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="271822456"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 08:00:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="604986191"
Received: from kaholo-mobl.amr.corp.intel.com (HELO [10.212.97.86])
 ([10.212.97.86])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 08:00:42 -0700
Message-ID: <95dcb89d-bfc7-7bc4-5ec5-04537bc0758d@linux.intel.com>
Date: Fri, 29 Jul 2022 10:00:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 4/5] soundwire: sysfs: remove sdw_slave_sysfs_init()
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-4-gregkh@linuxfoundation.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220729135041.2285908-4-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-kernel@vger.kernel.org
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



> diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
> index c4b6543c09fd..a3fb380ee519 100644
> --- a/drivers/soundwire/sysfs_slave_dpn.c
> +++ b/drivers/soundwire/sysfs_slave_dpn.c
> @@ -283,6 +283,9 @@ int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave)
>  	int ret;
>  	int i;
>  
> +	if (!slave->prop.source_ports && !slave->prop.sink_ports)
> +		return 0;
> +
>  	mask = slave->prop.source_ports;
>  	for_each_set_bit(i, &mask, 32) {
>  		ret = add_all_attributes(&slave->dev, i, 1);

I am struggling with this one since the driver is still adding
attributes manually. You mentioned in the other thread that

"
That's what the is_visible() callback is for in the groups structure,
you determine if the attribute is visable or not at runtime, you don't
rely on the driver itself to add/remove attributes, that does not scale
and again, is racy.
"

I interpret that as "there's still a race here", no?
