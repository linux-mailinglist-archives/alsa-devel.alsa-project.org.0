Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F341E8056D3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 15:09:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF3CA4C;
	Tue,  5 Dec 2023 15:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF3CA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701785368;
	bh=rQb+N39uPAAK6//1qgIY2sk376O56LStgFBioVbKq04=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gNp9yApo0TgNzzSamlifUbRr7Q3M8GXIv+gU/a8AGn8Mn5CElziDGyrno4iok29Vc
	 WFYqxZ0WRzHWGJYGgOL+/BPAXsjEgENekH/naJ6Yyi4l0Xtoh5+fOKm48sBuK/WGlD
	 3ET8ANOSFryqUyN5SLZQp1jowY+2/RSWjBSJYAgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8177AF802BE; Tue,  5 Dec 2023 15:08:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D440EF8057A;
	Tue,  5 Dec 2023 15:08:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80BF0F8024E; Tue,  5 Dec 2023 15:08:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B866EF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 15:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B866EF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YxWsdDBh
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B56gxTg026627;
	Tue, 5 Dec 2023 08:08:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Y84RVH3VhN8tDOj
	vYdyt02UT9ZJhyn7aTdxCf/Az8cs=; b=YxWsdDBhl7aBk9adBDLA8QMKQ0q1QDO
	Qk0If8WrYTB6+wF84QLExCUrmzWOJPnv0qVMZs2KdbjiPJgPL/dzsOy27Jz0aW5o
	u2s7IYOCLxoAgsqDmQlkN1X+4rNr4mvLe7OiOd4KVtwcDsXiL2gbuXLDufiTxpkP
	uLgIoTG9hb3cJ9aEzQkX+abBe03wZ1j0DpcEdJjHlBz91Y7ASiN1BZQ7uHq3AF4g
	VAJNhkItD8sdLYRzeEJb6gBVhoJ+MW1jEPG16gn+80ESXIsGYjOZfuFKsErRgD/u
	GitxT5Urn/OZz5FTFB684Lw/l69Yo9i1rZDtE/rAHkiZv6Lp9gXJ5Vg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnkat2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 08:08:43 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 14:08:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 5 Dec 2023 14:08:41 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C97E2474;
	Tue,  5 Dec 2023 14:08:41 +0000 (UTC)
Date: Tue, 5 Dec 2023 14:08:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <cezary.rojewski@intel.com>,
        <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw_cs_amp: Connect outputs to a
 speaker widget
Message-ID: <20231205140841.GG14858@ediswmail.ad.cirrus.com>
References: <20231205135001.2506070-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205135001.2506070-1-rf@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: AsMvK67Ferp6_peSXzZpkcOf209E6xTk
X-Proofpoint-ORIG-GUID: AsMvK67Ferp6_peSXzZpkcOf209E6xTk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DW6NPWZI5346ID6G2KJA3FUKNZXS3RJD
X-Message-ID-Hash: DW6NPWZI5346ID6G2KJA3FUKNZXS3RJD
X-MailFrom: prvs=7703bda8c8=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DW6NPWZI5346ID6G2KJA3FUKNZXS3RJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 05, 2023 at 01:50:01PM +0000, Richard Fitzgerald wrote:
> Hookup the CS35L56 DAPM_OUTPUT widgets to a DAPM_SPK widget so
> that there is a complete logical path to a speaker.
> 
> There is no particular reason to use multiple speaker widgets.
> The CS35L56 are designed to work together as a set so they have
> all been connected to a single speaker widget.
> 
> Instead of a hardcoded list of codec widget names, the code walks
> through all the codecs on the dailink and for every cs35l56 it uses
> its name prefix to construct the source end of the route. This adds
> a small amount of overhead during probe but has the benefit that it
> isn't dependent on every system using the same prefixes.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
