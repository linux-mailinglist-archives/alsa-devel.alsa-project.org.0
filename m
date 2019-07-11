Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC7866172
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 00:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F0491667;
	Fri, 12 Jul 2019 00:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F0491667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562882549;
	bh=mjUq1lGfIulf2uRgvtjN0A8A+BCaebKSvRcQL9FoqE8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oq59oSKsZ4+Y+Smn62tYhnDjh1x5nsCrohyTeLyw65TLWvH1ylgPExDfbG7CCwSNu
	 2cj5XHZJMVbvLy0XXTTKdSOG1ujwwbeiOvz8qbXa8MuaYOQIjnsCwjF9wOpLs+FzNe
	 g3H1BrN6xnh8uKkXTSJNG9vk6GzCe4NfQJ9eYpg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFAFF802E0;
	Fri, 12 Jul 2019 00:00:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB40AF802FB; Fri, 12 Jul 2019 00:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0194.hostedemail.com
 [216.40.44.194])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D8FF800E2
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 00:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D8FF800E2
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 87C83909A;
 Thu, 11 Jul 2019 22:00:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: bean07_3ea908f224563
X-Filterd-Recvd-Size: 2260
Received: from XPS-9350 (unknown [172.58.35.165])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Thu, 11 Jul 2019 22:00:30 +0000 (UTC)
Message-ID: <eeeb09518c8967ffd48606c3d1222553752e895d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Vinod Koul <vkoul@kernel.org>, Wen Yang
 <wen.yang99@zte.com.cn>, Gen Zhang <blackgod016574@gmail.com>, Dan
 Carpenter <dan.carpenter@oracle.com>, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 11 Jul 2019 15:00:00 -0700
In-Reply-To: <20190711174906.GA10867@hari-Inspiron-1545>
References: <20190711174906.GA10867@hari-Inspiron-1545>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Subject: Re: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: fix
 "conversion to bool not needed here"
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

On Thu, 2019-07-11 at 23:19 +0530, Hariprasad Kelam wrote:
> Fix below issue reported by coccicheck
> sound/soc/codecs/wcd9335.c:3991:25-30: WARNING: conversion to bool not
> needed here
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  sound/soc/codecs/wcd9335.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 1bbbe42..85a8d10 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -3988,12 +3988,7 @@ static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
>  		regmap_read(wcd->if_regmap,
>  				WCD9335_SLIM_PGD_PORT_INT_RX_SOURCE0 + j, &val);
>  		if (val) {
> -			if (!tx)
> -				reg = WCD9335_SLIM_PGD_PORT_INT_EN0 +
> -					(port_id / 8);
> -			else
> -				reg = WCD9335_SLIM_PGD_PORT_INT_TX_EN0 +
> -					(port_id / 8);
> +			reg = WCD9335_SLIM_PGD_PORT_INT_TX_EN0 + (port_id / 8);
>  			regmap_read(
>  				wcd->if_regmap, reg, &int_val);
>  			/*

This change makes no sense and doesn't match the commit message.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
