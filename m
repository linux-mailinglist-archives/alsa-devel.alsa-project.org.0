Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C9B1609B0
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 05:51:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865AD166C;
	Mon, 17 Feb 2020 05:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865AD166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581915068;
	bh=UiF0RtyJJ0uz6HERe8hAHhLQsKpq/zA/kJQJZ539sPM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSjUrPbGVGa7/lm7saEczgDK5uxRCH/VpWWNcmfNhB2RMklZyf3hj5odFsgGKThEB
	 GVfekagOM5GEJvGs8DK/DgjLxkbiSwZAjcR/CKY8AP4uG8acsFy97A2I/U0d3Bclon
	 qdKKAvIk8UCJAKQ/mMl/zmBLlHBABez/vjwaNjIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5250F801F4;
	Mon, 17 Feb 2020 05:49:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B53F80172; Mon, 17 Feb 2020 05:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id C8D77F800B6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 05:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D77F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="LzeR3AZZ"
X-UUID: 8a14c4fe7f9444b1b755bdb56451a0a8-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ib3CGDT48ndknLXCzeQvFl+o88PHBbAK1vPnBCCEPIU=; 
 b=LzeR3AZZNezNMC2uS+TX/bIxwUBA7Z2udE90OAaUxZoSgQ4Rtf81incW3AxkF97NnBP22yYcrMxjCIJzl9Hl7RWaea+CUXmXvoc1YB0YWVxqR68DcJtRkrtWE4nSEpl89hM/bI2YZurhxk+x8S/ji+FLNqyNWiQzPngxksfdIoE=;
X-UUID: 8a14c4fe7f9444b1b755bdb56451a0a8-20200217
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1619337215; Mon, 17 Feb 2020 12:49:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 12:48:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 12:49:00 +0800
Message-ID: <1581914953.20102.3.camel@mtksdaap41>
From: CK Hu <ck.hu@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 Feb 2020 12:49:13 +0800
In-Reply-To: <CA+Px+wWRn1-t2fd+bD-PGRVjyLaAHqm1wF3W3T_GMUh0GXkA_A@mail.gmail.com>
References: <20200217031653.52345-1-tzungbi@google.com>
 <20200217105513.2.I477092c2f104fd589133436c3ae4590e6fc6323b@changeid>
 <1581911058.12629.1.camel@mtksdaap41>
 <CA+Px+wWRn1-t2fd+bD-PGRVjyLaAHqm1wF3W3T_GMUh0GXkA_A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Cc: ALSA development <alsa-devel@alsa-project.org>, p.zabel@pengutronix.de,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Daniel
 Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] drm/mediatek: fix race condition
 for HDMI jack status reporting
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

On Mon, 2020-02-17 at 11:55 +0800, Tzung-Bi Shih wrote:
> On Mon, Feb 17, 2020 at 11:44 AM CK Hu <ck.hu@mediatek.com> wrote:
> > On Mon, 2020-02-17 at 11:16 +0800, Tzung-Bi Shih wrote:
> > > Fixes: 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting")
> >
> > This patch looks good to me, but please merge this patch with the patch
> > it fix.
> 
> 5d3c64477392 ("drm/mediatek: support HDMI jack status reporting") has
> applied to ASoC for-next branch.  This is a fixup patch.

I thought a patch need an ack by the maintainer. OK, so I could do is,
for this patch,

Acked-by: CK Hu <ck.hu@mediatek.com> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
