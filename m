Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D0D521546
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9250C18BD;
	Tue, 10 May 2022 14:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9250C18BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652185495;
	bh=PP9hvwR/f+Qg67bYAnXeqCbrK5GdXbgG9cpgZ75Qh2E=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KsQyGzvxTzF54SPvsSvgWL7Dlvlp99YTRHHi4CRAq0YUc65f9QGyVp/5INmgzMvc5
	 um1/FwbPPLYBaTRo7EaDc2yuCTgIjVFiJrkT20nKoiz5awvrkAnzTeNE/E6R9cJhV1
	 7jMuN1JLvvevQZweR2DVGR0AkuKq6sYRi/rGOjUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B77CAF80539;
	Tue, 10 May 2022 14:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D3FAF8014C; Mon,  9 May 2022 13:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C346F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 13:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C346F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.b="Brdurmu0"
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249BXGK7007757;
 Mon, 9 May 2022 11:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Hu4B3k0xeUNro813b2+aiUBT771PwRooBJJnDff8yqo=;
 b=Brdurmu0VDJiSNxJx0d9AvWLPlMZWxkJvwZ3MOcWoQqj6OpcVsVukftMCEBd1Qt61jdv
 8E1gjddiVWwhSd1wdAwJ1MQjdwP81kykLpwXRxgDef3jAgM1BDFlr0IGgp/MSevPcL2s
 E8Tn4HfJu3KO1a7ZfR/z/1nk7pWyrAB8owptbC3bOHcOR6T4rxIlUZDODs4ysx+rrabL
 821bhDazAJWGrmpv/4jdWDn43LGKxfMk065SuXMGr875PMjrP0J4RMiXe3KrXERucpeU
 TTol0HnOsQzyjW0hvmaKkcA7Tu8q/uFpCTFAst7osZ7Xc6XGK2e/IuE0Aec01pLOwjQA oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy26e828d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 11:36:45 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 249BXqDH009570;
 Mon, 9 May 2022 11:36:44 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fy26e8285-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 11:36:44 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 249BQwEc031325;
 Mon, 9 May 2022 11:36:44 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 3fwgd9nr45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 11:36:44 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 249BahAK23200072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 May 2022 11:36:43 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 594F6112064;
 Mon,  9 May 2022 11:36:43 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11645112062;
 Mon,  9 May 2022 11:36:42 +0000 (GMT)
Received: from [9.65.254.31] (unknown [9.65.254.31])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 May 2022 11:36:41 +0000 (GMT)
Message-ID: <3b88c917-debd-ffa8-3cc9-7b9b19f34ddd@linux.ibm.com>
Date: Mon, 9 May 2022 07:36:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] kernel/drivers: Remove redundant driver match function
Content-Language: en-US
To: lizhe <sensor1010@163.com>, lee.jones@linaro.org, fthain@linux-m68k.org,
 pasic@linux.ibm.com, jjherne@linux.ibm.com, freude@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, zbr@ioremap.net, perex@perex.cz,
 tiwai@suse.com, bvanassche@acm.org, dan.j.williams@intel.com,
 srinivas.kandagatla@linaro.org, wens@csie.org, colin.king@intel.com,
 u.kleine-koenig@pengutronix.de, hare@suse.de
References: <20220506045952.136290-1-sensor1010@163.com>
From: Tony Krowiak <akrowiak@linux.ibm.com>
In-Reply-To: <20220506045952.136290-1-sensor1010@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mLd8JY_V2FXBoVdvKg4D7A0V2tYAZCqR
X-Proofpoint-GUID: CSqm4z8NZvcz7mC3q7ZEt_umum_5EVtR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_03,2022-05-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090065
X-Mailman-Approved-At: Tue, 10 May 2022 14:21:48 +0200
Cc: linux-s390@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, target-devel@vger.kernel.org
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

For the drivers/s390/crypto/vfio_ap_drv.c device driver:
Reviewed-by: Tony Krowiak <akrowiak@stny.rr.com>

