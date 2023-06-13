Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482C72E980
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 19:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42052EA6;
	Tue, 13 Jun 2023 19:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42052EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686677191;
	bh=PUjA/4FiT9aApSVwkrXW0qG9spmJfS3N1XUzI/2eMuY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sePAmGv5/LUlxG394YJwknOBRceAaH/Q9YLwCAtM0b8jCthNB6Er4Lh8S8Md1scg5
	 YMeFj3hkEv0npPzXHJ1qhZpVoeUP34zeaScIjuf33DlYFcu8Njz7zCHbFdSx8sUrbO
	 iGl/PgOCyll8UfD0xHQxHKI5d9/XHGtqPHvxXHME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CE44F80155; Tue, 13 Jun 2023 19:25:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1442F80093;
	Tue, 13 Jun 2023 19:25:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75756F80149; Tue, 13 Jun 2023 19:25:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E83F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 19:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E83F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MnkJhsKc
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D5CURx013598;
	Tue, 13 Jun 2023 12:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=8jM/pTQ9RkIrizSqmNoAleLtqQ3RuHlN0Ay5WKR4zSs=;
 b=MnkJhsKctG/LXYYTYPvYW8Y1YD8F/G7/5YG3wS4S6B0O/EJZ3lZbBgWOR7gpR5nydmwM
 jhQVDAQf2zMOtdXSU3Wdu/Dd2X0h19XYtIdQn54JGXj/uUV26EwL+wINeL+Y1rZ62RDC
 wr3CNpNgW/aIwe2HNSt5mMant94ZoIV3agxhSu3RQUawKGCXQ3EpIlSN7u7D/qLsExWn
 Iv8Sqn3ve+U0p+xbwHg2oFkXZ0l4YkJmTc7YqVPYsOUbmgjumvC7GzNndvtvduGGfqFU
 GdLGF+dstPSBEJ8RwvctZ5vCtMuMXAPmSTnK1NuNghRLpQhB30QIQTkVeuH7HFJGXQbu 2w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r4nkmbdcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 12:25:08 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 13 Jun
 2023 18:25:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 18:25:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 12B4511C6;
	Tue, 13 Jun 2023 17:25:07 +0000 (UTC)
Date: Tue, 13 Jun 2023 17:25:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?=
	<povik+lin@cutebit.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <asahi@lists.linux.dev>
Subject: Re: [PATCH 04/10] ASoC: cs35l35: Use maple tree register cache
Message-ID: <20230613172507.GQ68926@ediswmail.ad.cirrus.com>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
 <20230609-asoc-cirrus-maple-v1-4-b806c4cbd1d4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230609-asoc-cirrus-maple-v1-4-b806c4cbd1d4@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: QIVkGV0BTOgKap_5ekNX9kg9n69j3Xgn
X-Proofpoint-ORIG-GUID: QIVkGV0BTOgKap_5ekNX9kg9n69j3Xgn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ND6SSF7DXNSMPHQ325DGLML37LHO2AZG
X-Message-ID-Hash: ND6SSF7DXNSMPHQ325DGLML37LHO2AZG
X-MailFrom: prvs=1528be82c5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ND6SSF7DXNSMPHQ325DGLML37LHO2AZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jun 10, 2023 at 02:56:24PM +0100, Mark Brown wrote:
> The cs35l35 can only support single register read and write operations
> so does not benefit from block writes. This means it gets no benefit from
> using the rbtree register cache over the maple tree register cache so
> convert it to use maple trees instead, it is more modern.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

A little late to the party, but for what it is worth on this
cs35l35 one:

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
