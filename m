Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A585FB74
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 15:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE75F93A;
	Thu, 22 Feb 2024 15:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE75F93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708612907;
	bh=5G6p4CsZj5y8xjTo5u6g1DmV7f13kIan+NI5DrjzCKU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EI5DKSV3BtQdBsrHjqCPih83vjzLJCNQgZMUCf7QjA7U8ubIis/y1DiMpE6iZJru1
	 okBGHgpxuPCVZGopNmnvqM5UhX39ekVWv8Dt6KoXt/LAonTK/Qhr77Ke4KWtoIDVrf
	 eNLsq/MnEONFHlToDJ637BT36qVNtMXH0aD+2YPE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FEC2F805A9; Thu, 22 Feb 2024 15:41:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3C1F8057B;
	Thu, 22 Feb 2024 15:41:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB433F80496; Thu, 22 Feb 2024 15:41:01 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4209AF800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 15:40:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4209AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qguk+Ih8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M6aL7N011439;
	Thu, 22 Feb 2024 08:40:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=GZdoxlRn/2MPxlEY4hTnWJTeSg5WxNCGjx0Who2o+Qc=; b=
	qguk+Ih8VW8nQ4KMHCGyKrmBgPn8H6/cv2mPEGqsxDlvpckIVYF5ArN4Etr5w/RT
	+Zbysbe7rD5zzrz17o+uDuUnyQQattKY1INkLTXi8uY2jJQYC9yPvs6CIC32FWIO
	GeKrIFGsMyXGv3s/VdKXhE3Q7L8vtUc7uHgpqBUr321ENU8wxS8ZFYktkDzk1Ex1
	b2z1bQy/jVihlun1vofgZifwMpTnkJ+orOkevtLE/QJnOhTLZq1FVigMukx+r9AQ
	EldlMp1UbWQfJoc/P5r7fSE/g7c1HqifzZZtgoDPYQFywJsPuuXbNKwbGx9MUy03
	W4JDpr/Qd91ArXhcgivTfA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205jmyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 08:40:52 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 22 Feb
 2024 14:40:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 22 Feb 2024 14:40:50 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AD855820243;
	Thu, 22 Feb 2024 14:40:50 +0000 (UTC)
Message-ID: <8edbbb9b-f07a-4cd5-a6ce-c46ee3acffe6@opensource.cirrus.com>
Date: Thu, 22 Feb 2024 14:40:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ALSA: cs35l56: Apply calibration from EFI
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zf4bQVLxDraNpc8et0FaVvviX6rn0oeh
X-Proofpoint-GUID: zf4bQVLxDraNpc8et0FaVvviX6rn0oeh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IRME7EGSFXVZ62R36QIYDFI3MBU5EL7J
X-Message-ID-Hash: IRME7EGSFXVZ62R36QIYDFI3MBU5EL7J
X-MailFrom: prvs=9782e93643=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRME7EGSFXVZ62R36QIYDFI3MBU5EL7J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/02/2024 15:04, Richard Fitzgerald wrote:
> Factory calibration of the speakers stores the calibration information
> into an EFI variable.
> 
> This set of patches adds support for applying speaker calibration
> data from that EFI variable.
> 

STOP! Don't merge.

I found a potential lockdep error in this code.
Will send a V2.

