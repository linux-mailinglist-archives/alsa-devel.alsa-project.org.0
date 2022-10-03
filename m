Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A895F2EA9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 12:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A4C221D6;
	Mon,  3 Oct 2022 12:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A4C221D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664792005;
	bh=GRKg2L6cqpiJl3Cag3SecMi8tlSlVRhdYPx5ta0wBPs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CSykj5In4yT+w3tRZPJTFITN7+dYQlvZzZbYm8SiX1qF4KLqu/hF1fI53CU4evmYc
	 FpsrZEGjDpu1odoH1hGnHOOgIe2n54qINc/+WaDr+Xx1pv5AN4v4wxyh4PagWSxHYr
	 3mpp9yCZS6z4hVdHl/Sn80JfzjVPeMXOdPIpP5mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D60AF800C1;
	Mon,  3 Oct 2022 12:12:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B2EAF80269; Mon,  3 Oct 2022 12:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E91EF800B5
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 12:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E91EF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="X/q7mn0U"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2936CCm8000542;
 Mon, 3 Oct 2022 05:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3pq2w83fAQz6lG7yf/bYiQNWBrKnuniVMi/7oU9hWOA=;
 b=X/q7mn0UK0JNbpErBcYSbo6qSmU9wRixQ7YDTIEunVtmWMiOAG3chSVkGu+xhdJ8iYwH
 d06pfwfBSc3ZPj17dotzWshpEas+WD94/pOc8lCzeFAp85TfeU4VjPZZidWbJ3yMWHCA
 xQcnirFPFwHET0ggof1ma5Geuzzast/e6wwqL6+cAFQkE0OM+sDjRrWoHDJwxVWpTPhh
 Z2G5/aTB2sK/OgMJZgZnkp7JcTvFH5eZNu1McSD95x6prqth8yw5MEntSvN67LzRwGvp
 hsIlcJu26WAQmARnv1GlpvULitpVYhLFKj0Ucf9IkY/UGzPUlupxMTfHHKYjlRpGZwIo BQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jxhyq21tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Oct 2022 05:12:26 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Mon, 3 Oct
 2022 05:12:25 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Mon, 3 Oct 2022 05:12:25 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 68EB115A3;
 Mon,  3 Oct 2022 10:12:25 +0000 (UTC)
Date: Mon, 3 Oct 2022 10:12:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH v2 3/3] ASoC: codecs: allow WM8961 to be selected by the
 user
Message-ID: <20221003101225.GA92394@ediswmail.ad.cirrus.com>
References: <20221003032414.248326-1-doug@schmorgal.com>
 <20221003032414.248326-4-doug@schmorgal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221003032414.248326-4-doug@schmorgal.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: V1-YgdPbklRz4biBRefDHAKPqU6SbQA_
X-Proofpoint-ORIG-GUID: V1-YgdPbklRz4biBRefDHAKPqU6SbQA_
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Sun, Oct 02, 2022 at 08:24:14PM -0700, Doug Brown wrote:
> Allow the WM8961 driver to be enabled independently now that it is
> usable with devicetree.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
