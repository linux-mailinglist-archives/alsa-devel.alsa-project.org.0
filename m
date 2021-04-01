Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E73514D7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 14:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135291699;
	Thu,  1 Apr 2021 14:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135291699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617280915;
	bh=ZRbBTkU4p5+NeIjvastSxXEsdxHQOC22xlVRgl47yfc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CELnoAwDlvgyrFnUwnTGnjt7piSj+fWj+q/I1XAvnbhGF7Q0NpWGRDl6NSbmzw6SB
	 3/Z81w0BcvIcdX7ftJCoSr0ZivQh4ba0v2I9eG5MBiCa3JqNgw9rXxYFPiZJbV7/4u
	 RtDy/9KeFlagNcCZqK7qmwRj3FlZSbi4aGfJ+Wzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C402F8026F;
	Thu,  1 Apr 2021 14:40:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5851EF8026B; Thu,  1 Apr 2021 14:40:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE867F8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 14:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE867F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JBN2pNqg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131CQciw030126; Thu, 1 Apr 2021 07:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ykBmYInzEvGFT1JMPiXc1lkaeT/jxWDhFNP9Q/A6/08=;
 b=JBN2pNqg6a9pM8wgveEEAANKekva129o80Za/JlxEa8yD9XTaahdQCrZWxWqWjBwfcYA
 0XYzN9+i9q1Ss9rGlQnUB195BidXC4ru+YqBxESdQ4N7OZLyoJecSdcAkjJpuyEvnTvt
 FNJaZW69K+/zJ8SgI/MnMCZ50GOWsh0fhKFwGI5udmLIsQlczCRU/3VhYx97IEAzXf1k
 LYUXLt17d7ZQyRHP+iKYdWEtgulGMPeNxam5CdJ2GKWfv803Y1Sz7l19l4npFT2ajTIH
 1saSDKNKacvdUPxwIl2wJKSfGee1JrZJWiO+bDuNW66PDn2kQr8QOI45ayj7ASVEpdWS JA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 37n2948wfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 01 Apr 2021 07:40:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 1 Apr 2021
 13:40:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 1 Apr 2021 13:40:14 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7C81E11D6;
 Thu,  1 Apr 2021 12:40:13 +0000 (UTC)
Date: Thu, 1 Apr 2021 12:40:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 32/32] pinctrl: update pin-control.rst references
Message-ID: <20210401124013.GT106851@ediswmail.ad.cirrus.com>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f056e1e16adff1df42416f0033fdb730169edf44.1617279356.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Io7iL6F3WDP7ZvGws1tN_zCpZy0zXWMf
X-Proofpoint-ORIG-GUID: Io7iL6F3WDP7ZvGws1tN_zCpZy0zXWMf
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=979
 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010088
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Drew Fustini <drew@beagleboard.org>, patches@opensource.cirrus.com,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
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

On Thu, Apr 01, 2021 at 02:17:52PM +0200, Mauro Carvalho Chehab wrote:
> Changeset 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> renamed: Documentation/driver-api/pinctl.rst
> to: Documentation/driver-api/pin-control.rst.
> 
> Update the cross-references accordingly.
> 
> Fixes: 5513b411ea5b ("Documentation: rename pinctl to pin-control")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
