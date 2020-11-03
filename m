Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1952A4A4A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 16:47:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C45716A8;
	Tue,  3 Nov 2020 16:46:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C45716A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604418430;
	bh=YcSZgtFYL9t2XCIM12+Ulqf8G0DXvUoFzdP0TccGuyc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W3Bk1Fmx3wfssVuSGV/jJ8zKFGYQ4Qk6WBFM48koA4KzoFdHfEhU1QeMu0TOvUMyR
	 PSN66BeS6RO4wZIusj6O2okun3N5djwg5apQx9MF8pm1NnCI7CDb/5dBO6ZQrli+L6
	 7Irp/qIUvANowp4g62Nt1Z15uO29oK0q63buIYM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE112F80272;
	Tue,  3 Nov 2020 16:45:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46BCAF80171; Tue,  3 Nov 2020 16:45:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E8BF8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 16:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E8BF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="bXh9b8/h"
Received: by mail-qv1-xf43.google.com with SMTP id g13so7937039qvu.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3wr/kJnGgJjVXv4j45gSDlCME78066E7KvOsuCGgBYM=;
 b=bXh9b8/hy2W1iREgfIgRL7uYM/L1Ff8B9CaIV6+KCI8gFvzb85lcJYfuJ5NY8YM6HN
 6PlIZC0SPiwCFiw8Blk+jDBqs35i6186Hb86cZfS5h+eFELZuWe7fyMKWe53fQ/2UGC3
 SU9cUPhpEpZ8OsFMd0f2KKz243+57XxdbO6nwIYYW8jcUjqH69YHiRUAqi8pflCezl+3
 8N0r5qPYKh5qXwuFg6RZI9pb0XDami7XP/r1GnVMt4Z/0Betcmrh1Mfz9PfQjb5y2nuZ
 MJhW02wMuv1uEgAsOcM62B+EB8XlwEVd0eFn5V8VZfqER2BocXGduwInbJ0p92DXG0ri
 SdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3wr/kJnGgJjVXv4j45gSDlCME78066E7KvOsuCGgBYM=;
 b=DpS54tcLFPXTauClanqOjG3EChnbzx6Uh5vDRDqBR9wubitYHiso8vDoWH1sQrtJnm
 uA45qYooc26Of+5pAA4yVHAUNBxjpndcOmNztZ1P2TzfgdsW0fZfVkp+NyGoJeSkECSB
 smaw5Y4aq+FwyXlt2/7k7PRsbCAdYXH0Y9IYu+oORTKfzESuHA/XxigWjj4vU1kvaR+7
 +Ga+9+fSpvBLhsUyvU7KTPE4O2ZgcH88bWHGYpy6fyWeRcKI2hyzt+JVS2XVTwEkKVZQ
 vmsqjjDsJcaQJHytNVVm8jlvyRJBzpCcdJnieRX8gf/CllsmSVLHvy+lrXIlkVHaezzj
 FAqg==
X-Gm-Message-State: AOAM531vnQxRYhG4xPQPOubdr1Eij+eRaDEtFXTEZFawuTFbPxIorjdD
 QB/ojksLqvk5T1Nq25i/OVmUWQ==
X-Google-Smtp-Source: ABdhPJz3S5UU3ilQyTYYox6+go2q28UHJ7dlganza0B5QQoayqoYF2WFeh5AeDtzdiCHK7WNbTpzsA==
X-Received: by 2002:ad4:464f:: with SMTP id y15mr24492069qvv.52.1604418326596; 
 Tue, 03 Nov 2020 07:45:26 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 19sm9771171qkj.69.2020.11.03.07.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:45:25 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kZyUv-00FwNv-89; Tue, 03 Nov 2020 11:45:25 -0400
Date: Tue, 3 Nov 2020 11:45:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>, gregkh <gregkh@linuxfoundation.org>
Subject: Re: [PATCH mlx5-next v1 06/11] vdpa/mlx5: Connect mlx5_vdpa to
 auxiliary bus
Message-ID: <20201103154525.GO36674@ziepe.ca>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-7-leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201101201542.2027568-7-leon@kernel.org>
Cc: alsa-devel@alsa-project.org, "Michael S. Tsirkin" <mst@redhat.com>,
 tiwai@suse.de, Jason Wang <jasowang@redhat.com>,
 ranjani.sridharan@linux.intel.com, Leon Romanovsky <leonro@nvidia.com>,
 linux-rdma@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 fred.oh@linux.intel.com, Doug Ledford <dledford@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, kiran.patil@intel.com, broonie@kernel.org,
 Parav Pandit <parav@nvidia.com>, Roi Dayan <roid@nvidia.com>,
 dan.j.williams@intel.com, virtualization@lists.linux-foundation.org,
 shiraz.saleem@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>, "David S . Miller" <davem@davemloft.net>
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

