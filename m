Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F282A3E1D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:55:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED0231684;
	Tue,  3 Nov 2020 08:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED0231684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390152;
	bh=F+RVJUPd6N3NlSo8lsMsGcW2JPuwTx9aScvjRYc3mOQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gloSrgl3Hjw2i/jICUu6auW+Mz/SgYOn/iswIDIS0jg3vzd8fCGLE5LwEJFu55NyU
	 zrqZVRqmrTFpY4KZcwk8/LdyjSAoncdzB7OUpVgWIbgtx7Rmt94zwcL6SlE/dyraBs
	 EHrnXwAujW/1EvfmG2x4jzeWvta11NLU9AyFozOk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C40F8056F;
	Tue,  3 Nov 2020 08:45:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA715F80108; Tue,  3 Nov 2020 08:11:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4813F80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 08:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4813F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Dah3vnxq"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa102830000>; Mon, 02 Nov 2020 23:10:59 -0800
Received: from [172.27.13.204] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 07:10:51 +0000
Subject: Re: [PATCH mlx5-next v1 11/11] RDMA/mlx5: Remove IB representors dead
 code
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, gregkh <gregkh@linuxfoundation.org>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-12-leon@kernel.org>
From: Roi Dayan <roid@nvidia.com>
Message-ID: <845b26c8-4dfa-5ef2-67a8-1ae6f556fd71@nvidia.com>
Date: Tue, 3 Nov 2020 09:10:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201101201542.2027568-12-leon@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604387459; bh=4WUhWdFgickYDSVFf73IeSlsegDSnCyqJHXLcImggck=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=Dah3vnxqaguW+nzDWpLeyjsmEMHzddxz/bOE8aJ2quo8SYWhPfZW9duce4clcU2ej
 GDvO7zRgP2eEzc57IkWZzFs0B8FdA4oKAREzx4GKnuosH6K8N+gYKCzkRksHIwl+BY
 J/lDEDeZ/jEIpOjtHSLOLEuTrWFl7yRZOjGW0s9jh0zRZFgVXmWM6aWYdZpEf4+sBU
 py9TwqCM+HnDehlKgL3fsLF3JZPH3K0pmL260bnNDmwfiW9C6vnS4YaXSX/rdNX2uZ
 ih2ncLS8xu/ZN9QxF8Ygw1/FKacbdTF/cGpwDzDrqYWjFzaJI/phkRuYPZhzRozU3o
 Z1jQ9+kZh73JA==
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:22 +0100
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, ranjani.sridharan@linux.intel.com,
 virtualization@lists.linux-foundation.org, fred.oh@linux.intel.com,
 tiwai@suse.de, broonie@kernel.org, Parav Pandit <parav@nvidia.com>,
 shiraz.saleem@intel.com, Jakub Kicinski <kuba@kernel.org>,
 dan.j.williams@intel.com, Leon Romanovsky <leonro@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, linux-kernel@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
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



