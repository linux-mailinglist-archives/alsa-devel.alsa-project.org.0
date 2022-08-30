Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 892495A5ED1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 11:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23B51676;
	Tue, 30 Aug 2022 11:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23B51676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661850083;
	bh=Kuuh9wXUPHy3ZZ+lPFe6JH/8oDguzS1P2yugkIRlrU8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HG61+RobISpGNGm2Uw8XPjIt/fFTfTOSF3Dvvt6D8kSAi5IW9CXgUk4bkhr01N9L/
	 v9yp70GF0J2/P1rgmdBX0sFDil70MBLbj0YkI1oi54pMNs17XqxrbIngDQzK4ljnmZ
	 faenmxpwP1rgjxsDt3NL1antu1+eEfxZiSdv+A+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48360F800AA;
	Tue, 30 Aug 2022 11:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3368F8023A; Tue, 30 Aug 2022 11:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60EB6F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 11:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EB6F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cpI3qv8n"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U6Tnpn015916;
 Tue, 30 Aug 2022 04:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=uRhx0qsItgHE0IAxKDqM89f+96sF81OK+0o/iFCcvgc=;
 b=cpI3qv8nZ3bz6aZFMMwF48lZRIKJ1bkMiyJRW/QvlydqTx+d8/Bgx7bZYaBmcR0pV6nB
 ZugUGNv/T97JqpSriapR7s80CF1aKOCpNrqegUxZ3L5AIq2iVcuRrDg3hI9pzBJEOHp2
 JCssrq1RcyWiaAa5szcooOLNFdOHUVNHyeD7tAIEzxkagiBk22lpxC6L6lXX+ppTzQcl
 wWn91ISG+vIyf0siIGiQgPC7yJnmOy1MNoIAkHlCSuwpxRBq5fr5d2hTkquN2IEXg6uJ
 d2Q9EjnEiUF/OKFKMoPMY4e5KuJ6p7BRaYdZwu6CeDteq80uzmEqYLO1hb436WpLyC6T hQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3j7fppb5b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 04:00:16 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 30 Aug
 2022 04:00:15 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Tue, 30 Aug 2022 04:00:15 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CFC7F459;
 Tue, 30 Aug 2022 09:00:14 +0000 (UTC)
Message-ID: <b3162f04-5cfe-75c2-6117-d7949ccd0a5a@opensource.cirrus.com>
Date: Tue, 30 Aug 2022 10:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] soundwire: bus: Fix lost UNATTACH when re-enumerating
Content-Language: en-US
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
References: <20220825122241.273090-1-rf@opensource.cirrus.com>
 <20220825122241.273090-4-rf@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220825122241.273090-4-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kK2WzBMWuKoTtPqrw0Bpl2oY0_QG6cYL
X-Proofpoint-ORIG-GUID: kK2WzBMWuKoTtPqrw0Bpl2oY0_QG6cYL
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 25/08/2022 13:22, Richard Fitzgerald wrote:
> Rearrange sdw_handle_slave_status() so that any peripherals
> on device #0 that are given a device ID are reported as
> unattached. The ensures that UNATTACH status is not lost.
> 
> Handle unenumerated devices first and update the
> sdw_slave_status array to indicate IDs that must have become
> UNATTACHED.
> 

Don't use this patch!
I found there's a race condition with the Cadence interrupts.
Use my alternative fix.
