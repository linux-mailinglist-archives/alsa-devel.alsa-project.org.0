Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342244E5E2B
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 06:32:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5ABB1614;
	Thu, 24 Mar 2022 06:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5ABB1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648099948;
	bh=4iteKqxsPzZLy0etLDRis5xcpFfzFqpSStuX8ZFgp6M=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBPg9C64dodlRlMOPTxFFZTp69oqBN3v/qWfgA474Ltw2cCkXDsI+BCtwcJC74Fdo
	 A8Dt4z8OZmE6ex3b07gSVIwB2EavD+Ym68efyoEmqz2Ojfs6EouFqeeawQEMnc0Eic
	 TaMc1dI5rNE/TQMI7j2hW9bzSL5b9et4LHsgX7pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB50F80139;
	Thu, 24 Mar 2022 06:31:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F47F80165; Thu, 24 Mar 2022 06:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40AEAF800AA
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 06:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40AEAF800AA
X-UUID: 3adf9d07ec0d4988b759eb87e86a33be-20220324
X-UUID: 3adf9d07ec0d4988b759eb87e86a33be-20220324
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 162818175; Thu, 24 Mar 2022 13:31:06 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 13:31:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 13:31:04 +0800
Message-ID: <6c331bb8e95aa7c1a88a6161622f51ff2fee3f98.camel@mediatek.com>
Subject: Re: [v6 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Date: Thu, 24 Mar 2022 13:31:04 +0800
In-Reply-To: <YjvBLf/8M1WUS/L+@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-2-jiaxin.yu@mediatek.com> <YjvBLf/8M1WUS/L+@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

On Thu, 2022-03-24 at 08:54 +0800, Tzung-Bi Shih wrote:
> On Thu, Mar 24, 2022 at 12:44:39AM +0800, Jiaxin Yu wrote:
> > +  speaker-codec:
> 
> If it is possible to have 1 or more items, would "speaker-codecs" be
> a better
> name?

Hi Tzung-Bi,

Yes, it is better to use "speaker-codecs", I will change it that in
driver patch and bindings patch.

Jiaxin.Yu
Thanks
> 
> > +    type: object
> > +    properties:
> > +      sound-dai:
> > +        minItems: 2
> 
> It should be 1.  Consider of rt1015p case.

Yes, I will correct it.

