Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9E57FFA6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 15:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93437FA;
	Mon, 25 Jul 2022 15:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93437FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658754789;
	bh=xCfaghR0YoO+F57f4jEgiOzm19nfizFOLqgwmH9eA+o=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=egMkKO3DLPVaP0n6Lo+rWOtX+1coB8MvlfPgHENr14F3dj178vGokYBSTqXW62lOb
	 zfLtFSYi8ztQjmwSZSfcbfeA8VQty13R/4ECvn2r7CwIy6SD6bsmO4dZVt8ACTz7Xo
	 Srx4O7PHyZUNByWhpoJ6FcWQvY3RcA2zJ5MQ9RQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3106F80212;
	Mon, 25 Jul 2022 15:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 437F0F80163; Mon, 25 Jul 2022 15:12:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6FFAF80115
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 15:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6FFAF80115
X-UUID: 49b8b6b8152a47de97605e9701075f54-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:e1ecf115-3b8c-4c25-b837-21a5f2b6b669, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.8, REQID:e1ecf115-3b8c-4c25-b837-21a5f2b6b669, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:0f94e32, CLOUDID:9e1bc529-fd69-41f1-91fc-8b8a329d3a88,
 C
 OID:3f88364b277a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 49b8b6b8152a47de97605e9701075f54-20220725
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 877510035; Mon, 25 Jul 2022 21:11:49 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 25 Jul 2022 21:11:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 21:11:48 +0800
Message-ID: <e4f9510c9a29c4a1ac8a40176d5a69397e3a0417.camel@mediatek.com>
Subject: Re: [bug report] ASoC: mediatek: mt8186: support adda in platform
 driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jul 2022 21:11:48 +0800
In-Reply-To: <Yt5FY0RffrGZx55I@kili>
References: <Yt5FY0RffrGZx55I@kili>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org
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

On Mon, 2022-07-25 at 10:25 +0300, Dan Carpenter wrote:
> Hello Jiaxin Yu,
> 
> The patch b65c466220b3: "ASoC: mediatek: mt8186: support adda in
> platform driver" from May 23, 2022, leads to the following Smatch
> static checker warning:
> 
> 	sound/soc/mediatek/mt8186/mt8186-dai-adda.c:78
> get_adda_priv_by_name()
> 	warn: strncmp() with weird length: 17 vs 7
> 
> sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>     72 static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct
> mtk_base_afe *afe,
>     73                                                        const
> char *name)
>     74 {
>     75         struct mt8186_afe_private *afe_priv = afe-
> >platform_priv;
>     76         int dai_id;
>     77
> --> 78         if (strncmp(name, "aud_dac_hires_clk", 7) == 0 ||
>     79             strncmp(name, "aud_adc_hires_clk", 7) == 0)
> 
> 7 is weird.  It would be more readable to say it as:
> 
> 	if (strncmp(name, "aud_dac", 7) == 0 ||
> 	    strncmp(name, "aud_adc", 7) == 0)
> 
Yes, I will fix it soon.

Thanks,
Jiaxin.Yu

>     80                 dai_id = MT8186_DAI_ADDA;
>     81         else
>     82                 return NULL;
>     83
>     84         return afe_priv->dai_priv[dai_id];
>     85 }
> 
> regards,
> dan carpenter