On 5/6/22 12:59 AM, lizhe wrote:
> If there is no driver match function, the driver core assumes that each
> candidate pair (driver, device) matches, see driver_match_device().
>
> Signed-off-by: lizhe <sensor1010@163.com>
> ---
>   drivers/mfd/mcp-core.c             |  6 ------
>   drivers/nubus/bus.c                |  6 ------
>   drivers/s390/crypto/vfio_ap_drv.c  |  6 ------
>   drivers/scsi/scsi_debug.c          |  7 -------
>   drivers/target/loopback/tcm_loop.c |  7 -------
>   drivers/w1/w1.c                    |  6 ------
>   sound/ac97_bus.c                   | 11 -----------
>   7 files changed, 49 deletions(-)
>
> diff --git a/drivers/mfd/mcp-core.c b/drivers/mfd/mcp-core.c
> index 2fa592c37c6f..281a9369f2b3 100644
> --- a/drivers/mfd/mcp-core.c
> +++ b/drivers/mfd/mcp-core.c
> @@ -20,11 +20,6 @@
>   #define to_mcp(d)		container_of(d, struct mcp, attached_device)
>   #define to_mcp_driver(d)	container_of(d, struct mcp_driver, drv)
>   
> -static int mcp_bus_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>   static int mcp_bus_probe(struct device *dev)
>   {
>   	struct mcp *mcp = to_mcp(dev);
> @@ -43,7 +38,6 @@ static void mcp_bus_remove(struct device *dev)
>   
>   static struct bus_type mcp_bus_type = {
>   	.name		= "mcp",
> -	.match		= mcp_bus_match,
>   	.probe		= mcp_bus_probe,
>   	.remove		= mcp_bus_remove,
>   };
> diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
> index 17fad660032c..72921e4f35f6 100644
> --- a/drivers/nubus/bus.c
> +++ b/drivers/nubus/bus.c
> @@ -14,11 +14,6 @@
>   #define to_nubus_board(d)       container_of(d, struct nubus_board, dev)
>   #define to_nubus_driver(d)      container_of(d, struct nubus_driver, driver)
>   
> -static int nubus_bus_match(struct device *dev, struct device_driver *driver)
> -{
> -	return 1;
> -}
> -
>   static int nubus_device_probe(struct device *dev)
>   {
>   	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
> @@ -39,7 +34,6 @@ static void nubus_device_remove(struct device *dev)
>   
>   struct bus_type nubus_bus_type = {
>   	.name		= "nubus",
> -	.match		= nubus_bus_match,
>   	.probe		= nubus_device_probe,
>   	.remove		= nubus_device_remove,
>   };
> diff --git a/drivers/s390/crypto/vfio_ap_drv.c b/drivers/s390/crypto/vfio_ap_drv.c
> index 29ebd54f8919..0a662c451f2a 100644
> --- a/drivers/s390/crypto/vfio_ap_drv.c
> +++ b/drivers/s390/crypto/vfio_ap_drv.c
> @@ -172,14 +172,8 @@ static void vfio_ap_matrix_dev_release(struct device *dev)
>   	kfree(matrix_dev);
>   }
>   
> -static int matrix_bus_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>   static struct bus_type matrix_bus = {
>   	.name = "matrix",
> -	.match = &matrix_bus_match,
>   };
>   
>   static struct device_driver matrix_driver = {
> diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
> index 592a290e6cfa..8107489b36e8 100644
> --- a/drivers/scsi/scsi_debug.c
> +++ b/drivers/scsi/scsi_debug.c
> @@ -7844,15 +7844,8 @@ static void sdebug_driver_remove(struct device *dev)
>   	scsi_host_put(sdbg_host->shost);
>   }
>   
> -static int pseudo_lld_bus_match(struct device *dev,
> -				struct device_driver *dev_driver)
> -{
> -	return 1;
> -}
> -
>   static struct bus_type pseudo_lld_bus = {
>   	.name = "pseudo",
> -	.match = pseudo_lld_bus_match,
>   	.probe = sdebug_driver_probe,
>   	.remove = sdebug_driver_remove,
>   	.drv_groups = sdebug_drv_groups,
> diff --git a/drivers/target/loopback/tcm_loop.c b/drivers/target/loopback/tcm_loop.c
> index 4407b56aa6d1..eeb63deff94f 100644
> --- a/drivers/target/loopback/tcm_loop.c
> +++ b/drivers/target/loopback/tcm_loop.c
> @@ -83,15 +83,8 @@ static int tcm_loop_show_info(struct seq_file *m, struct Scsi_Host *host)
>   static int tcm_loop_driver_probe(struct device *);
>   static void tcm_loop_driver_remove(struct device *);
>   
> -static int pseudo_lld_bus_match(struct device *dev,
> -				struct device_driver *dev_driver)
> -{
> -	return 1;
> -}
> -
>   static struct bus_type tcm_loop_lld_bus = {
>   	.name			= "tcm_loop_bus",
> -	.match			= pseudo_lld_bus_match,
>   	.probe			= tcm_loop_driver_probe,
>   	.remove			= tcm_loop_driver_remove,
>   };
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index f2ae2e563dc5..a6ecfa1b3417 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -58,11 +58,6 @@ MODULE_PARM_DESC(slave_ttl,
>   DEFINE_MUTEX(w1_mlock);
>   LIST_HEAD(w1_masters);
>   
> -static int w1_master_match(struct device *dev, struct device_driver *drv)
> -{
> -	return 1;
> -}
> -
>   static int w1_master_probe(struct device *dev)
>   {
>   	return -ENODEV;
> @@ -174,7 +169,6 @@ static int w1_uevent(struct device *dev, struct kobj_uevent_env *env);
>   
>   static struct bus_type w1_bus_type = {
>   	.name = "w1",
> -	.match = w1_master_match,
>   	.uevent = w1_uevent,
>   };
>   
> diff --git a/sound/ac97_bus.c b/sound/ac97_bus.c
> index b4685c53ff11..c7aee8c42c55 100644
> --- a/sound/ac97_bus.c
> +++ b/sound/ac97_bus.c
> @@ -75,19 +75,8 @@ int snd_ac97_reset(struct snd_ac97 *ac97, bool try_warm, unsigned int id,
>   }
>   EXPORT_SYMBOL_GPL(snd_ac97_reset);
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
>   struct bus_type ac97_bus_type = {
>   	.name		= "ac97",
> -	.match		= ac97_bus_match,
>   };
>   
>   static int __init ac97_bus_init(void)

