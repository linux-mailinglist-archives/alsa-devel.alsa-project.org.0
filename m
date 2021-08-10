Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4403E7D7E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 18:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2261783;
	Tue, 10 Aug 2021 18:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2261783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628612963;
	bh=i2FYA7Kt0PtGKszUIA5xNoUjpUc03TM0UiVRVE8VyDY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOjgfrVDqjhdXBcXE+io/gtEQ3HDb7ifXKlfSNBdHJyqHR4DdBqjtkm1Pll3G+zrY
	 XjO+IphTlT7fcoFeCAUBRALnLzPE/wfUuGW5ia3ZbSjvWih/oXzfqP0G1kM2j21W5z
	 5XVXl55u7P5jYYXfty279xyBCbXHpYhTljPr3TZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B2EBF8016B;
	Tue, 10 Aug 2021 18:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56E4FF8025D; Tue, 10 Aug 2021 18:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0DD4F8016B
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 18:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DD4F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MLRBCrXS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A75pbw008816; 
 Tue, 10 Aug 2021 11:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=O2npQgkHekRfIhp5RFEYceNfy+XR4ftl/wEb/k2M9F8=;
 b=MLRBCrXSkAZ9muYcN3HKkl2qedgasHrXl6WGjOPL6DXkJ3MKMdhCcF+rYAIxOU09nMmH
 tu6tnpM6Ff1aDWTw0SbUN9PzvA9dkUPfac7KznYbzHFbme4p8FWfAyzXKebzPUJ97rn6
 dJipgXazaZ/c3QhmS6Nh+tlmZjbiBbKRlz2AOMXWo9hRSGth+RDqDeQMO9ooR7+U0Ed8
 qirlk40I2MxnchmBNHm3yrHdqYosjftrC6gvzE5wXkLAJUHv73LhGaYRQ1cnObaRnkno
 o74Y6qbIUq/jAPSdoMWtoSWaOiupfglFyH0iZQospvydRQHSgG4LHjpkKKkgIi5gd343 cA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3abmrkgnuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 11:27:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 10 Aug
 2021 17:27:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 10 Aug 2021 17:27:46 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.221])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4416445D;
 Tue, 10 Aug 2021 16:27:46 +0000 (UTC)
Subject: Re: [PATCH 04/12] ASoC: cs42l42: Don't reconfigure the PLL while it
 is running
To: Mark Brown <broonie@kernel.org>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
 <20210810153759.24333-5-rf@opensource.cirrus.com>
 <20210810154959.GD4704@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <c194004a-2a22-5354-9042-3ce811236319@opensource.cirrus.com>
Date: Tue, 10 Aug 2021 17:27:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810154959.GD4704@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HEeDPNb_IMMg2JwbJqjEPOrF_mHE8xfr
X-Proofpoint-ORIG-GUID: HEeDPNb_IMMg2JwbJqjEPOrF_mHE8xfr
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=937 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100105
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 10/08/2021 16:49, Mark Brown wrote:
> On Tue, Aug 10, 2021 at 04:37:51PM +0100, Richard Fitzgerald wrote:
>> cs42l42_pcm_hw_params() must only configure the PLL if this is the first
>> stream to become active, otherwise it will be overwriting the registers
>> while the PLL is running.
> 
> Shouldn't the PLL code be noticing problematic attempts to reconfigure
> the PLL while it's active rather than the individual callers?
> 

It's wrong for a hw_params() for one stream to try to configure the PLL
when the other stream has already called hw_params(), configured the PLL
and started it. E.g. if you started a PLAYBACK, configured and
started everything, then got another hw_params() for the CAPTURE.

cs42l42_pll_config() could check whether it is already running and skip
configuration in that case, but that seems to me a rather opaque
implementation. In my opinion this doesn't really fall into the case of
ignoring-bad-stuff-to-be-helpful (like free() accepting a NULL).

hw_params() deals with both playback and capture streams so it makes
sense to me that it should contain logic to ensure it isn't stomping on
the other stream it already set up, rather than have everything it calls
figure out whether it shouldn't have done that.
