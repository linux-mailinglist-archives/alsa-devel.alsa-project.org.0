Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A5CC853
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C361682;
	Sat,  5 Oct 2019 08:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C361682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255720;
	bh=oe/NrIOqt7XiZ+gksJOkzp7FNuViI/iDl/xQnVSqJm4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YsrWJvmcrC+0YQkUecr/hV6wcd/la6bCiOMZ6rea6s2iREP1764pNgm8zA2pLFdav
	 N6sxEdnrUzp73Yeit5vUnIwjdfn9GPdmIrzjshCQ5ftfo5q6EJwv9lSfPyO68PRIN3
	 zakYCgkZ6HIvN40jWe74+yHAyqMT6tLJdG5kZfgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED7AF80519;
	Sat,  5 Oct 2019 08:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8C9CF80518; Sat,  5 Oct 2019 08:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id EDCE4F80137
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 08:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDCE4F80137
X-UUID: e522f1f6fdfc42288ca5849dd467b58b-20191005
X-UUID: e522f1f6fdfc42288ca5849dd467b58b-20191005
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <yingjoe.chen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 69778194; Sat, 05 Oct 2019 14:07:32 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 5 Oct 2019 14:07:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 5 Oct 2019 14:07:29 +0800
Message-ID: <1570255651.29077.26.camel@mtksdaap41>
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Date: Sat, 5 Oct 2019 14:07:31 +0800
In-Reply-To: <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-5-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 robh+dt@kernel.org, lgirdwood@gmail.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, eason.yen@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Subject: Re: [alsa-devel] [PATCH v2 4/4] ASoC: mt8183: fix audio playback
 slowly after playback during bootup
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

On Fri, 2019-09-27 at 18:31 +0800, Jiaxin Yu wrote:
> Before regmap_reinit_cache we must reset audio regs as default values.
> So we use reset controller unit(toprgu) to reset audio hw.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>


This one looks good to me. You could add this if you want


Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>


Joe.C

> ---
>  sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> index 4a31106d3471..721632386a50 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  
>  #include "mt8183-afe-common.h"
>  #include "mt8183-afe-clk.h"
> @@ -1089,6 +1090,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
>  	struct mtk_base_afe *afe;
>  	struct mt8183_afe_private *afe_priv;
>  	struct device *dev;
> +	struct reset_control *rstc;
>  	int i, irq_id, ret;
>  
>  	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> @@ -1126,6 +1128,19 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	rstc = devm_reset_control_get(dev, "audiosys");
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		dev_err(dev, "could not get audiosys reset:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_reset(rstc);
> +	if (ret) {
> +		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
> +		return ret;
> +	}
> +
>  	/* enable clock for regcache get default value from hw */
>  	afe_priv->pm_runtime_bypass_reg_ctl = true;
>  	pm_runtime_get_sync(&pdev->dev);


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
