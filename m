Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68E1981BD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 18:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECE541612;
	Mon, 30 Mar 2020 18:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECE541612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585587299;
	bh=3QJmFkLC8V4RxFdirNvjeH5MICNEQYuRNjKDaoRqMQw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dsOeBDA1D3S/0hV8HfL1O3KOgMjx6QLOPfwNFA+HgNjqrAqPr2rBWDfM+JDtbNYPO
	 r1R7Syi+NC1gpPJGS0/+rP9D842P1NQBfKqE6H4mOpaEX6LIgpsN/S5WFlW0L1HNPW
	 QLDoFrAG/wC/6KIZV8tTuVaYc2ZXiMl7o+XU21yA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ACC6F800EB;
	Mon, 30 Mar 2020 18:53:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59255F80148; Mon, 30 Mar 2020 18:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by alsa1.perex.cz (Postfix) with ESMTP id 3B74FF800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 18:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B74FF800EB
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 036CF72CCED;
 Mon, 30 Mar 2020 19:53:12 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id D39317CCB1F; Mon, 30 Mar 2020 19:53:11 +0300 (MSK)
Date: Mon, 30 Mar 2020 19:53:11 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH 5/5] ALSA: uapi: Drop asound.h inclusion
 from asoc.h
Message-ID: <20200330165311.GA11372@altlinux.org>
References: <20191220153415.2740-1-tiwai@suse.de>
 <20191220153415.2740-6-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220153415.2740-6-tiwai@suse.de>
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

Hi,

On Fri, Dec 20, 2019 at 04:34:15PM +0100, Takashi Iwai wrote:
> The asound.h isn't always available while asoc.h itself is distributed
> in alsa-lib package.  So we need to avoid the unnecessary inclusion of
> asound.h from there.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/uapi/sound/asoc.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
> index a74ca232f1fc..6048553c119d 100644
> --- a/include/uapi/sound/asoc.h
> +++ b/include/uapi/sound/asoc.h
> @@ -17,7 +17,6 @@
>  #define __LINUX_UAPI_SND_ASOC_H
>  
>  #include <linux/types.h>
> -#include <sound/asound.h>
>  
>  /*
>   * Maximum number of channels topology kcontrol can represent.

This has reached v5.6 and caused the following regression:

sound/asoc.h:214:14: error: 'SNDRV_CTL_ELEM_ID_NAME_MAXLEN' undeclared here (not in a function)
  214 |  char string[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];

Please revert or fix in some way to make the uapi header compileable again.

Thanks,


-- 
ldv
