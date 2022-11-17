Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A769762DEEF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 16:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4395416EA;
	Thu, 17 Nov 2022 16:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4395416EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668697303;
	bh=pym+nN5dyyoSuoPqt65bfQahyNJPS85MeiSSlQoBJ/8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9JFmDExf9xfb+nc7I6oBDSmOluoUOFWKqgj6H4/2I995ERSp82giASMX+9es/A3s
	 5YgYHXwNQ9IGOWJ+wnup+q3LUfeNToTTWPIbJakGP3ZDNfE+VmxcRDG+BPP+MXFuCR
	 dc9ujaSAdVm9IhN2dTLDNV+QPYZHLv3XjTF2x0kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DACF80526;
	Thu, 17 Nov 2022 16:00:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B14AF8015B; Thu, 17 Nov 2022 16:00:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13EE9F8015B
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 16:00:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13EE9F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="L0UiPEWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668697217; x=1700233217;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pym+nN5dyyoSuoPqt65bfQahyNJPS85MeiSSlQoBJ/8=;
 b=L0UiPEWJcx1dcYSiNrTIxk0jm633vaxn5yyZ8Qf2kwasqFnjWnBiZf5N
 isMWG6XrVWeWYYv55zGkr9sSXZCpTS9U2OQso/MwfLef22/9bVe6lznEK
 Poj8IjB/UkzlcbFhs3wdA3f0MJb1Cna6a8HQiJOII6+0lgSFgdop3J2nh
 c8DrWCL1tKC6iYGxsmu4n/wCrfRlYCplNoesU2rOjtRFgt7MjFGzksZU5
 eK0JGrb/AsaB1fQNYNl1ubFt+JRG4MKmx0HSF8j/lzBaabXhoExbh4O3x
 T8LtPArvJHjfdfl/1/qminIQBwaiY7PN4c+oaWeIYy16hhWi4TSo2hp7C Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314685225"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="314685225"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 07:00:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="617636533"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="617636533"
Received: from kristi4x-mobl1.amr.corp.intel.com (HELO [10.213.177.122])
 ([10.213.177.122])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 07:00:07 -0800
Message-ID: <d6fd57a0-4cb6-99df-d49c-eb18ff58b8a3@linux.intel.com>
Date: Thu, 17 Nov 2022 08:44:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
References: <20221117141727.3031503-1-ckeepax@opensource.cirrus.com>
 <20221117141727.3031503-4-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221117141727.3031503-4-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
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



On 11/17/22 08:17, Charles Keepax wrote:
> It is rather inefficient to be constantly playing with the runtime
> PM reference for each individual register, switch to holding a PM
> runtime reference across the whole register output.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> 
> Changes since v1:
>  - Reworded commit message
> 
>  drivers/soundwire/debugfs.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
> index 49900cd207bc7..0718e9cda138a 100644
> --- a/drivers/soundwire/debugfs.c
> +++ b/drivers/soundwire/debugfs.c
> @@ -4,6 +4,7 @@
>  #include <linux/device.h>
>  #include <linux/debugfs.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
> @@ -35,7 +36,7 @@ static ssize_t sdw_sprintf(struct sdw_slave *slave,
>  {
>  	int value;
>  
> -	value = sdw_read(slave, reg);
> +	value = sdw_read_no_pm(slave, reg);
>  
>  	if (value < 0)
>  		return scnprintf(buf + pos, RD_BUF - pos, "%3x\tXX\n", reg);
> @@ -55,6 +56,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
>  	if (!buf)
>  		return -ENOMEM;
>  
> +	ret = pm_runtime_resume_and_get(&slave->dev);
> +	if (ret < 0 && ret != -EACCES)
> +		return ret;
> +
>  	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
>  
>  	/* DP0 non-banked registers */
> @@ -112,6 +117,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
>  	}
>  
>  	seq_printf(s_file, "%s", buf);
> +
> +	pm_runtime_mark_last_busy(&slave->dev);
> +	pm_runtime_put(&slave->dev);
> +
>  	kfree(buf);
>  
>  	return 0;
