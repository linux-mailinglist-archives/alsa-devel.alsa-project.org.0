Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423384E231D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 10:15:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B552C16E8;
	Mon, 21 Mar 2022 10:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B552C16E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647854134;
	bh=BQw7ZqnQLrMKjmNfcUofN+2kai7uXMHKGAP9J0QPs+E=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LCwuufc+ZErsnyn2SfBzknWerhhhIPGcP+RjLZ700aXTp2nJdyS+Fq6qnwkzkoUeC
	 WEDT52Sd7BDqsSmB+1u83GcAO5MVBkd/S1hx7mwc2v/ffFSdDmARXM7/l294SaTfh6
	 fdkPZCEqHxqTfQOKyl9coq06NsRKDNsfzxYl3gS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06436F80238;
	Mon, 21 Mar 2022 10:14:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FFDEF80227; Mon, 21 Mar 2022 10:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B81E9F80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 10:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B81E9F80109
X-UUID: e030b7e5dcad4d9286f6479676f04775-20220321
X-UUID: e030b7e5dcad4d9286f6479676f04775-20220321
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 524223218; Mon, 21 Mar 2022 17:14:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 17:14:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Mar 2022 17:14:08 +0800
Message-ID: <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Date: Mon, 21 Mar 2022 17:14:08 +0800
In-Reply-To: <Yjf4KjXpVJaNnvb8@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > @@ -1145,6 +1140,13 @@ static int mt8192_mt6359_dev_probe(struct
> > platform_device *pdev)
> >  		goto err_speaker_codec;
> >  	}
> >  
> > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > "mediatek,headset-codec");
> > +	if (!headset_codec) {
> > +		ret = -EINVAL;
> > +		dev_err_probe(&pdev->dev, ret, "Property
> > 'headset_codec' missing or invalid\n");
> > +		goto err_headset_codec;
> > +	}
> 
> (to be neat) Does it have any reason to prevent from using
> of_parse_phandle()
> but of_get_child_by_name()?

Hi Tzung-Bi,

"mediatek,headset-codec" is a child node of pdev->dev.of_node, so I use
of_get_child_by_name() to get and   pass it to
snd_soc_of_get_dai_link_codecs().

Jiaxin.Yu
Thanks

