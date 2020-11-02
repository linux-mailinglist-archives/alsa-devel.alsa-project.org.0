Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243322A3E02
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:50:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1741177C;
	Tue,  3 Nov 2020 08:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1741177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389819;
	bh=HmEgTx+6DFubggxIoobtjknkn4OkSjHnMj6h3AsK/QA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtszNhYDJhCOqp8ueT5Ad9Uu7oAFEe9Qaiu8xkKuvPbdgPM77dmvGt5t6Dmn/XLm3
	 GDzn5lNHOrlk0anvwKiNXFYXgy2+xLi5lepNxCOOEc/7q7SohWAI8UFASIh34XExcb
	 swaWWq6uNL2SdLKlqBY3308J18oujVYqJD1DncrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DBC5F804FB;
	Tue,  3 Nov 2020 08:45:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5890F80232; Mon,  2 Nov 2020 15:55:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C887F8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C887F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="R3mZWX49"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa01dc70000>; Mon, 02 Nov 2020 06:55:03 -0800
Received: from [172.27.13.219] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 14:54:51 +0000
Subject: Re: [PATCH mlx5-next v1 10/11] net/mlx5: Simplify eswitch mode check
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, gregkh <gregkh@linuxfoundation.org>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-11-leon@kernel.org>
From: Roi Dayan <roid@nvidia.com>
Message-ID: <bf8e48b5-fab6-054c-c49f-38423f795f26@nvidia.com>
Date: Mon, 2 Nov 2020 16:54:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201101201542.2027568-11-leon@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604328903; bh=w4bgReo+JKb2pj4MQ9s4f16lHoHnoUxnw6BPra7Cqjg=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=R3mZWX49X8p9g0TQ8x4I+hrP7SQW+CHkMfHMiUFZIjkYdZU+uYR55D3WYm/JfILn/
 F3/r2/JAmIBGFUCLt/vyiCuFMOnlQneYNBBtlUlplYhof3y52PuC1+hillCaXjotQE
 drjS+Ei0xx9SOy0tntjurCSdFA3uF9xNVczu7+7injtRV1OIOvkhPgf3U3f/Is3NJU
 QJhQhEFL+0wpfyZDlm6yYL7HXAmxIWSPQzw0ZmdjC0ANwHe7/ddGu5tTzL2MgXSPgD
 WPu6KHDS5nOYZGJbxDr1maDtHZ2INw3Wjm/lPfiViCz4XODOERUyyniZCs8nICG55e
 N3jX1/H08UCpA==
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
> Provide mlx5_core device instead of "priv" pointer while checking
> eswith mode.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>   drivers/infiniband/hw/mlx5/counters.c             | 7 -------
>   drivers/infiniband/hw/mlx5/ib_rep.c               | 5 -----
>   drivers/infiniband/hw/mlx5/ib_rep.h               | 6 ------
>   drivers/net/ethernet/mellanox/mlx5/core/dev.c     | 4 ++--
>   drivers/net/ethernet/mellanox/mlx5/core/devlink.c | 2 +-
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 2 +-
>   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c   | 8 +++-----
>   drivers/net/ethernet/mellanox/mlx5/core/eswitch.c | 4 +++-
>   include/linux/mlx5/eswitch.h                      | 8 ++++++--
>   9 files changed, 16 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/mlx5/counters.c b/drivers/infiniband/hw/mlx5/counters.c
> index 70c8fd67ee2f..084652e2b15a 100644
> --- a/drivers/infiniband/hw/mlx5/counters.c
> +++ b/drivers/infiniband/hw/mlx5/counters.c
> @@ -138,13 +138,6 @@ static int mlx5_ib_create_counters(struct ib_counters *counters,
>   }
> 
> 
> -static bool is_mdev_switchdev_mode(const struct mlx5_core_dev *mdev)
> -{
> -	return MLX5_ESWITCH_MANAGER(mdev) &&
> -	       mlx5_ib_eswitch_mode(mdev->priv.eswitch) ==
> -		       MLX5_ESWITCH_OFFLOADS;
> -}
> -
>   static const struct mlx5_ib_counters *get_counters(struct mlx5_ib_dev *dev,
>   						   u8 port_num)
>   {
> diff --git a/drivers/infiniband/hw/mlx5/ib_rep.c b/drivers/infiniband/hw/mlx5/ib_rep.c
> index 0dc15757cc66..9810bdd7f3bc 100644
> --- a/drivers/infiniband/hw/mlx5/ib_rep.c
> +++ b/drivers/infiniband/hw/mlx5/ib_rep.c
> @@ -102,11 +102,6 @@ static const struct mlx5_eswitch_rep_ops rep_ops = {
>   	.get_proto_dev = mlx5_ib_vport_get_proto_dev,
>   };
> 
> -u8 mlx5_ib_eswitch_mode(struct mlx5_eswitch *esw)
> -{
> -	return mlx5_eswitch_mode(esw);
> -}
> -
>   struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
>   					  u16 vport_num)
>   {
> diff --git a/drivers/infiniband/hw/mlx5/ib_rep.h b/drivers/infiniband/hw/mlx5/ib_rep.h
> index 94bf51ddd422..93f562735e89 100644
> --- a/drivers/infiniband/hw/mlx5/ib_rep.h
> +++ b/drivers/infiniband/hw/mlx5/ib_rep.h
> @@ -12,7 +12,6 @@
>   extern const struct mlx5_ib_profile raw_eth_profile;
> 
>   #ifdef CONFIG_MLX5_ESWITCH
> -u8 mlx5_ib_eswitch_mode(struct mlx5_eswitch *esw);
>   struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
>   					  u16 vport_num);
>   struct mlx5_ib_dev *mlx5_ib_get_uplink_ibdev(struct mlx5_eswitch *esw);
> @@ -26,11 +25,6 @@ struct mlx5_flow_handle *create_flow_rule_vport_sq(struct mlx5_ib_dev *dev,
>   struct net_device *mlx5_ib_get_rep_netdev(struct mlx5_eswitch *esw,
>   					  u16 vport_num);
>   #else /* CONFIG_MLX5_ESWITCH */
> -static inline u8 mlx5_ib_eswitch_mode(struct mlx5_eswitch *esw)
> -{
> -	return MLX5_ESWITCH_NONE;
> -}
> -
>   static inline
>   struct mlx5_ib_dev *mlx5_ib_get_rep_ibdev(struct mlx5_eswitch *esw,
>   					  u16 vport_num)
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/dev.c b/drivers/net/ethernet/mellanox/mlx5/core/dev.c
> index 3a81c2f1971b..b051417ede67 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/dev.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/dev.c
> @@ -47,7 +47,7 @@ static bool is_eth_rep_supported(struct mlx5_core_dev *dev)
>   	if (!MLX5_ESWITCH_MANAGER(dev))
>   		return false;
> 
> -	if (mlx5_eswitch_mode(dev->priv.eswitch) != MLX5_ESWITCH_OFFLOADS)
> +	if (!is_mdev_switchdev_mode(dev))
>   		return false;
> 
>   	return true;
> @@ -144,7 +144,7 @@ static bool is_ib_rep_supported(struct mlx5_core_dev *dev)
>   	if (!MLX5_ESWITCH_MANAGER(dev))
>   		return false;
> 
> -	if (mlx5_eswitch_mode(dev->priv.eswitch) != MLX5_ESWITCH_OFFLOADS)
> +	if (!is_mdev_switchdev_mode(dev))
>   		return false;
> 
>   	if (mlx5_core_mp_enabled(dev))
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/devlink.c b/drivers/net/ethernet/mellanox/mlx5/core/devlink.c
> index 1a351e2f6ace..aeffb6b135ee 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/devlink.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/devlink.c
> @@ -221,7 +221,7 @@ static int mlx5_devlink_fs_mode_validate(struct devlink *devlink, u32 id,
>   		u8 eswitch_mode;
>   		bool smfs_cap;
> 
> -		eswitch_mode = mlx5_eswitch_mode(dev->priv.eswitch);
> +		eswitch_mode = mlx5_eswitch_mode(dev);
>   		smfs_cap = mlx5_fs_dr_is_supported(dev);
> 
>   		if (!smfs_cap) {
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> index 3c4f880c6329..8d65ac888a28 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -3135,7 +3135,7 @@ static void mlx5e_modify_admin_state(struct mlx5_core_dev *mdev,
> 
>   	mlx5_set_port_admin_status(mdev, state);
> 
> -	if (!MLX5_ESWITCH_MANAGER(mdev) ||  mlx5_eswitch_mode(esw) == MLX5_ESWITCH_OFFLOADS)
> +	if (mlx5_eswitch_mode(mdev) != MLX5_ESWITCH_LEGACY)
>   		return;
> 
>   	if (state == MLX5_PORT_UP)
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> index e3a968e9e2a0..7548bab78654 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> @@ -271,8 +271,6 @@ mlx5e_tc_match_to_reg_set(struct mlx5_core_dev *mdev,
>   	return 0;
>   }
> 
> -#define esw_offloads_mode(esw) (mlx5_eswitch_mode(esw) == MLX5_ESWITCH_OFFLOADS)
> -
>   static struct mlx5_tc_ct_priv *
>   get_ct_priv(struct mlx5e_priv *priv)
>   {
> @@ -280,7 +278,7 @@ get_ct_priv(struct mlx5e_priv *priv)
>   	struct mlx5_rep_uplink_priv *uplink_priv;
>   	struct mlx5e_rep_priv *uplink_rpriv;
> 
> -	if (esw_offloads_mode(esw)) {
> +	if (is_mdev_switchdev_mode(priv->mdev)) {
>   		uplink_rpriv = mlx5_eswitch_get_uplink_priv(esw, REP_ETH);
>   		uplink_priv = &uplink_rpriv->uplink_priv;
> 
> @@ -297,7 +295,7 @@ mlx5_tc_rule_insert(struct mlx5e_priv *priv,
>   {
>   	struct mlx5_eswitch *esw = priv->mdev->priv.eswitch;
> 
> -	if (esw_offloads_mode(esw))
> +	if (is_mdev_switchdev_mode(priv->mdev))
>   		return mlx5_eswitch_add_offloaded_rule(esw, spec, attr);
> 
>   	return	mlx5e_add_offloaded_nic_rule(priv, spec, attr);
> @@ -310,7 +308,7 @@ mlx5_tc_rule_delete(struct mlx5e_priv *priv,
>   {
>   	struct mlx5_eswitch *esw = priv->mdev->priv.eswitch;
> 
> -	if (esw_offloads_mode(esw)) {
> +	if (is_mdev_switchdev_mode(priv->mdev)) {
>   		mlx5_eswitch_del_offloaded_rule(esw, rule, attr);
> 
>   		return;
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
> index b652b4bde733..b44f28fb5518 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
> @@ -2439,8 +2439,10 @@ int mlx5_eswitch_get_vport_stats(struct mlx5_eswitch *esw,
>   	return err;
>   }
> 
> -u8 mlx5_eswitch_mode(struct mlx5_eswitch *esw)
> +u8 mlx5_eswitch_mode(struct mlx5_core_dev *dev)
>   {
> +	struct mlx5_eswitch *esw = dev->priv.eswitch;
> +
>   	return ESW_ALLOWED(esw) ? esw->mode : MLX5_ESWITCH_NONE;
>   }
>   EXPORT_SYMBOL_GPL(mlx5_eswitch_mode);
> diff --git a/include/linux/mlx5/eswitch.h b/include/linux/mlx5/eswitch.h
> index b0ae8020f13e..29fd832950e0 100644
> --- a/include/linux/mlx5/eswitch.h
> +++ b/include/linux/mlx5/eswitch.h
> @@ -96,10 +96,10 @@ static inline u32 mlx5_eswitch_get_vport_metadata_mask(void)
> 
>   u32 mlx5_eswitch_get_vport_metadata_for_match(struct mlx5_eswitch *esw,
>   					      u16 vport_num);
> -u8 mlx5_eswitch_mode(struct mlx5_eswitch *esw);
> +u8 mlx5_eswitch_mode(struct mlx5_core_dev *dev);
>   #else  /* CONFIG_MLX5_ESWITCH */
> 
> -static inline u8 mlx5_eswitch_mode(struct mlx5_eswitch *esw)
> +static inline u8 mlx5_eswitch_mode(struct mlx5_core_dev *dev)
>   {
>   	return MLX5_ESWITCH_NONE;
>   }
> @@ -136,4 +136,8 @@ mlx5_eswitch_get_vport_metadata_mask(void)
>   }
>   #endif /* CONFIG_MLX5_ESWITCH */
> 
> +static inline bool is_mdev_switchdev_mode(struct mlx5_core_dev *dev)
> +{
> +	return mlx5_eswitch_mode(dev) == MLX5_ESWITCH_OFFLOADS;
> +}
>   #endif
> --
> 2.28.0
> 

Reviewed-by: Roi Dayan <roid@nvidia.com>
