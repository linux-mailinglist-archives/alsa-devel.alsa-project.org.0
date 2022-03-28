Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC134E9267
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 12:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 392B41779;
	Mon, 28 Mar 2022 12:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 392B41779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648462730;
	bh=rifKiqm9/8zbl4+YMXtsipRY02DE4nGS9Q62MKW6kDE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uneBkOC+OSpFcBJvPEcRLGV8QiR3LXGX8CcEnCfCLcG0wVzbHmV5HgzE/Xljhuy/9
	 C8ZHfk9SgFCnNDGjpXfI88Lq5WUkv9ylPqJObO2wNyze6e5U4GtqpFo2AXAErRmF1/
	 8N3ETWetdbDZUwP9D2sBbgLyvWh+GIwfK77sTtpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69C2DF80121;
	Mon, 28 Mar 2022 12:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD2B3F80121; Mon, 28 Mar 2022 12:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 864A7F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 12:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 864A7F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="becHUMbt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8AwiO030875;
 Mon, 28 Mar 2022 05:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9GQ/xq5UTnlV+3fQiQ9JRlYf4mnIDLMf0DRBN/HnJ38=;
 b=becHUMbtfomLJyi8ywLIu8VJQuKYWm3EAaAkEar5LqarBr6o3bNbGdX+aya9RSvo6u2u
 JshiVzLTQyeUW6gbK1a0DpszIxAJZCou1HaqSY2MNBz3X7tVZad5E8RJdHWzC7t+eH2m
 buc/8syL3fgep9X4TE/bh0FcNE7tGOei3e+OObb5Pjhevh9cE5Uy4eHz9V5luprnbq9o
 ZLWQLIDtQ1TV3zixYvD48wWGGolM5h2TfRH/zolbazxANv36kLuHNHXGrOcDApEFLA3b
 2AX6+h0Vpn1LeRwpRTd5217uadiSmo3FpXRJQXRXtXBmCEDh6RyLmjO74h0e0kJq7W3d ew== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081ah6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 05:17:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 11:17:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 11:17:28 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 68AA2B16;
 Mon, 28 Mar 2022 10:17:27 +0000 (UTC)
Date: Mon, 28 Mar 2022 10:17:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH v2 2/2] ASoC: cs35l41: Don't hard-code the number of
 otp_elem in the array
Message-ID: <20220328101727.GE38351@ediswmail.ad.cirrus.com>
References: <20220328042210.37660-1-hui.wang@canonical.com>
 <20220328042210.37660-2-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220328042210.37660-2-hui.wang@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 8Baqvbb0tc_8gFcbr5UmAsjQJ8DChar0
X-Proofpoint-GUID: 8Baqvbb0tc_8gFcbr5UmAsjQJ8DChar0
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, tanureal@opensource.cirrus.com
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

On Mon, Mar 28, 2022 at 12:22:10PM +0800, Hui Wang wrote:
> The CS35L41_NUM_OTP_ELEM is 100, but only 99 entries are defined in
> the array otp_map_1/2[CS35L41_NUM_OTP_ELEM], this will trigger UBSAN
> to report a shift-out-of-bounds warning in the cs35l41_otp_unpack()
> since the last entry in the array will resuilt in GENMASK(-1, 0).
> 
> To fix it, removing the definition CS35L41_NUM_OTP_ELEM and use
> ARRAY_SIZE to calculate the number of elements dynamically.
> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
