Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF64E91B5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 11:46:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C98621767;
	Mon, 28 Mar 2022 11:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C98621767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648460814;
	bh=ToKGoNfm2rY/nLqWRGPd9kd+Fk5HV0Uz2fLZK8Jx+ac=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OK4Qrrq1JVVqsIVMfua/49peacWQKmBrm5kFEYC2csh3fpskrIBlbQ+Hy1y/8Ap0K
	 FbVoyYk0dSJspCCLAI8lutM339XnTDzz7kt3feZnlhTstEqhH+7nPDsTVettVsOiIA
	 FY+iNXT7mh5fIPt0JWYDXEsXRc0N2zQuTXILVKZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C3AF8026A;
	Mon, 28 Mar 2022 11:45:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03529F8024C; Mon, 28 Mar 2022 11:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC91F80121
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 11:45:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC91F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KtBN+75G"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22S8AHCS030605;
 Mon, 28 Mar 2022 04:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=4V20xx4HGJbwaGDxO7BMZFwlL8ORDVBJfgXerNqNSrw=;
 b=KtBN+75GzeG9LeSwmBWbLB/eF3P2Wjza4AaBHaab+kZ/dPWagA8G3CnID7nmk1Nq3u8v
 urBxx6tDZdLbqutIgLiXERvZGVspdcLfDkszwqSfXj+EnYLisljRK2iUNrOlr9u4ptFE
 7Jm2XXqrvUK3PMkiNz9/iv8/UgGveeo6ayUmEfI3tXqNeoywcnxw73uMFG4WHA6531Yq
 F5Pw/BTcPL5Ctvf4N2ehSL20UZyrf09J31dGoPS7/fDTSCNjEx6O6k6iTNDcgbMZOahI
 LRyuNwOYfzFr19YsA7XUT1xMufN6/xKFZvCZ3xGAMMhRac01XiUl7VMA9e+zEZnuEzAL wA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3f2081ag7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 04:45:33 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 28 Mar
 2022 10:45:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 28 Mar 2022 10:45:31 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 444CC46A;
 Mon, 28 Mar 2022 09:45:31 +0000 (UTC)
Date: Mon, 28 Mar 2022 09:45:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 6/7] ASoC: wm8731: Convert DT bindings to YAML format
Message-ID: <20220328094531.GZ38351@ediswmail.ad.cirrus.com>
References: <20220325153121.1598494-1-broonie@kernel.org>
 <20220325153121.1598494-7-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220325153121.1598494-7-broonie@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ILZNgPJQrg1-B_S7O0NIrGhwfKVb8Zpf
X-Proofpoint-GUID: ILZNgPJQrg1-B_S7O0NIrGhwfKVb8Zpf
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org
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

On Fri, Mar 25, 2022 at 03:31:20PM +0000, Mark Brown wrote:
> Convert the WM8731 DT bindings to YAML format, including addition of
> documentation for the regulator and clock bindings which the driver has
> had for some time but which were not covered in the bindings document.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
