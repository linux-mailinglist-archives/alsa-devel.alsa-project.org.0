Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ABD700C20
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 17:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC80A4E;
	Fri, 12 May 2023 17:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC80A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683906195;
	bh=3gEKuSVEGrHaq3hazRUa+sdFsmghn01+0kYISTMm5h0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xu6IMwgccWAqdIsiynIZSd9sogVFGVC9F7QDl1wjzGHb/CSTp5rd6k1/FntKW4VQ5
	 wFlnaloOT7AJNJgYgcjvVxbrENZuP2qfY2ThJGY86i0QOpC9K60AbFG/fOn2qKIQvh
	 4O5zSaggp3LkRjejCLEbx2bhkLYY4d/shq/h7w7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69B5FF8014C; Fri, 12 May 2023 17:42:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 992A8F8032D;
	Fri, 12 May 2023 17:42:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09E0BF8052E; Fri, 12 May 2023 17:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DDA5F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 17:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDA5F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KVcz6XNP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CF3372001679;
	Fri, 12 May 2023 10:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=B37wweTi8+RlFLIzQLpjB1FktiSxeiJrAjQf//Y2odQ=;
 b=KVcz6XNPSCRthYUSHmT9pCqQ/9v8qMphPkZgTyE+EZpgPhFAXkh44hX6uN/U5yD2Idx2
 qaQ27W69Ta/X3HyjdqoAPw1zzB0hIdirel6wrB6iQgIqRecq3FCiAM6i9DRsz8iaVs/A
 7/25+FGyInLFZrS6Jir0sG/usD5fvdfv9lfSY0XXOOjB6A0mZUpaSfziMPG3/4RiLYuP
 8CZ5Z0SWQfPnbYmuESuNe/NKookFvLi3txnBcHX9mik1wszm1FDo+uNLIvKUX+Z1O8gX
 sS1wNDArZojp1pBhG5xfuMLjMWBbe5tIPFqu7QCEs87hNuMTbeUUNvjJrwrhiY8lo2Qu qw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7nb5n9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 10:42:12 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 10:42:10 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 10:42:10 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 62A4A15A4;
	Fri, 12 May 2023 15:42:10 +0000 (UTC)
Date: Fri, 12 May 2023 15:42:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/10] ASoC: ak4118: Update to use new component control
 notify helper
Message-ID: <20230512154210.GI68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-4-ckeepax@opensource.cirrus.com>
 <138e5c73-c33b-806a-b64e-5c93aaefb140@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <138e5c73-c33b-806a-b64e-5c93aaefb140@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: xhtMFVwhjVBZv_0DgtBEWA0ofRcdVbya
X-Proofpoint-GUID: xhtMFVwhjVBZv_0DgtBEWA0ofRcdVbya
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: H3HI245BADDLBTKGNURCHHQYSC2RJOQ2
X-Message-ID-Hash: H3HI245BADDLBTKGNURCHHQYSC2RJOQ2
X-MailFrom: prvs=0496644b8b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3HI245BADDLBTKGNURCHHQYSC2RJOQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 08:48:40AM -0500, Pierre-Louis Bossart wrote:
> On 5/12/23 07:28, Charles Keepax wrote:
> > Update the driver to use the new ASoC core control notify helper.
> > This also fixes a bug where the control would not be found if the
> > CODEC was given a name prefix.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  sound/soc/codecs/ak4118.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
> 
> should patches 2, 3, 4 be part of a separate series, they really have
> nothing to do with the Cirrus CS32L43?

Patch 2 has a build dependency on the CODEC patch, 3/4 are
debatable. I could do the series without these patches and do a
seperate chain with those three patches and an extra patch to
convert the cs42l43, if that is preferred to shrink the chain.

Thanks,
Charles
