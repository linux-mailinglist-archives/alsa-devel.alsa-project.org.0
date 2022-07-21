Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7E57CBBB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 15:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A108B17BF;
	Thu, 21 Jul 2022 15:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A108B17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658409642;
	bh=zmv7mTFNmy+hubTJ/Y1q+LU2/S3Sq8Hgv+rvwaZaBaw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l/aAQAEJKGfUbCyKXCEY1FHglNO1bXMziir7uYHXylmsF5JrhXy/ZmUNNt26QcTbm
	 NF9/7oHHJ1C9OMC7qSWLmmPvs1KIaJ/1sj46GrNn2fLdn+AeDXBhjvQfaWna9CGClQ
	 MqcFaN062QHBa0X4EdwpregDyyxGpYedC1gEfhZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDBEF80256;
	Thu, 21 Jul 2022 15:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B9E8F8016D; Thu, 21 Jul 2022 15:19:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00054F800ED
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 15:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00054F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FZT7UNlR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LBc3LT005144;
 Thu, 21 Jul 2022 08:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Sk2v+4C0j9sxQiOuU4jhIsVMoQvIwBpR9MTlFn7X9aY=;
 b=FZT7UNlR077kT3PPoj0hi2TM4hTJz6gPWZX+TVR22HA6g1IxvrQJ3H8+9tzbxxcUm0VF
 +BRe2AYSuZxslom7Te+3zdbPFX7Ib/9PD+zdv/1NNTlMg3L67/7i6IYojKtND+5iScA1
 X8jdzkbYRLmWCCZ2MQ0vAjb1jKYaeEiEJoS0HsizJQhyTFJgpiCUYpKLg+7aNGE4Td7O
 pJ8qU9gp9g/UL56IUdn2pgW5bsPL7QJFzZjOvHlT2Po+eSnKZ8HBb6mZGGvEHkL3xM4J
 OgmiL5cceoiRo6Mu+VG1idHgPwjhi9QN6Gg6OIAUtZXCyRElsHJCRhNAEKAGZzpUJnhW qA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hdrqfk38e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 08:19:30 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Thu, 21 Jul
 2022 08:19:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Thu, 21 Jul 2022 08:19:28 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7740AB06;
 Thu, 21 Jul 2022 13:19:28 +0000 (UTC)
Date: Thu, 21 Jul 2022 13:19:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: cs35l41: Set the new legacy DAI naming flag
Message-ID: <20220721131928.GD92394@ediswmail.ad.cirrus.com>
References: <20220721121454.1378945-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220721121454.1378945-1-cristian.ciocaltea@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: PmvaTdVQy3GeoVh_5BEv1IAUx1skmKXh
X-Proofpoint-GUID: PmvaTdVQy3GeoVh_5BEv1IAUx1skmKXh
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 21, 2022 at 03:14:54PM +0300, Cristian Ciocaltea wrote:
> Unlike most CODEC drivers, the CS35L41 driver did not have the
> non_legacy_dai_naming set, meaning it uses the legacy naming.
> 
> The recent migration to the new legacy DAI naming style has broken
> driver functionality because it is now expected to set the new legacy
> DAI naming flag in order to instruct the core subsystem to use the
> legacy name format on DAI registration.
> 
> Let's fix this by setting the legacy_dai_naming flag accordingly.
> 
> Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

It is really not intended for any CODECs to be using the legacy
DAI naming, it was only intended for platform side components.
Would be good if you had some details on the affected system and
if that could be updated to use the non legacy DAI naming?

Thanks,
Charles
