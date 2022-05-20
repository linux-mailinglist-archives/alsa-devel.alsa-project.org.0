Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D0352E9DC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 12:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0652B1741;
	Fri, 20 May 2022 12:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0652B1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653042354;
	bh=Ctcih0AxGGxU/GpcGZz5CZ8rkyHC/3xFQsqauWCyEHk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O45vxmrTnvsQY1Ec1XQ6CgMsq72Q0NlJGn6RiFlNR9tEBw/IEp23xQ7LDqDzUVtcv
	 mXmbQBjTjki6piI8S8Zmg/oF0hHS4SrvqkEwm9tmw0zSYB+UozpDBfrm+il4ei+uRi
	 UnpEyhqk0nyIvQ0LocucCFjNnyIqNbpPkMmhFXBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 637BDF801F5;
	Fri, 20 May 2022 12:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD328F8019D; Fri, 20 May 2022 12:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D5C0F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 12:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D5C0F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="E3MDFwXs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCxB026795;
 Fri, 20 May 2022 05:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=WSOvhMBIg+CnexC+Y8X+ZG7BYMkoKeetiZYSiJmE0cw=;
 b=E3MDFwXsbJRiBaE4OT2ai+JBwbYdqbCNDnTM5WTrjlOXZlrikeuJ1tiL+m5bGqsZo03j
 hZNgysmRG2QNG9jfqt9CJyU1HKdQikMi9FpVUiaR7mHeBwbTedb07Mex56RR9EocUbFP
 vjQtPAGfK1wk5RM/9IUs9D/tVUYW0yOqIgk1qYoeQRhBJEla3nFqJiatKvzERFcXHqSI
 Q+/Hno0xMo5/BjF4Kn3iHQ0QMOXFJX9/9GuLbAmIRVv9J84ewdgkmDjMuNAiVSG2dbUO
 otHvJplf8L8ZVHcLm7hZgWu0kIHYmP+5RyytltwUsoK/TaAybqvdQMM8AE7gkhiA4klo dQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg6de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 05:24:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 11:24:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 20 May 2022 11:24:47 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 20F84458;
 Fri, 20 May 2022 10:24:47 +0000 (UTC)
Date: Fri, 20 May 2022 10:24:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 56/56] ASoC: simple-card-utils: Move
 snd_soc_component_is_codec to be local
Message-ID: <20220520102447.GL38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
 <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: EewLKkNvojqM2gQAbwrh9EQ5fKjwiv7u
X-Proofpoint-ORIG-GUID: EewLKkNvojqM2gQAbwrh9EQ5fKjwiv7u
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

On Fri, May 20, 2022 at 01:02:33AM +0000, Kuninori Morimoto wrote:
> 
> Hi
> 
> This is not related to this patch, but...
> 
> > -static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
> > -{
> > -	return component->driver->non_legacy_dai_naming;
> > -}
> (snip)
> > +static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
> > +{
> > +	return component->driver->endianness;
> > +}
> 
> I have added "endianness" "non_legacy_dai_naming" to component
> when convert old "Codec style" into current "Component style".
> All codec needs to have these 2.
> 
> 	69941bab7c7aeaa7bf7e84397e294c17f0b7c6df
> 	("ASoC: snd_soc_component_driver has non_legacy_dai_naming")
> 
> 	273d778ef38a8861f880e9df5799029dc82bd55d
> 	("ASoC: snd_soc_component_driver has endianness")
> 
> The reason why I didn't use "codec" was that try to keep
> original style as much as possible.
> But it seems this is good time to use "codec" for it ?
> I think the code will be more understandable.
> 
> -	.endianness
> -	.non_legacy_dai_naming
> +	.is_codec

Yeah I considered this but it didn't really feel like the right
way to go to me. Firstly, at this stage we almost certainly need
to keep the endianness and non_legacy_dai_naming flags, there are
corner cases when endianness probably shouldn't be applied to CODECs
(as noted in my endianness series), and there are platform drivers
that use non_legacy_dai_naming.

We could add an is_codec flag along side the other two. But it
means a whole extra flag and means the the core is still requiring
a concept of what is a CODEC driver, which really we want to get
rid of as part of componentisation.

My thinking was that, whilst making this function local to the
driver isn't perfect, simple card will be used with simple CODECs
that are likely to exist on a standard audio bus, and thus have
endianness and the newer graph cards don't require specific
identification of what is a CODEC driver. So it probably works as
a solution for now.

> 
> Thank you for your help !!

Absolutely no problem, thank you for all the work you have done
on this over the years.

Thanks,
Charles
