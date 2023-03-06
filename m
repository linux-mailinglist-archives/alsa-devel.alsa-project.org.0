Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939D6AB9A7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 10:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B87E10C2;
	Mon,  6 Mar 2023 10:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B87E10C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678094607;
	bh=7emKmA50ekFqFecM8QBpWPJXUqA3UHFOdFOu0+MLYfA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gf1K+WKFzNcgh/qI3J6Y/pWo18MTYA6VSCzFJjhg/28FS9E7kFdJ3Jlmcf1Edc+gJ
	 APVdu0cXu6n2nL/FbehDCJTAOLbtu2xtIPj+Kv20si1mLDfT7Djsrczvj5dBSOV4d5
	 JfkFVNKK5tDyAsuGWf3eITNF7JJyhCjzib/JZG3w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D55CCF800DF;
	Mon,  6 Mar 2023 10:22:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82FCAF80431; Mon,  6 Mar 2023 10:22:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57034F800DF
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 10:22:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57034F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=AmM18T6l
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3265HHFB032633;
	Mon, 6 Mar 2023 03:22:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=25P+xMRcCTAydVHeS++PJrEDucjELxBxfa6hv3Q1AUY=;
 b=AmM18T6lclpx16HfEhzJpEAIxTCdH85rOOgKPm7WPsaBn+UWcFK9yvfi9lcnci9ArUDf
 h2fRU7aReer5YktEZVqYEkik2acraU/P7YINVntLmaJCd+IBx0pHfMLg7s9sA5z7nUJb
 fsGZqvMO0sB2RUIoe+S+/dt+H/6oAjy4y+6S1LlPIfk7OtE++EiiOXL4+S3ZJqDZ0zCO
 Bod6a3/BGsDalRGQQyMLy9jI4lFA1icvo1+vYcVa9zefD/5FobGu1kC342q30NJN//5v
 CNFDK/EqbRAIrp7sCqQMAZU/wENCt83LNmE3PeHlj7FfYf2EOUCkt5G1qYK4U1wKj1pV ng==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3p439tabsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:22:30 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 6 Mar
 2023 03:22:28 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 03:22:28 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 615EA458;
	Mon,  6 Mar 2023 09:22:28 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:22:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH v2 3/5] ASoC: cs35l45: IRQ support
Message-ID: <20230306092228.GO68926@ediswmail.ad.cirrus.com>
References: <20230303192151.2437221-1-vkarpovi@opensource.cirrus.com>
 <20230303192151.2437221-3-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230303192151.2437221-3-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: ujTC8BSxs-GuqPhhpwTt-ckuaWD3Pbnz
X-Proofpoint-ORIG-GUID: ujTC8BSxs-GuqPhhpwTt-ckuaWD3Pbnz
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FACFQMVMHJ3TTRLDECOLN2JWTJG6SOMP
X-Message-ID-Hash: FACFQMVMHJ3TTRLDECOLN2JWTJG6SOMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FACFQMVMHJ3TTRLDECOLN2JWTJG6SOMP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 03, 2023 at 01:21:49PM -0600, Vlad Karpovich wrote:
> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
> 
> Adds IRQ handlers
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
