Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71E94E233F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 10:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47CFF1701;
	Mon, 21 Mar 2022 10:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47CFF1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647854588;
	bh=js3Rr+dGBwxPT5O2sAogbnMjmIOd+kG1mAzBVLLRx5o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYW/NjW+dWLKjgG7yBYWRHyNNNaKOgEn9lWxyWu1HWNwi2NKWtljZxO+x8iO/rFRm
	 nSvVHKGAXi/GOozZ6aWf8GV8PRML7MkQSWzbgVF1kHwXxZ4TTe+3oRyNIOeOnX6FiX
	 p4n4kjQSAB8cRQWlXxEA6JuHJngPPSswYGN3hkN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0116F80238;
	Mon, 21 Mar 2022 10:22:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CEA8F80227; Mon, 21 Mar 2022 10:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24EF0F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 10:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24EF0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="njg8O/W4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB0A5611E1;
 Mon, 21 Mar 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE151C340E8;
 Mon, 21 Mar 2022 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647854509;
 bh=js3Rr+dGBwxPT5O2sAogbnMjmIOd+kG1mAzBVLLRx5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=njg8O/W4Vv3IECCZJM2JewVvH2vhm/jUaAYsDEQCWqJEgtkAsUVGs4K/8FcdpyR71
 YjV1ksexpq42ejRKGzipRXOojPfkM/Q7xSNrXdq6JsKQWhkzJ7rOAC15x1NcxNerTU
 un6vKgzW5+68tp0PAizpMFw8QEXn9ec5oKQs4+546vK0dWR7HZ2kyk4ldf40i/Qe8r
 k1QnGilipJlO+hW0rVt0F1Aur7Wk9ZqXUiX5E9LZuEJ7i5vVUU3CQxVF3QT1LutpPz
 sIoozG+4fpjWdnp8YvNE/yHISY8DpgnYVsWpiG9oBKBUE/2Mw+q2mm/sQo6p12Go8A
 epZkZzxjmBvdA==
Date: Mon, 21 Mar 2022 17:21:44 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <YjhDqKhtYastPhf0@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
 <Yjf4KjXpVJaNnvb8@google.com>
 <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17e6e8895ebc1113911481c7e097b394005db123.camel@mediatek.com>
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

On Mon, Mar 21, 2022 at 05:14:08PM +0800, Jiaxin Yu wrote:
> On Mon, 2022-03-21 at 11:59 +0800, Tzung-Bi Shih wrote:
> > On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> > > @@ -1145,6 +1140,13 @@ static int mt8192_mt6359_dev_probe(struct
> > > platform_device *pdev)
> > >  		goto err_speaker_codec;
> > >  	}
> > >  
> > > +	headset_codec = of_get_child_by_name(pdev->dev.of_node,
> > > "mediatek,headset-codec");
> > > +	if (!headset_codec) {
> > > +		ret = -EINVAL;
> > > +		dev_err_probe(&pdev->dev, ret, "Property
> > > 'headset_codec' missing or invalid\n");
> > > +		goto err_headset_codec;
> > > +	}
> > 
> > (to be neat) Does it have any reason to prevent from using
> > of_parse_phandle()
> > but of_get_child_by_name()?
> 
> "mediatek,headset-codec" is a child node of pdev->dev.of_node, so I use
> of_get_child_by_name() to get and   pass it to
> snd_soc_of_get_dai_link_codecs().

"mediatek,platform" and "mediatek,hdmi-codec" are also children of
pdev->dev.of_node.  I guess my question is: why doesn't it also use
of_parse_phandle() for "mediatek,headset-codec"?  Did I misunderstand?
