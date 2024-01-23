Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8EA83897C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 09:50:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C5A384A;
	Tue, 23 Jan 2024 09:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C5A384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705999802;
	bh=dhY165tMS0Miq8EqkLLuTWzkti65/pXyDCZ6C1zNaAw=;
	h=Subject:From:To:CC:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I2yTkDYOO3a9INrz0usNusL+np6O/zlpApCj9xnMdGSZacMazexBXfRmfCMOQG+86
	 X9jmYxStp27+u9LWdbMXJYJunqXEs8mcAfeJxxIYIVYj/p6XFvgXcqqeMFi0VYy8BK
	 JJ3LlCHo4iROWu+lYHH4qirLFm78MMSsaIXNsYLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A2CF8057F; Tue, 23 Jan 2024 09:49:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43440F804E7;
	Tue, 23 Jan 2024 09:49:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFEE3F8028D; Tue, 23 Jan 2024 09:49:18 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 10968F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 09:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10968F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QmYz032Q
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40N5mRpw012720;
	Tue, 23 Jan 2024 02:48:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding; s=
	PODMain02222019; bh=6GVSsBOtJASVspjRjHj4J47rudy6/Dh7Gcb1mVujeKY=; b=
	QmYz032QwQtAOpem/ebdhFIDrpoqX8j+gPEIIe+3iL4jNmepAdmq3QVBWTjxJT00
	eWADrpfn9SezkbAcT/lPdP+gfBRK5S80HKCLFL0WdIxaE2nl81pEfgOXDX9t24uw
	JcZlAXa1ET9sTLY5hFEDuyFQ8tej98za56xjO7SIzLTjQvWhGqusLyWNdoPssvYz
	99RlpyNFm8Z4GxEVbXx+sFyi28FgidBQkANkcaf7Kp/AjZfRjYlS+WvWMwEkT/IR
	qT54ie6+KGXJxmajbMbm8bppF6/vHNzgqlNrX7oYVctD3jevQ4IYiWw7yTLvP8T2
	mc7pYyz+JXpK53v69eni6w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vrcf33scm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 02:48:58 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 08:48:56 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 23 Jan 2024 08:48:56 +0000
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.251.123])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BCEA946C;
	Tue, 23 Jan 2024 08:48:56 +0000 (UTC)
Message-ID: 
 <c41bdd66cdf02db82fece500f75296d23f4d8041.camel@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23
 for MTL
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Mark Brown
	<broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        "Bard
 Liao" <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 23 Jan 2024 08:48:56 +0000
In-Reply-To: <30f022a5-7ab1-4b2d-b4c1-5a209ec67c5b@linux.intel.com>
References: <20240122151545.69437-1-mstrozek@opensource.cirrus.com>
	 <30f022a5-7ab1-4b2d-b4c1-5a209ec67c5b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0zZL-g3xvMlGVsP8krmjzLMFqwF3KYzY
X-Proofpoint-GUID: 0zZL-g3xvMlGVsP8krmjzLMFqwF3KYzY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VFX3PNTKTQOVAKSVL4I6X4EP5PZYJUVT
X-Message-ID-Hash: VFX3PNTKTQOVAKSVL4I6X4EP5PZYJUVT
X-MailFrom: prvs=8752699952=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFX3PNTKTQOVAKSVL4I6X4EP5PZYJUVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W dniu wto, 23.01.2024 o godzinie 09∶34 +0100, użytkownik Pierre-Louis
Bossart napisał:
> 
> 
> On 1/22/24 16:15, Maciej Strozek wrote:
> 
> It wouldn't hurt to add a brief commit message describing what the
> hardware layout is, specifically how the mics are handled.
> 
> It's also best to submit the corresponding machine driver updates at
> the
> same time to check for consistency.
> 
Will add the message in the next version

> 
> >         },
> > +       {
> > +               .link_mask = BIT(0) | BIT(2) | BIT(3),
> > +               .links = cs42l43_link0_cs35l56_link2_link3,
> > +               .drv_name = "sof_sdw",
> > +               .sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-
> > l23.tplg",
> 
> was this topology submitted to the SOF tree? I don't see it, usually
> we
> review topology/acpi/machine stuff together to avoid disconnects.
> 
Not yet, sorry, I'm aiming to send the topology to the SOF repo today.
Will include the link here in the next version.

> > +       },
> >         {
> >                 .link_mask = GENMASK(2, 0),
> >                 .links = mtl_cs42l43_cs35l56,
> > --
> > 2.34.1
> > 

-- 
Regards,
Maciej

