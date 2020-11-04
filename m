Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF382A6674
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 15:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E920C16B1;
	Wed,  4 Nov 2020 15:33:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E920C16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604500451;
	bh=2cWd/Rnfctz/8vgNoGtdlGQm2dSrMJBQxxz+457B4vo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I4SlEj31xi4kX8ZJhYT/z+MvvTboMKbZNtjS2snm9vBmGTRBHPYXVBf0vwIsL6Mkx
	 w5sn3Rf6WxSV+s2XC2UKnf+apy4s0BPupRbgV9Jyyq3+JSpUaMmy3vXB0xjXeprKZI
	 9Js/52HG1WBOP7oqv1ddrJoij3+fxoHSCGML3AOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C4B7F8015A;
	Wed,  4 Nov 2020 15:32:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95826F80234; Wed,  4 Nov 2020 15:32:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2DCCF80229
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 15:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DCCF80229
IronPort-SDR: ujGJouZMKNHO+5Bg5Lifqa2zE0aZpv726jIDSK1SpD/QaUlfGshF75NIQpl7Hm3XDNcZJK/4Nk
 XX3U0XnHh8sw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="165715932"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="165715932"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 06:32:22 -0800
IronPort-SDR: dgPb2V4LKbxWwLJT9JDWWW+71bH+S2I8n4y14fLOT5P7lUAoEXmfZzfB1Xt9hhwZ3YLtL9hhQf
 MJjiuJbp5YFg==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="396918766"
Received: from msridhar-mobl1.amr.corp.intel.com (HELO [10.254.96.252])
 ([10.254.96.252])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 06:32:21 -0800
Subject: Re: [PATCH] soundwire: Fix DEBUG_LOCKS_WARN_ON for uninitialized
 attribute
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20201104112941.1134-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8f875634-a145-650b-17b2-a738ca7e99f3@linux.intel.com>
Date: Wed, 4 Nov 2020 08:32:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104112941.1134-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 11/4/20 5:29 AM, Srinivas Kandagatla wrote:
> running kernel with CONFIG_DEBUG_LOCKS_ALLOC enabled will below warning:
> 
> BUG: key ffff502e09807098 has not been registered!
> DEBUG_LOCKS_WARN_ON(1)
> WARNING: CPU: 5 PID: 129 at kernel/locking/lockdep.c:4623
> 	lockdep_init_map_waits+0xe8/0x250
> Modules linked in:
> CPU: 5 PID: 129 Comm: kworker/5:1 Tainted: G
>         W         5.10.0-rc1-00277-ged49f224ca3f-dirty #1210
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events deferred_probe_work_func
> pstate: 80c00005 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
> pc : lockdep_init_map_waits+0xe8/0x250
> lr : lockdep_init_map_waits+0xe8/0x250
>   [ Trimmed ]
> 
> Call trace:
>   lockdep_init_map_waits+0xe8/0x250
>   __kernfs_create_file+0x78/0x180
>   sysfs_add_file_mode_ns+0x94/0x1c8
>   internal_create_group+0x110/0x3e0
>   sysfs_create_group+0x18/0x28
>   devm_device_add_group+0x4c/0xb0
>   add_all_attributes+0x438/0x490
>   sdw_slave_sysfs_dpn_init+0x128/0x138
>   sdw_slave_sysfs_init+0x80/0xa0
>   sdw_drv_probe+0x94/0x170
>   really_probe+0x118/0x3e0
>   driver_probe_device+0x5c/0xc0
> 
>   [ Trimmed ]
> 
> CPU: 5 PID: 129 Comm: kworker/5:1 Tainted: G
>       W         5.10.0-rc1-00277-ged49f224ca3f-dirty #1210
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: events deferred_probe_work_func
> Call trace:
>   dump_backtrace+0x0/0x1c0
>   show_stack+0x18/0x68
>   dump_stack+0xd8/0x134
>   __warn+0xa0/0x158
>   report_bug+0xc8/0x178
>   bug_handler+0x20/0x78
>   brk_handler+0x70/0xc8
> 
> [ Trimmed ]
> 
> Fix this by initializing dynamically allocated sysfs attribute to keep lockdep happy!
> 
> Fixes: bcac59029955 ("soundwire: add Slave sysfs support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I added the exact same fix last Friday but you beat me to it.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

My commit message was a bit more self-explanatory though, maybe you 
could add the explanation at the end and possibly trim the logs?

"
when CONFIG_DEBUG_LOCK_ALLOC is enabled, a warning is thrown, e.g.

kernel: [ 4.078863] BUG: key ffff8a9203c92dc0 has not been registered!
kernel: [ 4.078865] ------------[ cut here ]------------
kernel: [ 4.078866] DEBUG_LOCKS_WARN_ON(1)
kernel: [ 4.078871] WARNING: CPU: 0 PID: 280 at
kernel/locking/lockdep.c:4623 lockdep_init_map_waits+0x177/0x200
kernel: [ 4.078902] Call Trace:
kernel: [ 4.078906] __kernfs_create_file+0x76/0x100
kernel: [ 4.078908] sysfs_add_file_mode_ns+0x9f/0x190
kernel: [ 4.078909] internal_create_group+0x112/0x380
kernel: [ 4.078912] devm_device_add_group+0x41/0x80
kernel: [ 4.078915] add_all_attributes+0x4bf/0x4e0 [soundwire_bus]
kernel: [ 4.078918] sdw_slave_sysfs_dpn_init+0x68/0xe0 [soundwire_bus]
kernel: [ 4.078920] sdw_slave_sysfs_init+0x6b/0x80 [soundwire_bus]

For DPn ports, the attributes are allocated dynamically and it's
required to use the macro sysfs_attr_init(), whose behavior is
precisely dependent on CONFIG_DEBUG_LOCK_ALLOC. See details in
linux/sysfs.h.
"

Thanks Srinivas!


> ---
>   drivers/soundwire/sysfs_slave_dpn.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/sysfs_slave_dpn.c b/drivers/soundwire/sysfs_slave_dpn.c
> index 05a721ea9830..c4b6543c09fd 100644
> --- a/drivers/soundwire/sysfs_slave_dpn.c
> +++ b/drivers/soundwire/sysfs_slave_dpn.c
> @@ -37,6 +37,7 @@ static int field##_attribute_alloc(struct device *dev,			\
>   		return -ENOMEM;						\
>   	dpn_attr->N = N;						\
>   	dpn_attr->dir = dir;						\
> +	sysfs_attr_init(&dpn_attr->dev_attr.attr);			\
>   	dpn_attr->format_string = format_string;			\
>   	dpn_attr->dev_attr.attr.name = __stringify(field);		\
>   	dpn_attr->dev_attr.attr.mode = 0444;				\
> 
