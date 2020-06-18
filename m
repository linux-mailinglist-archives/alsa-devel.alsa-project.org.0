Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3861FF1E8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 14:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EABBA178A;
	Thu, 18 Jun 2020 14:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EABBA178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592483656;
	bh=JVYGKk1zPfXFsEY8Ui+ZMWAAVGSESGg6UldwKwlnweY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U83XCrgOiMN73vvu2Ipe8K136ZQRnCIURMBeQqCH1SwXsu20LjdlG3NkiQ1SZt+QW
	 M7J7dBfnBr8ipc/2C3xeoNbpmcdupG4GdGTaLVma8qZmNoarp8xPR0559d9jH+E4VX
	 0pqnbw8jywr7LYU+Kwo8VTzggDqYPzskjM0oO8cQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B96FF80162;
	Thu, 18 Jun 2020 14:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BE09F800EF; Thu, 18 Jun 2020 14:32:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97024F800EF
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 14:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97024F800EF
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jltiJ-00082t-U1; Thu, 18 Jun 2020 14:32:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: wu000273@umn.edu
Subject: Re: [PATCH] ASoC: rockchip: Fix a reference count leak.
Date: Thu, 18 Jun 2020 14:32:15 +0200
Message-ID: <3050852.oyibrqGndV@diego>
In-Reply-To: <20200613205158.27296-1-wu000273@umn.edu>
References: <20200613205158.27296-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kjlu@umn.edu,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Am Samstag, 13. Juni 2020, 22:51:58 CEST schrieb wu000273@umn.edu:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.
> 
> Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>

somewhat unintuitive, but I checked __pm_runtime_resume for it, so
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  sound/soc/rockchip/rockchip_pdm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
> index 7cd42fcfcf38..1707414cfa92 100644
> --- a/sound/soc/rockchip/rockchip_pdm.c
> +++ b/sound/soc/rockchip/rockchip_pdm.c
> @@ -590,8 +590,10 @@ static int rockchip_pdm_resume(struct device *dev)
>  	int ret;
>  
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put(dev);
>  		return ret;
> +	}
>  
>  	ret = regcache_sync(pdm->regmap);
>  
> 




