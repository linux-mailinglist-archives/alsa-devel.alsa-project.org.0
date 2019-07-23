Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B155471B25
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189AF18E7;
	Tue, 23 Jul 2019 17:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189AF18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894721;
	bh=Xm45J+auI3p+4LEWWeNMFwOUzOcR7Ls7d4RjYkup3Ew=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m0V4x4GP71VfLocOk4KH7stfgCDWdsAEhaCUHClbBUXzs9XUe/yDpuSmMGYqkobzW
	 tSIVHiowuxNFpPp601yjGC6g0AU2k9gEXPh161xDwZOgT2tXeLVWA2JyR2vDfVAATo
	 rE80NrHkPSzcyEH+e4YBc5WD5shNXXlNnQ7MoeFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8051EF803D0;
	Tue, 23 Jul 2019 17:10:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED21DF80447; Tue, 23 Jul 2019 17:10:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5337EF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 17:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5337EF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="M9IKSgva"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6NFA999032127; Tue, 23 Jul 2019 10:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=rR1RiKHMViJgd9A454CT+s327PV9JXUGjTgiT2EYPUU=;
 b=M9IKSgvaSyyafFyzVM1aYb8aMJ2kVRC6EmFpvD1GFwmBV4c8/HU/OHtPAlSbJ0ElGqXF
 qT5iZ6aNmjro6bYVhsmD36mljXeVvvOH4v5P57J4+1K1E1IAhiUy8KcXbc45WICXHqPa
 PWoG4yKyJNZCBKAjHs0djzNyGeN8Xo0wpJCdX/lppptBKKxWWG1sKn5rQ0P7pHknL9+C
 RvM9wkDdsBFfbEVqbT0NIs/R5wF6kMsU4K8RVjLstWujbau+jXkFL2bQSQAdZ+aSH9qi
 Yge8B8PwGThuIgsqG/+qY08v3DpjBkyD8iuZZyQhaZlr3AXTvGpwqhbyxukp3uaZW3gt Mw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2twm3qsaw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 10:10:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 23 Jul
 2019 16:10:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 23 Jul 2019 16:10:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 11DDC45;
 Tue, 23 Jul 2019 16:10:07 +0100 (BST)
Date: Tue, 23 Jul 2019 16:10:07 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190723151007.GQ54126@ediswmail.ad.cirrus.com>
References: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
 <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
 <20190723081706.GL54126@ediswmail.ad.cirrus.com>
 <026ea350-db7b-d78c-cae5-e03cf735607c@intel.com>
 <20190723150125.GP54126@ediswmail.ad.cirrus.com>
 <20190723150302.GH5365@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723150302.GH5365@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxlogscore=939 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907230152
Cc: patches@opensource.cirrus.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: madera: Read device tree
 configuration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 23, 2019 at 04:03:02PM +0100, Mark Brown wrote:
> On Tue, Jul 23, 2019 at 04:01:25PM +0100, Charles Keepax wrote:
> 
> > Ah.. yes I follow. Yes this is intentional, all the DT fields in
> > question are optional so the driver should proceed if even if they
> > are corrupt or missing.
> 
> If they're present but unparsable you should probably say something
> about that really.  That's clearly different to optional.

The helper logs an error message itself since essentially the
only difference in the messages is the name of the property,
there is just no need to process the return value since we
would take the same code path regardless of failure or success.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
