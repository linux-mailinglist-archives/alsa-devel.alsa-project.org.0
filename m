Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB9817394
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 15:30:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C13F183E;
	Mon, 18 Dec 2023 15:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C13F183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702909843;
	bh=mQ8vItNtUZTK887rAjwKJVy2mtNEO7Zj2fCFRfQmnCo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XlkWt3qUdLubaHhRv836oUVH9RRAg2ae2PKbDEUSiZvTSlIaxpuo0eY9/ferANVNI
	 A4eE7bzM/ERM8kyvDKNiKAnm5O90I8mJTUUtr/jMXY5J2uQZJVEr/HVQOukw1ax/hD
	 ndFAA47D9OZAu5icE2+W5jG88J6CEH1mCxQd5rJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15341F8056F; Mon, 18 Dec 2023 15:30:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 904EBF8055C;
	Mon, 18 Dec 2023 15:30:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE789F80425; Mon, 18 Dec 2023 15:30:02 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 30DFBF800BD
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 15:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DFBF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RcIiff7Z
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BI5ucvm029947;
	Mon, 18 Dec 2023 08:29:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Q3K2jRhiUj+p3q9
	pzVaLQolrGJbvLSKGMXyIqTW5100=; b=RcIiff7ZLBLLuGCvlQSuI/wrkRxCGcM
	XcKikPcRb2cP+YcM7UZMMLGWgZWvYZcG4ZM61M3e+VandUWQ8solAnlhFGx3q1Yg
	Q4dNUU8EH9/jXU8oo/SnTHnAlvigBTJMBBQhcLdM5cNTCtRUPJMLvIxhJcqnOWUE
	aillJMRALIzLY09P30aaUClvAkthbWOPpEhzCYqFAvsCXm+r3fDzL7F9nU54UUXJ
	YPZ3RGLrNjbUTTtWaeGdCnHEO3VBHYG0I/2S+pNd6OSjD3lIRh9rBd1ds/+zv1zY
	DjKta/cQfIL6ti7DL9J7FOPkoEwDKJDl2/FVPkOiU0c30yahSYu2hIA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a622scj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 08:29:49 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 14:29:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 18 Dec 2023 14:29:46 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DDEF915A2;
	Mon, 18 Dec 2023 14:29:46 +0000 (UTC)
Date: Mon, 18 Dec 2023 14:29:46 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <broonie@kernel.org>,
        <vinod.koul@intel.com>, Bard liao <yung-chuan.liao@linux.intel.com>,
        Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
        <vijendar.mukunda@amd.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shuming Fan
	<shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Oder Chiou
	<oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: fTecLkRAfwiwFOOz9SQ3rNt-s_rvS7z5
X-Proofpoint-ORIG-GUID: fTecLkRAfwiwFOOz9SQ3rNt-s_rvS7z5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: G3R54MVOCTFFLNSJM57S5TK2EFKR2A6C
X-Message-ID-Hash: G3R54MVOCTFFLNSJM57S5TK2EFKR2A6C
X-MailFrom: prvs=771681532f=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3R54MVOCTFFLNSJM57S5TK2EFKR2A6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
> > why not have a single API that does both? First check if it is supported
> > and then allocate buffers and do the transfer.. What are the advantages
> > of using this two step process
> 
> Symmetry is the only thing that comes to my mind. Open - close and send
> - wait are natural matches, aren't they?
> 
> We do need a wait(), so bundling open() and send() would be odd.
> 

I agree send->wait->close would be odd, But you just bundle close
into wait. So the API becomes just send->wait, which seems pretty
logical.

> But you have a point that the open() is not generic in that it also
> prepares the DMA buffers for transmission. Maybe it's more natural to
> follow the traditional open(), hw_params(), hw_free, close() from ALSA.

I think this just makes it worse, you are now adding even more
calls. The problem I see here is that, open and close (at least to
me) strongly implies that you can do multiple operations between
them and unless I have misunderstood something here you can't.

Thanks,
Charles
