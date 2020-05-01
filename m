Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2551C19D3
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 17:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A5316A4;
	Fri,  1 May 2020 17:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A5316A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588347592;
	bh=8RI0kSnr/Xi+7hyJf5KRp9j0YGOavTNOcLXXlW6Klh4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPCkdeyxcYnQUAZseBjI5BIL7WJ2kStpE7DoCW0+3fs7r92SQwQP42SCpg9h6e99Q
	 +7CvO8CuMYyQCRibYUvQqa/kZPVqv7MwiDweLx2QVrmNFLFHqG2w5ZH7UFHcN57bbz
	 oGlW+kLo17t42s02do2uaHzAxi8+v/UQZf7B3GCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9F1F800E5;
	Fri,  1 May 2020 17:38:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9217F8022B; Fri,  1 May 2020 17:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71587F800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 17:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71587F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="olcDTUG5"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 041DvKvJ019635; Fri, 1 May 2020 08:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=JzGqBIQszLu//+K3RgyjRVgYmCjC0eyp591kUihnjjw=;
 b=olcDTUG5L43shFMXwWoSRFqQCJ6rf1+sS+6IfQRtknWZEMgse4JyCVol2dlyaQO1dIv3
 RQULtVHb2mFr206A4+M5+MSZboaPSOn9ZUfJbCzr9QwLSdwQ5iRx5kZM+rBXEiHzNgFp
 8+Z5hugcGI4IqKPTkTm87Q5ZSMmDLVsdDxtzofu1+7H/02MFrvjasK/iQrXOedjyeMsi
 g8el1KSP2qOywMzH5jghwuTGMECa+5WGZTli4q+e4p/Hdg3zFpJWgmB1RfBfYaZ6CjKL
 lnmF2xi/prlkvUACK0OOKRyi05H13n/3ynoD/vqIWskgGdGB6/m18LskVeX9xSPiZcwJ Tw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 30r7eg91ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 01 May 2020 08:58:54 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 1 May 2020
 14:58:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 1 May 2020 14:58:51 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CD583448;
 Fri,  1 May 2020 13:58:51 +0000 (UTC)
Date: Fri, 1 May 2020 13:58:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: sound: wm8994: Correct required supplies
 based on actual implementaion
Message-ID: <20200501135851.GP44490@ediswmail.ad.cirrus.com>
References: <20200501133534.6706-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200501133534.6706-1-krzk@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=757 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005010109
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jonathan Bakker <xc-racer2@live.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Fri, May 01, 2020 at 03:35:34PM +0200, Krzysztof Kozlowski wrote:
> The required supplies in bindings were actually not matching
> implementation making the bindings incorrect and misleading.  The Linux
> kernel driver requires all supplies to be present.  Also for wlf,wm8994
> uses just DBVDD-supply instead of DBVDDn-supply (n: <1,3>).
> 
> Reported-by: Jonathan Bakker <xc-racer2@live.ca>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
