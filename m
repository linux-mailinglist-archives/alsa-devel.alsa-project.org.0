Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27622D7A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 09:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D11041607;
	Mon, 20 May 2019 09:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D11041607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558339125;
	bh=F5Zm4UKQ1QBJtKyGYR+FnF71yIaA2eGBqfh6Sv9r/MI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8SIrbmXcblGWZhxZUPnw70TOCeuWW2BXhUqkGPnC42/2trsuJx19jUBoctjnGrpR
	 qGHEVdMP/9Hc3g22zVio7swqic+6tBDE555Y+w1Ffdz6+n2GsX1b5KkPJ1UdViz3wq
	 U8PC/L7fq/18SYfMZlvzdL5pMJj7cSbti0gTliuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6851F89630;
	Mon, 20 May 2019 09:57:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79D12F89618; Mon, 20 May 2019 09:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=HTML_MESSAGE,RDNS_NONE,
 SPF_HELO_NONE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by alsa1.perex.cz (Postfix) with ESMTP id A6111F8962F
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 09:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6111F8962F
X-UUID: f4bdbc2a47f14b409dfc2592fec0a0b2-20190520
X-UUID: f4bdbc2a47f14b409dfc2592fec0a0b2-20190520
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 964549803; Mon, 20 May 2019 15:50:17 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 20 May 2019 15:50:16 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 20 May 2019 15:50:15 +0800
Message-ID: <1558338615.21415.0.camel@mhfsdcap03>
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 20 May 2019 15:50:15 +0800
In-Reply-To: <20190516101652.GD5598@sirena.org.uk>
References: <20190516101515.4127-1-shunli.wang@mediatek.com>
 <20190516101652.GD5598@sirena.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, Shunli Wang <shunli.wang@mediatek.com>,
 kaichieh.chuang@mediatek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Mediatek: MT8183: enable IIR filter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 2019-05-16 at 11:16 +0100, Mark Brown wrote:
> On Thu, May 16, 2019 at 06:15:15PM +0800, Shunli Wang wrote:
> > This patch is to enable IIR filter when DMIC of PMIC
> > is enabled.
> 
> Should this not have a user control in case the user wants to avoid the
> filter for some reason?

The last commit message is incorrect,IIR filter is always required to
open for DMIC and AMIC of PMIC.So we will send V2 which correct the
commit message again.



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
