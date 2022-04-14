Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87A500881
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 10:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487D316F8;
	Thu, 14 Apr 2022 10:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487D316F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649925554;
	bh=5K5PBCjw++wR7vZ/ZFFzD2BNbcB1Pi8tfcNLTFjOH2o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DfU5aWTGYetpbFmVIDEsdzh6kvDeP1qAvELnzUK5LQIhUMjMH1Y707Bp1SAIKqKan
	 WyNb6OtmOLJ/k9lJa6KGBIQ2zmUq/P87NDjWmdAfSOlWFX5nk8rB5yE540F7u6jFEK
	 1NM9XkLIb3cD3RigRXZaMa0nbUi3a97WELQDUx1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A52FEF801F7;
	Thu, 14 Apr 2022 10:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CE75F80162; Thu, 14 Apr 2022 10:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F617F80124
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 10:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F617F80124
X-UUID: 8cce995ca1594bbd84835c6af7d68581-20220414
X-UUID: 8cce995ca1594bbd84835c6af7d68581-20220414
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 956665497; Thu, 14 Apr 2022 16:37:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 14 Apr 2022 16:37:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 16:37:58 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <tiwai@suse.de>
Subject: Re: [PATCH -next] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Date: Thu, 14 Apr 2022 16:37:58 +0800
Message-ID: <20220414083758.32396-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <s5hzgko3wh5.wl-tiwai@suse.de>
References: <s5hzgko3wh5.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tiwai@suse.com,
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

Hi Takashi,

> This must be a side-effect of the recent fix 9dd7c46346ca
> ("sound/oss/dmasound: fix build when drivers are mixed =y/=m").
> Adding Randy to Cc.
> 
> IMO, a less uglier way would be to add __maybe_unused to that
> function.  But it's a matter of taste.

thanks, I will use __maybe_unused and the fix tag in v2.

Thanks,
Miles

> 
> 
> thanks,
> 
> Takashi
