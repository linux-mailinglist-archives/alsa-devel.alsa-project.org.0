Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F322514533
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 11:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D9815C1;
	Fri, 29 Apr 2022 11:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D9815C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651223801;
	bh=D0lpmc/fGDwF8aAvb0EchkmoHJj0PJr6ropsxHnoP8U=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQe2zMM5u3oiTXedo/fSA7BoatBK2HDtJ5HGK68dapkb90PeYTful/9YgXy9ZwHdP
	 /elCU0qnZM8xipVTY7cyMt7Y9RFYmEKGm1JCDXWuLcUqHiqeqOFroHgtdsi6s1zmkM
	 /A6ZswAWOlcuV2AHKpsjzvhrt7NxcWDKrGyOVuVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C5DEF80269;
	Fri, 29 Apr 2022 11:15:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 679C1F80237; Fri, 29 Apr 2022 11:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=PRX_BODY_135,RDNS_NONE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B26D1F8016E
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 11:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B26D1F8016E
X-UUID: 5b7b56c497b54af38cb68743611774e3-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:242fe031-ed48-42f4-a271-3e560c49da6a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:47
X-CID-INFO: VERSION:1.1.4, REQID:242fe031-ed48-42f4-a271-3e560c49da6a, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:47
X-CID-META: VersionHash:faefae9, CLOUDID:20432c2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:28|17|19|48,TC:nil,Content:4,EDM:-3,File:nil,QS:0
 ,BEC:nil
X-UUID: 5b7b56c497b54af38cb68743611774e3-20220429
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1146370166; Fri, 29 Apr 2022 17:15:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 29 Apr 2022 17:15:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:15:22 +0800
Message-ID: <b90426905a486ab720b9d67f00ed869285acd768.camel@mediatek.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Apr 2022 17:15:22 +0800
In-Reply-To: <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <CAMuHMdWYJofetMwkAH4d8UzKZH77hxwRhXrMhaECOs1suQV2PA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, aaronyu@google.com,
 Julian Braha <julianbraha@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, 2022-04-29 at 10:47 +0200, Geert Uytterhoeven wrote:
> Hi Jiaxin,
> 
> Gmail tends to mark your patches as spam.
> Can you please make sure to use "PATCH" in the subject line, e.g.
> "[PATCH v4 00/18] ASoC: mediatek: Add support for MT8186 SoC"?
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a
> hacker. But
> when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds

Hi Geert,

Sorry for this mistake, I usually use "git format-patch --subject-
prefix "v4" --cover-letter -x" to generate a series of patches.
So it automatically removes "PATCH". I will correct the cmd to "git
format-patch --subject-prefix "PATCH v4" --cover-letter -x".

Thanks,
Jiaxin.Yu

