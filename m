Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95D6AB9D2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 10:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC73310C9;
	Mon,  6 Mar 2023 10:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC73310C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678094875;
	bh=DeVNr19sYlCdDyNC5hKkr9w2At3dbZ18tapsHwNA16o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RjxJjSOMBEsg+koJyxkmVenl9Jk7b7CTtqkMTM0q93YpWHZOTUDyVn96C27xwm744
	 9NlhpEkA5YOnKD4YmzxwwA7nV4Rh0XA1P9JCJYMmUA/1T2Yx8wjq0mz4MXN08PkS2q
	 bhwXVaQZQhRdMB7Ra1nUxEVvct+w3w5XvKXCsCxc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 832CFF80236;
	Mon,  6 Mar 2023 10:27:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D279F8042F; Mon,  6 Mar 2023 10:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3FFAF800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 10:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3FFAF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DpUW7tkB
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3266sjZ2003171;
	Mon, 6 Mar 2023 03:26:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ijoY0cAbKV1Yi6yBy5gj8C+z3x9rq5z5KsnmtjtmXUE=;
 b=DpUW7tkBAyuVbuCN6NZciQlN/dUM10aE/Ei98jWy7AdpheJVZ1NtnQDr/fk2aAIfqYFQ
 qinypZuQaU7a7uspV7yspS/Xa8ULkH6KYsucuPmMnL+ZSJ9ikuACsStDAguU5m90BxtK
 LtazGLwOGvZVG/IiF4yNwgjzUtdGlyXitLa/YWQ6nCtVBJhcwwfI5uAjh2BzlkggOBET
 tejFfcPLXJlR06LUAu/Q3y8YFcDTXYu5LTPqXgUuHJov/bBVowKp0JLIBLcnXouwLRMi
 btDcw6xypNuHJ56A0gJ6DFNolqCik6PEwcaGAcC/m+XvFqxcVJcAqZ+yzRVl9sFKsZez lA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3p439tabwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:26:53 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 6 Mar
 2023 03:26:52 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Mon, 6 Mar 2023 03:26:52 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 18BCD11D3;
	Mon,  6 Mar 2023 09:26:52 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:26:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH v2 4/5] ASoC: cs35l45: DSP Support
Message-ID: <20230306092652.GP68926@ediswmail.ad.cirrus.com>
References: <20230303192151.2437221-1-vkarpovi@opensource.cirrus.com>
 <20230303192151.2437221-4-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230303192151.2437221-4-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: u6TL_NqWZk8T0ATfLPsOJ8WtEENrHZ7l
X-Proofpoint-ORIG-GUID: u6TL_NqWZk8T0ATfLPsOJ8WtEENrHZ7l
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 46IF3CHH5DUC25YCPENKXZUYRL3BCPJ2
X-Message-ID-Hash: 46IF3CHH5DUC25YCPENKXZUYRL3BCPJ2
X-MailFrom: prvs=84292303a6=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46IF3CHH5DUC25YCPENKXZUYRL3BCPJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 03, 2023 at 01:21:50PM -0600, Vlad Karpovich wrote:
> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
> 
> The CS35L45 digital core incorporates one programmable DSP block,
> capable of running a wide range of audio enhancement and speaker
> and battery protection functions.
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---
> +#define CS35L45_DAC_MUX_ROUTE(name) \
> +	{ name" Source", "ASP_RX1",	"ASP_RX1" }, \
> +	{ name" Source", "ASP_RX2",	"ASP_RX2" }, \
> +	{ name" Source", "DSP_TX1",	"DSP1" }, \
> +	{ name" Source", "DSP_TX2",	"DSP1" }
> +
> +

Minor nit, double blank line here.

But otherwise looks pretty good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
