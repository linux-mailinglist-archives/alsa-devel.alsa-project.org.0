Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63227921A2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 11:46:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10931886;
	Tue,  5 Sep 2023 11:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10931886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693907198;
	bh=a+JqJWDUZ+pfKsSLgk1Pf+IFTjEbgEqw3SwwIEDKH1o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X+MtoMYKPjWBeMG7X//bftRWVTO3s8XwJ3P2KNUWAqDqxQoqzypPcDyMSD/2f941m
	 ExWBF93Mw5HtaV07opPP+kM1xau9DVfMRbRHIz8ty7Je+7iIE68/LWB6bVpRWty4Ve
	 wVJo3utk+rgL5KzuWW4256L46o3SxPOk1uBo/lTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F35F80494; Tue,  5 Sep 2023 11:45:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF42F80431;
	Tue,  5 Sep 2023 11:45:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7FFAF8047D; Tue,  5 Sep 2023 11:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0FF6F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 11:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0FF6F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qbID/8r+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3856L0ej015029;
	Tue, 5 Sep 2023 04:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=R1PXGn/5wGrB3Y7
	MxvWTug+xiW8/98V2SY3ME2SCowg=; b=qbID/8r+ndv/7kvkjrQTTUay/Ti0zeT
	CDh/JRWSNkCdGhk2Qh3CIA3aW5Vrrf5ece1hlUKCvSaYFNtGvJ+1OEQPaWXfrfTh
	vTX5QJefj2qbTZ8SDISnWQR7pjrI7nqJUIIbl2Vaj6vxpUgzT90N3wODK9PmPrzF
	0K5AM9q7j/h88SZRZF+CnDbbpbcZ8sooigQnG9rSqLS0tZCWtf1nY2uKF5PD5rh0
	ajjNZqB48CjfJ7Y1c9UBuAJR3ZnD+74T1NKNnInxZnN4BIHB/8K8eCKkvMx1oOmd
	a+yCvXgzSHyxC8qylT3s83iFI9b19zMNx50BsttBY7WaY9eLJxSyiKw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex3bun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 04:45:38 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 5 Sep
 2023 10:45:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 5 Sep 2023 10:45:35 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5C1D911AA;
	Tue,  5 Sep 2023 09:45:35 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:45:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
Subject: Re: [PATCH 9/9] ASoC: cs35l41: Use devm_pm_runtime_enable()
Message-ID: <20230905094535.GK103419@ediswmail.ad.cirrus.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-10-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230902210621.1184693-10-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: f05LQqp9LadCj4InE97tI91FBtGyZO61
X-Proofpoint-GUID: f05LQqp9LadCj4InE97tI91FBtGyZO61
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UFO5AJ76OQW26QY5W7EXD2J53TQAXZIX
X-Message-ID-Hash: UFO5AJ76OQW26QY5W7EXD2J53TQAXZIX
X-MailFrom: prvs=4612d7e67e=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFO5AJ76OQW26QY5W7EXD2J53TQAXZIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 03, 2023 at 12:06:21AM +0300, Cristian Ciocaltea wrote:
> Simplify runtime PM during probe by converting pm_runtime_enable() to
> the managed version.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> @@ -1376,7 +1379,6 @@ void cs35l41_remove(struct cs35l41_private *cs35l41)
>  	cancel_work_sync(&cs35l41->mdsync_up_work);
>  
>  	pm_runtime_get_sync(cs35l41->dev);
> -	pm_runtime_disable(cs35l41->dev);
>  
>  	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1, 0xFFFFFFFF);
>  	if (cs35l41->hw_cfg.bst_type == CS35L41_SHD_BOOST_PASS ||

Are we sure this is safe? The remove handler appears to be
written to disable pm_runtime at the start presumably to stop the
resume/suspend handler running during the remove callback.
Whereas after this change the pm_runtime isn't disabled until
after the remove callback has run. Does this open a window were
we could get an erroneous pm_runtime suspend after the
pm_runtime_put_noidle?

Thanks,
Charles
