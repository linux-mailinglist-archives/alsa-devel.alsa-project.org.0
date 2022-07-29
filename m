Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD135851CA
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 16:47:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8669B1631;
	Fri, 29 Jul 2022 16:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8669B1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659106057;
	bh=m9Ot69f7v52GIgFR648kODiHS1IQPN1bSG6GxWTY8lI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNRbU6L4lQN2EscGapjF9RQQz6rGI/jiETAEgZ1Ebe7WgGr7FxS3/HUpYn2plIdx5
	 qJ+ZYEzkFiBakQUuSg1LFn19qvw5qkitu0cyuOg2u0/dHzV3s6/LO0FuTgcnh48ucI
	 djcbEcidNDgIoYv6IioPLOTwP4VRDy1Cq+KcQVzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E65A5F804B1;
	Fri, 29 Jul 2022 16:46:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61BFCF800BD; Fri, 29 Jul 2022 16:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2FECF800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 16:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FECF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QyAxjAy8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659105992; x=1690641992;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m9Ot69f7v52GIgFR648kODiHS1IQPN1bSG6GxWTY8lI=;
 b=QyAxjAy82cFMjuP59ReoeWTNVNhjXg7glHWAfrPX7yR9ziL2CJhPo45B
 Ac/VkiS2ZFWaOvF7OF8ylqOteg+6gfLzKDo51xTsNIWUuiH+dPprLrI1f
 wTrXMTTZig7B0OF2wibIlEQNqn6XtmoHvns4sGTzZtM/FYfd7fuXHbtUd
 8B6LGwbAAvgH1jsJ1Nxul/2RjX4GA5tlhpkcb1ANX/HHf1Kz0KxJIktad
 ZfvH2or6x0BDFtSsl0TCXlP3M0r2zUHDrES74+HpGvfxFnqTlobomXXfb
 g0qInp+v8z/eUfl00KCxX6ncd1eP7IuvNXN0J82syhHHBwnlgEbyaqKL3 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="268543504"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="268543504"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 07:46:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; d="scan'208";a="604982775"
Received: from kaholo-mobl.amr.corp.intel.com (HELO [10.212.97.86])
 ([10.212.97.86])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2022 07:46:27 -0700
Message-ID: <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
Date: Fri, 29 Jul 2022 09:46:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220729135041.2285908-2-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org
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



On 7/29/22 08:50, Greg Kroah-Hartman wrote:
> There's no need to special-case the dp0 sysfs attributes, the
> is_visible() callback in the attribute group can handle that for us, so
> add that and add it to the attribute group list making the logic simpler
> overall.
> 
> This is a step on the way to moving all of the sysfs attribute handling
> into the default driver core attribute group logic so that the soundwire
> core does not have to do any of it manually.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/soundwire/sysfs_slave.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> index 83e3f6cc3250..3723333a5c2b 100644
> --- a/drivers/soundwire/sysfs_slave.c
> +++ b/drivers/soundwire/sysfs_slave.c
> @@ -174,6 +174,16 @@ static ssize_t words_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(words);
>  
> +static umode_t dp0_is_visible(struct kobject *kobj, struct attribute *attr,
> +			      int n)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(kobj_to_dev(kobj));
> +
> +	if (slave->prop.dp0_prop)
> +		return attr->mode;
> +	return 0;
> +}

This changes the results slightly by creating an empty 'dp0' directory
with no attributes inside.

Before:

[root@fedora ~]# cd /sys/bus/soundwire/devices/sdw:3:025d:0714:01
[root@fedora sdw:3:025d:0714:01]# ls dp0
ls: cannot access 'dp0': No such file or directory

After:
[root@fedora sdw:3:025d:0714:01]# ls dp0

> +
>  static struct attribute *dp0_attrs[] = {
>  	&dev_attr_max_word.attr,
>  	&dev_attr_min_word.attr,
> @@ -190,12 +200,14 @@ static struct attribute *dp0_attrs[] = {
>   */
>  static const struct attribute_group dp0_group = {
>  	.attrs = dp0_attrs,
> +	.is_visible = dp0_is_visible,
>  	.name = "dp0",
>  };
>  
>  static const struct attribute_group *slave_groups[] = {
>  	&slave_attr_group,
>  	&sdw_slave_dev_attr_group,
> +	&dp0_group,
>  	NULL,
>  };
>  
> @@ -207,12 +219,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (slave->prop.dp0_prop) {
> -		ret = devm_device_add_group(&slave->dev, &dp0_group);
> -		if (ret < 0)
> -			return ret;
> -	}
> -
>  	if (slave->prop.source_ports || slave->prop.sink_ports) {
>  		ret = sdw_slave_sysfs_dpn_init(slave);
>  		if (ret < 0)
