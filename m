Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B64E2C24
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 16:25:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4308E174F;
	Mon, 21 Mar 2022 16:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4308E174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647876301;
	bh=4ZpyIyXYDcZ36RfZOIv4oxh4lJ+vIIHH8n+8gbprSCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CMqtyw4bUbhRAv6wyPQ9JgMQ9CkuiKA200uOBEO1sTKNmz85M+j/g9X4ndff0pOqg
	 ucVdOR3iDU3ZkOgfw/PYtJfJgqJ5N8G6Ugxiy/Rxs5zak8nXZjsk9+u01ZVQM3hUrO
	 sgFifMQGyZiOXHCcDQiF3NuB95EXAUEtrjslrtPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34267F80116;
	Mon, 21 Mar 2022 16:23:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE2B0F80431; Mon, 21 Mar 2022 16:23:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E119F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 16:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E119F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FLUh+ySf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFE7860FA7;
 Mon, 21 Mar 2022 15:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2884C340E8;
 Mon, 21 Mar 2022 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647876211;
 bh=4ZpyIyXYDcZ36RfZOIv4oxh4lJ+vIIHH8n+8gbprSCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLUh+ySfIHCMJccWzOujn77JxsZSejOrwn2p+855hwyPXkF77aZrr9VGfNd3TNBae
 Jv/ZNWbw9RsZ+dfUJ84+PcHkfujZL0NeibCYTsty4A6WSXYyMYGmUmcj2w2lcgxd4P
 cf8c1Gms39QL09R0tr7PAs6V8cKQg33YUUbBvLVsjcnKMHMgi57S0ZTfSyDw1nfGl/
 HoyUkLDdnEeKZ8mYgoL+WPh+F2bKLY/gcv6y9AFrzpORCRUSuBTM7+tSlEiZbuUDU6
 80L7Ocezq1BqkwgAuVGW8CVX5utlXtGw9ev6MzSOKgVw2psVepJdNKjc6a5a4AXINL
 /VeaMprAovbNg==
Date: Mon, 21 Mar 2022 23:23:26 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <YjiYbqtrxlgrUplq@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
 <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
 <YjhDqKhtYastPhf0@google.com>
 <f9cd3c31cc41f0f3c72930664445646d8175c760.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9cd3c31cc41f0f3c72930664445646d8175c760.camel@mediatek.com>
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

On Mon, Mar 21, 2022 at 10:38:48PM +0800, Jiaxin Yu wrote:
> On Mon, 2022-03-21 at 17:21 +0800, Tzung-Bi Shih wrote:
> > On Mon, Mar 21, 2022 at 05:14:08PM +0800, Jiaxin Yu wrote:
> > > On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> > > > On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > > > > @@ -1145,6 +1140,13 @@ static int
> > > > > mt8192_mt6359_dev_probe(struct
> > > > > platform_device *pdev)
> > > > >  		goto err_speaker_codec;
> > > > >  	}
> > > > >  
> > > > > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > > > > "mediatek,headset-codec");
> > > > > +	if (!headset_codec) {
> > > > > +		ret = -EINVAL;
> > > > > +		dev_err_probe(&pdev->dev, ret, "Property
> > > > > 'headset_codec' missing or invalid\n");
> > > > > +		goto err_headset_codec;
> > > > > +	}
> > > > 
> > > > (to be neat) Does it have any reason to prevent from using
> > > > of_parse_phandle()
> > > > but of_get_child_by_name()?
> > > 
> > > "mediatek,headset-codec" is a child node of pdev->dev.of_node, so I
> > > use
> > > of_get_child_by_name() to get and   pass it to
> > > snd_soc_of_get_dai_link_codecs().
> > 
> > "mediatek,platform" and "mediatek,hdmi-codec" are also children of
> > pdev->dev.of_node.  I guess my question is: why doesn't it also use
> > of_parse_phandle() for "mediatek,headset-codec"?  Did I
> > misunderstand?
> 
> The following is from bindings, "mediatek,speaker-codec" and
> "mediatek,headset-codec" are sub nodes of sound but "mediatek,platform"
> and "mediatek,hdmi-codec" are the name of properties. So we can't get
> the sub node pointer through of_parse_phandle().
> 
>       sound: mt8192-sound {
>           compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
>           mediatek,platform = <&afe>;
>           mediatek,hdmi-codec = <&anx_bridge_dp>;
>           pinctrl-names = "aud_clk_mosi_off",
>                           "aud_clk_mosi_on";
>           pinctrl-0 = <&aud_clk_mosi_off>;
>           pinctrl-1 = <&aud_clk_mosi_on>;
>  
>           mediatek,headset-codec {
>               sound-dai = <&rt5682>;
>           };
>  
>           mediatek,speaker-codec {
>               sound-dai = <&rt1015_l>,
>                           <&rt1015_r>;
>           };
>       };

Got it, thanks for the explanation.  Will provide my R-b tag in another
thread.
