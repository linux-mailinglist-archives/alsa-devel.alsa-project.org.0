Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD685E7313
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 06:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E2B74C;
	Fri, 23 Sep 2022 06:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E2B74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663908080;
	bh=CPIqNJo13pPNWdzRtUz6EBnP4WlV2rbaZ//Zr9ekT8w=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E485aLqjrbBos5tzeRKN7CqieQaeSG6UDlzAq+doDBugP73Ivc7PFRWPxZBsOvh6o
	 IbnD+mCTMfppCftOPkQufFNjemNFqa1vyRCbIzPZE0i9nHE+RV5w2ZYlGBBB8Wnuor
	 5LBq5sszQdnVEbzdvEUh0RFxVMqn3LhABvTQj8qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA1FF80431;
	Fri, 23 Sep 2022 06:40:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83838F80269; Fri, 23 Sep 2022 06:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCD69F80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 06:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD69F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="TdXRbfZ/"
X-UUID: 487a28df31454b88850da2e2ac74aa34-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1KZyGx1JqtxeTxG8MfIi+v7uhwTWWMglV+1MnUR2ayE=; 
 b=TdXRbfZ/8IpUgA+lgxgn3KDZv+0j7EA5CWlc4TohCN8q+rZHaFNgrEY7V+31LDmlQrDDAODk9tPs7vKTjb8uosN+bowdeTcGP3dXobFf0JJWKfBEgtkEbWWOTcUzeov0ZfCj3qbXbrBvzFeJmxO3xusmM7zq42IjKXLmPmyPWOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:b6a5756d-ad41-4351-8341-83706ac362ae, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:73
X-CID-INFO: VERSION:1.1.11, REQID:b6a5756d-ad41-4351-8341-83706ac362ae, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:73
X-CID-META: VersionHash:39a5ff1, CLOUDID:5370d0a2-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:220922192633HYJZ5STC,BulkQuantity:204,Recheck:0,SF:28|17|19|48|823|8
 24,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil
 ,COL:0
X-UUID: 487a28df31454b88850da2e2ac74aa34-20220923
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1142852460; Fri, 23 Sep 2022 12:39:55 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 12:39:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Sep 2022 12:39:54 +0800
Message-ID: <978af4cc1a8bfa92675bb201947cfdac1e5429f1.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
From: Trevor Wu <trevor.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark
 Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Date: Fri, 23 Sep 2022 12:39:54 +0800
In-Reply-To: <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com> <YyxjZ9nCBdVovkVs@sirena.org.uk>
 <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Thu, 2022-09-22 at 16:10 +0200, AngeloGioacchino Del Regno wrote:
> Il 22/09/22 15:30, Mark Brown ha scritto:
> > On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:
> > 
> > > snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure
> > > whether
> > > it would introduce any side effect or not.  Perhaps Trevor could
> > > provide some suggestions.
> > 
> > If it does it should be to fix isues rather than introduce new
> > problems - I suspect the other operations just don't work
> > currently.
> 
>  From my upstream tests, this didn't introduce any issues, that's why
> I've
> sent this patch.
> 
> In any case, let's check with Trevor, just as to be extremely sure,
> but please
> use an upstream kernel for eventual tests, as there are quite a bit
> of changes
> between 5.10 and current upstream.
> 
> Cheers,
> Angelo

I think it's not a big risk if Angelo already did the test and
snd_soc_pm_ops is also used in MT8186.
I can help do more tests on 5.10 when the patch is back to chromium in
the future.
MTK also have a plan to support complete suspend/resume functionality
in MT8195. If Tzung-bi has concerns about the patch, I can help submit
the patch at the time.

Thanks,
Trevor

