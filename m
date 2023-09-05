Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CA079218C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 11:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9819F6;
	Tue,  5 Sep 2023 11:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9819F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693906662;
	bh=HaNPDQOCrInW2D3tvyTNpqcVx7wI4tRS6JoeyTgT/+0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FG0QEbEdDj8kBDTaVzs5lSITJqoLMSLaRe2Q2kIZjfSj6qLVMVepvMkL9QbviF16Y
	 gZJ0QMJ655RIlIxpXl2QzwKBKTIEVDrUEyF8XlG7v8ADQei0U79cwAfrzNkfDrUcm3
	 7cdHs3YZgXcQ/+bz7B2XBQLxWH07C4tWETD7z57c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2461F80567; Tue,  5 Sep 2023 11:36:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F4BFF80494;
	Tue,  5 Sep 2023 11:36:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35446F80549; Tue,  5 Sep 2023 11:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33F0BF80431
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 11:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F0BF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UNS/Hk5L
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3858Y7u3006177;
	Tue, 5 Sep 2023 04:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=SDlOxuu7Uo3W5Kj
	A/a8pV8zd//4tX+9LFSKkBFBusr8=; b=UNS/Hk5L6CSRuIwjJs5wg6hJOwRmnAQ
	7Tz3ff60Y/cRADssfWHG2qIHsUZghCfJ9g9PbAl37dnyphPIlWZJzOBWxaAGVmFi
	KYgw4dqZfJCSSTUIx+qkbxck4pOhXda7CbcGso1V0EXNYUGHylsH72UpHIMg89Cb
	tZusvNzJRj2WyQd7nhZ8JrWyt9NeUYxmHVSUSUt99TjCxN3vl2BDcSM4hkNclJJv
	AjPMhxL0ehXXdinrLRoIcrLFWcmdRgWvYj5ljx95b1ZbDNNhGc2TeyfWbwLkXXw+
	8/m3YdH7VR1EsL4OiRo9qqsq0+k7AUc/pyffhFWG2rQ6mLuLheBA9Hg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sv1fhts21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 04:36:28 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 5 Sep
 2023 10:36:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 5 Sep 2023 10:36:27 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3983D11AA;
	Tue,  5 Sep 2023 09:36:27 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:36:27 +0000
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
Subject: Re: [PATCH 6/9] ASoC: cs35l41: Make use of dev_err_probe()
Message-ID: <20230905093627.GH103419@ediswmail.ad.cirrus.com>
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230902210621.1184693-7-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: MHH3QmBB3KVCkFEfka8UHaKRE-468d9Y
X-Proofpoint-GUID: MHH3QmBB3KVCkFEfka8UHaKRE-468d9Y
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YIYITTSUBNJVAKEXJSYD6QDH2EPDBYIK
X-Message-ID-Hash: YIYITTSUBNJVAKEXJSYD6QDH2EPDBYIK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIYITTSUBNJVAKEXJSYD6QDH2EPDBYIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Sep 03, 2023 at 12:06:18AM +0300, Cristian Ciocaltea wrote:
> Use dev_err_probe() helper where possible, to simplify error handling
> during probe.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
