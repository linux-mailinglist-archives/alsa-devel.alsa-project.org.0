Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D253F54D607
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 02:22:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C5FF1AA9;
	Thu, 16 Jun 2022 02:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C5FF1AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655338979;
	bh=NTswwFr1u17EVinu5rIhd//LtRF4Tf7fhtKvFWEhhJo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmlCxK58+oTOO1wmHozB7HdLPM+lWbbcJb54wnvBdNcgVDpOassqiDx17uD8O3o6k
	 md2neJBMqtlg01SwzkNyeB43ri0kYldibCjg48hO7yG3DFiIgSHPlKu3qaHFV7kqZd
	 xVcmtdyBi7WLw8EsX9aecpct0gT+VCqO8vL3fiRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8F61F800B9;
	Thu, 16 Jun 2022 02:21:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70904F80162; Thu, 16 Jun 2022 02:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94B26F800D8
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 02:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B26F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="KN8vr1iV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Sr5dlTKS"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AA185C00D7;
 Wed, 15 Jun 2022 20:21:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 15 Jun 2022 20:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655338907; x=1655425307; bh=WD
 IA1k+vn1vyk6sKpiwf9/HshMJxrMIMaoY0+abbIDE=; b=KN8vr1iVGJp9lMqrvu
 2GzyJS1tTNsnungvZbSOGr9id1R497O47mxG6m5wvPsM4C3dzh+p6j0Kgkvq3DAG
 sKdvYigSt395Ejwog1wHt/VuqNBzome6DLFcPMh/LM+iEux6M3zTOwO/HfkwAKKY
 NGT1lORLP3T5/5Jnid5mnuLig+vTcuY6X8+LPdjRaAyYtY54llYsy8m1t/Dzrq6z
 r4e8QFx7tpPa/9ih310wyz/aKm9NcqLnpND8B6NowTmPHkvsmxe7Bn0liCHoovHs
 ObTwNuuSlfrjKJU203ABZjTQmdzUAWT6Z+n4YjJgh0CGKjktwSbMwTR6H6ze6eNT
 yJ+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655338907; x=1655425307; bh=WDIA1k+vn1vyk6sKpiwf9/HshMJx
 rMIMaoY0+abbIDE=; b=Sr5dlTKSCI3rrVDVU/LtMJr2bYszrv4HTWX7kEzFsGmv
 kgwvulq54c47NE3w65Yh8wwyLjLkKGxonE2QELAlfHp42VKomRrkKCGoyCpPxyAi
 d91XyReCI69AIS+s6cGK6UKKDKDqsdEz0p7ulwdbFzkIpKFtstEgzPxGs7RofOWf
 +kFJFtkXnbAaNIzDJ7E2Aa2wqUgNrgK3uV5PoSGpwahC4eVGKhUyQgy2Pk2S1MCY
 s2sL9q7MtL7Sw5kTqu710x/EuWXkbMmJL2U+A9+DiBEkCXvVJ9XBKaDgfEpJpGYq
 +mFzhiUp1dHeej5b0iUIddZcMsDgGv/1v1Og6DiqQw==
X-ME-Sender: <xms:mneqYuaXP-9qa4wrUUi6rBjX_1p6u88Kej4IxrpFTnLIl093A2XvtQ>
 <xme:mneqYhZtisTJJTT2mYjxNdJhMZc1X2BB6IvMvShcrDIjcfzdN1iEGvkqZr0RExl2q
 13umKMcv2TZs1Mhhe4>
X-ME-Received: <xmr:mneqYo-Omqj8hnIoRSXO1vR-6dHFSc4L85aWA-C-p6-eWCkwvhtzA-yvikQHeV5PfxBk80b389BA-KrKkOBLVixdgG2-B7Sj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
 ertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeevieelhf
 dukeffheekffduudevvdefudelleefgeeileejheejuedvgefhteevvdenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:mneqYgqZmlgTxAol3sAfR99YV8Gh0Z2Ii2HQ4BBs4yKPrmzt-VCTXg>
 <xmx:mneqYprpzZzkM0b44WGo0gt90G5j6VgFY0sYxyZlQqVQno-e9I3auA>
 <xmx:mneqYuRuayoevNPOA3AcBqC5a8EOZXYfOvfgWsrvUwNf_-IZDqp6mA>
 <xmx:m3eqYg3QrkA-zo7kmvwsf0P10LrU_Wis-CTckWjTmE9uvhbCirzWVg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 20:21:45 -0400 (EDT)
Date: Thu, 16 Jun 2022 09:21:42 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de, stefanr@s5r6.in-berlin.de
Subject: Re: [PATCH v2 0/3] firewire: fix minor issues
Message-ID: <Yqp3lvOYHwZyC0I5@workstation>
Mail-Followup-To: tiwai@suse.de, stefanr@s5r6.in-berlin.de,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net
References: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615121505.61412-1-o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net
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

Hi,

I realized that the second patch still includes a bug that shorter
buffer is allocated for block request than received length since the
computation is aligned to 4 without care of remainder.

Actually in the case of block request, the length is not necessarily
multiples of 4 and the packet payload has enough size of field with
padding to be aligned to 4, according to 1394 OHCI specification. In the
implementation of firewire-core driver, the field is copied without
the padding.

Please abandon them. I'm sorry to trouble you.


On Wed, Jun 15, 2022 at 09:15:02PM +0900, Takashi Sakamoto wrote:
> This second version of patchset is revised version of previous one[1] to
> fix mistake of macro usage pointed out by reviewer[2].
> 
> As I note, they are not so urgent changes, thus I don't mind postponing
> until next merge window.
> 
> [1] https://lore.kernel.org/alsa-devel/20220512111756.103008-1-o-takashi@sakamocchi.jp/
> [2] https://lore.kernel.org/alsa-devel/87o7yvpf4t.wl-tiwai@suse.de/
> 
> Jiapeng Chong (1):
>   firewire: convert sysfs sprintf/snprintf family to sysfs_emit
> 
> Lv Ruyi (1):
>   firewire: Fix using uninitialized value
> 
> Minghao Chi (CGEL ZTE) (1):
>   firewire: use struct_size over open coded arithmetic
> 
>  drivers/firewire/core-device.c      | 6 ++----
>  drivers/firewire/core-transaction.c | 3 ++-
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> -- 
> 2.34.1


Reards

Takashi Sakamoto
