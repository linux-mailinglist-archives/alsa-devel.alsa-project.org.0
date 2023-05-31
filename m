Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E971846F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 16:13:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E84074C;
	Wed, 31 May 2023 16:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E84074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685542411;
	bh=QvcHv1sr4DYc4geZOZZlyOgBGvt35FDQOU1Zvdardx4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rEXEEek/L6kXjSpxQXEco8q/GjncIb75LWbaXwxRa+58IaYRr+6sdR8K5m09ZPsGI
	 3hvKEXf6JNXuy7QxUkL3Wq5HHsUtqQV1+iTh0txoy8PPEkL1rIJ97LGjVYuXoLmMJ8
	 sAKrL8Rl6+JT+DRH+ox7Avs5qVoyYgJ4OWxtxzgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 485F8F80542; Wed, 31 May 2023 16:12:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93C79F8042F;
	Wed, 31 May 2023 16:12:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7DEBF8042F; Wed, 31 May 2023 16:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94B7CF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 16:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B7CF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ApqQ+JFf
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V5CpaG031404;
	Wed, 31 May 2023 09:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=DfcZshtC/3kePJgZElnsMbSUMBBpHznHMh0D64IdoII=;
 b=ApqQ+JFfSzg+1JB9vTTtQ6kONI8wr2UWK94lbyvCuEPStuZp7bhenjNYydsOQrbr5cW9
 QOeLN+yWeBz+VuHFGE3W0W+IIpeH4c0Gz4lIMFAm+vj+RRdn7QPmycW6j08R/dHZ/qFs
 7ldmOfOGYsgkGbI4kSbTr7q3WdgUkBR4YdWzgzTseHkNtB5IgncTzjDVi9cxQaDFRb+K
 QZR6u8tTT3IrbG4Q6QdABwZRbLTRkK3hJjGkmu7RqkvUhv26RrjiqdN1GM5Bl/w8a6Td
 ep+DcqVcOsaWKRNeU7dEo9Fd0R27E4SIvL13c1KS1IMbhJ1ZFwrNnRvyt8c9MgVf+1oh tQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mvtw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 09:12:09 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 31 May
 2023 15:12:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 15:12:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 598FD475;
	Wed, 31 May 2023 14:12:07 +0000 (UTC)
Date: Wed, 31 May 2023 14:12:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <broonie@kernel.org>, <lee@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: sound: cirrus,cs42l43: Add initial
 DT binding
Message-ID: <20230531141207.GJ68926@ediswmail.ad.cirrus.com>
References: <20230530122112.1314458-1-ckeepax@opensource.cirrus.com>
 <20230530122112.1314458-3-ckeepax@opensource.cirrus.com>
 <eef819db-4de3-06fe-8fe6-b0fe87ab5d84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <eef819db-4de3-06fe-8fe6-b0fe87ab5d84@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: hIXSRhjnKWNOVq-ly_WiPUo81d5fSQGO
X-Proofpoint-ORIG-GUID: hIXSRhjnKWNOVq-ly_WiPUo81d5fSQGO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VBQANF7EMBOF73VKR6L2AILTG3RVIQTS
X-Message-ID-Hash: VBQANF7EMBOF73VKR6L2AILTG3RVIQTS
X-MailFrom: prvs=151547ecba=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBQANF7EMBOF73VKR6L2AILTG3RVIQTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 31, 2023 at 11:02:24AM +0200, Krzysztof Kozlowski wrote:
> On 30/05/2023 14:21, Charles Keepax wrote:
> > +  cirrus,bias-sense-ua:
> 
> "ua" looks like microamp. If so, microamp instead:
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml
> 
> > +  pinctrl:
> > +    type: object
> > +
> > +    allOf:
> 
> Drop allOf, just "$ref: ......"
> 
> > +      - $ref: /schemas/pinctrl/pinctrl.yaml#
> > +
> > +    additionalProperties: false
> 
> Also drop blank lines between these three above.
> 
> > +    patternProperties:
> > +      "-state$":
> 
> Use consistent quotes, either " or ' everywhere
> 

Thanks, will fix those all up for v3.

Thanks,
Charles
