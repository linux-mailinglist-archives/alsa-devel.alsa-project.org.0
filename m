Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74C6F486
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jul 2019 20:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE1E91702;
	Sun, 21 Jul 2019 20:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE1E91702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563732358;
	bh=txJTU0dPy9MYgIzLIiXCTn91+vCUUSGA0pFBaUy23FM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AR54d4mye0KiBJ5GiV79pxLZfQFxz4bPPyk2qyVkDIao7a46eBmt3F53Jx8HNEX2f
	 MiHDrB4I2w71Z2yW2ayKatNvkqzTOA4OVJhG3XR20B3lqDdMBWsHjI37m1vFppjni4
	 Z5R3x1nfejp9MIatAA+x5PM93q8Ia3erDBrePrpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2174CF8044A;
	Sun, 21 Jul 2019 20:04:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C1CAF80448; Sun, 21 Jul 2019 20:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0185.hostedemail.com
 [216.40.44.185])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1806F800E8
 for <alsa-devel@alsa-project.org>; Sun, 21 Jul 2019 20:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1806F800E8
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 8D5AC18029122;
 Sun, 21 Jul 2019 18:04:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: care78_23d5a97d6b148
X-Filterd-Recvd-Size: 1889
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Sun, 21 Jul 2019 18:04:06 +0000 (UTC)
Message-ID: <4154c43331e4d1d361db41194587d3d41cf991b0.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
Date: Sun, 21 Jul 2019 11:04:04 -0700
In-Reply-To: <20190721174715.GA10747@hari-Inspiron-1545>
References: <20190721174715.GA10747@hari-Inspiron-1545>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Subject: Re: [alsa-devel] [PATCH] slimbus: fix duplicated argument to ||
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

On Sun, 2019-07-21 at 23:17 +0530, Hariprasad Kelam wrote:
> Remove duplicate argument SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION.
> 
> fix below issue reported by coccicheck
> ./drivers/slimbus/slimbus.h:440:3-46: duplicated argument to && or ||
> 
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/slimbus/slimbus.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
> index 9be4108..46a6441 100644
> --- a/drivers/slimbus/slimbus.h
> +++ b/drivers/slimbus/slimbus.h
> @@ -438,8 +438,7 @@ static inline bool slim_tid_txn(u8 mt, u8 mc)
>  	return (mt == SLIM_MSG_MT_CORE &&
>  		(mc == SLIM_MSG_MC_REQUEST_INFORMATION ||
>  		 mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION ||
> -		 mc == SLIM_MSG_MC_REQUEST_VALUE ||
> -		 mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION));
> +		 mc == SLIM_MSG_MC_REQUEST_VALUE));
>  }

Perhaps this was intended to be
		mc ==  SLIM_MSG_MC_REQUEST_CHANGE_VALUE ?


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
