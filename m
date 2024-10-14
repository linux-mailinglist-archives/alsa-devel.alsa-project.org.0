Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BDD99C67A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48776DEE;
	Mon, 14 Oct 2024 11:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48776DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728899648;
	bh=wTznNRxq4Ol6evXe6YrBE+3/cUzghRmBUThX1urQc6c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pw2fYdHY7mV7OPG+bq94Gp6C7B6P4ACrKS0t3arYOu2JpWUuSOJaPFEdlQg9XfwtG
	 uuO5oft1NvAbV8yFobT4aTYQIELI5ki4Lsk0olKRZd3/l1isLnsROkURlKeWdKSX9y
	 QzSTGK8C342PEr1QtqQJQf5zQ5Z45DDokYgPvzoA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3845F805A9; Mon, 14 Oct 2024 11:53:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A50F805B0;
	Mon, 14 Oct 2024 11:53:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F0AF80448; Mon, 14 Oct 2024 11:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5A02F80104
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 11:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5A02F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qvrvoKJX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 49E5B8Wv014355;
	Mon, 14 Oct 2024 04:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=n5EOpM0QtmkhjQP2SV
	HPp5yw+kmLesybGOkVGs2/VvU=; b=qvrvoKJXGcQoDkzT2X5ov19HcxPBN99zwY
	pddlGKyiSmvXJcbRfU9bzmFMlVQau/11ye01tW1IRmPVrCJDZUMMWR9d/iaFLens
	2HYA44Tp23nlq3SgA2WI3h6eVdfC+Oo54tNikzC7uATYgVsYMtxmCjDBZhBg9SEw
	0wOsSvnq0PPbbJ1w9NgVIs/xa2T6JeCyB66nJMO6KY3TY5rz0GjEkx7kArmoAhVn
	0+GcEFP8mkhKeNPdUbABql/yShbI47iACA/k8jXhRgzN41Mnm4yw0eXAtRtmHYzN
	GE4DUfHcRk1BL4oEevXVCD+9MsfsQ6+J8vucz0OpWcAx7n2Zdl5Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 427pgxhyqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 04:53:23 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Oct
 2024 10:53:21 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 14 Oct 2024 10:53:21 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 6491B820248;
	Mon, 14 Oct 2024 09:53:21 +0000 (UTC)
Date: Mon, 14 Oct 2024 10:53:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf v3 1/2] sof-soundwire: Change map control
 names to make them unique and user friendly
Message-ID: <ZwzqEO3lokmsoBbC@opensource.cirrus.com>
References: <20241011105710.1998823-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011105710.1998823-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-GUID: 9jcXcqNCpJWxYw5KeKA3GUZ5GoL-KryX
X-Proofpoint-ORIG-GUID: 9jcXcqNCpJWxYw5KeKA3GUZ5GoL-KryX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BENVJ4W2E4HJP6OIYDZPH4JJ37ZPLGOJ
X-Message-ID-Hash: BENVJ4W2E4HJP6OIYDZPH4JJ37ZPLGOJ
X-MailFrom: prvs=701735cebf=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BENVJ4W2E4HJP6OIYDZPH4JJ37ZPLGOJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 11, 2024 at 11:57:09AM +0100, Maciej Strozek wrote:
> Both 'Speaker Digital' and 'cs42l43 PDM2' names were found in other alsa
> controls, confusing the MixerElems paths. Make them unique to avoid errors for
> hardware mutes. Also add 'Capture' string into microphone controls to make
> them work properly.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Both patches look good to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
