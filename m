Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904493CFA7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 10:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DA7EAB;
	Fri, 26 Jul 2024 10:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DA7EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721982748;
	bh=SaWF+4KJQU0XUGHZ2RnknEncK0bztWKxjR5PTu+Y7hE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o4Ce7Db5g5Qw5E91rSWU5NwtWSBGl63246xjNn0QWfbQFdmkdSW4QrkusUK1RfMwB
	 NFjv1YuHpFOggNSV0u6MDXBt2c8RIIsqQyeRLqqkFndjUNyEhPZRUHomxeSpaIKuwG
	 mTA5UWir08IoD0981CqdNi7yaVop1rz2UgnPnFGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C33F80580; Fri, 26 Jul 2024 10:31:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57237F805AF;
	Fri, 26 Jul 2024 10:31:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2291F801F5; Fri, 26 Jul 2024 10:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 848D4F801F5
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 10:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 848D4F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o9qLQSb/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46Q6nlm2014217;
	Fri, 26 Jul 2024 03:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Fsrg6RkL3ljELUDbdF
	raOMnuDGBzLzBG9berJqeS99w=; b=o9qLQSb/6FYQi/W15D8/Q6B22hsutkg88J
	mNvNh/AZ9dtqrOtTI2R79TLXpy8lg1lRKFhIl6wq6uiLWlhJxh1WDOawKX7VlaCO
	eU4rIuRfd03jDKIDXA77BqwjD/sjpjlrViwwSQ4PT0Lh9y7BbLCx3sB5ScZRuZYJ
	vNZcORfK21t/q+SSA5prVTMc95eHtVjvLmZqXGyBKNQbnzb9vRk/fzqO4TR9DyPL
	kzPctMSGrBR/TxYyv0GJbep/oRCXMW0g49lRFREAm4X4hdll9PMJyP+uXK1OcV7U
	L5pHZHo0u48Al18wep6LoWHV38jlkQySIDlmkNZa06BVjUwfSSdg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40m1mdr9bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 03:13:56 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 09:13:54 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 26 Jul 2024 09:13:54 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8AA4D820244;
	Fri, 26 Jul 2024 08:13:54 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:13:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
CC: Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu
	<baojun.xu@ti.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        "Arnaud
 Pouliquen" <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 2/2] ASoC: constify snd_soc_component_driver struct
Message-ID: <ZqNawRmAqBRLIoQq@opensource.cirrus.com>
References: 
 <20240725-const_snd_soc_component_driver-v1-0-3d7ee08e129b@gmail.com>
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: 
 <20240725-const_snd_soc_component_driver-v1-2-3d7ee08e129b@gmail.com>
X-Proofpoint-GUID: 5Vy4Ky4wKTO8OiKMKMdLcpITcmsfQPPw
X-Proofpoint-ORIG-GUID: 5Vy4Ky4wKTO8OiKMKMdLcpITcmsfQPPw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M32PWDQE5XBRAKTLRI6JK4EQ43EVARPE
X-Message-ID-Hash: M32PWDQE5XBRAKTLRI6JK4EQ43EVARPE
X-MailFrom: prvs=49370cd301=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M32PWDQE5XBRAKTLRI6JK4EQ43EVARPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 12:31:40PM +0200, Javier Carrasco wrote:
> The instances of the `snd_soc_component_driver` struct are not modified
> after their declaration, and they are only passed to
> `devm_snd_soc_register_component()`, which expects a constant
> `snd_soc_component_driver`.
> 
> Move all instances of `snd_soc_component_driver` to read-only sections
> by declaring them const.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  sound/soc/codecs/cs43130.c           | 2 +-

> -static struct snd_soc_component_driver soc_component_dev_cs43130 = {
> +static const struct snd_soc_component_driver soc_component_dev_cs43130 = {
>  	.probe			= cs43130_probe,
>  	.controls		= cs43130_snd_controls,
>  	.num_controls		= ARRAY_SIZE(cs43130_snd_controls),

This won't work for cs43130, whilst what the driver does is
clearly slightly sketch it directly modifies this struct before
registering it with ASoC. That would need fixed first before this
change can be made.

Thanks,
Charles
