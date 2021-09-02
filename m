Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D245F3FF7F9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 01:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FAC117D6;
	Fri,  3 Sep 2021 01:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FAC117D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630626122;
	bh=/MvppA2XMjVnRDSUYCyPKTXU1CJ2AElzphXryeOjsJc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qsasJE5NXDCbumONPVdYEuHeO7zYxlMXYmnX+MIC+zU1XnVIXCM4y/8Cbl2g9qoLJ
	 bk/eA0eLS6xAHZ6rqtXMJyJM5XI5UQIUIBt35mIToK5TSIK0ipX8iMO1kucdpoIfrG
	 u9O7Jw16Pg+RoPjfQZC7QJ4+m6lqvwvP8EKTCLMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 780F6F8028D;
	Fri,  3 Sep 2021 01:40:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA80DF80269; Fri,  3 Sep 2021 01:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E99A3F800AF
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 01:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E99A3F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jXWpP7I7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 182McvMY021787; 
 Thu, 2 Sep 2021 18:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=2UP2Gs1kkLluI8rBPXuGcTotq9NZEpMoXKvgKbYVmkA=;
 b=jXWpP7I78kdSN08NDks7sj/Bzu6EZc9PJkAzRyvp9dXNP8KS4q/O9HMu4Au7fjNbSX6K
 XDP4tsA2vSjTuV3vMR2AQZfujDmUCCWOp4DGJiXR7VRtS/anshhhbQiAPKsHYFeyYUdI
 0HRLww2GQ+f1wE+2eGQZyn6ngMSIYzFc0uTJ4xsVdMdB7is03+kwSSqZP3IA0luiVkm9
 sAJHf0Wt9DrlHqnSyxyNDmlAhR5utaQvEUfaxoiGztPNQLkQLpQvYwSAQAqnhfXER32W
 GdKXwAk/fM/iXMiMmFXE1XdQ2r/icd9S7O8VyrIS3iG1onJMfO9oW+CVIT36lfLjAUXp Ng== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3au1e08gxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Sep 2021 18:40:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 3 Sep
 2021 00:40:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 3 Sep 2021 00:40:34 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com [141.131.65.54])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4AFA3B13;
 Thu,  2 Sep 2021 23:40:33 +0000 (UTC)
Subject: Re: [PATCH v5 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <robh@kernel.org>,
 <ckeepax@opensource.cirrus.com>, <brian.austin@cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <david.rhodes@cirrus.com>
References: <20210816224310.344931-1-drhodes@opensource.cirrus.com>
 <20210816224310.344931-2-drhodes@opensource.cirrus.com>
 <a0be6858-0d98-7f26-9ba5-f290c9809b5c@linux.intel.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <cdabe1e9-5411-d2b6-d629-8ec87aa4c764@opensource.cirrus.com>
Date: Thu, 2 Sep 2021 18:40:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a0be6858-0d98-7f26-9ba5-f290c9809b5c@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QGwP7S9bTfDGyjSm8QwgbfWqCB75IWo_
X-Proofpoint-ORIG-GUID: QGwP7S9bTfDGyjSm8QwgbfWqCB75IWo_
X-Proofpoint-Spam-Reason: safe
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

On 8/16/21 6:41 PM, Pierre-Louis Bossart wrote:
> 
> Is the ACPI probe smart enough to deal with two different drivers
> registering for the *same* HID?
> 
> I haven't seen any precedent, e.g. the RT6777 uses a different ACPI HID
> for its I2C and SPI modes.
> 
> 

I2C and SPI buses, when they are looking for a driver with an ID that 
matches a device declared in ACPI, will iterate over drivers that belong 
to the bus only (bus_for_each_drv()). It is not possible for an I2C 
driver to be matched during SPI device enumeration or vice versa.

Thanks,
David
