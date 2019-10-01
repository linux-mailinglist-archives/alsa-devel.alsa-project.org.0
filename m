Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BCC369B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 16:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042EB1683;
	Tue,  1 Oct 2019 16:03:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042EB1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569938646;
	bh=pwkfBEwpKqCS18kGsnP6H3zr7iFbc0Y2nCGRcMcpSVY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDw0P+skNP9ib80hAc4W7BPh1YKsVDfiBk8t1jfwgN9rlFfLq0TQlbyxKz5PXiqpg
	 Vt6+YLLIMM6nbg3kKOhwYZuvMOU07fJTjmwY0yGA6fO1744x975QFh86lZDMiWOBkF
	 9xAwaYWLlMrfsCmRlctZJ/XGTEPnnp8JKm0P0/Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C30F80482;
	Tue,  1 Oct 2019 16:02:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EA4FF80506; Tue,  1 Oct 2019 16:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB2C2F80482
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 16:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2C2F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="grNY1ZQz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x91DxDFb003745; Tue, 1 Oct 2019 09:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=iXl+HypeyUPile2y44yl/8fYFXUn4LWWbCsCEioNyAk=;
 b=grNY1ZQzHWXuQYms+UYxORtLS15d3g1qTZ6oYYaRcWthY0G+Svcbi7vpVm3V8ElYIFEO
 fSVR4B7RSBZm3yd0XXeLDbksN0/XuoQ6dPAsK82z6+g4JmnxeRVgRJTLU0OTRDtH52jd
 XigyXOYcAvyGWZyOzzv4yDrosx0U7k4pvEg0ZEv7XIm70dd/fjjZ1mCigrxNivej66OS
 QXt1R6sc4C8nCD7MWGURgOhocyoN5QXtXiVPCy31cYtTt+w+czOAyNIRdAug/r32913z
 f1BMrJthpoa7Ng9ygWExYhyLDgXxx7xGBdsAS+zmO0YVQxi0CQBBAODmUo+z/T+YLkhq OA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2va4x4ndej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Oct 2019 09:02:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 1 Oct
 2019 15:02:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 1 Oct 2019 15:02:11 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1CD872A1;
 Tue,  1 Oct 2019 14:02:11 +0000 (UTC)
Date: Tue, 1 Oct 2019 14:02:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <20191001140211.GT10204@ediswmail.ad.cirrus.com>
References: <20191001123625.19370-1-s.nawrocki@samsung.com>
 <CGME20191001123639eucas1p2b15309e0b0008b2627b8630082d69f41@eucas1p2.samsung.com>
 <20191001123625.19370-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001123625.19370-2-s.nawrocki@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910010126
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, krzk@kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Subject: Re: [alsa-devel] [PATCH v3 RESEND 2/3] ASoC: samsung: arndale: Add
 support for WM1811 CODEC
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

On Tue, Oct 01, 2019 at 02:36:24PM +0200, Sylwester Nawrocki wrote:
> The Arndale boards come with different types of the audio daughter
> board.  In order to support the WM1811 one we add new definition of
> an ASoC card which will be registered when the driver matches on
> "samsung,arndale-wm1811" compatible.  There is no runtime detection of
> the audio daughter board type at the moment, compatible string of the
> audio card needs to be adjusted in DT, e.g. by the bootloader,
> depending on actual audio board (CODEC) used.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