On 2020-11-01 10:15 PM, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Delete dead code.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>   drivers/infiniband/hw/mlx5/ib_rep.c | 31 +++++++----------------------
>   drivers/infiniband/hw/mlx5/ib_rep.h | 31 -----------------------------
>   2 files changed, 7 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx5/ib_rep.c b/drivers/infiniband/hw/mlx5/ib_rep.c
> index 9810bdd7f3bc..a1a9450ed92c 100644
> --- a/drivers/infiniband/hw/mlx5/ib_rep.c
> +++ b/drivers/infiniband/hw/mlx5/ib_rep.c
> @@ -13,7 +13,7 @@ mlx5_ib_set_vport_rep(struct mlx5_core_dev *dev, struct mlx5_eswitch_rep *rep)
>   	struct mlx5_ib_dev *ibdev;
>   	int vport_index;
> 
> -	ibdev = mlx5_ib_get_uplink_ibdev(dev->priv.eswitch);
> +	ibdev = mlx5_eswitch_uplink_get_proto_dev(dev->priv.eswitch, REP_IB);
>   	vport_index = rep->vport_index;
> 
>   	ibdev->port[vport_index].rep = rep;
> @@ -74,6 +74,11 @@ mlx5_ib_vport_rep_load(struct mlx5_core_dev *dev, struct mlx5_eswitch_rep *rep)
>   	return ret;
>   }
> 
> +static void *mlx5_ib_rep_to_dev(struct mlx5_eswitch_rep *rep)
> +{
> +	return rep->rep_data[REP_IB].priv;
> +}
> +
>   static void
>   mlx5_ib_vport_rep_unload(struct mlx5_eswitch_rep *rep)
>   {
> @@ -91,40 +96,18 @@ mlx5_ib_vport_rep_unload(struct mlx5_eswitch_rep *rep)
>   		__mlx5_ib_remove(dev, dev->profile, MLX5_IB_STAGE_MAX);
>   }
> 
> -static void *mlx5_ib_vport_get_proto_dev(struct mlx5_eswitch_rep *rep)
> -{
> -	return mlx5_ib_rep_to_dev(rep);
> -}
> -
>   static const struct mlx5_eswitch_rep_ops rep_ops = {
>   	.load = mlx5_ib_vport_rep_load,
>   	.unload = mlx5_ib_vport_rep_unload,
> -	.get_proto_dev = mlx5_ib_vport_get_proto_dev,
> +	.get_proto_dev = mlx5_ib_rep_to_dev,
>   };
> 
> -struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
> -					  u16 vport_num)
> -{
> -	return mlx5_eswitch_get_proto_dev(esw, vport_num, REP_IB);
> -}
> -
>   struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
>   					  u16 vport_num)
>   {
>   	return mlx5_eswitch_get_proto_dev(esw, vport_num, REP_ETH);
>   }
> 
> -struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw)
> -{
> -	return mlx5_eswitch_uplink_get_proto_dev(esw, REP_IB);
> -}
> -
> -struct mlx5_eswitch_rep *mlx5_ib_vport_rep(struct mlx5_eswitch *esw,
> -					   u16 vport_num)
> -{
> -	return mlx5_eswitch_vport_rep(esw, vport_num);
> -}
> -
>   struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
>   						   struct mlx5_ib_sq *sq,
>   						   u16 port)
> diff --git a/drivers/infiniband/hw/mlx5/ib_rep.h b/drivers/infiniband/hw/mlx5/ib_rep.h
> index 93f562735e89..ce1dcb105dbd 100644
> --- a/drivers/infiniband/hw/mlx5/ib_rep.h
> +++ b/drivers/infiniband/hw/mlx5/ib_rep.h
> @@ -12,11 +12,6 @@
>   extern const struct mlx5_ib_profile raw_eth_profile;
> 
>   #ifdef CONFIG_MLX5_ESWITCH
> -struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
> -					  u16 vport_num);
> -struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw);
> -struct mlx5_eswitch_rep *mlx5_ib_vport_rep(struct mlx5_eswitch *esw,
> -					   u16 vport_num);
>   int mlx5r_rep_init(void);
>   void mlx5r_rep_cleanup(void);
>   struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
> @@ -25,26 +20,6 @@ struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
>   struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
>   					  u16 vport_num);
>   #else /* CONFIG_MLX5_ESWITCH */
> -static inline
> -struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
> -					  u16 vport_num)
> -{
> -	return NULL;
> -}
> -
> -static inline
> -struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw)
> -{
> -	return NULL;
> -}
> -
> -static inline
> -struct mlx5_eswitch_rep *mlx5_ib_vport_rep(struct mlx5_eswitch *esw,
> -					   u16 vport_num)
> -{
> -	return NULL;
> -}
> -
>   static inline int mlx5r_rep_init(void) { return 0; }
>   static inline void mlx5r_rep_cleanup(void) {}
>   static inline
> @@ -62,10 +37,4 @@ struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
>   	return NULL;
>   }
>   #endif
> -
> -static inline
> -struct mlx5_ib_dev *mlx5_ib_rep_to_dev(struct mlx5_eswitch_rep *rep)
> -{
> -	return rep->rep_data[REP_IB].priv;
> -}
>   #endif /* __MLX5_IB_REP_H__ */
> --
> 2.28.0
> 

Reviewed-by: Roi Dayan <roid@nvidia.com>
