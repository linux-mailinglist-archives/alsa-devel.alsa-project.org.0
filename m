Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B439769FE0B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 22:57:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D98F868;
	Wed, 22 Feb 2023 22:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D98F868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677103065;
	bh=FQjMyVzSHSIgh7EMsFdQKnCgltVv/tqKk8x8OOuae8s=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XNUJfKWgBjSyBzJbK3hdAazjVZp6+lx2uHNIOpSVBmrfnBM1CDNv4lifGko4NXhAX
	 wpGRp/okc7A9cEkMZnb8KzX3imKRd97lCwwotNwJ+xTy5B6MJGpIomSGOlz24GGl9j
	 XR5cFPK5IgugaCiK4dyBm4jMGva8b6rpRzyhj1RE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D28BAF8025A;
	Wed, 22 Feb 2023 22:56:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D48ECF80266; Wed, 22 Feb 2023 22:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6794F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 22:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6794F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LMzojmsW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MGEO6f007999;
	Wed, 22 Feb 2023 15:56:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=qNi37xYQRlfuea/sB2J8zS++OGP8mx2YMn3nkAm0mn0=;
 b=LMzojmsWNVmpVH6vjeI8xcWqHuABD21hE45Gd3TDmsX5FV5tbq3Qe5FAvt3Q61PzdLgO
 qVSThfVcnmOP7dhQoNzx2VWaNRbblXJLW2nHvuSP6hI4gT8M+EzwwOTiPjhSOxl4Miw0
 bewf+MgPHOPoO5wufsLrz0gjE/He0PPhQDO3czxRrDKY7MN4KBeSQyHUj3M6gp29nFnI
 Uz8ngBEmkqjPq/LHIav96XtmsefMCJcdGtoWFfMk/dMcBh3y8bB9pLNDjhsuirgzlMvQ
 8Kt3RyRPEB1r8/cK4CCJThfdS/CRbWjf1eE1laRdiYXGYLD0iFbvg8YuUxi6cP2TlbmO xA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ntvy7npn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:56:41 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 22 Feb
 2023 15:56:39 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Wed, 22 Feb 2023 15:56:39 -0600
Received: from [141.131.215.58] (david-linux.ad.cirrus.com [141.131.215.58])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E8FFB0E;
	Wed, 22 Feb 2023 21:56:37 +0000 (UTC)
Message-ID: <689ffdac-8d52-a76d-8a01-a43b8a7d9fa8@opensource.cirrus.com>
Date: Wed, 22 Feb 2023 15:56:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 3/4] ALSA: cs35l41: Add shared boost feature
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
References: <20230222093244.938156-1-lucas.tanure@collabora.com>
 <20230222093244.938156-4-lucas.tanure@collabora.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
In-Reply-To: <20230222093244.938156-4-lucas.tanure@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bn1JS915Zx1ORUfjuwqC75Eu316YV50-
X-Proofpoint-GUID: bn1JS915Zx1ORUfjuwqC75Eu316YV50-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HKFTKIGDUMS6V3JOIRKHYKSPQ3ECXR7Q
X-Message-ID-Hash: HKFTKIGDUMS6V3JOIRKHYKSPQ3ECXR7Q
X-MailFrom: prvs=7417dd5999=drhodes@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKFTKIGDUMS6V3JOIRKHYKSPQ3ECXR7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/22/23 03:32, Lucas Tanure wrote:
> +static const struct reg_sequence cs35l41_actv_seq[] = {
> +	/* SYNC_BST_CTL_RX_EN = 1; SYNC_BST_CTL_TX_EN = 1 */
> +	{CS35L41_MDSYNC_EN,        0x00003000},
> +	/* BST_CTL_SEL = MDSYNC */
> +	{CS35L41_BSTCVRT_VCTRL2,    0x00000002},
> +};
> +
> +static const struct reg_sequence cs35l41_pass_seq[] = {
> +	/* SYNC_BST_CTL_RX_EN = 1; SYNC_BST_CTL_TX_EN = 0 */
> +	{CS35L41_MDSYNC_EN,        0x00002000},
> +	/* BST_EN = 0 */
> +	{CS35L41_PWR_CTRL2,        0x00003300},
> +	/* BST_CTL_SEL = MDSYNC */
> +	{CS35L41_BSTCVRT_VCTRL2,    0x00000002},
> +};
> +

The passive device only needs to use TX, not RX.
It is transmitting its boost target voltage to the bus so that the
active amp can boost according to the combined target.

Should be:
static const struct reg_sequence cs35l41_pass_seq[] = {
	/* SYNC_BST_CTL_RX_EN = 0; SYNC_BST_CTL_TX_EN = 1 */
	{CS35L41_MDSYNC_EN,        0x00001000},
...

Thanks,
David
