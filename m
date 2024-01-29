Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D1B840831
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 15:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEF984A;
	Mon, 29 Jan 2024 15:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEF984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706538235;
	bh=vW6TNIkeck9BpwYQUg+4uWlPjC9obh2Y2AixNJRS0k4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vb/DICv62znCQXmqPdPS+m3WqPyGtN7YVSnF+apzJGUHSIgbgFLeLOLdkJoU3J/Gr
	 IpLGElkIBvZnzjE7A6A0IoTffJGLeAK63DcPdM2mfrjCQqv6NJgp9W1M13/tN3NEP2
	 l/xh7nA/216Xh43eAqmSicmjMrrGOrgdst/q/7Q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98334F805AE; Mon, 29 Jan 2024 15:23:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BF4F805A9;
	Mon, 29 Jan 2024 15:23:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63DB3F80563; Mon, 29 Jan 2024 15:23:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B93BEF800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 15:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B93BEF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=pIvpz/tM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T4qVf0031043;
	Mon, 29 Jan 2024 08:23:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=EYYIOSJVY3d6bCG
	KoPIC2EeJcrPTQrMYy67pwh4YFx4=; b=pIvpz/tMT4GpaHkLwy4YIHa2toYpVoo
	rv8Tr0BfBpi3Ff64G4bcySN8S2tFwzz0FpTkACTLl17QUWzL2aA8bi0ZcjDsU9rA
	Oqo8LpeSMaPsRcpKd0vJ0eygQe+5bNmMQDZlJmjsl2lDrOD1lpGYoeeiTWV+F8Zv
	xzUotVP3SQRTCZqAvaJEMXIpxM1Ogezak18fjtBqDQV5iYu6PEhTIt6XN2I93VSl
	3NGWDmvbF7oDKrX8AVldDow80CNmT80uRqocOXb537+2afAR4efD+w1sohry5fBG
	7bV9CnDHvxt4/u92NPdzGeuSUvZruFhE8FQ2bhHVDQoXEyzA8avQ0Ng==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vw043t3sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 08:23:09 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 14:23:07 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 14:23:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 42AB4820242;
	Mon, 29 Jan 2024 14:23:07 +0000 (UTC)
Date: Mon, 29 Jan 2024 14:23:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23
 for MTL
Message-ID: <Zbe0yi5Qo1eG5yCk@ediswmail9.ad.cirrus.com>
References: <20240123113246.75539-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240123113246.75539-1-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: -_gIoV694mP0SnotpE1zKJindY_rtzTY
X-Proofpoint-GUID: -_gIoV694mP0SnotpE1zKJindY_rtzTY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UHDOCHXJKX5D6GTPXPK2YRLF56KHXF7C
X-Message-ID-Hash: UHDOCHXJKX5D6GTPXPK2YRLF56KHXF7C
X-MailFrom: prvs=9758a52b9a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHDOCHXJKX5D6GTPXPK2YRLF56KHXF7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 23, 2024 at 11:32:46AM +0000, Maciej Strozek wrote:
> The layout is configured as:
> - Link0: CS42L43 Jack and mics (2ch)
> - Link2: 2x CS35L56 Speaker (amps 3 and 4, right)
> - Link3: 2x CS35L56 Speaker (amps 1 and 2, left)
> 
> Corresponding SOF topology:
> https://github.com/thesofproject/sof/pull/8773
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
