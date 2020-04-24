Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E041B7005
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 10:49:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A91C1696;
	Fri, 24 Apr 2020 10:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A91C1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587718193;
	bh=TYb8yhIKE7rQ2JCZz8754ywbLKb6K2AL0yMJjoHVi6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aG4XWnj92PdEZuf3AeCK4NzEBb0lDKQolME8GEwtcKG6PIm9EosOtJdjPMbpk7MnQ
	 vLLNyFOP55GRxR3Ni6JgIFvRrCm6k/yq+hr50Q6//VNvunewg35S3tUtWGVKUv27mV
	 YgvjcUK8+h439KC2/kcffM0jCaU9XpoH7RTS8k5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF17F801D9;
	Fri, 24 Apr 2020 10:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 509F8F80142; Fri, 24 Apr 2020 10:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB49F80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 10:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB49F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gunMysvL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O8il1D028258; Fri, 24 Apr 2020 03:47:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=fXrN/vRnScSWJDcmtCru77GbgI4wSk3jscD+7uVlLms=;
 b=gunMysvL7ZtWVNTuOnAPfqQUhKNWjSLqvvKkRqm0zbqn3yR37whEPBjAXq/r0eKCf5jW
 90hlUbJ/ZaA/ESrj0qbrUV4ZVPWskncgkBNdfyw2k9HdVE8JYeAXo7xq8xndznVRoZGN
 cdyy3LjdlV2CpY+U2Bu/I+jXBnPVP3zNZbldBjyk1WvZivIaJTnmevF2Q5p1e8hmz8Ge
 LL56j7LSTo0bzZx71S2+0sliu7+3ShNfmMpAawHttOLVru+30ZgrwFtJfcUE3c+NXaqg
 OC1N6UmXVDkWUeb9RB8D+PQsRrzYYcEFi0wcbXmvPPo0gXxEkFzaS3VnQS4OYJHfAq4X rA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 30fxy4kq6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 24 Apr 2020 03:47:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 24 Apr
 2020 09:47:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Fri, 24 Apr 2020 09:47:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C5EBF44A;
 Fri, 24 Apr 2020 08:47:54 +0000 (UTC)
Date: Fri, 24 Apr 2020 08:47:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8962: set CLOCKING2 as non-volatile register
Message-ID: <20200424084754.GI44490@ediswmail.ad.cirrus.com>
References: <6d25d5b36d4b9aeb8655b5e947dad52214e34177.1587693523.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6d25d5b36d4b9aeb8655b5e947dad52214e34177.1587693523.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=667
 malwarescore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240068
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, tglx@linutronix.de, info@metux.net, allison@lohutok.net
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

On Fri, Apr 24, 2020 at 10:01:38AM +0800, Shengjiu Wang wrote:
> Previously CLOCKING2 is set as a volatile register, but cause
> issue at suspend & resume, that some bits of CLOCKING2 is not
> restored at resume, for example SYSCLK_SRC bits, then the output
> clock is wrong.
> 
> The volatile property is caused by CLASSD_CLK_DIV bits,
> which are controlled by the chip itself. But the datasheet
> claims these are read only and protected by the security key,
> and they are not read by the driver at all.
> 
> So it should be safe to change CLOCKING2 to be non-volatile.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
