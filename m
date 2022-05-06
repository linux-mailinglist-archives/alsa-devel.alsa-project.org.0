Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9552152F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AB1317F1;
	Tue, 10 May 2022 14:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AB1317F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652185403;
	bh=2z1sbkNw7ahHcs7QjP4txrOPl/I4rL3+ZDp3OxkW1vA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2zrbMbMQ6Ub35dFkL+v4AT/VXYmwr8z1N3Xt6/RBmDPNFOPMq5ZZSz1DkQhLK4dg
	 xnfobcw3tFRFbNTS/i+GtB3pcj+0I4WfCEUZY8qZ0Us1fSm9h1XkhEmsNRifFF75F7
	 CDprpt2GNi7oddPSAG5mT1NATD4MVmALeVrpDp9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB112F804FF;
	Tue, 10 May 2022 14:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5388F8014B; Sat,  7 May 2022 00:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 565B0F800E3
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 00:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 565B0F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RhSA51ni"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2BEDB2B01226;
 Fri,  6 May 2022 18:35:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 06 May 2022 18:35:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651876539; x=
 1651883739; bh=2PEZYJ6H5NjwlOLCSF/znMhdRyqXIjEm8KXJigOw1Vg=; b=R
 hSA51niVEy5JxE00UFlfNdR1m/Gsve1HXbIJ8aDQJGiiDIk1ooDHCLTCwwpYrvlQ
 YR1enxc9lWl3vJfhQqA1K4Q69QNVad/yA9aERbbeMMv3zopodqrUwIGQ4MVLvTPP
 S3DQ/Xspu7Gd5d76rMpzSMJlZZRVG9srnSziZ6HQfkiVCo9cgHbhK6UDCVf1YQHk
 NjGvL/5k8tq22gbV9F9JZPOsfXQsPTClBCp3lb8H2nm7WOcpbBnjT9SO+hQibBoW
 5rj5nh7Hhh+8opf2Xw7dGZ54ujIRFcf9yGhLGAqlqWBuJqwmuWNNCDE8Xsd7SUIU
 +I3tHsGhsfTPCSbp9zezg==
X-ME-Sender: <xms:uaJ1Yos7Sa-TdFVIL7sWpOzedzlxyq2DMlWgYStdttrEfWJ3KBkw2g>
 <xme:uaJ1YldYxyOSV54bosQ1N7kY8T6WyeiFEwEWKCF4kl6GNo0mkckoMVtTeYZVKy2jR
 i-Ik7VsQzHrRoP6TQg>
X-ME-Received: <xmr:uaJ1Yjwf0y7CxAbgwS6EjNm7kxQQ7k6dJXwmGC25H9vJCI22UA2ENQMtoqlN8B5G3zXMjLnD6SAVkOZs6SO88vQ8YvGcQKN-8LU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeggddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevufgjkfhfgggtsehttdertd
 dttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidq
 mheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejke
 fhffekfeffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorh
 hg
X-ME-Proxy: <xmx:uqJ1YrOgJ7Ze4Tm5sUhhN1T4TBROjdwpfjC0NrBBv86stC8ojlcEOg>
 <xmx:uqJ1Yo8CiMR8elzazfYvgRY28ArT41bU7Z1aLYW88WZhNYRb4XETHA>
 <xmx:uqJ1YjUt8L4tCAlZl4mc0t_BcLXtfQ_9QlDXab0dP4mdmLz3tBn5MA>
 <xmx:u6J1YsTZjm5Ryket5HJxDr66Tv0cB-EH5IyGfEPbAY-9E02TbqMI2DWsmrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 May 2022 18:35:36 -0400 (EDT)
Date: Sat, 7 May 2022 08:35:43 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: lizhe <sensor1010@163.com>
Subject: Re: [PATCH] kernel/drivers: Remove redundant driver match function
In-Reply-To: <20220506045952.136290-1-sensor1010@163.com>
Message-ID: <fe632997-be40-55f2-96c0-e79a7aece197@linux-m68k.org>
References: <20220506045952.136290-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Tue, 10 May 2022 14:21:49 +0200
Cc: alsa-devel@alsa-project.org, target-devel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, zbr@ioremap.net, agordeev@linux.ibm.com,
 lee.jones@linaro.org, linux-s390@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, pasic@linux.ibm.com, wens@csie.org,
 u.kleine-koenig@pengutronix.de, borntraeger@linux.ibm.com, jejb@linux.ibm.com,
 jjherne@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 linux-m68k@lists.linux-m68k.org, freude@linux.ibm.com, hare@suse.de,
 dan.j.williams@intel.com, akrowiak@linux.ibm.com, martin.petersen@oracle.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, svens@linux.ibm.com,
 colin.king@intel.com
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


On Thu, 5 May 2022, lizhe wrote:

> If there is no driver match function, the driver core assumes that each
> candidate pair (driver, device) matches, see driver_match_device().
> 
> Signed-off-by: lizhe <sensor1010@163.com>

Acked-by: Finn Thain <fthain@linux-m68k.org>
for the nubus changes.