On Sun, Nov 01, 2020 at 10:15:37PM +0200, Leon Romanovsky wrote:
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> index 6c218b47b9f1..5316e51e72d4 100644
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1,18 +1,27 @@
>  // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
>  /* Copyright (c) 2020 Mellanox Technologies Ltd. */
> 
> +#include <linux/module.h>
>  #include <linux/vdpa.h>
> +#include <linux/vringh.h>
> +#include <uapi/linux/virtio_net.h>
>  #include <uapi/linux/virtio_ids.h>
>  #include <linux/virtio_config.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/mlx5/cq.h>
>  #include <linux/mlx5/qp.h>
>  #include <linux/mlx5/device.h>
> +#include <linux/mlx5/driver.h>
>  #include <linux/mlx5/vport.h>
>  #include <linux/mlx5/fs.h>
> -#include <linux/mlx5/device.h>
>  #include <linux/mlx5/mlx5_ifc_vdpa.h>
> -#include "mlx5_vnet.h"
>  #include "mlx5_vdpa.h"
> 
> +MODULE_AUTHOR("Eli Cohen <eli@mellanox.com>");
> +MODULE_DESCRIPTION("Mellanox VDPA driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +
> +#define to_mlx5_vdpa_ndev(__mvdev) container_of(__mvdev, struct mlx5_vdpa_net, mvdev)
>  #define to_mvdev(__vdev) container_of((__vdev), struct mlx5_vdpa_dev, vdev)
> 
>  #define VALID_FEATURES_MASK                                                                        \
> @@ -159,6 +168,11 @@ static bool mlx5_vdpa_debug;
>  			mlx5_vdpa_info(mvdev, "%s\n", #_status);                                   \
>  	} while (0)
> 
> +static inline u32 mlx5_vdpa_max_qps(int max_vqs)
> +{
> +	return max_vqs / 2;
> +}
> +
>  static void print_status(struct mlx5_vdpa_dev *mvdev, u8 status, bool set)
>  {
>  	if (status & ~VALID_STATUS_MASK)
> @@ -1928,8 +1942,11 @@ static void init_mvqs(struct mlx5_vdpa_net *ndev)
>  	}
>  }
> 
> -void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
> +static int mlx5v_probe(struct auxiliary_device *adev,
> +		       const struct auxiliary_device_id *id)
>  {
> +	struct mlx5_adev *madev = container_of(adev, struct mlx5_adev, adev);
> +	struct mlx5_core_dev *mdev = madev->mdev;
>  	struct virtio_net_config *config;
>  	struct mlx5_vdpa_dev *mvdev;
>  	struct mlx5_vdpa_net *ndev;
> @@ -1943,7 +1960,7 @@ void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
>  	ndev = vdpa_alloc_device(struct mlx5_vdpa_net, mvdev.vdev, mdev->device, &mlx5_vdpa_ops,
>  				 2 * mlx5_vdpa_max_qps(max_vqs));
>  	if (IS_ERR(ndev))
> -		return ndev;
> +		return PTR_ERR(ndev);
> 
>  	ndev->mvdev.max_vqs = max_vqs;
>  	mvdev = &ndev->mvdev;
> @@ -1972,7 +1989,8 @@ void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
>  	if (err)
>  		goto err_reg;
> 
> -	return ndev;
> +	dev_set_drvdata(&adev->dev, ndev);
> +	return 0;
> 
>  err_reg:
>  	free_resources(ndev);
> @@ -1981,10 +1999,29 @@ void *mlx5_vdpa_add_dev(struct mlx5_core_dev *mdev)
>  err_mtu:
>  	mutex_destroy(&ndev->reslock);
>  	put_device(&mvdev->vdev.dev);
> -	return ERR_PTR(err);
> +	return err;
>  }
> 
> -void mlx5_vdpa_remove_dev(struct mlx5_vdpa_dev *mvdev)
> +static int mlx5v_remove(struct auxiliary_device *adev)
>  {
> +	struct mlx5_vdpa_dev *mvdev = dev_get_drvdata(&adev->dev);
> +
>  	vdpa_unregister_device(&mvdev->vdev);
> +	return 0;
>  }
> +
> +static const struct auxiliary_device_id mlx5v_id_table[] = {
> +	{ .name = MLX5_ADEV_NAME ".vnet", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(auxiliary, mlx5v_id_table);
> +
> +static struct auxiliary_driver mlx5v_driver = {
> +	.name = "vnet",
> +	.probe = mlx5v_probe,
> +	.remove = mlx5v_remove,
> +	.id_table = mlx5v_id_table,
> +};

It is hard to see from the diff, but when this patch is applied the
vdpa module looks like I imagined things would look with the auxiliary
bus. It is very similar in structure to a PCI driver with the probe()
function cleanly registering with its subsystem. This is what I'd like
to see from the new Intel RDMA driver.

Greg, I think this patch is the best clean usage example.

I've looked over this series and it has the right idea and
parts. There is definitely more that can be done to improve mlx5 in
this area, but this series is well scoped and cleans a good part of
it.

Jason
