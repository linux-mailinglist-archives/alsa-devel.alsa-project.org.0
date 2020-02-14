Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E59415D28F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 08:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5561664;
	Fri, 14 Feb 2020 08:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5561664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581664165;
	bh=lLenkQWzp1juYXdbPDmIW9591yGSI1hl/lSPaQGPr/E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tcGZa4g8Pi3p/A2KLovKFxdS4rk0cYBQ/Ob3Y28PKYKCnkNMP4mYOMeXoO/kKSUMp
	 4Wv7vY7SM2VLAR9h2yX9jTu2BT239dp+asBtUJj2IjvR5hJnqWfVWaRqcZi1qN6Uvi
	 j+Oxb2ZnbDqm1pSIgiO9vLg8guokunckjXog/YN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77082F80157;
	Fri, 14 Feb 2020 08:07:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E47F8014F; Fri, 14 Feb 2020 08:07:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 35EFAF800F0
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 08:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35EFAF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="ij1BKawu"
X-UUID: 3885370f7ce3465aa5177912297affa6-20200214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AAKmt3psV2g2K8EVhgPpwHcYTt/PyKL1ctLHR7lIS6k=; 
 b=ij1BKawuDxx6m4M9NOhNWshiLpr6/8t96cXtzq1Ezlt///aK3HTxOLs7egK+M9Rdfjos+YMM/x6/EHsZrwNSMHMcOQkxDUgfnghJTOhqRE24YTwcFwyCdda4awt7XIBdU/8AiJMVE7crCaqWcaau5pxfAziSFj9rW89jheQLhoE=;
X-UUID: 3885370f7ce3465aa5177912297affa6-20200214
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1965851174; Fri, 14 Feb 2020 15:07:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 15:06:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 15:07:21 +0800
Message-ID: <1581664042.20487.4.camel@mtksdaap41>
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 14 Feb 2020 15:07:22 +0800
In-Reply-To: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
References: <20200213153226.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, p.zabel@pengutronix.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 dgreid@google.com, linux-arm-kernel@lists.infradead.org, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH] drm/mediatek: fix race condition for HDMI
 jack status reporting
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

Hi, Tzung-Bi:

On Thu, 2020-02-13 at 15:59 +0800, Tzung-Bi Shih wrote:
> hdmi_conn_detect and mtk_hdmi_audio_hook_plugged_cb would be called
> by different threads.
> 
> Imaging the following calling sequence:
>            Thread A                            Thread B
> --------------------------------------------------------------------
> mtk_hdmi_audio_hook_plugged_cb()
> mtk_cec_hpd_high() -> disconnected
>                                      hdmi_conn_detect()
>                                      mtk_cec_hpd_high() -> connected
>                                      plugged_cb(connected)
> plugged_cb(disconnected)
> 
> The latest disconnected is false reported.  Makes mtk_cec_hpd_high
> and plugged_cb atomic to fix.
> 
> plugged_cb and codec_dev are also in danger of race condition.  Instead
> of using mutex to protect them:
> - Checks NULLs first.
> - Uses WRITE_ONCE() to prevent store tearing (i.e. write to plugged_cb
>   after codec_dev).
> - Uses codec_dev as a signal to report HDMI jack status.
> 
> Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Previous discussion: https://patchwork.kernel.org/patch/11367625/
> Previous attempt: https://patchwork.kernel.org/patch/11378413/
> 
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 03aeb73005ef..b1e5d0c538fa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/mutex.h>
>  #include <linux/of_platform.h>
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
> @@ -171,6 +172,7 @@ struct mtk_hdmi {
>  	bool enabled;
>  	hdmi_codec_plugged_cb plugged_cb;
>  	struct device *codec_dev;
> +	struct mutex update_plugged_status_lock;
>  };
>  
>  static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
> @@ -1199,10 +1201,13 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
>  static enum drm_connector_status
>  mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
>  {
> -	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +	bool connected;
>  
> -	if (hdmi->plugged_cb && hdmi->codec_dev)
> +	mutex_lock(&hdmi->update_plugged_status_lock);
> +	connected = mtk_cec_hpd_high(hdmi->cec_dev);
> +	if (hdmi->codec_dev)
>  		hdmi->plugged_cb(hdmi->codec_dev, connected);
> +	mutex_unlock(&hdmi->update_plugged_status_lock);
>  
>  	return connected ?
>  	       connector_status_connected : connector_status_disconnected;
> @@ -1669,8 +1674,12 @@ static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
>  {
>  	struct mtk_hdmi *hdmi = data;
>  
> -	hdmi->plugged_cb = fn;
> -	hdmi->codec_dev = codec_dev;
> +	if (!fn || !codec_dev)

I think sound driver could be removed for some reason, and fn should be
set to NULL before sound driver removed. In this case, codec_dev != NULL
and fn == NULL.

Regards,
CK

> +		return -EINVAL;
> +
> +	/* Use WRITE_ONCE() to prevent store tearing. */
> +	WRITE_ONCE(hdmi->plugged_cb, fn);
> +	WRITE_ONCE(hdmi->codec_dev, codec_dev);
>  	mtk_hdmi_update_plugged_status(hdmi);
>  
>  	return 0;
> @@ -1729,6 +1738,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	mutex_init(&hdmi->update_plugged_status_lock);
>  	platform_set_drvdata(pdev, hdmi);
>  
>  	ret = mtk_hdmi_output_init(hdmi);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
