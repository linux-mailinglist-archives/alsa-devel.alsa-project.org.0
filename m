Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041773A94E4
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 10:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AF81686;
	Wed, 16 Jun 2021 10:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AF81686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623831809;
	bh=3JBH+9yP1dxFgSqGCMIREb492/jkmrjh1q82PBnnvwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZPYg2I9RJTEa5MZuRCx1tAlimVHeaLmzhd65SZv28S/ZJ/CqHh3avKdlVRegYo7o4
	 QjZYQWhC+zPhybO02f55rWIkDPt4W5Bp/O5nuyMpBEsG/BpECHWnV033SeJJ/YuOeF
	 0ZeBNW4u+4T1gUOKSXySbJ5Xcb78Ru661Q0BlDMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2CB4F802E8;
	Wed, 16 Jun 2021 10:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F1BF80423; Wed, 16 Jun 2021 10:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FEDEF80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 10:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FEDEF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="lN5SUX1u"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bmm63I7V"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5E96158044E;
 Wed, 16 Jun 2021 04:21:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 16 Jun 2021 04:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=o
 z1afSZtH4HEgY3zg42iH1DY//zDW8wKRe4vHaTi0y0=; b=lN5SUX1uagJ28V30k
 RC1tmY6DI9XAlPzOqVSgDgaMxG/WoeiuBWcBHIdcB1CXm3e4bqlqrWI/tgyNvqQY
 yDt1jRi5zrXeechHiBDfSvLWt5RFInLKRWIVKMadud5QfJdauxI4/nL7swM22SIf
 twheS0P6OfgJsj5/inWXrlarPgGVHEDeZG8kyeel1AXPSPpYaDW8zqRMDXFY8ziX
 WHcF1E6/pISk7f1Z3cPoMl5dqVwmltX/ND8byzqGhrBMJMzjva9KD2tCSBvA8nfq
 HJBX+raIEVE+do2fz8IMPl9i4JdqzdtlNe79s7m90CLs19qunnb5tI9S1n2jo/O+
 Qf2JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=oz1afSZtH4HEgY3zg42iH1DY//zDW8wKRe4vHaTi0
 y0=; b=bmm63I7VxeIVqq+/FRSF68A0XI3F7eCYsCEWYOYvN1IcHMho3Bdb6+tvM
 e7SKSNiRkCRWKx6dobT/WP/YAa/xq65u/NtfnnVMYZ+mnRTbV2Gx14tWEhF7j8yF
 EEygGeX03XWAv7RVxGALJS1arH8DAcyzqkdTpwDhhlHOaD7kLh6d+i9BPyav4Mzf
 jWBujeIa9fdV2xmFhMXQb/ZK+wYvHHVQTRugeJkLmt00uNtcsF3JWKZBmWIDSaYY
 ha+Lj/10tSQ6bJeHQ+NlGmDHfqzXw5nSIYljfpr0K6AnLAF5dnbdBjQlL0Qwcsbv
 5TDTJJyIPJmabmRS9GZYJJWQ1fl2w==
X-ME-Sender: <xms:obTJYJOBnmrghJOugX0l7MBAFgaXxK24GMDyHJDS5x7AqgI2oYQsrQ>
 <xme:obTJYL9ZYQPVBcCEYKzC09vp6b72sKxTvr1EJpQG27SYuu22iiqXyr32n20BZGSV1
 0cyGdsTzK1Vye7DNEQ>
X-ME-Received: <xmr:obTJYIQoiTyb_IzglrDMyDVN10hTgNvkwd0EdPYKBhREetI-NuAbsVZEE8LInqvQLOwGRZhl4-D7T5Piw4oqTIbi60qx6ZmCOzGm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:obTJYFtEYBd5JB3YPDZATxYUAH4HBhQzopmQFc2JT6yom3hYs_AKhg>
 <xmx:obTJYBehjpvFtceQCmkSwIDKUK91vq3Ur-_q277EsSdqEljlrGN9fw>
 <xmx:obTJYB3dj1QPCy50MWLCnS4Dt_uVahxFGaGwFY93tEPsoEMJFzD3FA>
 <xmx:o7TJYP26NQO9-XFDXfXaF0wuXvyOuehZel8F6E58MuvraDMDZVh_PQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 04:21:53 -0400 (EDT)
Date: Wed, 16 Jun 2021 10:21:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: hdmi-codec: Make symbol
 'hdmi_codec_controls' static
Message-ID: <20210616082151.mrcbswfpponkleve@gilmour>
References: <20210615172156.2840576-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210615172156.2840576-1-weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Tue, Jun 15, 2021 at 05:21:56PM +0000, Wei Yongjun wrote:
> The sparse tool complains as follows:
>=20
> sound/soc/codecs/hdmi-codec.c:750:25: warning:
>  symbol 'hdmi_codec_controls' was not declared. Should it be static?
>=20
> This symbol is not used outside of hdmi-codec.c, so marks it static.
>=20
> Fixes: 366b45b97448 ("ASoC: hdmi-codec: Rework to support more controls")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
