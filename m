Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3997155879
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 14:31:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806301670;
	Fri,  7 Feb 2020 14:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806301670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581082289;
	bh=AXyuo1jiXUFpDJ85Ml8a6SJOISU5fLfWZ8rA5hk3Y94=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5CpnaYsK1oH5t0qp8MXmm+AqHolq1K+3gUhXybjOofNIv0pheQ9p/oPizj3vhDOV
	 2Lt5kZqiqx8Yv0m4G5+TBicCwGYj++nvrFjfFvLQqSG74dqHZpceh0ZoF47BiE3ose
	 j5xx5CRm8IiGRYGlVpP0wa11dV6Tx9iF4lJUvik0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A15EF8027C;
	Fri,  7 Feb 2020 14:27:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2473F80148; Fri,  7 Feb 2020 10:34:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 672EBF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 10:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 672EBF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="PUFN4niI"
X-UUID: 806eec9a71c24019be45c0656c9f9297-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m74yjQkT2G8gL7JoqJhfpeZ6P0zLpKwVgqiwmutKy3g=; 
 b=PUFN4niIigJ5y4h9n6/8BFNCnIfv41AI2DNojRUrHJcG0/L3pCWJVbOa8n7ah4u0oGqJELS6wUtwpZQWf1NGfjjTsy4kQg9dIKuR64MEb5FOX+YyZevs/B0Q/QC9NtfU+b6tatMNH5cZ5nqCzjEYNmsXqs6rBH1gPQFSYLXZaYk=;
X-UUID: 806eec9a71c24019be45c0656c9f9297-20200207
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 638472475; Fri, 07 Feb 2020 17:34:19 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 17:33:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 17:31:40 +0800
Message-ID: <1581068057.28261.0.camel@mtksdaap41>
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 7 Feb 2020 17:34:17 +0800
In-Reply-To: <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.1.Ieba8d422486264eb7aaa3aa257620a1b0c74c6db@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Fri, 07 Feb 2020 14:27:20 +0100
Cc: alsa-devel@alsa-project.org, p.zabel@pengutronix.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 dgreid@google.com, linux-arm-kernel@lists.infradead.org, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH v2 1/3] drm/mediatek: exit earlier if
 failed to register audio driver
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

On Thu, 2020-02-06 at 11:17 +0800, Tzung-Bi Shih wrote:
> Exits earlier if register_audio_driver() returns errors.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index c79b1f855d89..23c2b0e8693d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1656,7 +1656,7 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
>  	.get_eld = mtk_hdmi_audio_get_eld,
>  };
>  
> -static void mtk_hdmi_register_audio_driver(struct device *dev)
> +static int mtk_hdmi_register_audio_driver(struct device *dev)
>  {
>  	struct hdmi_codec_pdata codec_data = {
>  		.ops = &mtk_hdmi_audio_codec_ops,
> @@ -1669,9 +1669,10 @@ static void mtk_hdmi_register_audio_driver(struct device *dev)
>  					     PLATFORM_DEVID_AUTO, &codec_data,
>  					     sizeof(codec_data));
>  	if (IS_ERR(pdev))
> -		return;
> +		return PTR_ERR(pdev);
>  
>  	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
> +	return 0;
>  }
>  
>  static int mtk_drm_hdmi_probe(struct platform_device *pdev)
> @@ -1705,7 +1706,11 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	mtk_hdmi_register_audio_driver(dev);
> +	ret = mtk_hdmi_register_audio_driver(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register audio driver: %d\n", ret);
> +		return ret;
> +	}
>  
>  	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
>  	hdmi->bridge.of_node = pdev->dev.of_node;

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
