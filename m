Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8229761A09
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 15:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FEB4843;
	Tue, 25 Jul 2023 15:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FEB4843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690292045;
	bh=gLALJ7DCyDDaQ4tRL9rexxxeXGa8duCLz2XXdGj67F0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cq2vZZyh9XwVcdUAKy/0hmIoSBNx/WtwVfF/GWFY5N/0yud0kyKecixaNdLcJhzF/
	 FPbVlKjmpKP44MPQuhTCl25HJxVg6IbbEPjSTs582irxUnN6NNfq1G60ExzdKju+6A
	 MEfi1cK5IyyUovIdcmVTn7asvqjycPA/K9SlGN/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15E30F802E8; Tue, 25 Jul 2023 15:32:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F9DF80163;
	Tue, 25 Jul 2023 15:32:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E855F8019B; Tue, 25 Jul 2023 15:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23647F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 15:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23647F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=p9BOac5J
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36PCqECZ016074;
	Tue, 25 Jul 2023 08:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Rvzlab3T/LDmq3i
	1JUmRbgKAL1E8yhOvWBWw0r2ZLI4=; b=p9BOac5JKRru7ukoTWlfSIbWqB5FN8b
	wvCW34kmstv4FwrKrjrYgzS1MCSloEiWPOlkFKM231451N4yVDOUaIymA62UovZD
	AHd8YTSYEOoae6Uk7wSgcPLmHSgEsC7yuQJ/Ckd6jzsyBnRkSqC1hMhtpTmuPj0h
	sH5XezuXb6SGgnsM1akb3iPP9o98vxbpBcnF2ReEshgBkv7k73M6lX4FCz4oe/7+
	MoU5kem5abwXD8jIP4blcC0or61d/wzDYgegkEI7EvUkTn1GxGmyZYgmkXtIkpnb
	fD6wx87TymfG5NFCU37VOlQKTXDNPv2APDir09mNnt1hlWVNUSpatLg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s1nm99k12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 08:32:29 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 14:32:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 25 Jul 2023 14:32:28 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 184003560;
	Tue, 25 Jul 2023 13:32:28 +0000 (UTC)
Date: Tue, 25 Jul 2023 13:32:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Yang Yingliang <yangyingliang@huawei.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
        <rf@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: cs42l51: change cs42l51_of_match to static
Message-ID: <20230725133228.GM103419@ediswmail.ad.cirrus.com>
References: <20230725120917.513064-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230725120917.513064-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: f3y17RVjdfFMZeOpSIJY108tRnhI8qJJ
X-Proofpoint-GUID: f3y17RVjdfFMZeOpSIJY108tRnhI8qJJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OH5V3AJ4RXID4XERWMNMWW2ZLIV6OLNT
X-Message-ID-Hash: OH5V3AJ4RXID4XERWMNMWW2ZLIV6OLNT
X-MailFrom: prvs=2570f46236=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OH5V3AJ4RXID4XERWMNMWW2ZLIV6OLNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 25, 2023 at 08:09:17PM +0800, Yang Yingliang wrote:
> cs42l51_of_match is only used in cs42l51-i2c.c now,
> change it to static.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
