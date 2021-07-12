Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 965113C462C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 11:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF45166C;
	Mon, 12 Jul 2021 11:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF45166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626080676;
	bh=DPQd6nHXrw2vQLTJwKFGMm1umqZR+PkM4lAZM57PjXg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lKzgPnaY0kxGh8aNiRnmrYSOhs8BpQxMAIxesYhQGQNDkcg3+dwD3GZo9XxJVidKk
	 e6+670AxLYdbAHhVPxSnspBEupb186WO5KowM9UjLW0V8dFk20OOxVq4nTw7bEP0kF
	 if/EAX4B7GW2pWLwRg500PrAHpfuhlT7xkYQXJ4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75D60F80083;
	Mon, 12 Jul 2021 11:03:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69196F80254; Mon, 12 Jul 2021 11:03:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC49F800EB
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 11:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC49F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jilRwAHY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C91Y7I011920; Mon, 12 Jul 2021 04:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=RZn3JkWO0ROq0cZt5Om8gamOQWLCYckW8ZsXwdXRSoE=;
 b=jilRwAHYkKk0jvxQJRnNF62PgNrB+y+tKOhFFar7yMkeK9U1GE+qHNChle5grV6wU5YY
 AqPE3GQwqFn2dNgyUJ66EIodHqoKsGWEXXGCe1ebfSqyYd+E+GXR1pRq8A+nLCFdUHuR
 lMl8uW+VpfbCQCzl0wkvuKE7/Py29pg3X03Q6RoEaN0e14QE0Bhc05RFFaQz9v53149n
 wYrbqOUqcO91f0iEFHNxbe9SIoVRDQ9cqNCxshKQZMrJNPQ0ndEUoJno2cIYNymxHDXy
 GH9z3P8nUMl01el/nEj1xe4VMmaJWOS8wbDW0Tiu81/oKFz805/aDiXrgdYhlzLG0NzJ Fw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39q7ynhpsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 12 Jul 2021 04:03:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 12 Jul
 2021 09:32:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 12 Jul 2021 09:32:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8412B45D;
 Mon, 12 Jul 2021 08:32:54 +0000 (UTC)
Date: Mon, 12 Jul 2021 08:32:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210712083253.GG9223@ediswmail.ad.cirrus.com>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
 <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
 <20210702120810.GA4416@sirena.org.uk>
 <2a795a56-0b3d-069b-b31d-b8cee0b89f4f@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2a795a56-0b3d-069b-b31d-b8cee0b89f4f@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: WFwTvvOWDttuxvkQyfdbHHp4l94aj1fG
X-Proofpoint-ORIG-GUID: WFwTvvOWDttuxvkQyfdbHHp4l94aj1fG
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=927 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120071
Cc: robh@kernel.org, brian.austin@cirrus.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 david.rhodes@cirrus.com, Mark Brown <broonie@kernel.org>
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

On Fri, Jul 02, 2021 at 10:23:52AM -0500, David Rhodes wrote:
> On 7/2/21 7:08 AM, Mark Brown wrote:
> >On Thu, Jul 01, 2021 at 03:22:53PM -0500, David Rhodes wrote:
> >>On 6/29/21 6:51 PM, Pierre-Louis Bossart wrote:
> On 6/29/21 5:27 PM, David Rhodes wrote:
> > +	unsigned int status[4] = {0, 0, 0, 0};
> > +	unsigned int masks[4] = {0, 0, 0, 0};
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(status); i++) {
> > +		regmap_read(cs35l41->regmap,
> > +			    CS35L41_IRQ1_STATUS1 + (i * CS35L41_REGSTRIDE),
> > +			    &status[i]);
> > +		regmap_read(cs35l41->regmap,
> > +			    CS35L41_IRQ1_MASK1 + (i * CS35L41_REGSTRIDE),
> > +			    &masks[i]);
> > +	}
> 
> Pierre is correct that both arrays will always be fully initialized
> with regmap reads in the loop before any other access.
> Without the explicit initialization, an analyzer that is not as
> smart as Pierre will tell me that the array values can be used
> uninitialized later on.
> Presumably the tool does not unroll the loop to see that every array
> value is assigned.
> 
> So I don't think I have an actual issue, but I am just shutting up
> the static analyzers, although I do think I fixed what they were
> telling me.

This isn't quite correct the static analyser is flagging a real
issue here. The issue is because the return values from the
regmap_reads are not checked, if regmap_read fails then that
index in the array would not be initialised and then gets used
later. Now if the read failing isn't a situation the drive is
bothered about initalising to zero is probably fine. So I guess it
doesn't feel to me that the code particularly needs changed here,
but certainly the warning if you remove the initialisations is real.

Thanks,
Charles
