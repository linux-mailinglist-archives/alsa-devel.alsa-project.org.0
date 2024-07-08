Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADF092A552
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 17:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D3C209;
	Mon,  8 Jul 2024 17:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D3C209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720450851;
	bh=GkJPSDPVlqWkpaY7O36uwo7fVzHGxLGGcvZQxBA2Hb4=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oMDcke10BFyT+FISsglxDqxX1CAYvpJqgJ4auHYjttEkO914PqskcC6C+WGwEKOBB
	 LZjbaJU6Ii1ZqhYYpid8yQ5S1Z4SLwsxIZ8QlGE3FDTygj9vbnli1aKT9OQCuNtl+q
	 shDnmi5RXTNZQNhY8XdQT6AHtACfyQE7oZGEMv50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0305CF805AC; Mon,  8 Jul 2024 17:00:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B88BF805A8;
	Mon,  8 Jul 2024 17:00:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18363F801F5; Mon,  8 Jul 2024 17:00:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F402FF800FA
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 17:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F402FF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=L/eUG8A8
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4685b6Vr018003;
	Mon, 8 Jul 2024 10:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cvmmguTLgovTIrwesbPF/aWvLQBDAGZHlCL6dk/5Sa0=; b=
	L/eUG8A8gVOU81nEl+n2uyuBVMcM79jrgACyzVhP84xJuVlQPkZONrumw53p8zjP
	SNOg2iekxcAXD5QSLkVbdKKFibSXQYHjne4GNl4B0Z8SEJcgK26jNNLMVhjOHyZF
	yJY/LqN2ZcDskzYZoP40h8kPkohdMnlMkya4cEX/oV//Eg3P/Duj2jtKl9W+63/h
	3CLZB/Q4+evq+lvUg9o5WmO5+yVpbRFsMnEv0RnnREzxGsw62zrqKi25yV0lxp9H
	1EJIVmjHlrWW+b34Kc7d41WCnkvxA3EguhU5YUEDuh0TliWvUIfbuD28sGtHNylP
	ZSvOkf2A8Wutl0dtcUKkQQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4072bj9mfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 10:00:08 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 16:00:07 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 8 Jul 2024 16:00:07 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 37878820244;
	Mon,  8 Jul 2024 15:00:07 +0000 (UTC)
Message-ID: <de44f274-4e02-4c66-b784-41031e99c33e@opensource.cirrus.com>
Date: Mon, 8 Jul 2024 16:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: cs_dsp: Use strnlen() on name fields in V1 wmfw
 files
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240708144855.385332-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20240708144855.385332-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D4bEonTxS4WC1HX6qRWzBqepH8NnP1Oc
X-Proofpoint-GUID: D4bEonTxS4WC1HX6qRWzBqepH8NnP1Oc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NIG7Z2ZI725QNWRGZNXWXCCADWOT66CZ
X-Message-ID-Hash: NIG7Z2ZI725QNWRGZNXWXCCADWOT66CZ
X-MailFrom: prvs=4919130c1b=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIG7Z2ZI725QNWRGZNXWXCCADWOT66CZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/07/2024 15:48, Richard Fitzgerald wrote:
> Use strnlen() instead of strlen() on the algorithm and coefficient name
> string arrays in V1 wmfw files.
> 
> In V1 wmfw files the name is a NUL-terminated string in a fixed-size
> array. cs_dsp should protect against overrunning the array if the NUL
> terminator is missing.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")

Don't take this. It applies to 6.11 but not to 6.10.
I'll try to sort out one that applies to new and old code, or
send separate 6.11 and backport versions.

Sorry about that.
