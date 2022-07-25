Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE25157FFBF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 15:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9629883E;
	Mon, 25 Jul 2022 15:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9629883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658755536;
	bh=vDPUNG4fg4/l5NuzITag1FZGKVuw0xIrlftw+tTS/dw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shaQy7bbubrFS982iuw76kfzqaQtJuTwRohJtcPhevqPn1AsQ214yFtez1uJ5GAfb
	 kTq30f5CrOOkVng4zipKsMD/05AmVHoX0MW5xQTZ4DpkviHwpzwbMw5bHAkB7qqGW7
	 La8hyNcFRTe2jQMdyU1hj4GBEw3g7X8j3hT2sVz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE672F80088;
	Mon, 25 Jul 2022 15:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A66BF80163; Mon, 25 Jul 2022 15:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B551CF80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 15:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B551CF80088
X-UUID: 78c6c066a4f041d6becfc03085c28716-20220725
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:e05560e0-9b94-46f5-95b9-b1f709165081, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:0f94e32, CLOUDID:fda870b3-06d2-48ef-b2dd-540836705165,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 78c6c066a4f041d6becfc03085c28716-20220725
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1843290214; Mon, 25 Jul 2022 21:24:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 21:24:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 21:24:20 +0800
Message-ID: <be6520d211efd5d0b49c8a81d21f0ea2e32d2ae0.camel@mediatek.com>
Subject: Re: [bug report] ASoC: mediatek: mt8186: support tdm in platform
 driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jul 2022 21:24:20 +0800
In-Reply-To: <Yt5GC+tlG7M6jiXC@kili>
References: <Yt5GC+tlG7M6jiXC@kili>
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

On Mon, 2022-07-25 at 10:28 +0300, Dan Carpenter wrote:
> Hello Jiaxin Yu,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch ae92dcbee8b6: "ASoC: mediatek: mt8186: support tdm in
> platform driver" from May 23, 2022, leads to the following Smatch
> complaint:
> 
>     sound/soc/mediatek/mt8186/mt8186-dai-tdm.c:424
> mtk_dai_tdm_hw_params()
>     warn: variable dereferenced before check 'tdm_priv' (see line
> 406)
> 
> sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
>    405		struct mtk_afe_tdm_priv *tdm_priv = afe_priv-
> >dai_priv[tdm_id];
>    406		unsigned int tdm_mode = tdm_priv->tdm_mode;
>                                         ^^^^^^^^^^^^^^^^^^^
> Lot's of dereferences
> 
>    407		unsigned int data_mode = tdm_priv->data_mode;
>    408		unsigned int rate = params_rate(params);
>    409		unsigned int channels =
> params_channels(params);
>    410		snd_pcm_format_t format =
> params_format(params);
>    411		unsigned int bit_width =
>    412			snd_pcm_format_physical_width(format);
>    413		unsigned int tdm_channels = (data_mode ==
> TDM_DATA_ONE_PIN) ?
>    414			get_tdm_ch_per_sdata(tdm_mode,
> channels) : 2;
>    415		unsigned int lrck_width =
>    416			get_tdm_lrck_width(format, tdm_mode);
>    417		unsigned int tdm_con = 0;
>    418		bool slave_mode = tdm_priv->slave_mode;
>    419		bool lrck_inv = tdm_priv->lck_invert;
>    420		bool bck_inv = tdm_priv->bck_invert;
>    421		unsigned int tran_rate;
>    422		unsigned int tran_relatch_rate;
>    423	
>    424		if (!tdm_priv) {
>                     ^^^^^^^^^
> Checked too late
> 
>    425			dev_err(afe->dev, "%s(), tdm_priv ==
> NULL", __func__);
>    426			return -EINVAL;
> 
> regards,
> dan carpenter

Yes, it's a mistake.
In fact, the judgment here is really unnecessary. Because when
registering, if tdm_priv is NULL, registration will fail. So I will
remove this code, and check other DAI drivers, then remove judgments
link this.

Thanks,
Jiaxin.Yu


