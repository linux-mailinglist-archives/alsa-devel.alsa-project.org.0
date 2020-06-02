Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926461EBBE7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 14:41:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5F01661;
	Tue,  2 Jun 2020 14:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5F01661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591101692;
	bh=1SDsosQaivvxmiHXl5ASQGS9mFoLRUBMJIlBMFpsa6M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZlDkzQtYKL5udT3dE2a981CzS8P4AJ1RVwUcb3HVOtOGxT7pHRkkWxwZCWLZECMK
	 pSWj+0skknO3XdpAuVVnMc+oO0eWfglJ6BUcKsBdakm/wWRG8JqnT5/0E0jWFiWn/8
	 07G281QooIHA27f28Kv9uLs0l0ls4DDoF3k2nodM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD3CF80260;
	Tue,  2 Jun 2020 14:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B790DF8026F; Tue,  2 Jun 2020 14:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED82DF800BC
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 14:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED82DF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="uzsmwn7Y"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CcSIv001774;
 Tue, 2 Jun 2020 12:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=+hHvUJaPYzsi+fcWNIuGDxfwGDP2NYDK2A8UukYwLsg=;
 b=uzsmwn7YqvyQ9EzQ2iEowprkxDu+h0QW+mTPgk/n+d/ws9CfK8jJe+OY/4p6ntObBilj
 Kv7SKNlgcxGB8BeOHAZd2jNNlIqiMWeq7PcQmXHQF2g8q2aeNA5c4dTwRuZVp4C/jPEd
 X1cyqsLoNmwDPfRnKVBIteRPu48AmNrF85QWtYyUXn7yrtPXMy5CnonvcdgjUcTv/TC/
 2R4LVXu55RXdqwP19B4SBQlT3S36d12TbEkA7ciWxs38ebbE2NiXIWKwYbVJyztFsrgB
 Qs2gdYJdTsALUuy+0NSoRBmnd8Gsn+QhsBfaVTn8Q407dniu+dRSdbGpQkMUbyTEFKr+ 5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31dkruguax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:39:43 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052CcLPP008707;
 Tue, 2 Jun 2020 12:39:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 31dju1bseu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:39:42 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052Cdflg021562;
 Tue, 2 Jun 2020 12:39:41 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:39:40 -0700
Date: Tue, 2 Jun 2020 15:39:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Subject: Re: [RESEND PATCH v1 4/6] staging: greybus: audio: Resolve
 compilation error in topology parser
Message-ID: <20200602123930.GG30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <6131fec4cf9e18dbf70fa7f992de9d588299ee18.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6131fec4cf9e18dbf70fa7f992de9d588299ee18.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020089
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 greybus-dev@lists.linaro.org, Mark Brown <broonie@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Jun 02, 2020 at 10:51:13AM +0530, Vaibhav Agarwal wrote:
> Fix compilation errors for GB Audio topology parser code with recent
> kernel versions.
> 
> Signed-off-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 130 +++++++++++------------
>  1 file changed, 61 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 4ac30accf226..7d5e87341a5c 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -5,8 +5,8 @@
>   * Copyright 2015-2016 Linaro Ltd.
>   */
>  
> +#include <linux/greybus.h>
>  #include "audio_codec.h"
> -#include "greybus_protocols.h"
>  
>  #define GBAUDIO_INVALID_ID	0xFF
>  
> @@ -165,15 +165,15 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
>  	struct gbaudio_ctl_pvt *data;
>  	struct gb_audio_ctl_elem_info *info;
>  	struct gbaudio_module_info *module;
> -	struct snd_soc_codec *codec = snd_kcontrol_chip(kcontrol);
> -	struct gbaudio_codec_info *gbcodec = snd_soc_codec_get_drvdata(codec);
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> +	struct gbaudio_codec_info *gb = snd_soc_component_get_drvdata(comp);

Please rename "gbcodec" in a different patch.  It's not related to
fixing the compile.

Otherwise it seems okay.

regards,
dan carpenter

