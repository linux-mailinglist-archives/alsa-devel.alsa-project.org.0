Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4551006C1
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 14:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375401681;
	Mon, 18 Nov 2019 14:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375401681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574084881;
	bh=9aBZTyL0KXZrC50P2GpelGYAAB4OB5os9pmwEBrUKdE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lpo4HsF+EYGudNJ86qE2PImlERPsW6qLKy9LWF6Lh8kmNP6wsfHeCdOhOfc0H17WC
	 Ao6+HG+eq4B27I6P2nasv+ZAxjhEj4NKjIjz9hfCkmOhxLaimcga3IVsbADHnO3DRC
	 /C7F42qfM75ed8atF+vAT23FQIgGcumqv9L8MI04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BC2F80100;
	Mon, 18 Nov 2019 14:46:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5D10F8013B; Mon, 18 Nov 2019 14:46:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6E3EF800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 14:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E3EF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iZuu/ARc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAIDk8d7005170; Mon, 18 Nov 2019 07:46:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=kgedk8P1j1xy9kHnrKOzBOtC3OmjpxDmewRDw/fD/BA=;
 b=iZuu/ARcpkZGSdJb/PjqskNUxRfjM6GN4qmQwGpt4jtId4+l++flVa39tws70AHE59yc
 57kDZbbZTk+ae1fQIXghJlJxR4q2pN71xSrkIVLYrineaGKwC1Huqad+Iw75NeRGasyY
 LlEh7GQYhCMm/v8hf+/Kb7rGz7Kfr91uQMyMLu3pvDS2VkLX8pUnCECwl3Lf6qoo9093
 GJmBggCg4fxPvo9hfGPS4slK+0Z96ilNSSM4r6SpCq76y2kX4PiAxqCxC7i/b8+zEgRg
 t7NI3eRzArfEeaCa1xALdcOApYNzAovGTRW2keZkWaYQch5piIFbYXYBMymHi5VrIlsY /g== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2wafc82j9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Nov 2019 07:46:06 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 18 Nov
 2019 13:46:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 18 Nov 2019 13:46:02 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 662422C6;
 Mon, 18 Nov 2019 13:46:02 +0000 (UTC)
Date: Mon, 18 Nov 2019 13:46:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>
Message-ID: <20191118134602.GH10439@ediswmail.ad.cirrus.com>
References: <1573847653-17094-1-git-send-email-david.rhodes@cirrus.com>
 <1573847653-17094-2-git-send-email-david.rhodes@cirrus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573847653-17094-2-git-send-email-david.rhodes@cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=711 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911180125
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, Li Xu <li.xu@cirrus.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: wm_adsp: Expose mixer control API
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

On Fri, Nov 15, 2019 at 01:54:13PM -0600, David Rhodes wrote:
> From: Li Xu <li.xu@cirrus.com>
> 
> Expose mixer control API for reading and writing controls from the kernel.
> This API can be used by ALSA kernel drivers with ADSP support to
> read and write firmware-defined memory regions.
> 
> Signed-off-by: Li Xu <li.xu@cirrus.com>
> Signed-off-by: David Rhodes <david.rhodes@cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
