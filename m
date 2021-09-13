Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6D408443
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 07:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77EBC82A;
	Mon, 13 Sep 2021 07:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77EBC82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631512634;
	bh=wuc/aR8/2QMOnzLBtThvqfbYAspQphQz2hm/GSVeYYA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k190oq2jIXcykJ5sZxaMo9+icpybwO4vkyfIko38umonUFA1tKL0OS3h7XFYajqI2
	 AkycVu+fE/SGa6boRyGKY0xtstNt0m9oqkipR8HqFHc6pP7p9yW4GeLFDlXGzhr+zJ
	 xsGn14O0CsHuDHCQ0YbHI39KU0P3hbHn3zU1mt0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E49F80227;
	Mon, 13 Sep 2021 07:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F49F8027C; Mon, 13 Sep 2021 07:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B57B5F80132
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 07:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57B5F80132
X-UUID: a04d09bb2c8a4bf0aef64581cadeaee6-20210913
X-UUID: a04d09bb2c8a4bf0aef64581cadeaee6-20210913
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1343577215; Mon, 13 Sep 2021 13:55:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 13:55:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Sep 2021 13:55:38 +0800
Message-ID: <5fa1e99f1b9097336a3e610dc383170f09036b14.camel@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: common: handle NULL case in
 suspend/resume function
From: Trevor Wu <trevor.wu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 13 Sep 2021 13:55:38 +0800
In-Reply-To: <20210910102358.GC4474@sirena.org.uk>
References: <20210910092613.30188-1-trevor.wu@mediatek.com>
 <20210910102358.GC4474@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dan.carpenter@oracle.com,
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

On Fri, 2021-09-10 at 11:23 +0100, Mark Brown wrote:
> On Fri, Sep 10, 2021 at 05:26:13PM +0800, Trevor Wu wrote:
> 
> > When memory allocation for afe->reg_back_up fails, reg_back_up
> > can't
> > be used.
> > Keep the suspend/resume flow but skip register backup when
> > afe->reg_back_up is NULL, in case illegal memory access happens.
> 
> It seems like it'd be better to just allocate the buffer at probe
> time
> and fail in case we can't get it, I'd be surprised if there's many
> platforms using this hardware that don't also end up suspending and
> resuming.

Hi Mark,

Thanks for your suggestion.
I agree it's better to allocate the memory at probe time.
I think we can still keep the implementation in the suspend/resume
function as a fallback solution if user doesn't allocate the memory in
probe function.

In the new mediatek SOCs, regcache has been used to handle register
backup.
Do I need to add the buffer allocation on probe function to the
platform in which mtk_afe_suspend and mtk_afe_resume are used?

Thanks,
Trevor

