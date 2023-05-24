Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAB770F1C8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 11:07:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AB41204;
	Wed, 24 May 2023 11:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AB41204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684919244;
	bh=xTKph1EZnb+HTsh9Iwnb/jj597hKlSSml/2mGDR8RbU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=caYKxhCIKfjN8xJyVWXA2Td791IuAsB2foubjXI3evrx5EPsg24s/Wdn3qZKNOvEC
	 H46j5Yobak4OUP/f8W+x/y5Ah8Nc4MIq43+fgXPfyvAibUUEOyDt9IufZwXEMU0Atb
	 xn6h2Na4Ugil8blN80pczMxlK0IMjtd9FkmwAgbU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3FF9F80549; Wed, 24 May 2023 11:06:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7CFF8024E;
	Wed, 24 May 2023 11:06:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2053BF8026A; Wed, 24 May 2023 11:06:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E96FF80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 11:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E96FF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FEdV7ahy
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34O5bg1h014263;
	Wed, 24 May 2023 04:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=uzfT3zTEiD3ss3IpphzPV77dyiwKRiVQ7W/KRC08H4E=;
 b=FEdV7ahystegIXvoI23lI6UpN6uixv3n/nS3d05eUUQZM8shAbHl//yx7Axg8/cq4kGK
 eQhk91wqJKze/F+rVOBOFADVd/QjwZTBh9txIbvOOlhAGQZmdEI9w9KHdJm7H/QDLI+q
 ekM+KrweYLa3HDegJ/AsT680Ab9GyJCuzstXzOPEkQvv3ez/IUDHncrGAPx0durBBzX7
 cCT3aa3XIP46BuFMLQ1F0A+Q233pHjgJOaG8r06CloZY4abtaFVFauu7hFqN2Av9UnyX
 J4aXcNRVbWbfAcjHn3+eQVSc9AqrCuIBXsy766vraXJee8z1yb1KXhwC719gd6qVaZdD uw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm504u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 04:05:58 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 24 May
 2023 04:05:57 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 May 2023 04:05:57 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E5FE411D4;
	Wed, 24 May 2023 09:05:56 +0000 (UTC)
Date: Wed, 24 May 2023 09:05:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <u.kleine-koenig@pengutronix.de>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
Message-ID: <20230524090556.GC68926@ediswmail.ad.cirrus.com>
References: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: RwA5E8b8e1mHtmfuFZNOWKlk5INpBUBt
X-Proofpoint-GUID: RwA5E8b8e1mHtmfuFZNOWKlk5INpBUBt
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YMPYT4LD44KVE72G6IB6GRWLMR7DK32K
X-Message-ID-Hash: YMPYT4LD44KVE72G6IB6GRWLMR7DK32K
X-MailFrom: prvs=05086b7afd=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMPYT4LD44KVE72G6IB6GRWLMR7DK32K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 10, 2023 at 10:25:34AM +0100, Charles Keepax wrote:
> Cirrus never intended to upstream dual licensed code, convert to
> GPL only.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Apologies for this but this was never our intention and I believe that
> it can be a little legally involved maintaining dual licensed kernel code.
> Fortunately not that many people outside of Cirrus have contributed to
> the files in question. I have CCed everyone who has contributed both
> internally and externally.

Pierre, Uwe,

Apologies for chasing but it would be really helpful to get an
ack for this one, we need the approval of everyone who
contributed to fix the licensing issue.

Thanks,
Charles
