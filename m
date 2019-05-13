Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0F1B1C4
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 10:17:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FECC16E5;
	Mon, 13 May 2019 10:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FECC16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557735439;
	bh=DrUIAT41GnL8HXBo+WmGY60Lb/Hu5ZcNJ72rERjIZS4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4Nz7pxxcZaVVM0/x4X3YmfBqqdEp9cee6t3EK0ZpB5Xh6yi5M1pfJpBrIseRq3P/
	 Uycml+hS7z2Zq9EFIPJmyIUUTFDD/PQjfx9dYNefChqrw7oebu2tnwceRf5l0Os7ZZ
	 VsvZ5dNl4QHG5XMCnOzqWNaTMGTNoUldPT1uKaRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D124F896B8;
	Mon, 13 May 2019 10:15:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E9B3F89684; Mon, 13 May 2019 10:15:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7284EF80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 10:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7284EF80733
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4D89QCh015186; Mon, 13 May 2019 03:15:23 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2sdusy2arj-1;
 Mon, 13 May 2019 03:15:23 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 0A979611C8AD;
 Mon, 13 May 2019 03:15:23 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 13 May
 2019 09:15:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 13 May 2019 09:15:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CA94F2A1;
 Mon, 13 May 2019 09:15:21 +0100 (BST)
Date: Mon, 13 May 2019 09:15:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Daniel Gomez <dagmcr@gmail.com>
Message-ID: <20190513081521.GE45394@ediswmail.ad.cirrus.com>
References: <1557569038-20340-1-git-send-email-dagmcr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557569038-20340-1-git-send-email-dagmcr@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=988 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905130060
Cc: "moderated list:CIRRUS LOGIC MADERA CODEC DRIVERS"
 <alsa-devel@alsa-project.org>,
 "open list:CIRRUS LOGIC MADERA CODEC DRIVERS" <patches@opensource.cirrus.com>,
 open list <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, javier@dowhile0.org,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v2] mfd: madera: Add missing of table
	registration
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

On Sat, May 11, 2019 at 12:03:58PM +0200, Daniel Gomez wrote:
> MODULE_DEVICE_TABLE(of, <of_match_table> should be called to complete DT
> OF mathing mechanism and register it.
> 
> Before this patch:
> modinfo ./drivers/mfd/madera.ko | grep alias
> 
> After this patch:
> modinfo ./drivers/mfd/madera.ko | grep alias
> alias:          of:N*T*Ccirrus,wm1840C*
> alias:          of:N*T*Ccirrus,wm1840
> alias:          of:N*T*Ccirrus,cs47l91C*
> alias:          of:N*T*Ccirrus,cs47l91
> alias:          of:N*T*Ccirrus,cs47l90C*
> alias:          of:N*T*Ccirrus,cs47l90
> alias:          of:N*T*Ccirrus,cs47l85C*
> alias:          of:N*T*Ccirrus,cs47l85
> alias:          of:N*T*Ccirrus,cs47l35C*
> alias:          of:N*T*Ccirrus,cs47l35
> 
> Reported-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
