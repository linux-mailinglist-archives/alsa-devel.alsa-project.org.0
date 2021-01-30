Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93844309629
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 16:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D94116E1;
	Sat, 30 Jan 2021 16:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D94116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612019842;
	bh=Uqi9xJo20c02bSr9HnGFB/IqBqglYfV1luik2nTM9co=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKfD/fDjtAZheBUM0M8/gzfAtsAIYTQEu93sHn6DIhppEByUFIkMFApy8C1IOOC8I
	 nhXZ24KJwBQu+mLzPGPvyuK01yXYEinCrYBBK5P+9F07QGHHfSwY4hPqJjP3Wmd6ei
	 VKij5Gxle9WjhtdGN7Ao0O9K7yVXLpURlJN3RZWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F52FF801D8;
	Sat, 30 Jan 2021 16:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8C03F8015B; Sat, 30 Jan 2021 16:15:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 959C7F800E9
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 959C7F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="kNvhE+f7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10UF6T1S007664; Sat, 30 Jan 2021 09:15:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=z6O7qQU4+a8/PrtYDJjwK1tn9hCYDnZdVwKAB86IJtc=;
 b=kNvhE+f7/rZy3o5jKux9b3DY4AGoAEg2JSpjhoydPOlcluZpQNgD5c1yEOUrVidxEAwi
 2WNo/IKauPWxqzQ7MF84HwRfYjrb5BkBzfC9MnZekgxbNQjyUL02MeV0QpPYt6zUCRnw
 WPjXqNk34TKozq3EN84in72Mpgn6FaANz/Y7M+dsiT/nWjlw7q26RCuP28IuHK/6D6O2
 maWq1iCktH6iIDehwnaMTZm3aZ+u+sKavlP8IjtRLU34VpNnXq3tgWg8dyShaIPI6+m+
 JGpF6fIo+5bpoAOVOqg/qHIhUhsZl8rQsr08lrAXo0I7qCVgqIM+dwwawW94DWGwXKFp ng== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36d4rtg5xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 30 Jan 2021 09:15:38 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sat, 30 Jan
 2021 15:15:37 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Sat, 30 Jan 2021 15:15:37 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E620645;
 Sat, 30 Jan 2021 15:15:36 +0000 (UTC)
Date: Sat, 30 Jan 2021 15:15:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 07/13] ASoC: arizona-jack: Move jack-detect variables
 to struct arizona_priv
Message-ID: <20210130151536.GR106851@ediswmail.ad.cirrus.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121313.79530-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210123121313.79530-8-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=880 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101300084
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Sat, Jan 23, 2021 at 01:13:07PM +0100, Hans de Goede wrote:
> Move all the jack-detect variables from struct arizona_extcon_info to
> struct arizona_priv.
> 
> This is part of a patch series converting the arizona extcon driver into
> a helper library for letting the arizona codec-drivers directly report jack
> state through the standard sound/soc/soc-jack.c functions.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
