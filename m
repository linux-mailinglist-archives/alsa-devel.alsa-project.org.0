Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBDF30040E
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 14:23:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E04281EEB;
	Fri, 22 Jan 2021 14:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E04281EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611321792;
	bh=Fr/ADTXUXb7ofXRfa5Zu7AU+FL4k+Px8FrLcUcJg+54=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDTtAqsKwZF57BCRaVi0fn6GyBOEJ5AhtHw6dzAm65J65e1N+34TjFp+6cO0vw8z6
	 iHg48LXubTYCb4d/TQYMFl/r9XMaGJYlh30TI8JSKfQBuyn3YZ0qBcBjvrJw53JtuA
	 vJbSLGMEus1wgnTicp41sS2Ri/geZTNL75exK4+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 829DFF8019B;
	Fri, 22 Jan 2021 14:21:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88041F8016E; Fri, 22 Jan 2021 14:21:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F50F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 14:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F50F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="K77Mnw9x"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10MDD3FR025324; Fri, 22 Jan 2021 07:21:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Fr/ADTXUXb7ofXRfa5Zu7AU+FL4k+Px8FrLcUcJg+54=;
 b=K77Mnw9x/nkLI+/QLfCNE/QbkVOr/aRnr2lYnkdyFAg43EVeY5SG4k6FGhB1uHGd7w+Q
 QdkbzgzSZjcEo0puhWTkz8/iOLTzUQlnKN74QRq9qXPRiOG2SYUj4lriM8EiHOYeAZnY
 EblRdqb3EuXl2fkvXykkaD3RmS/xFuPRQiq86+HC7xeniJag7LYbyhVTWu9tGkXLvtWf
 nZWeXlUGHzH/Xbg7rs/rqG3bfBhfdzrCohklg5EgEENyEWfhKRn7AEZc4JEJCh3IqKpU
 1BjWiTgQ/+LW+5SqqaTJCZrNiaRFJTkqPJLHHpWGNihcuf8hhc+YjKmPFTwcHkZfkuyA hw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36692rbp7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 22 Jan 2021 07:21:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 22 Jan
 2021 13:21:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 22 Jan 2021 13:21:27 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8AD1A45;
 Fri, 22 Jan 2021 13:21:21 +0000 (UTC)
Date: Fri, 22 Jan 2021 13:21:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 08/12] ASoC: arizona-jack: convert into a helper
 library for codec drivers
Message-ID: <20210122132121.GJ106851@ediswmail.ad.cirrus.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-9-hdegoede@redhat.com>
 <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
 <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
 <5c1f181f-f074-397d-cdba-d37ab58f9a2b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5c1f181f-f074-397d-cdba-d37ab58f9a2b@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220072
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Jan 21, 2021 at 05:55:00PM +0100, Hans de Goede wrote:
> On 1/19/21 10:51 AM, Richard Fitzgerald wrote:
> > On 18/01/2021 17:24, Andy Shevchenko wrote:
> >> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 1. Keep the code as is, live with the debugfs error. This might be
> best for now, as I don't want to grow the scope of this series too much.
> I will go with this for the next version of this series (unless
> I receive feedback otherwise before I get around to posting the next
> version).

Thinking about this more, I seem to remember this is something
that has been discussed before, having the need to have
situations where a driver and the framework are both managing the
regulator at once on the same device.

I wonder if this commit was related to that:

commit ff268b56ce8c ("regulator: core: Don't spew backtraces on duplicate sysfs")

Apologies I don't have as much time as I normally would to look
into such issues at the moment, due to various internal company
things going on.

I do suspect that this option is the way to go though and if
there are issues of duplicates being created by the regulator
core those probably need to be resolved in there. But that can
probably be done separate from this series.

Thanks,
Charles
