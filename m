Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459561C82DD
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 08:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D371317DE;
	Thu,  7 May 2020 08:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D371317DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588834311;
	bh=77qSUYCM+3iENrJTafQWQ68ZThzBUhdoBDElgwNBMGM=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ulaxa93btHRhaIQhewUItlx/jKwBgkYMjp7Bngulcd/C4DexTyP0dtyxwxkr4PI0/
	 UnXYXYlQqBh5Q75Bb1LwJNzaxhT81qlbkG7AOaY2bdsMa26d6rTLG2AsPNX+pQiyPu
	 qqokFLeimOo3XLlLihzMphDFkwtZRpp6Ixg4uLGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5CC5F80162;
	Thu,  7 May 2020 08:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE86F8015F; Thu,  7 May 2020 08:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0244.hostedemail.com
 [216.40.44.244])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3D3AF800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 08:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3D3AF800AD
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 427BF1803950B;
 Thu,  7 May 2020 06:49:52 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: burst17_1bd6e369c792e
X-Filterd-Recvd-Size: 1816
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Thu,  7 May 2020 06:49:51 +0000 (UTC)
Message-ID: <5f2d179c35de8e7705f82a8c9a540dbd204bb978.camel@perches.com>
Subject: Re: [PATCH -next] ALSA: portman2x4: Use bitwise instead of
 arithmetic operator for flags
From: Joe Perches <joe@perches.com>
To: Samuel Zou <zou_wei@huawei.com>, perex@perex.cz, tiwai@suse.com
Date: Wed, 06 May 2020 23:49:50 -0700
In-Reply-To: <1588834135-14842-1-git-send-email-zou_wei@huawei.com>
References: <1588834135-14842-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 2020-05-07 at 14:48 +0800, Samuel Zou wrote:
> Fix the following coccinelle warning:
> 
> sound/drivers/portman2x4.c:460:34-35: WARNING: sum of probable bitmasks, consider |

This one is reasonable.

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> ---
>  sound/drivers/portman2x4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
> index ecefa7c..38603cb 100644
> --- a/sound/drivers/portman2x4.c
> +++ b/sound/drivers/portman2x4.c
> @@ -457,7 +457,7 @@ static int portman_probe(struct parport *p)
>  
>  	/* Set for RXDATA0 where no damage will be done. */
>  	/* 5 */
> -	parport_write_control(p, RXDATA0 + STROBE);	/* Write Strobe=1 to command reg. */
> +	parport_write_control(p, RXDATA0 | STROBE);	/* Write Strobe=1 to command reg. */
>  
>  	/* 6 */
>  	if ((parport_read_status(p) & ESTB) != ESTB)

