Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606BD1B0677
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 12:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA8311672;
	Mon, 20 Apr 2020 12:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA8311672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587378154;
	bh=Wx9Aqok3g6Y37Al1gYcFCoYRflZolDPeMHx1CDRsfT0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uCuFCKKxbqU2IV94qBHR5JqsL6is8ADpMHiHE5ih3zXnjD/aD5xnrbYCuX3rrDfjf
	 8O+/bpBlk+YRBa+EBCnLNoTE7yJAbimz0W2Ip3dXWitQHxXkZTVaCtA0CuMP8eDiGo
	 a5LnEU2orFuazgWSh+k7yDWMuPygZaN7t8CUPO9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C444F8020C;
	Mon, 20 Apr 2020 12:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5581CF801D9; Mon, 20 Apr 2020 12:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCF61F800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 12:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF61F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iTkrZKvQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KAHvms020023; Mon, 20 Apr 2020 05:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2LG4bVGJSX8kaa/mVzzhOMC3cdmYj8ZDluEr+iaC/lA=;
 b=iTkrZKvQuu6FTFYSPh4ZjgxJ9NZ6kji5c07gafaYSSn3GkX2icr8frjJB/OC9n9OwETT
 fWZ50Zxtwl/EG6AF6BMU008h7PnMo8h99za9bNavSIWiGykSCfUs2om4piUgneqG4DgX
 0bdS4R3VBWg793RhQWlXu1Y/g/prkHRZN6zFW+mirl2NNRm/b2T7q0H348oCiWFllJjt
 ZxUT0qjU4MOh9U2Ui2sPen8YyPTxPCaqGLjxTqd2SgK9lLpseX+tkszCkZObuTmmZ8Go
 Rt+AOo4hXG3UYpqEZ0xHXV00DKOBQVUHTZPPaFRCKyEPZ/zvFCovATmjVFdO+HqnvBY6 ow== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 30fxy4atc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 20 Apr 2020 05:19:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 20 Apr
 2020 11:19:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 20 Apr 2020 11:19:23 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8180E2AB;
 Mon, 20 Apr 2020 10:19:23 +0000 (UTC)
Date: Mon, 20 Apr 2020 10:19:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Alexey Shinkin <alexshinkin@hotmail.com>
Subject: Re: wm8960  codec driver question
Message-ID: <20200420101923.GA44490@ediswmail.ad.cirrus.com>
References: <BL0PR01MB4802ECF9650E33DCAA7FEFEDAFD80@BL0PR01MB4802.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL0PR01MB4802ECF9650E33DCAA7FEFEDAFD80@BL0PR01MB4802.prod.exchangelabs.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=923
 malwarescore=0
 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200092
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On Thu, Apr 16, 2020 at 04:24:18AM +0000, Alexey Shinkin wrote:
> 	/* Turn it on */
> 	snd_soc_component_update_bits(component, WM8960_POWER2, 0x1, 0x1);
> 	msleep(250);
> 	snd_soc_component_update_bits(component, WM8960_CLOCK1, 0x1, 0x1);
> 
> 
> What is the reason  for the 250 ms delay ?  I did not find anything
> related in the chip datasheet .
> 
> I found the delay very annoying in my app that generates an
> audible feedback to touchscreen events.  Looks like it is safe to
> comment out the msleep() call  , could there be any implications ?

Almost certainly this is providing time for the PLL to lock before
turning on clocks dependent on this. If you reduce the value some
systems might progress before the PLL is locked which could cause
weird behaviour. Although might work fine on other systems,
removing it all together is probably a bad idea though.

Thanks,
Charles
