Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D652850BB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 19:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2FA170E;
	Tue,  6 Oct 2020 19:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2FA170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602005114;
	bh=O8037/XQX9BMZhwDeVVw/xrgcB1aBDB18FxCjX2E5Bs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCWTbZjdnWz5u6O07tRf6O0TSVG9hzPTtpRK21/7w6czZeDaTDnHVz+OwrftAEJaY
	 MdzLyNKaJ0bzEE3JcYaJphVAtkA5bEfMObXfNubqb+JT/6tM+nnCwLp0wsMuAnQyyg
	 b/boEwGUoSnFaOjH7bIRetFgvK+F9/hS0KS0W2wI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A97F80129;
	Tue,  6 Oct 2020 19:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFE89F8012A; Tue,  6 Oct 2020 19:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A32F80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 19:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A32F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gEvAWCYY"
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FB0420782;
 Tue,  6 Oct 2020 17:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602005002;
 bh=O8037/XQX9BMZhwDeVVw/xrgcB1aBDB18FxCjX2E5Bs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gEvAWCYYLyEIbgMzIMDzaE1mi8CXHQt4WiqgEJzlzaS35baukykaJVSXX150gy+kv
 EbaFpf1GvtUgK9iNI9VMmmvhBGYcoQlCkM2ZvTiyIqZaK4/IkigHEgO2YT2XNBervS
 OFpTXKQc7GZgOgtU8WDmPPctfymrriTdmVZgesdg=
Date: Tue, 6 Oct 2020 20:23:17 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Dave Ertman <david.m.ertman@intel.com>
Subject: Re: [PATCH v2 1/6] Add ancillary bus support
Message-ID: <20201006172317.GN1874917@unreal>
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-2-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005182446.977325-2-david.m.ertman@intel.com>
Cc: alsa-devel@alsa-project.org, parav@mellanox.com, tiwai@suse.de,
 netdev@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 kiran.patil@intel.com
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

On Mon, Oct 05, 2020 at 11:24:41AM -0700, Dave Ertman wrote:
> Add support for the Ancillary Bus, ancillary_device and ancillary_driver.
> It enables drivers to create an ancillary_device and bind an
> ancillary_driver to it.
>
> The bus supports probe/remove shutdown and suspend/resume callbacks.
> Each ancillary_device has a unique string based id; driver binds to
> an ancillary_device based on this id through the bus.
>
> Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> ---

<...>

> +/**
> + * __ancillary_driver_register - register a driver for ancillary bus devices
> + * @ancildrv: ancillary_driver structure
> + * @owner: owning module/driver
> + */
> +int __ancillary_driver_register(struct ancillary_driver *ancildrv, struct module *owner)
> +{
> +	if (WARN_ON(!ancildrv->probe) || WARN_ON(!ancildrv->remove) ||
> +	    WARN_ON(!ancildrv->shutdown) || WARN_ON(!ancildrv->id_table))
> +		return -EINVAL;

In our driver ->shutdown is empty, it will be best if ancillary bus will
do "if (->remove) ..->remove()" pattern.

> +
> +	ancildrv->driver.owner = owner;
> +	ancildrv->driver.bus = &ancillary_bus_type;
> +	ancildrv->driver.probe = ancillary_probe_driver;
> +	ancildrv->driver.remove = ancillary_remove_driver;
> +	ancildrv->driver.shutdown = ancillary_shutdown_driver;
> +

I think that this part is wrong, probe/remove/shutdown functions should
come from ancillary_bus_type. You are overwriting private device_driver
callbacks that makes impossible to make container_of of ancillary_driver
to chain operations.

> +	return driver_register(&ancildrv->driver);
> +}
> +EXPORT_SYMBOL_GPL(__ancillary_driver_register);

Thanks
