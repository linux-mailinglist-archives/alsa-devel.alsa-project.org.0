Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDDA50AE37
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 04:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C9F84D;
	Fri, 22 Apr 2022 04:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C9F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650596074;
	bh=+7z0env39sXN+MyD8cfQApGDKrT8kjP42bhPqZ1EaCY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkKz5ymsm+X/AeImQUO8D+PnO7l/kOlIEHl80TnQq7qo9R8yXAfPBr8i0A1xYYFnq
	 XX8uBRyTzmO+o4lPusbcTgzOLrfveLU1WwXIoqGajuYIbGss7/bHuY7uDBBzhUgE8u
	 2DAgNM9XIMa5HL0VxIJYhTJ/Q4nRT8a50lAmeGfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBE7F80249;
	Fri, 22 Apr 2022 04:53:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DDDAF80245; Fri, 22 Apr 2022 04:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84E26F80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 04:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E26F80125
X-UUID: 272af0c95c334f2ab44e2ac5451820dc-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e9307f85-12c3-4783-86c5-0857a376cb9c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:53,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:53
X-CID-INFO: VERSION:1.1.4, REQID:e9307f85-12c3-4783-86c5-0857a376cb9c, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:53,FILE:0,RULE:Release_UHam,ACTI
 ON:release,TS:53
X-CID-META: VersionHash:faefae9, CLOUDID:363b8cf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:3120d0ac20a5,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 272af0c95c334f2ab44e2ac5451820dc-20220422
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1478556448; Fri, 22 Apr 2022 10:53:13 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Apr 2022 10:53:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 10:53:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <tiwai@suse.de>
Subject: Re: [PATCH -next V2] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Date: Fri, 22 Apr 2022 10:53:12 +0800
Message-ID: <20220422025312.7718-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <s5ha6cm4xy2.wl-tiwai@suse.de>
References: <s5ha6cm4xy2.wl-tiwai@suse.de>
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

Hi Taksshi,

>> We observed: 'dmasound_setup' defined but not used error with
>> COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.
>> 
>> Fix it by adding __maybe_unused to dmasound_setup.
>> 
>> Error(s):
>> sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]
>> 
>> Fixes: 9dd7c46346ca ("sound/oss/dmasound: fix build when drivers are mixed =y/=m")
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>> Cc: Takashi Iwai <tiwai@suse.com>
>
>Thanks, applied.

This patch is needed in 5.18-rc3 [1] too, should I submit another patch or
you can pick it to the mainstream?

[1] https://lore.kernel.org/lkml/alpine.DEB.2.22.394.2204190925230.302265@ramsan.of.borg/

thanks,
Miles
>
>
>Takashi

