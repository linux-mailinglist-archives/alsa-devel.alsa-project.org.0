Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C95E5835
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 03:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2984843;
	Thu, 22 Sep 2022 03:43:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2984843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663811057;
	bh=MSpIoCfVPW85ZcH8K1OPb7CqLlG1/Zt+BPl7JPBrj0o=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+tjN5rE60yp33p7myXbR8J5MVq+qFk4GJ8cNsOhBZxtAW9SCl2EUSoNtFahTtbB9
	 ZbHpYTQotI2ZMSMnxjcwctMp8foIMShp4k+kUyuek7spqCWqXrgexEdtY24P9wuaEZ
	 IWybLeMAYi3i406x7sFiJpZ3ArH07DO2iz0g+KIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A99FF804E7;
	Thu, 22 Sep 2022 03:43:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 937D9F8012A; Thu, 22 Sep 2022 03:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD80DF8020D;
 Thu, 22 Sep 2022 03:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD80DF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="k/ln69CK"
X-UUID: 4f43afa987a34280aed1746f442474a9-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4ooavMI26VS/rgEsvGJZdTi0rwPkW4R7VrMOyd8Gas0=; 
 b=k/ln69CKqBDVX43egJxyQbJb2YLHXlhn0l00XZkk56xmJaRTmmRtp0xOx57ulhGl4yt+g3OJrEm6sUAesR8+NU4YsPaFYDE2+ietPQiRgrGQ3INUE+FypzW5KDYWUZSk95s8MxTMp55EKsLKfM79sykKiRY1LSHyfjYQGtTyiMw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:c347f47b-e952-45d2-9581-ced0dd693c00, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Release_Ham,ACTIO
 N:release,TS:73
X-CID-INFO: VERSION:1.1.11, REQID:c347f47b-e952-45d2-9581-ced0dd693c00, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:73
X-CID-META: VersionHash:39a5ff1, CLOUDID:80c5c4af-12a8-4d8e-859c-1b6ce09c0eab,
 B
 ulkID:2209212018083T3OSIUH,BulkQuantity:69,Recheck:0,SF:28|17|19|48|823|82
 4,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40|20,QS:nil,BEC:n
 il,COL:0
X-UUID: 4f43afa987a34280aed1746f442474a9-20220922
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1309701659; Thu, 22 Sep 2022 09:42:53 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 22 Sep 2022 09:42:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Sep 2022 09:42:51 +0800
Message-ID: <45bba23b9bea4c5df0ac1751c9dcd8f1ce5df6e6.camel@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
From: chunxu.li <chunxu.li@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
 <daniel.baluta@nxp.com>
Date: Thu, 22 Sep 2022 09:42:51 +0800
In-Reply-To: <dbe3f7fb-5fae-b147-f824-cd39ba3900ca@collabora.com>
References: <20220921120239.31934-1-chunxu.li@mediatek.com>
 <dbe3f7fb-5fae-b147-f824-cd39ba3900ca@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

On Wed, 2022-09-21 at 14:17 +0200, AngeloGioacchino Del Regno wrote:
> Il 21/09/22 14:02, Chunxu Li ha scritto:
> > add pcm_pointer callback for mt8186 to support read
> > host position from DSP
> > 
> > Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
> 
> Hello Chunxu,
> Can you please also add this, along with the .pcm_hw_params callback
> to mt8195.c?
> 
> Anyway, for this one:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Sure, certainly.

