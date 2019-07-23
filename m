Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F161C713D7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 10:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32EEB185B;
	Tue, 23 Jul 2019 10:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32EEB185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563870152;
	bh=uu6nQvTo2mabCAE/EXkbpv9Cs0ouUbfhEam2/V1rFJ8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcUMXz5oiNTTPedOOqsSwBbaKt0WAbCXHKADs27ef/kIVbM4aSyntPjZ/3ayuIoyi
	 43viCNItlPcTVk8q7pbZIeANhmD1TsCBJSV4tsI0CArtnEY+ChumhL1r1Qi7OpTMV+
	 E1EVKkW9caxxnnROTEpQ3H4lb9IH2z48Q4rUTeh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5976BF8044B;
	Tue, 23 Jul 2019 10:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134C9F8048D; Tue, 23 Jul 2019 10:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCBD0F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 10:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCBD0F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nHBsCqvV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6N89MhE003240; Tue, 23 Jul 2019 03:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=heXrm67tJbWK9vFgpwEGtkNoldgh/gCYsC/MIRgclb8=;
 b=nHBsCqvVOVpDWipMzE+vNhOjQdmNOcVHSkoqs1HYrM70WGIzVGnerScEQkC6M4YCeiw+
 B2plh9m+DnuhDz8EKwXqZmVsRyAnqHB5y1GzLruIx9QVNScn3/WWrg9nxAhRgAVl+9iW
 sLrtlew8KBihWRw9h64wfYboDLh7X1fPvUma4svQBCD7YAtaWgMgrKOaPFNDPc4QxDCN
 RwM2AsC3lkhj3pkY0DYKVCrSZeq92GbRwNVHv2QU9LsyaarTwGqmGcG5jW6/mLoygF6V
 mKGQsenfGsHkdEA+rnmrQEHWbDy8IRANf7W5lx4r4M66GqpO/KstN5Snfd6IyuEJyS+d yw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2twm3qrrgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 03:17:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 23 Jul
 2019 09:17:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 23 Jul 2019 09:17:06 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 695D545;
 Tue, 23 Jul 2019 09:17:06 +0100 (BST)
Date: Tue, 23 Jul 2019 09:17:06 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190723081706.GL54126@ediswmail.ad.cirrus.com>
References: <20190722135209.30302-1-ckeepax@opensource.cirrus.com>
 <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a6ca46b-9ca7-6c91-6aa9-d1be785c64c5@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907230077
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

On Tue, Jul 23, 2019 at 12:07:32AM +0200, Cezary Rojewski wrote:
> On 2019-07-22 15:52, Charles Keepax wrote:
> >+static void madera_prop_get_inmode(struct madera_priv *priv)
> >+{
> >+	struct madera *madera = priv->madera;
> >+	struct madera_codec_pdata *pdata = &madera->pdata.codec;
> >+	u32 tmp[MADERA_MAX_INPUT * MADERA_MAX_MUXED_CHANNELS];
> >+	int n, i, in_idx, ch_idx;
> >+
> >+	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode) != MADERA_MAX_INPUT);
> >+	BUILD_BUG_ON(ARRAY_SIZE(pdata->inmode[0]) != MADERA_MAX_MUXED_CHANNELS);
> >+
> >+	n = madera_get_variable_u32_array(madera->dev, "cirrus,inmode",
> >+					  tmp, ARRAY_SIZE(tmp),
> >+					  MADERA_MAX_MUXED_CHANNELS);
> >+	if (n < 0)
> >+		return;
> >+
> >+	in_idx = 0;
> >+	ch_idx = 0;
> >+	for (i = 0; i < n; ++i) {
> >+		pdata->inmode[in_idx][ch_idx] = tmp[i];
> >+
> >+		if (++ch_idx == MADERA_MAX_MUXED_CHANNELS) {
> >+			ch_idx = 0;
> >+			++in_idx;
> >+		}
> >+	}
> >+}
> >+
> >+static void madera_prop_get_pdata(struct madera_priv *priv)
> >+{
> >+	struct madera *madera = priv->madera;
> >+	struct madera_codec_pdata *pdata = &madera->pdata.codec;
> >+	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
> >+	int i, n;
> >+
> >+	madera_prop_get_inmode(priv);
> 
> Hmm, madera_get_variable_u32_array calls are not permissive within
> madera_prop_get_inmode yet here they are. Is this intentional?
> 

Apologies but could you clarify what you mean by "not
permissive"?

I can't see anything that would prevent the function from
being called (indeed it builds and works), and the binding
documentation does specify that this field can be of variable
size.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