> ---
>  drivers/mfd/mcp-core.c             |  6 ------
>  drivers/nubus/bus.c                |  6 ------
>  drivers/s390/crypto/vfio_ap_drv.c  |  6 ------
>  drivers/scsi/scsi_debug.c          |  7 -------
>  drivers/target/loopback/tcm_loop.c |  7 -------
>  drivers/w1/w1.c                    |  6 ------
>  sound/ac97_bus.c                   | 11 -----------
>  7 files changed, 49 deletions(-)
> 
> diff --git a/drivers/mfd/mcp-core.c b/drivers/mfd/mcp-core.c
> index 2fa592c37c6f..281a9369f2b3 100644
> --- a/drivers/mfd/mcp-core.c
> +++ b/drivers/mfd/mcp-core.c
> @@ -20,11 +20,6 @@
>  #define to_mcp(d)		container_of(d, struct mcp, attached_device)
>  #define to_mcp_driver(d)	container_of(d, struct mcp_driver, drv)
>  
> -static int mcp_bus_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>  static int mcp_bus_probe(struct device *dev)
>  {
>  	struct mcp *mcp = to_mcp(dev);
> @@ -43,7 +38,6 @@ static void mcp_bus_remove(struct device *dev)
>  
>  static struct bus_type mcp_bus_type = {
>  	.name		= "mcp",
> -	.match		= mcp_bus_match,
>  	.probe		= mcp_bus_probe,
>  	.remove		= mcp_bus_remove,
>  };
> diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
> index 17fad660032c..72921e4f35f6 100644
> --- a/drivers/nubus/bus.c
> +++ b/drivers/nubus/bus.c
> @@ -14,11 +14,6 @@
>  #define to_nubus_board(d)       container_of(d, struct nubus_board, dev)
>  #define to_nubus_driver(d)      container_of(d, struct nubus_driver, driver)
>  
> -static int nubus_bus_match(struct device *dev, struct device_driver *driver)
> -{
> -	return 1;
> -}
> -
>  static int nubus_device_probe(struct device *dev)
>  {
>  	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
> @@ -39,7 +34,6 @@ static void nubus_device_remove(struct device *dev)
>  
>  struct bus_type nubus_bus_type = {
>  	.name		= "nubus",
> -	.match		= nubus_bus_match,
>  	.probe		= nubus_device_probe,
>  	.remove		= nubus_device_remove,
>  };
> diff --git a/drivers/s390/crypto/vfio_ap_drv.c b/drivers/s390/crypto/vfio_ap_drv.c
> index 29ebd54f8919..0a662c451f2a 100644
> --- a/drivers/s390/crypto/vfio_ap_drv.c
> +++ b/drivers/s390/crypto/vfio_ap_drv.c
> @@ -172,14 +172,8 @@ static void vfio_ap_matrix_dev_release(struct device *dev)
>  	kfree(matrix_dev);
>  }
>  
> -static int matrix_bus_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>  static struct bus_type matrix_bus = {
>  	.name = "matrix",
> -	.match = &matrix_bus_match,
>  };
>  
>  static struct device_driver matrix_driver = {
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index 592a290e6cfa..8107489b36e8 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -7844,15 +7844,8 @@ static void sdebug_driver_remove(struct device *dev)
>  	scsi_host_put(sdbg_host->shost);
>  }
>  
> -static int pseudo_lld_bus_match(struct device *dev,
> -				struct device_driver *dev_driver)
> -{
> -	return 1;
> -}
> -
>  static struct bus_type pseudo_lld_bus = {
>  	.name = "pseudo",
> -	.match = pseudo_lld_bus_match,
>  	.probe = sdebug_driver_probe,
>  	.remove = sdebug_driver_remove,
>  	.drv_groups = sdebug_drv_groups,
> diff --git a/drivers/target/loopback/tcm_loop.c b/drivers/target/loopback/tcm_loop.c
> index 4407b56aa6d1..eeb63deff94f 100644
> --- a/drivers/target/loopback/tcm_loop.c
> +++ b/drivers/target/loopback/tcm_loop.c
> @@ -83,15 +83,8 @@ static int tcm_loop_show_info(struct seq_file *m, struct Scsi_Host *host)
>  static int tcm_loop_driver_probe(struct device *);
>  static void tcm_loop_driver_remove(struct device *);
>  
> -static int pseudo_lld_bus_match(struct device *dev,
> -				struct device_driver *dev_driver)
> -{
> -	return 1;
> -}
> -
>  static struct bus_type tcm_loop_lld_bus = {
>  	.name			= "tcm_loop_bus",
> -	.match			= pseudo_lld_bus_match,
>  	.probe			= tcm_loop_driver_probe,
>  	.remove			= tcm_loop_driver_remove,
>  };
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index f2ae2e563dc5..a6ecfa1b3417 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -58,11 +58,6 @@ MODULE_PARM_DESC(slave_ttl,
>  DEFINE_MUTEX(w1_mlock);
>  LIST_HEAD(w1_masters);
>  
> -static int w1_master_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>  static int w1_master_probe(struct device *dev)
>  {
>  	return -ENODEV;
> @@ -174,7 +169,6 @@ static int w1_uevent(struct device *dev, struct kobj_uevent_env *env);
>  
>  static struct bus_type w1_bus_type = {
>  	.name = "w1",
> -	.match = w1_master_match,
>  	.uevent = w1_uevent,
>  };
>  
> diff --git a/sound/ac97_bus.c b/sound/ac97_bus.c
> index b4685c53ff11..c7aee8c42c55 100644
> --- a/sound/ac97_bus.c
> +++ b/sound/ac97_bus.c
> @@ -75,19 +75,8 @@ int snd_ac97_reset(struct snd_ac97 *ac97, bool try_warm, unsigned int id,
>  }
>  EXPORT_SYMBOL_GPL(snd_ac97_reset);
>  
> -/*
> - * Let drivers decide whether they want to support given codec from their
> - * probe method. Drivers have direct access to the struct snd_ac97
> - * structure and may  decide based on the id field amongst other things.
> - */
> -static int ac97_bus_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>  struct bus_type ac97_bus_type = {
>  	.name		= "ac97",
> -	.match		= ac97_bus_match,
>  };
>  
>  static int __init ac97_bus_init(void)
> 
