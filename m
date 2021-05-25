Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73383905FD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 17:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3101741;
	Tue, 25 May 2021 17:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3101741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621958275;
	bh=ybjztAC+C2wtUJQLIpb+1z9tNNZmC4XRH5zbGdi+1ko=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PmdTHeqVkOL4uXlsJg7z4ZpzuxoORa/bETH1vmQ/DL6qqf3RT4LAZ4ucwryvtDiCF
	 OV2jmPqLQzsixM0fzgqd/8M38lgLnP39ybXMbYOghj1qaI9JOt5fcPCo2S8qg2zRGI
	 dUmWdT2SsXzcinWZo/+ic4OPWB34U3ARYayvuM7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCABF800C9;
	Tue, 25 May 2021 17:56:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CE55F800CB; Tue, 25 May 2021 17:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E144EF800AC
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 17:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E144EF800AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nF5ygvZC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PFlE5W011728; Tue, 25 May 2021 10:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=0CPhgMB2lgOup1kygifBFb39H803MbQgcG6514/E4h8=;
 b=nF5ygvZCgxxCqFQ2GAsQh+J/YbmAC3si9oXzKrItCB/2XYi7F+NDh4ovQzAvvw+FLlIf
 DfTtXDevS+G9iZwXC3Ua/mKtJQSRG428riWHxCSY3uu0BOBrlYisw2UMWN+5C6efjuOM
 qR9nkqKd9zQMzelj4dPLgr/xiUn5K30k6rog0vGcWyt2mSHlNiHFfqtXZw8JGgXDz132
 kpLCcyRg4nAhVn3zONfmSMQJ9T+W/XW4JYoQukUYXYV7tw8aaVf1eNdsUGXvjNrnsAot
 f98qYgYnEbsg22v5RhHbyujQ62hAkmcmHbOi+LpQuWJTo+IHZZesy7+yK+C/F6ZPRZFw 8g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38r7ck9xmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 May 2021 10:56:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 25 May
 2021 16:56:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 25 May 2021 16:56:12 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A51CD11CD;
 Tue, 25 May 2021 15:56:12 +0000 (UTC)
Date: Tue, 25 May 2021 15:56:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: cs42l52: use DEVICE_ATTR_WO macro
Message-ID: <20210525155612.GN64205@ediswmail.ad.cirrus.com>
References: <20210524114239.7960-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210524114239.7960-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 3p6-TkACwukyvofnZ_frdG3D58RMClOd
X-Proofpoint-ORIG-GUID: 3p6-TkACwukyvofnZ_frdG3D58RMClOd
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=913
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250096
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, tiwai@suse.com, broonie@kernel.org,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org
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

On Mon, May 24, 2021 at 07:42:39PM +0800, YueHaibing wrote:
> Use DEVICE_ATTR_WO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
