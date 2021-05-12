Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0837B7DB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 10:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A88B18AA;
	Wed, 12 May 2021 10:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A88B18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620807968;
	bh=t5kjKQqEXmiasJpM/MN/TeLQABXdhEYxlO03Hie0f6I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NPAO6+qCHNp4vTKJQkATVZxd4ZE9NhINHaN5SFT8W+x42XOb0qVlQT0p/D7LqE9Hr
	 uEfkNTUIsOCiQZntcP7XObDBhWphONpL3wFhsPGa5hnNLFq50VdaBItReHJScM0xAk
	 O3lTQm7leL0OZaG+VmcOknSsZRNe4nCXXeJK2HgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B587F8027B;
	Wed, 12 May 2021 10:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6B07F80272; Wed, 12 May 2021 10:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25B20F8013A
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 10:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25B20F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dCnnKmcC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14C8IT55003150; Wed, 12 May 2021 03:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=cuMhQe9yq154UjGxdpGpoxEWlFJU1yPPM7Nluq0FAQM=;
 b=dCnnKmcCzaXJr9I+WG5DwrftCatf232NQFx1CMRCPhXzzKU3hoas03Q7eUMRH8W+Q0t/
 LMhtbFCsFz485dLqr31A6eRAl8TtuJJeXve/hUKkzjj1Ab1EsOA4+IF/MdYNMcwl2ouu
 iRMWcfqcpnCOPZ+BbbD48YqGjZQYSIAeCN3BvA04Pj0v/H92LAII9iSWNvMOScWU6MKU
 C6AE4g9T2k6bjpFHm4lrIC1o/FAFSI96cvo0wGmGdvPmtBhMk3ZXeZ4DAurbFnGPiKJA
 OT2v4kVwiWJlMmXa7DRuVlY1ejWngT0Efd5oCyOoek06VDZ+Ap6HYLtvYUwuKxn0uOTO 4w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 38gay8g11y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 12 May 2021 03:24:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 12 May
 2021 09:24:16 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 12 May 2021 09:24:16 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F054511CD;
 Wed, 12 May 2021 08:24:15 +0000 (UTC)
Date: Wed, 12 May 2021 08:24:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm2200: remove include of wmfw.h
Message-ID: <20210512082415.GG64205@ediswmail.ad.cirrus.com>
References: <20210511171514.270219-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210511171514.270219-1-simont@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 4zk9NxgHR7ySqQrIit--I1alLSUZNvZ4
X-Proofpoint-ORIG-GUID: 4zk9NxgHR7ySqQrIit--I1alLSUZNvZ4
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 mlxlogscore=868 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120060
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Tue, May 11, 2021 at 06:15:14PM +0100, Simon Trimmer wrote:
> We want all wm_adsp clients to use the wm_adsp.h header as they
> shouldn't need to include internal sub-headers.
> 
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
