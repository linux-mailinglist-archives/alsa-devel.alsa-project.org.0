Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D554B8443
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:30:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C5001948;
	Wed, 16 Feb 2022 10:29:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C5001948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003806;
	bh=Iwk06rOzeXujhOVg+lR4ZUSOjaOUSH3uhllC6rWz3Vw=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CUAms79wr+YJX2vqJAYQy4PONATVp3hp/phWk2jvso8BH0m0N1bjdLjod9lE3fpBJ
	 /6bbiLvkylCyzMd7HZIG4xnXr2Mr99grAOkV3SmJxVEazhoZC+/nppcRugVCP6BVRs
	 MMvpDpIukBpN+D7oQ4/48G47AkkIpNVEHhHC3uVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80452F80558;
	Wed, 16 Feb 2022 10:25:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCEB8F80310; Tue, 15 Feb 2022 03:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 720B8F8012F
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 03:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720B8F8012F
X-UUID: 7c965cb11cb840179b068fbfb5380b89-20220215
X-UUID: 7c965cb11cb840179b068fbfb5380b89-20220215
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 143493579; Tue, 15 Feb 2022 10:27:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 10:27:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Feb 2022 10:27:33 +0800
Message-ID: <2a39dc9465761a16587bfe82189f581c1d52da6a.camel@mediatek.com>
Subject: Re: [PATCH 20/23] ASoC: codecs: wcd938x: Make use of the helper
 component_compare/release_of
From: Yong Wu <yong.wu@mediatek.com>
To: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 15 Feb 2022 10:27:33 +0800
In-Reply-To: <67b2e6e8-e4fe-06ca-3d12-9bba83743989@collabora.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-21-yong.wu@mediatek.com>
 <YgpNqLQzpx4J6d8K@sirena.org.uk>
 <67b2e6e8-e4fe-06ca-3d12-9bba83743989@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Will Deacon <will@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Joerg
 Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Clark <robdclark@gmail.com>, James Wang <james.qian.wang@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

On Mon, 2022-02-14 at 13:43 +0100, AngeloGioacchino Del Regno wrote:
> Il 14/02/22 13:40, Mark Brown ha scritto:
> > On Mon, Feb 14, 2022 at 02:08:16PM +0800, Yong Wu wrote:
> > > Use the common compare/release helpers from component.
> > 
> > What's the story with dependencies here?  I've just got this one
> > patch
> > with no cover letter...

Sorry for this. I will add in cover letter next time.
Maybe in next week. Just to see if there is any other comment.

Thanks.

> 
> Hello Mark,
> I agree, the cover letter should be sent to everyone; Yong, please
> add the
> proper Ccs to it next time.
> 
> Anyway, context:
> 
https://patchwork.kernel.org/project/linux-mediatek/cover/20220214060819.7334-1-yong.wu@mediatek.com/

Thanks very much:)

> 
> Cheers,
> Angelo

