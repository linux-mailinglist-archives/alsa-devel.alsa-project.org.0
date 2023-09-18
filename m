Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460B7A44E5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 10:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A2E4852;
	Mon, 18 Sep 2023 10:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A2E4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695026261;
	bh=AZBtsWt9Rdq/th+esntkn0BcgO+4f0CgeW8qIy6ZMvg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLCvrXQ4wEGAY1zeLBveySu8R7oi9tHTbK5QpSdFtXoSYB/wKZsgrnIdvWevvlfim
	 1n3Q/Kc53pD1An4Qk/gV4phvOKUWkvfMSdnUmRGfIq8NCZh4Cb+qstY5wm4F01Gz6Y
	 Dtd8HfGTVDZVT8S4jBscThennCvP4FEuvBVoC0Y8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A04CF80494; Mon, 18 Sep 2023 10:36:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDC6F80494;
	Mon, 18 Sep 2023 10:36:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21E3FF801F5; Mon, 18 Sep 2023 10:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D86F7F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 10:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86F7F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=kUGIJAnd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38I4SDP2011029;
	Mon, 18 Sep 2023 03:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=2n7pNpKVLOivSG4
	DFdhrlBJ2AweybJOuaBKfhmO5+JM=; b=kUGIJAndEcaXMxWvuhig7Y6FQ6y2eOk
	HW/J3SoI/94qHe5pHPlMCKcaxsuL2pdTiyvxqmHAfe8u6T5wz3uj/IFDnvYQGU84
	KHhSlT/2bSYNQSxie9tYS5ba0KBfqUMbRk0qV4I8YvO912YhMK4CybluE/QG7b4C
	YRUVgWoLGg6SSasWQNdcjKOskJ58zPGd7+vksiE/oYF4hCJu8d6N5weHMMaYgH5s
	/OxTOx3g/bjncb3pS4KuEz/7T6ERT8lIGsGsZVqtOOf7YvOyMLIqM+e2u7uGLbq7
	vhPMU0clNUf9YVsOyPet39zXW2PEPVkwiXoHTNrLtoBpJzBFfHFpk0g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t59ry235y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Sep 2023 03:35:47 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 18 Sep
 2023 09:35:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 18 Sep 2023 09:35:45 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7EB9315B4;
	Mon, 18 Sep 2023 08:35:45 +0000 (UTC)
Date: Mon, 18 Sep 2023 08:35:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: John Watts <contact@jookia.org>
CC: <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
        "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen
 property
Message-ID: <20230918083545.GX103419@ediswmail.ad.cirrus.com>
References: <20230917173726.1916439-1-contact@jookia.org>
 <20230917173726.1916439-4-contact@jookia.org>
 <ZQc7XnrXX5VenYoX@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQc7XnrXX5VenYoX@titan>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8HuOBrbWGgJulNyoGbHCm-8cWOZUTd7y
X-Proofpoint-ORIG-GUID: 8HuOBrbWGgJulNyoGbHCm-8cWOZUTd7y
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LQ2TY5B6JYWE6C6VMNSU57TICS4X7AE6
X-Message-ID-Hash: LQ2TY5B6JYWE6C6VMNSU57TICS4X7AE6
X-MailFrom: prvs=4625b791e1=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQ2TY5B6JYWE6C6VMNSU57TICS4X7AE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 18, 2023 at 03:46:06AM +1000, John Watts wrote:
> On Mon, Sep 18, 2023 at 03:37:26AM +1000, John Watts wrote:
> > +Optional properties:
> > +
> > + - wlf,fsampen : FSAMPEN pin value, 0 for low, 1 for high, 2 for disconnected
> > +
> 
> Uh-oh, I forgot to specify what it defaults to.
> Should I reply to this patch with a fix or re-send the entire series after I get feedback?
> 

I would probably send a new spin with the fix and my acks.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
