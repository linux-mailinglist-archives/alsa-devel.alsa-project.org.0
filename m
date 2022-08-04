Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E2589DDC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 16:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471C5844;
	Thu,  4 Aug 2022 16:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471C5844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659624546;
	bh=6Luo3nVKnhm9MS9mMcDSj2czS31Q4KNJHbWXKMu0OmI=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bL9DQ26ZXGs9QtYXvGxN7f73zKMXnry8iXZZT51+UwtdnJxPCMk79uGPVX0b0x1h8
	 +510cI3pVy90wu6EjrpU2PicugLz5NfLlctEIR2iq+E6J+R74KJ1/FPORmlJqK+Zqi
	 l/UJFqL7MXx4kKsORndwkyQQtQixdAyZ3N7Qg3yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4A7F802DF;
	Thu,  4 Aug 2022 16:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1636F8016A; Thu,  4 Aug 2022 16:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97338F8012F;
 Thu,  4 Aug 2022 16:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97338F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="e3ke6iX7"
X-UUID: 88886b0a3159428a819f01cd0fb36f80-20220804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h3l/BjGiDj7ogx0ua5ecB5Kqs/UfoZIgMYIj4zv4hAo=; 
 b=e3ke6iX7yZ5bzvLap5EolVJUlV/LsYivTXrxaX6IVbOjDp//aMU4EJPY+7MMl14cfsLnjPORi0qejFPvbgqLIJSJ88JweqkUVBTff3XVC/u4obw3hrl5+1jeIwGOfNBgTBGAx/gKyeqR0k8StpgNNvf7KC9/9XUY/pmMJjpQREY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:dff183f7-8962-4890-97f3-7da4c178d3ab, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:50
X-CID-INFO: VERSION:1.1.8, REQID:dff183f7-8962-4890-97f3-7da4c178d3ab, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:50
X-CID-META: VersionHash:0f94e32, CLOUDID:4c503ed1-841b-4e95-ad42-8f86e18f54fc,
 C
 OID:32c24ad63680,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 88886b0a3159428a819f01cd0fb36f80-20220804
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1803292040; Thu, 04 Aug 2022 22:47:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 22:47:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 22:47:48 +0800
Message-ID: <767ff0f7f40711b8ecda545e43e87036e88f0f22.camel@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 4 Aug 2022 22:47:48 +0800
In-Reply-To: <YuvKjn3cW5im2Yw9@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-3-chunxu.li@mediatek.com>
 <Yuu+elYxBv3xZ1O2@sirena.org.uk>
 <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
 <YuvKjn3cW5im2Yw9@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 daniel.baluta@nxp.com, tinghan.shen@mediatek.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 peter.ujfalusi@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Thu, 2022-08-04 at 14:33 +0100, Mark Brown wrote:
> On Thu, Aug 04, 2022 at 09:21:37PM +0800, chunxu.li wrote:
> > On Thu, 2022-08-04 at 13:41 +0100, Mark Brown wrote:
> > > On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:
> > > > +		.board = "mediatek,mt8186",
> > > > +		.sof_tplg_filename = "sof-mt8186.tplg",
> > > The mediatek,mt8186 compatible looks like a SoC compatible not a
> > > board
> > > compatible...
> > Our dts config as below:
> > kingler board:
> > compatible = "google,corsola", "google,kingler", "mediatek,mt8186";
> > krabby board:
> > compatible = "google,corsola", "google,krabby", "mediatek,mt8186";
> 
> So the SoC is listed as a fallback for the board and things work out
> fine.
> 
> > Which of the two approaches do you prefer?
> 
> I think it would be clearer to keep what's being matched the same but
> rename the .board field to be .compatible, or possibly
> .system_compatible
> or something if it's unclear what's being matched.  That'd be more
> normal for specifying a compatible string anyway.

Appreciated for you advice, I'll rename the .board to .compatible as
following:

+	.compatible = "mediatek,mt8186",
+	.sof_tplg_filename = "sof-mt8186.tplg",


