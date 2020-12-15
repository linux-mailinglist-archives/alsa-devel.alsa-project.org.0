Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C042D2DB3E7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 19:44:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C0BD1816;
	Tue, 15 Dec 2020 19:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C0BD1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608057853;
	bh=+qN+NAlOwHDBMyWFVpEcgpRtDDTEgbLYFPq4+QKCfOo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WbrDSFN/rQnsTY9JitpbljZBK6aIiVEdrscZbWj3cMsK06GcY2OKDzxNIE7cl5Edm
	 rs/LqI1wU/5/kVE1WbJsd0UBj9+pgyDkFlUEku2an61vavvkCiX0e64G5UcGwTUVzS
	 3nXX8VZvq6614rgi/iWs5VhWDiyeslW1Wbdxo5lE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE73EF80259;
	Tue, 15 Dec 2020 19:42:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41DEEF80278; Tue, 15 Dec 2020 19:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (49-237-179-185.static.tentacle.fi [185.179.237.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70629F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 19:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70629F8014B
Received: from 88-114-184-87.elisa-laajakaista.fi ([88.114.184.87]
 helo=[192.168.1.48])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1kpFGK-00044Z-4g; Tue, 15 Dec 2020 20:41:28 +0200
Subject: Re: [PATCH 1/2] MAINTAINERS: Update email address for TI ASoC and
 twl4030 codec drivers
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org
References: <20201215130512.8753-1-peter.ujfalusi@ti.com>
 <20201215130512.8753-2-peter.ujfalusi@ti.com>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <563f5961-40e3-3333-b734-75893806cd04@bitmer.com>
Date: Tue, 15 Dec 2020 20:41:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215130512.8753-2-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tiwai@suse.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 15.12.2020 15.05, Peter Ujfalusi wrote:
> My employment with TI is coming to an end, it is my intention to look after
> the drivers I have worked with over the years.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f6e7162241eb..a091f183b27f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12862,7 +12862,7 @@ F:	include/misc/ocxl*
>  F:	include/uapi/misc/ocxl.h
>  
>  OMAP AUDIO SUPPORT
> -M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
> +M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
>  M:	Jarkko Nikula <jarkko.nikula@bitmer.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  L:	linux-omap@vger.kernel.org
> @@ -17537,7 +17537,7 @@ F:	arch/xtensa/
>  F:	drivers/irqchip/irq-xtensa-*
>  

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
