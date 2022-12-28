Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EA665757E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 11:51:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2B72590C;
	Wed, 28 Dec 2022 11:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2B72590C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672224687;
	bh=6qut9pA9OveEvxOPBLoEVjTUuS8asjcaGZgo/5ThDRo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i6S1FRrkJXGfuHly9oe7mwKSeIu1c0ro6yVgneIxf5ld82kvI4GeajLgGTD9oNCvl
	 7ovo6Q94VAT+PnGHhyS59TvSmSkExFdKdsajS1D/x6QzbON8luPjoqBmZEMb4MFL6Q
	 CQXUFPpLHeWBul56gX5mhosiFowJfabA6hZtkIoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3AB4F8023B;
	Wed, 28 Dec 2022 11:50:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E95F8042F; Wed, 28 Dec 2022 11:50:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48584F800F0
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 11:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48584F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=V94Garek
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BSAFcib029539; Wed, 28 Dec 2022 04:50:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=rIeu7WF6DtqWolIDAOYqvMx29bKhbAUlb2U/kZoTnH0=;
 b=V94GarekpKmiZWByPz+K7dj+KFEmHN7rSXJF3Zo1z+gNNjHKi/bChMUEhAk4PAwdd8+V
 vfFeA8g4ekN0tnm/F1a7KAIbluozEgAYTQ7xqasX/IMKDw56M1f+qn5Lm6zXQbdfbMcc
 /9Y9nOI7XCant0ZRWAbondQip5nLnWEeP3pWgts3313JMD9ObtUOapmAmTs4Hs0OH1y2
 293G4H9nv8eYwfb3yW4Ed37q2qlL17V2sNAYJIWpzXMftC77bBWJAo+SizR9Y/NZeaCt
 iTSdaPKYHzFJThrw9o5RiVvnwJz+RqpnAoOoQfVx1aKgCiT0AmjWlpUyt6gIG483xwNK Jg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mnyq7aygf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 04:50:20 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 28 Dec
 2022 04:50:18 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Wed, 28 Dec 2022 04:50:18 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 726BC11CB;
 Wed, 28 Dec 2022 10:50:18 +0000 (UTC)
Date: Wed, 28 Dec 2022 10:50:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs35l41: add interrupts
Message-ID: <20221228105018.GH36097@ediswmail.ad.cirrus.com>
References: <20221224154210.43356-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221224154210.43356-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: GLp5ipBMYVET8tLWK6OHEKBU3-iUWl04
X-Proofpoint-ORIG-GUID: GLp5ipBMYVET8tLWK6OHEKBU3-iUWl04
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, Dec 24, 2022 at 04:42:09PM +0100, Krzysztof Kozlowski wrote:
> Both DTS (SM8250 and SM8350 based Sony Xperia boards) and Linux driver
> mention interrupt, so allow it to fix:
> 
>   sm8350-sony-xperia-sagami-pdx215.dtb: cs35l41@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
