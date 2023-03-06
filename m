Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DF6ABA06
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 10:36:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88ABF10CC;
	Mon,  6 Mar 2023 10:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88ABF10CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678095402;
	bh=pSrNeFO3QjeaWO9sX4+pu0ehERebdZZlqH4k+uv8po8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f6jPkjqffW8gZszxPpzonQ9yCiLvLsunmUpmsYFMWB6zLch9ixSy7EbILTCLrgSW7
	 JzhtGlOC8zrjK535U43eNPKMU1mbj5imy0D/alRlCkoUT/jGjbgPyiDoDavCvsf68k
	 e3lFJ6ZPUNgYH45glLVvAqGEdOFKrYqRy41fRZmg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE78F80236;
	Mon,  6 Mar 2023 10:35:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74288F8042F; Mon,  6 Mar 2023 10:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66950F800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 10:35:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66950F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o3Dm5HXF
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3265VMOE000378;
	Mon, 6 Mar 2023 03:35:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=AVoa7prKja+G6h0Wnu0l9jqt2+WL1wtrX2iRfjCAD+4=;
 b=o3Dm5HXF9lJSpFa8tPiMeU0geOH3PahawQjtjsgLjcBAcsK+V4EQJAGP8VIt5MPMjdNY
 0BTjh6cr6bwfMAe2vf5SrNeSebSOdg8VdJ08jWTSwxgwPvAT5YU0Jag6DLHnM8VTmMt4
 somKJXTvzULmnXElIo0kt0XUivzO2A6SH7xuquAOHDmOdh/dnBFEF7rzHsqg/4WGD2zn
 o6sqTFCmxL0c7Vj7F6/1YmvZVcCEkuwH4Caj84ML0qSnWCDjrztqZxhrDQ9Pib853OZo
 PDuarwHUvKhb+PRqLPmwuzWGhTnBCdw46e6FDjvwNUDoT3Y1HAYi748dWhBqN90K5gEY UA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p44972b9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 03:35:39 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 6 Mar
 2023 03:35:37 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 6 Mar 2023 03:35:37 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8CBF5475;
	Mon,  6 Mar 2023 09:35:37 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:35:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH v2 5/5] ASoC: cs35l45: Hibernation support
Message-ID: <20230306093537.GQ68926@ediswmail.ad.cirrus.com>
References: <20230303192151.2437221-1-vkarpovi@opensource.cirrus.com>
 <20230303192151.2437221-5-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230303192151.2437221-5-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: mi9dECTXyLkzWfg3ymR3pjWPMi52khpf
X-Proofpoint-ORIG-GUID: mi9dECTXyLkzWfg3ymR3pjWPMi52khpf
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BJACGS7SPQKMMPZ2LVQLZ4AA3WNGSKZF
X-Message-ID-Hash: BJACGS7SPQKMMPZ2LVQLZ4AA3WNGSKZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJACGS7SPQKMMPZ2LVQLZ4AA3WNGSKZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 03, 2023 at 01:21:51PM -0600, Vlad Karpovich wrote:
> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
> 
> Adds support for a low-power Hibernation State.
> In this state, all register contents are lost, but the contents of
> RAM are retained. In the Hibernation State, only always-on digital
> functions to support wake-up are enabled.

Yeah perhaps clarify that this relates to the DSP, something like
"Add support for a low-power hibernation state for the DSP. In
this state the DSP RAM contents are maintained, such that
firmware does not need to be re-downloaded, but the rest of the
chip's register state is lost."

But rest of it looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
