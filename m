Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6E25DFA9
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 18:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1931761;
	Fri,  4 Sep 2020 18:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1931761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599236323;
	bh=/dE5uv2mYZ3ZF/9Kd1Kc5YMC+o3/jd470YhbBHPEGYw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMs92WuXtBoIMJucxUod02W+bHxeAhLAPuhJMUsygkQxNyBmJQ9io+91fq8EDEbGG
	 fyjksjc/oF+bu6UCTlM3NSlOJBRUuKv5dkBlXHYW3hFzKCAIZlWnk5RGkuC70o07KS
	 cLhSefFgOlGWM60dfivzbyyYWdfy4l6ZU9mkuY2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B3E4F80257;
	Fri,  4 Sep 2020 18:17:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28C2EF8024A; Fri,  4 Sep 2020 18:17:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_26,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2002F80113
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 18:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2002F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lJJQ9wzR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084GGI3M007925; Fri, 4 Sep 2020 11:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=PODMain02222019;
 bh=76FaaRrunFbexsou6fbys/9Meax+ywrGh7TuEp7aeyM=;
 b=lJJQ9wzRikUdH7JNwcF0swFR31NWj5uTxZI5DpMGFCffiwecVIpPPIT5rSh0i2dtAskP
 N0koC/Q3n0LJrqm+k+lqlhubVlux3pqy6sX3Bzov+QwgVdxJ6JdA+zIamnyuwVJC3GJh
 GhriNiO/UsdtlcATF9jp28FJeWznV88C0c32XzWwGw5HkzTGy9SFlhzklHDlRMCmHPml
 qsYeUWdWWqb1DZWxmBIZHxPf0W5gCOQMio8usc8C+QRdgzAuauU0XlSDIIg9rTeMIbWG
 ne5GyS5IYBaWkPpBkfNardRSSXbOCLcrC2b6dzdt7uDsknrtaL+5I/qM7Y7ORm8fZSf+ wQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 337keqhmut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Sep 2020 11:16:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 4 Sep 2020
 17:16:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 4 Sep 2020 17:16:49 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 609552C3;
 Fri,  4 Sep 2020 16:16:49 +0000 (UTC)
Date: Fri, 4 Sep 2020 16:16:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [linux-sunxi] [PATCH 05/16] ASoc: sun4i-i2s: Add 20 and 24 bit
 support
Message-ID: <20200904161649.GL10899@ediswmail.ad.cirrus.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-6-peron.clem@gmail.com>
 <1e320dfd-9388-54b2-dba9-7def0bf4bbad@sholland.org>
 <9148679.oVN3Z7rve9@kista>
 <fd714cb6-3650-1eb9-616d-33c00f1442eb@sholland.org>
 <20200903074023.jccqp45br3er4h3g@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200903074023.jccqp45br3er4h3g@gilmour.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009040141
Cc: devicetree@vger.kernel.org,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
 Rob Herring <robh+dt@kernel.org>, peron.clem@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
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

On Thu, Sep 03, 2020 at 09:40:23AM +0200, Maxime Ripard wrote:
> On Wed, Sep 02, 2020 at 09:22:33PM -0500, Samuel Holland wrote:
> > On 9/2/20 1:10 PM, Jernej Škrabec wrote:
> > > Hi Samuel!
> > > 
> > > Dne petek, 10. julij 2020 ob 07:44:51 CEST je Samuel Holland napisal(a):
> > >> On 7/4/20 6:38 AM, Clément Péron wrote:
> > >>> From: Marcus Cooper <codekipper@gmail.com>
> > >>>
> > >>> Extend the functionality of the driver to include support of 20 and
> > >>> 24 bits per sample.
> > >>>
> > >>> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > >>> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> > >>> ---
> > >>>
> > >>>  sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
> > >>>  1 file changed, 9 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > >>> index f78167e152ce..bc7f9343bc7a 100644
> > >>> --- a/sound/soc/sunxi/sun4i-i2s.c
> > >>> +++ b/sound/soc/sunxi/sun4i-i2s.c
> > >>> @@ -577,6 +577,9 @@ static int sun4i_i2s_hw_params(struct
> > >>> snd_pcm_substream *substream,> 
> > >>>  	case 16:
> > >>>  		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> > >>>  		break;
> > >>>
> > >>> +	case 32:
> > >>> +		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> > >>> +		break;
> > >>
> > >> This breaks the sun4i variants, because sun4i_i2s_get_wss returns 4 for a 32
> > >> bit width, but it needs to return 3.
> > > 
> > > I'm not sure what has WSS with physical width and DMA?
> > 
> > This is the change where creating a S24_LE stream no longer fails with -EINVAL.
> > So this is the change where userspace stops downsampling 24-bit audio sources.
> > So this is the change where playback of 24-bit audio sources breaks, because WSS
> > is programmed wrong.
> > 
> > >> As a side note, I wonder why we use the physical width (the spacing between
> > >> samples in RAM) to drive the slot width. S24_LE takes up 4 bytes per sample
> > >> in RAM, which we need for DMA. But I don't see why we would want to
> > >> transmit the padding over the wire. I would expect it to be transmitted the
> > >> same as S24_3LE (which has no padding). It did not matter before, because
> > >> the only supported format had no padding.
> > > 
> > > Allwinner DMA engines support only 1, 2, 4 and sometimes 8 bytes for bus 
> > > width, so if sample is 24 bits in size, we have no other way but to transmit 
> > > padding too.
> > 
> > I understand why we do 4 byte DMA from RAM <=> I2S FIFO; that was not my
> > question. I'm referring to the actual wire format (FIFO <=> PCM_DIN/DOUT). The
> > sample is already truncated from 32 bits to 24 bits in the FIFO -- that's what
> > TXIM and RXOM in FIFO_CTRL control.
> > 
> > If a sample is 24 bits wide, why would we send 32 BCLKs for every LRCK? I would
> > expect the slot width to match the sample resolution by default. But yet we have
> > this code in the driver:
> > 
> >     unsigned int word_size = params_width(params);
> >     unsigned int slot_width = params_physical_width(params);
> > 
> > I think slot_width should be the same as word_size, and I suggest changing it
> > before adding 20/24-bit support.
> 
> Generally speaking, the slot width doesn't necessarily match the
> physical width. With TDM for example you may very well have slots
> larger than their samples.
> 
> That being said, S24 is explicitly a format where you send a sample of
> 24 bits in a 32-bit word (in the lowest three bytes, little endian)
> 
> See:
> https://elixir.bootlin.com/linux/v5.9-rc3/source/sound/core/pcm_misc.c#L75
> https://mailman.alsa-project.org/pipermail/alsa-devel/2013-April/061073.html
> 
> 24 bits of data over three bytes like you suggest is S24_3LE
> 

My understanding is physical_width refers to the in memory
representation, but shouldn't be used to control the slot width
on the bus. If not specified otherwise (say through the set_tdm
callback), and if the appropriate BCLK is supported, then the slot
should be just large enough to hold the data.

Thanks,
Charles
