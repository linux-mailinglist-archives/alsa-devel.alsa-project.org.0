Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E142A7ED45
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 09:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3F7175C;
	Fri,  2 Aug 2019 09:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3F7175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564730258;
	bh=piE9mKLLHhBgEadBHniQkKqi6IhQauPHTHYWTTTGYBs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SfEms49jQULEWLTz8+RduTyWApPZOLghP7aD1Z/pDKTNAUnqEyhqbwlWsF6qtEZ8m
	 YQNADf7I1xg9y4IcqPz69SYt/6gtiwdZQ3eCkaITcJsAb+h1J7J9poeb+iBXFU94sX
	 SZgIAXGJDrLX3XNwK4ZOdRYiou+h3FEMf8Y7eLc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBB5AF80C15;
	Fri,  2 Aug 2019 08:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2FABF80133; Wed, 31 Jul 2019 22:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431CAF800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 22:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431CAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="m5I5d4eS"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6VKYV8E137496;
 Wed, 31 Jul 2019 20:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=cxi4RXuMAY0gssCcoh+duXl2/IGVLQSytbMX5zC4ZvE=;
 b=m5I5d4eSCGtQPWAua7VPFrQcGk82H9W6ADbRW5gAwpK1KJa1Q7eNLGoelcOJk4WGPQyj
 Ua26fHby5HtzwLpaFMlLTEcTVyXWePeS8Gdq+s4snHG3qEsDdfSGdROIZ7QrSrPgCalb
 qQxAxrSmMKIXCiOD2yhjryz9FcHCp+mlALqmyxM5mNQvF7gwMdQH5dW56PykxHGkRbUW
 eMJAr9LPgL5X/RQWYZMgoxJWY0A/cnkjj8c3miWZAE2A/dUMgFJLLmoNwsp86oYZ2OrY
 roXNFjr7XzhyG+IPe9+E+hLLtTMw8JjS4BmDSBcUuuzoHkUOI+DH6utMpBvRs/j1umy6 fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2u0ejpqkt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 20:37:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6VKS1Ob167767;
 Wed, 31 Jul 2019 20:37:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2u38fbam15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 20:37:04 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6VKavQs005257;
 Wed, 31 Jul 2019 20:36:57 GMT
Received: from [192.168.1.84] (/99.156.91.244)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 31 Jul 2019 13:36:57 -0700
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1564603513.git.mchehab+samsung@kernel.org>
 <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
From: Dave Kleikamp <dave.kleikamp@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dave.kleikamp@oracle.com; prefer-encrypt=mutual; keydata=
 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
 rnNNL3zBkwD3nWcTxFnX
Message-ID: <0fd2f332-891f-b3f8-6d6c-e58358611228@oracle.com>
Date: Wed, 31 Jul 2019 15:36:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5b4fae5978d309641fa8ba233a9efe2b48201cd6.1564603513.git.mchehab+samsung@kernel.org>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9335
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=21
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1907310205
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9335
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=21 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1907310206
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:52:07 +0200
Cc: Mark Rutland <mark.rutland@arm.com>, Dave Kleikamp <shaggy@kernel.org>,
 alsa-devel@alsa-project.org, Evgeniy Dushistov <dushistov@mail.ru>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 Mauro Carvalho Chehab <mchehab@infradead.org>, devicetree@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/6] docs: fix a couple of new broken
	references
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 7/31/19 3:08 PM, Mauro Carvalho Chehab wrote:
> Those are due to recent changes. Most of the issues
> can be automatically fixed with:
> 
> 	$ ./scripts/documentation-file-ref-check --fix
> 
> The only exception was the sound binding with required
> manual work.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Acked-by: > Dave Kleikamp <dave.kleikamp@oracle.com>
> ---
>  Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt | 2 +-
>  MAINTAINERS                                                 | 4 ++--
>  drivers/hwtracing/coresight/Kconfig                         | 2 +-
>  fs/jfs/Kconfig                                              | 2 +-
>  fs/ufs/Kconfig                                              | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
> index 2ca3d138528e..7ecf6bd60d27 100644
> --- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
> +++ b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
> @@ -4,7 +4,7 @@ Allwinner SUN8I audio codec
>  On Sun8i-A33 SoCs, the audio is separated in different parts:
>  	  - A DAI driver. It uses the "sun4i-i2s" driver which is
>  	  documented here:
> -	  Documentation/devicetree/bindings/sound/sun4i-i2s.txt
> +	  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
>  	  - An analog part of the codec which is handled as PRCM registers.
>  	  See Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
>  	  - An digital part of the codec which is documented in this current
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6de82f019a52..f109a8bcffda 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8659,7 +8659,7 @@ L:	jfs-discussion@lists.sourceforge.net
>  W:	http://jfs.sourceforge.net/
>  T:	git git://github.com/kleikamp/linux-shaggy.git
>  S:	Maintained
> -F:	Documentation/filesystems/jfs.txt
> +F:	Documentation/admin-guide/jfs.rst
>  F:	fs/jfs/
>  
>  JME NETWORK DRIVER
> @@ -16439,7 +16439,7 @@ F:	drivers/hid/hid-udraw-ps3.c
>  UFS FILESYSTEM
>  M:	Evgeniy Dushistov <dushistov@mail.ru>
>  S:	Maintained
> -F:	Documentation/filesystems/ufs.txt
> +F:	Documentation/admin-guide/ufs.rst
>  F:	fs/ufs/
>  
>  UHID USERSPACE HID IO DRIVER:
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 14638db4991d..7a9f5fb08330 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -106,7 +106,7 @@ config CORESIGHT_CPU_DEBUG
>  	  can quickly get to know program counter (PC), secure state,
>  	  exception level, etc. Before use debugging functionality, platform
>  	  needs to ensure the clock domain and power domain are enabled
> -	  properly, please refer Documentation/trace/coresight-cpu-debug.txt
> +	  properly, please refer Documentation/trace/coresight-cpu-debug.rst
>  	  for detailed description and the example for usage.
>  
>  endif
> diff --git a/fs/jfs/Kconfig b/fs/jfs/Kconfig
> index 22a273bd4648..05cb0e8e4382 100644
> --- a/fs/jfs/Kconfig
> +++ b/fs/jfs/Kconfig
> @@ -5,7 +5,7 @@ config JFS_FS
>  	select CRC32
>  	help
>  	  This is a port of IBM's Journaled Filesystem .  More information is
> -	  available in the file <file:Documentation/filesystems/jfs.txt>.
> +	  available in the file <file:Documentation/admin-guide/jfs.rst>.
>  
>  	  If you do not intend to use the JFS filesystem, say N.
>  
> diff --git a/fs/ufs/Kconfig b/fs/ufs/Kconfig
> index fcb41516ea59..6d30adb6b890 100644
> --- a/fs/ufs/Kconfig
> +++ b/fs/ufs/Kconfig
> @@ -9,7 +9,7 @@ config UFS_FS
>  	  this file system as well. Saying Y here will allow you to read from
>  	  these partitions; if you also want to write to them, say Y to the
>  	  experimental "UFS file system write support", below. Please read the
> -	  file <file:Documentation/filesystems/ufs.txt> for more information.
> +	  file <file:Documentation/admin-guide/ufs.rst> for more information.
>  
>            The recently released UFS2 variant (used in FreeBSD 5.x) is
>            READ-ONLY supported.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
