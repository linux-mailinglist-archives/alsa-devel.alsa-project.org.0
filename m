Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECF8A1947
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 18:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DBDC2BDB;
	Thu, 11 Apr 2024 18:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DBDC2BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712851431;
	bh=BduVLd6senfYQDjjc2EDd4dHZbvRxRDiGRqpAmy1XG4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CkmBBIMWUSUXoQMfTXoVn8zY/op1uMdC9m99C2MjXD/Oq7tVJBqvpufXInvgEdFSw
	 1CSV45rkfmT2otvbDZXwO6XRyLJN8yFFlvX6GFQgxgPLgZU+tlzJhGFDk4jrEbYRBY
	 pkBWN8S6AK+BFfzYAR3MKoHcDhjWAQsrT0mo8cmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E77F80587; Thu, 11 Apr 2024 18:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DB87F8058C;
	Thu, 11 Apr 2024 18:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C685F8026D; Thu, 11 Apr 2024 18:03:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61368F80130
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 18:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61368F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hP1+J8LP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43B4cAmU024765;
	Thu, 11 Apr 2024 11:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=/twGumiTIF1zrVK9lUsJUzl36p7oTXhdLfL49IKSSZ8=; b=
	hP1+J8LPZgg3mX5BGq5T5F3+biTC4zzO8c3RN3jBiLdVVbcUMrgms2rIeCRxGuLQ
	S1tM4IFVCk0KO3XchWAYzNYIP6TaykTa7N4LQ5oTNDAOoJXFVXqKnAOA9TXewiiH
	pUUc1IPBLbIF/n5PYkx0UYbLyia738KDo8aBZm/n9BB1CV7L5z1rygnFt1PFcNQk
	o72mC5dzRP6ZVbu1qkvc4nzjd0kMZeVeSmV3GZcIPj7YWF+UVkZF6jcAYuHgSJhG
	rY4xqnKfZ074SggSgZx4aWt2aK87jdN1N8jRMsbaPjqaBEWKi0bLNIFdiLgDVAfV
	cyfZtB6R/qhPIaeu1jm8SQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxq94m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 11:02:44 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Apr
 2024 17:02:42 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 11 Apr 2024 17:02:42 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 50939820242;
	Thu, 11 Apr 2024 16:02:42 +0000 (UTC)
Message-ID: <a49dc5e4-9e04-4f18-85bf-e3edf0baa3e4@opensource.cirrus.com>
Date: Thu, 11 Apr 2024 17:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown
	<broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240411142648.650921-1-sbinding@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240411142648.650921-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WxM7XQ2Y3OO6eWFsJB2nx3a-2_V6AIvt
X-Proofpoint-GUID: WxM7XQ2Y3OO6eWFsJB2nx3a-2_V6AIvt
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XD62PAFTGO2HREVVYTU5BFWRJQW7TEBG
X-Message-ID-Hash: XD62PAFTGO2HREVVYTU5BFWRJQW7TEBG
X-MailFrom: prvs=18318a13e0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XD62PAFTGO2HREVVYTU5BFWRJQW7TEBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/04/2024 15:26, Stefan Binding wrote:
> Currently, all ASoC systems are set to use VPMON for DSP1RX5_SRC,
> however, this is required only for internal boost systems.
> External boost systems require VBSTMON instead of VPMON to be the
> input to DSP1RX5_SRC.
> Shared Boost Active acts like Internal boost (requires VPMON).
> Shared Boost Passive acts like External boost (requires VBSTMON)
> All systems require DSP1RX6_SRC to be set to VBSTMON.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
