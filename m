Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EFFD476
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 06:35:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D291615;
	Fri, 15 Nov 2019 06:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D291615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573796126;
	bh=01tsTdz5sKSfmLFvtDpk7Q23gFCnTFqeFB1jP1f3Hck=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YawARfKdQkw9l/b7p8omD2/dF8zdmEVQ4MN1vYUpWSQ5BBp08QZQK1vmP+zAXsAp8
	 RowLh2G6txacWLIiFQ8CpjVjHutMaO6dLHaatm7amINJTeQAwcFSGQfQiZ0asJOXU0
	 Ljk9IN5+r7kubeh2hYNv8JQTpt6GySMQALLuEOS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37C5FF80103;
	Fri, 15 Nov 2019 06:33:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D4A5F80103; Fri, 15 Nov 2019 06:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 538B0F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 06:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 538B0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="p/0M+qb3"
X-UUID: cab5a84008254049846ccc1f8edd7868-20191115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gmCzP92C7G4qxYX2rnqn8wBdFvNJ/rhP3o6A+8fl2G0=; 
 b=p/0M+qb3eDhRKvkPjf5KIXIhey3RDqBLvm4wVRzwdzGedrLCWcssIEsRW6WoO67jYIwIRQluHTe6fZxFykUyTtlzesNJ0CJsw8krIMCdlyc4spEWGIVDSawR6179YjCF4zV2P86Y2ZW2IDmenHgTTjfrkYibawnOqp+EL76wJoU=;
X-UUID: cab5a84008254049846ccc1f8edd7868-20191115
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <eason.yen@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 843355152; Fri, 15 Nov 2019 13:33:24 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 15 Nov 2019 13:33:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 15 Nov 2019 13:33:20 +0800
Message-ID: <1573796002.14232.14.camel@mtkswgap22>
From: Eason Yen <eason.yen@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 15 Nov 2019 13:33:22 +0800
In-Reply-To: <20191112173409.GI5195@sirena.co.uk>
References: <1573532538-30602-1-git-send-email-eason.yen@mediatek.com>
 <1573532538-30602-2-git-send-email-eason.yen@mediatek.com>
 <20191112173409.GI5195@sirena.co.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 86CE66E82027474A9B0B7FFEFCC7979862667C6949F3058B7B4509A9EF0DCEB82000:8
X-MTK: N
Cc: matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com,
 chipeng.chang@mediatek.com
Subject: Re: [alsa-devel] [PATCH] ASoC: mediatek: common: refine
	mtk_afe_fe_hw_params
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

Hi Mark,

 
On Tue, 2019-11-12 at 17:34 +0000, Mark Brown wrote:
> On Tue, Nov 12, 2019 at 12:22:18PM +0800, Eason Yen wrote:
...
> 
> It'd be better to split these two into separate patches, they're two
> separate things.  Ideally the refactoring should just be simple code
> motion.  Right now the patch is a bit difficult to follow.
> 

Ok, I will separate this patch soon.


> >  static int mtk_regmap_update_bits(struct regmap *map, int reg,
> > -			   unsigned int mask,
> > -			   unsigned int val, int shift)
> > +				  unsigned int mask,
> > +				  unsigned int val, int shift)
> >  {
> >  	if (reg < 0 || WARN_ON_ONCE(shift < 0))
> >  		return 0;
> 
> This is an unrelated indentation change?

Yes, it is an alignment that to match open parenthesis.

> 
> > +	dev_info(afe->dev, "%s(), %s, ch %d, rate %d, fmt %d, dma_addr %pad, dma_area %p, dma_bytes 0x%zx\n",
> > +		 __func__, memif->data->name,
> > +		 channels, rate, format,
> > +		 &substream->runtime->dma_addr,
> > +		 substream->runtime->dma_area,
> > +		 substream->runtime->dma_bytes);
> 
> This is going to get noisy, dev_dbg at most please.

Ok, thanks for your suggestion.


Regards,
Eason
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
