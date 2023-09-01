Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9678FA40
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D5ADED;
	Fri,  1 Sep 2023 10:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D5ADED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693558334;
	bh=Cz4/sMTXO9oA2vCESmlVHkM+1EI2LLYq5YJ22uyO5PY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jOhCZGqMCmqHER7wOq/pBfx54K32TJlDlYz0U75DkcRE4Hexc8tcKZukSNcFmWeSs
	 m7OsH2h0b4NV2F3jIxpxgTBHrJ6gwdZWt8Sjwq2VbZ6b86hkRv0G/jCBSsOOMo4hQM
	 WJWvi7oJCKXfFpjI+9JoGDifBDBM44Wx6q7sXts0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 434A6F80564; Fri,  1 Sep 2023 10:50:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A590F8055B;
	Fri,  1 Sep 2023 10:50:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC38BF80563; Fri,  1 Sep 2023 10:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C376F8055B
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C376F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LQU+jcl3
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3815QgUA022494;
	Fri, 1 Sep 2023 03:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=za8y5lvVzB9oa0e
	VtAWyf93Fucehe4zshiET5W9+dUg=; b=LQU+jcl3Mokf/SB99EygO9XkrmtuFXV
	RrDlewc4WUEB3PtIXi5avbn0sFVslixZlbFxdXAjB8Hbg/Ivy577xTXw0ErA2Akc
	8MZg76Aw3vXViKK6xOg0lf0cDdEoHs17CS3YJ4D2bgOHr5V5LmlwDcixog8z3g6B
	E+SXVRX1bs0wPDwm0eRtWDpPkEi2KqvvGP0WW2yFFq2um8h+R5+cYUidw02DZOQ3
	i7HvJI5heiQOatoLhPM5uPncYPHAZWIiUyMX4ZnVZutac4AK/7r9C/faUBdcOvf1
	Jbf014LcEG8iI5VhtIBCPNifA2LrcGOZaJ+CCQVCGKksXe2lNGFcOyA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyg4ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 03:50:41 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 1 Sep
 2023 09:50:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 1 Sep 2023 09:50:39 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 941EFB06;
	Fri,  1 Sep 2023 08:50:39 +0000 (UTC)
Date: Fri, 1 Sep 2023 08:50:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] ASoC: cs35l45: Add AMP Enable Switch control
Message-ID: <20230901085039.GC103419@ediswmail.ad.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
 <20230831162042.471801-4-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831162042.471801-4-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 5pVzOaU-Hl8lz1MEbVUUZtmufoJJRWkG
X-Proofpoint-GUID: 5pVzOaU-Hl8lz1MEbVUUZtmufoJJRWkG
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3WHZO35WUR6IEJDV2TFPECZDLIKEHWEB
X-Message-ID-Hash: 3WHZO35WUR6IEJDV2TFPECZDLIKEHWEB
X-MailFrom: prvs=4608688732=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WHZO35WUR6IEJDV2TFPECZDLIKEHWEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 31, 2023 at 11:20:42AM -0500, Vlad Karpovich wrote:
> The "AMP Enable Switch" is useful in systems with multiple
> amplifiers connected to the same audio bus
> but not all of them are needed for all use cases.
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
