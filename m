Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B887D904F03
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 11:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39EC83E;
	Wed, 12 Jun 2024 11:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39EC83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718183999;
	bh=F0A4d3hGnN6+nvgQFbeYftwbhwXUE8Wyx+tNtqKxuVU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BPhX/xu839yuShDrVUXrr/tCkYCogNQtqRpViiHoaHjKZXDi/3sPPNmiVsYQXq0AN
	 lMjmiqFaKyK2I1sni/+BH6misurg7DKBQVgTkeOqD4PFLddfGGpwFmBIxWzSaKfUGg
	 9IZOowmOry2EJLriV1B6wXodD7D+EY1VaKypL8TA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0CC2F805C1; Wed, 12 Jun 2024 11:19:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E70DF805B3;
	Wed, 12 Jun 2024 11:19:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33C4EF8057A; Wed, 12 Jun 2024 11:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B6CEF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 11:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6CEF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UoJHKpBi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45C30uMP015315;
	Wed, 12 Jun 2024 04:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vcNSGSbVY6Ikenk/caiUKmLsl6LeZS9uRP4qAW5SnA0=; b=
	UoJHKpBid2CjyABmHjWnr29CPJ2VooyQ+kXLs5cbbD5rKACwcuLGzoCLnMhJl86n
	+qotEEvy33oncuWIOruFyVZGWqXBKFv/4lRUCHxQUlsyx7EYNRJRwwd8cmc3/D58
	7GLtv2OvinXfA722/Tw6LOPgwSA2QxxSXMkTouNctsP6gTbAYcJ0TQsGYmop9il3
	Sny94klAYbkkUAiPmhGzKXNgBc69pZLnC8KKYascS702fqyugdI9Fc5IRpa0E78H
	E+nY1f5lWhP9wdhr6bTEYsuADFVO2wwHIWqeq0AMmQucPc6k7AgA5eOgvB/y0UsB
	A1eG2GAF3nX/wYAdsoKA/g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ymkqhutf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 04:19:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 10:19:06 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 12 Jun 2024 10:19:06 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A316F820248;
	Wed, 12 Jun 2024 09:19:06 +0000 (UTC)
Message-ID: <36219997-397b-4a26-96ee-7527fb6eb024@opensource.cirrus.com>
Date: Wed, 12 Jun 2024 10:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI
 is hooked up
To: Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20240611145746.1454663-1-rf@opensource.cirrus.com>
 <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vQsCTsFBVzalywJRQxJATsNxxml4b8AZ
X-Proofpoint-ORIG-GUID: vQsCTsFBVzalywJRQxJATsNxxml4b8AZ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5JVFLXNSDN66JJH4XIIA33PBXKJGBJGX
X-Message-ID-Hash: 5JVFLXNSDN66JJH4XIIA33PBXKJGBJGX
X-MailFrom: prvs=3893b14233=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JVFLXNSDN66JJH4XIIA33PBXKJGBJGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/06/2024 17:12, Mark Brown wrote:
> On Tue, Jun 11, 2024 at 03:57:46PM +0100, Richard Fitzgerald wrote:
>> If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
>> sources should be initialized to disconnected.
>>
>> The silicon default is for the mixer source registers to default to
>> a collection of monitoring sources. The problem with this is that it
>> causes the DAPM graph to initialize with the capture path connected
>> to a valid source widget, even though nothing setup a path. When the
>> ASP DAI is connected as a codec-to-codec link this will cause the other
>> codec to power-up even though nothing is using it.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: dfd2ffb37399 ("ASoC: cs35l56: Prevent overwriting firmware ASP config")
> 
> This doesn't seem particularly different to any other unhelpful chip
> default, I'm not sure why it'd be so urgent that we'd hard code a

I'm not sure I understand the objection here. Are you objecting to the
patch itself, or that I marked it as a Fixes?

> default?  There were some other devices with things like bypass routes
> set up.  The capture path getting spuriously triggered feels like
> something that should just be sorted in general (TBH I thought that
> worked OK but it's been quite some time since I looked properly).


