Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E03D733E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 12:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A90E1AE7;
	Tue, 27 Jul 2021 12:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A90E1AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627381817;
	bh=7RckXsE0Qqi5v4IwL38fHbGViAv8D+hRFFFmq30aIFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDJuOf2xgusVk3MSHmUJ8ewHtDwsgXwVbA7YW13SyQtKT9Mxtc5Jh/Tu4qVmlWz/7
	 6z8pxbId2IFDHUqxevn8i/D5nEeJzfUKcd3qc6jjPkU03iCKXpZq/+A6/ghd/EUnWh
	 2xx3iVDM/MyR07QPAOGS7Cn+5bk2e2/Zk65AD1YI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ED6EF80276;
	Tue, 27 Jul 2021 12:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE58BF8026C; Tue, 27 Jul 2021 12:28:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7402F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 12:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7402F8020D
X-UUID: efd200f13da7478b88155cd429614a1f-20210727
X-UUID: efd200f13da7478b88155cd429614a1f-20210727
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <chihhao.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 521133217; Tue, 27 Jul 2021 18:28:14 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 18:28:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 27 Jul 2021 18:28:13 +0800
From: <chihhao.chen@mediatek.com>
To: <geraldogabriel@gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
Date: Tue, 27 Jul 2021 18:27:44 +0800
Message-ID: <20210727102744.30364-1-chihhao.chen@mediatek.com>
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

Hello

<6>[  150.347456][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.347517][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.384289][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.390920][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.438156][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.438226][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.473547][ T2768] __uac_clock_find_source: FOR EP 81: Clock Selector c has pin 2 for Clock Source ID a selected
<6>[  150.480165][ T2768] __uac_clock_find_source: FOR EP 81: Found Source! Clock Selector c has pin 2 for Clock Source ID a about to be reselected
<6>[  150.513375][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.513439][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.546161][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.552678][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.584347][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.584418][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.617760][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.624253][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.657906][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.657982][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected
<6>[  150.689571][ T2768] __uac_clock_find_source: FOR EP 1: Clock Selector b has pin 2 for Clock Source ID a selected
<6>[  150.696109][ T2768] __uac_clock_find_source: FOR EP 1: Found Source! Clock Selector b has pin 2 for Clock Source ID a about to be reselected

Chihhao

