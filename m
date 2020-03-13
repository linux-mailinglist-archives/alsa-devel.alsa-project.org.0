Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCFD18480C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 14:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABD91805;
	Fri, 13 Mar 2020 14:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABD91805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584106027;
	bh=kxaxTJVVKZVL7AmzQrIeUTzResAv1y6qY63DhKAUTAY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTM7PCQYuzRxFmDZcdX3VPOa8txLm/ZLCUYoos8+sgKIpBIKcwYfy9if0334LH1b+
	 Y1UoocG1KUAGLPx0DxB0DbnBxRNx7BlGoUeXKMKqmbjDFrIQC6RLP1n5dRFokr48x4
	 RMcW+/Gv7cNORmf7P7xxZqBh8R7/Jxx2kANU6nf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 079DAF80086;
	Fri, 13 Mar 2020 14:25:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F43F801EB; Fri, 13 Mar 2020 14:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05F79F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 14:25:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F79F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PS6US2pp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DDOf69020396; Fri, 13 Mar 2020 08:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=1g+yEZHlt2Q04R5aWwm8MjJ2eg5k6k6BPi/8vA7zXSg=;
 b=PS6US2ppZ2WT6af52sTUusw3XSBtJzLVNDcBr9MiUIsjM1BmF5u9o49+rVS7eAdjwiX4
 wXt+3lMI6DhP7Eo9xxHrxSuDemwJt+3UR11ypVZT2Eg4OYohIsQjqRchaMGDUdWLrCna
 tnzorTH+2F1h9EaoDdUsXN3B3kKyzPJqAzadyn+57EMxnFlZ9TpWy8Zf/9pA18LNmPs6
 FJRJg7txWRu6JbbTr0u7Do10CeFd+/mlTSfauvsxlCUEUOn3pUH23eWeKaroT5SpcFux
 vYHuG+5gOXRmG+V80M0j8Fi4bwBczk5BNHzkDQ8DU1H9OI6iXvh9BuJwOTptHOMPWJB7 pQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2yqt8nsmtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 Mar 2020 08:25:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 13 Mar
 2020 13:25:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 13 Mar 2020 13:25:07 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BB39F2AB;
 Fri, 13 Mar 2020 13:25:07 +0000 (UTC)
Date: Fri, 13 Mar 2020 13:25:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: wm_adsp: Use scnprintf() for the limited buffer
 output
Message-ID: <20200313132507.GL108283@ediswmail.ad.cirrus.com>
References: <20200313130334.9028-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200313130334.9028-1-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=788 priorityscore=1501 clxscore=1015
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130070
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Fri, Mar 13, 2020 at 02:03:34PM +0100, Takashi Iwai wrote:
> snprintf() is a hard-to-use function, it's especially difficult to use
> it for concatenating substrings in a buffer with a limited size.
> Since snprintf() returns the would-be-output size, not the actual
> size, the subsequent use of snprintf() may point to the incorrect
> position.
> 
> Use scnprintf() instead for fixing such potential errors.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
