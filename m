Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF36971B0E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 17:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627A718C1;
	Tue, 23 Jul 2019 17:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627A718C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563894385;
	bh=id7i9nUaROjnaxknPzYScdCuqfXas4oR9f9E6A13BB0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnCpB1fRrnypamjZGoYi10vlYZfTduN5zROfQdNk1pYz+Zu+0t/wXd7c6Q2Cc0tf0
	 VsURaFvrhxRJlOt9cGoNSjZetEka42fyU9fOrrYS03Dq0fSenEEp59B2p6JIF+tdEe
	 Ks1O0TZU+d9SKHpzj24DMnZdb8GM+dWnDwsj2xHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66BB9F8045F;
	Tue, 23 Jul 2019 17:01:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 627A9F80448; Tue, 23 Jul 2019 17:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E37C2F803D0
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 17:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E37C2F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Uk13UIGq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6NExGZH030306; Tue, 23 Jul 2019 10:01:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=gRqnNNmACYJNNT7eO3cnirVA8gnHYZn0oFzvuPprQH8=;
 b=Uk13UIGq/723t67AhG74LMicMaFgfegSjzqfjcVli65BUDRVgQ45F80F8zuR1/ovjJwc
 Y7pHH+19PbR1gTh9COZvsL4TBJHomivh3tMIqj/AGbml4Jylh/iCvNmXGHCv+xDX+y/p
 FsUjvbm2E8z3FsK6vfeinZfyROQhrh2d5XSMHU92CY2qeULHKAyW8OOmKTaA8DkwvMez
 aVINhaikZkW4mudMuu0sjmdDFYRWCE7bTFtjR6k7esNJTpgfWQr0T3x9EbqqGgZgpgjJ
 ftSAsH0OW4hLAUbNz06K/DtnCKOwo6S2vaID16vSok6SXwwZkGObV8mDN7xZkjmj6M5c QQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2twm4ch9w2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 10:01:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 23 Jul
 2019 16:01:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 23 Jul 2019 16:01:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE975447;
 Tue, 23 Jul 2019 16:01:25 +0100 (BST)
Date: Tue, 23 Jul 2019 16:01:25 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190723150125.GP54126@ediswmail.ad.cirrus.com>
References: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
 <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
 <20190723081706.GL54126@ediswmail.ad.cirrus.com>
 <026ea350-db7b-d78c-cae5-e03cf735607c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <026ea350-db7b-d78c-cae5-e03cf735607c@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1904300001
 definitions=main-1907230150
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
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

On Tue, Jul 23, 2019 at 04:21:41PM +0200, Cezary Rojewski wrote:
> On 2019-07-23 10:17, Charles Keepax wrote:
> >On Tue, Jul 23, 2019 at 12:07:32AM +0200, Cezary Rojewski wrote:
> >>On 2019-07-22 15:52, Charles Keepax wrote:
> >>>+static void madera_prop_get_inmode(struct madera_priv *priv)
> >>>+
> >>>+	n = madera_get_variable_u32_array(madera->dev, "cirrus,inmode",
> >>>+					  tmp, ARRAY_SIZE(tmp),
> >>>+					  MADERA_MAX_MUXED_CHANNELS);
> >>>+	if (n < 0)
> >>>+		return;
> >>
> >>Hmm, madera_get_variable_u32_array calls are not permissive within
> >>madera_prop_get_inmode yet here they are. Is this intentional?
> >>
> >
> >Apologies but could you clarify what you mean by "not
> >permissive"?
> >
> >I can't see anything that would prevent the function from
> >being called (indeed it builds and works), and the binding
> >documentation does specify that this field can be of variable
> >size.
> >
> >Thanks,
> >Charles
> 
> No worries. By "permissive" I described the usage of
> _get_variable_u32_array within madera_prop_get_pdata. In
> madera_prop_get_inmode you do care about the return value. In
> madera_prop_get_pdata however, you ignore all of them. From
> _get_variable_u32_array declaration, it seems function may fail.
> Sometimes it's desired to be permissive, simply asking if that's
> intentional.
> 

Ah.. yes I follow. Yes this is intentional, all the DT fields in
question are optional so the driver should proceed if even if they
are corrupt or missing.

madera_prop_get_inmode checks the return value because additional
code is required to insert the values into the pdata structure, so
that code should be skipped in the case cirrus,inmode is not
present/fails. Most of the calls in madera_prop_get_pdata are
self-contained not requiring further handling other than reading
the data directly into the pdata structure. Uou can see the same
on the read of cirrus,out-mono the additional processing is
skipped in the case of an error.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
