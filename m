Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE03E0FB8
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 09:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B11165D;
	Thu,  5 Aug 2021 09:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B11165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628150150;
	bh=miCaEGB806tdWPou9taWaDlX0V/cV3pSjkPZ8rZdBNM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eQvJR9tryU2eckPyEG6y37kUIgNJG3unYZNxE/JutPsu5tOyPX9RXtkn6c50L+C8K
	 fuxHYfYJpZn7Zn7fNy4KKUuOHNjpCvqR2JOCzVfcpI/nsHDxlrfWVc380WI8obR21W
	 UlRlHKOY5638cXe7MSVUwQ+8pApbQvBP1LMObRHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F790F8032C;
	Thu,  5 Aug 2021 09:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC53F802E8; Thu,  5 Aug 2021 09:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CB6EF8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 09:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB6EF8010A
X-UUID: 831aadfcca6448ed92316f625e869ed5-20210805
X-UUID: 831aadfcca6448ed92316f625e869ed5-20210805
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 917629391; Thu, 05 Aug 2021 15:54:07 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Aug 2021 15:54:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 Aug 2021 15:54:05 +0800
From: <chihhao.chen@mediatek.com>
To: <geraldogabriel@gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
Date: Thu, 5 Aug 2021 15:54:01 +0800
Message-ID: <20210805075401.21170-1-chihhao.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com, tiwai@suse.de,
 damien@zamaudio.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 chihhao.chen@mediatek.com, linux-mediatek@lists.infradead.org,
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

From: chihhao chen <chihhao.chen@mediatek.com>

Hi Geraldo Nascimento,

For echo test, it means we use this earphone to receive and play sounds at the same time.
We found in this case serious noise problem happens.

Log as follows with your patch
<6>[  175.960387][T401365] __uac_clock_find_source: Clock Selector 0xc has pin 2 selected
<6>[  175.966980][T401365] __uac_clock_find_source: Clock Selector 0xb has pin 2 selected
<6>[  176.026251][T400354] __uac_clock_find_source: Clock Selector 0xc has pin 1 selected
<6>[  176.032406][T400354] __uac_clock_find_source: Clock Selector 0xb has pin 1 selected

There is no noise and I think this should be a firmware bug.

Thanks
Chihhao

