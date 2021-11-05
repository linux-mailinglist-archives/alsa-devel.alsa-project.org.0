Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E4445F10
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 05:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A56F1688;
	Fri,  5 Nov 2021 05:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A56F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636085616;
	bh=Mw1yQ3MWr9K6/+QZmJR5lRUP6el9+0+bCKmu9oaowyc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RVhRGvTgTg5SPqRbq2ruLeYx9WBXmDBmwM1z0s2nahEvgy8VKuOI90XTUbn2zAyLC
	 EAbwGBVEMdVNJHVYy53HzBj2IqVEtqA6nnobXMxcy890yON2Jj2Z7VtX7w9iIAThm2
	 M2rX/HHpPvKO8S8hqkpIFNWkJc6FLEtRLxKbXeRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A251F80279;
	Fri,  5 Nov 2021 05:12:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AECEF8026A; Fri,  5 Nov 2021 05:12:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F459F80148
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 05:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F459F80148
X-UUID: 9c2cbe9fa3dd4117bb2ca022e041268b-20211105
X-UUID: 9c2cbe9fa3dd4117bb2ca022e041268b-20211105
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 105411032; Fri, 05 Nov 2021 12:11:56 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 12:11:56 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Nov 2021 12:11:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Nov 2021 12:11:55 +0800
Message-ID: <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
From: Trevor Wu <trevor.wu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 5 Nov 2021 12:11:55 +0800
In-Reply-To: <YYP+l7tMofYoB+aC@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 2021-11-04 at 15:39 +0000, Mark Brown wrote:
> On Wed, Nov 03, 2021 at 06:00:39PM +0800, Trevor Wu wrote:
> > Because we will add DSP support, an new machine driver for the same
> > board is required. BE and codec configuration will use the same
> > code
> > when machine driver is designed for the same board.
> 
> I don't follow why the DSP support requires a new driver?  Shouldn't
> all
> systems with the DSP present be using it?

We need to keep the solution without DSP, so we can replace DSP
solution with non-DSP when it's required. But when we introduce SOF for
DSP control, there will be more routes in machine driver and device
tree usage is different from the original. So it's hard to share the
same driver for these two solutions.

Thanks,
Trevor

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

