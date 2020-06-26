Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFF20B003
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jun 2020 12:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595A41689;
	Fri, 26 Jun 2020 12:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595A41689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593168431;
	bh=4G7vg+Ka2G1q/KlyULnBxayeO4j0d+prAJASY+o1o/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lb+YtXolXdqWjvGvlh7zx5CyZFZ5qIvzaGWsveY0HOYCuowYi1UwJzplNy8B9359W
	 QmiAOri9LD02rQGJjJyVR+XQsvqJsUXlw9CHzYE468IkKdEtOnh/wAbUbvjGslpmKa
	 jK76dSanvsBoDjxTRJruE9AK9zHB32iUb429dcUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 807ADF80162;
	Fri, 26 Jun 2020 12:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAF65F8015B; Fri, 26 Jun 2020 12:45:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8264DF800F1
 for <alsa-devel@alsa-project.org>; Fri, 26 Jun 2020 12:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8264DF800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TKKXIlNZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QAcXan005493; Fri, 26 Jun 2020 05:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yuqVxib/OfeKhWvQNRZsWQpeJuc2MCZD82snGcZPbvY=;
 b=TKKXIlNZhrtCtrvcPLS2cTAD7q+rVFd+GWHM0kAfDLc7UwW4e86BKpn63LAJeT27dbnc
 k5ZDgpdRHHvfebakcOLVhcfz9xjHzFCzmRAMircnpCg8PKo3eeMoNHSgEtZ0zwGw7Q+9
 x5E1hQBcEEwa8sCWwCq+wK4q7UXOFnQsXQMHFLIVEKBj9L6SumY2TY3mbcqE0/dJ3mlc
 7+2psNNivT7ldMeNIF0H4BY3nOZFwKF5uj7fVPqhtf9btUYY8RKMDhOgfvyBzWi0M8RI
 oQr4wh+Q8d//Bk30lch0Cw9OPvq7fk+6JUJFZ2WmPcAxSIpwrB+pYf88rMr6v0vxuazs mA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 31uus3c4ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 26 Jun 2020 05:45:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 26 Jun
 2020 11:45:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 26 Jun 2020 11:45:19 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CAF212C5;
 Fri, 26 Jun 2020 10:45:19 +0000 (UTC)
Date: Fri, 26 Jun 2020 10:45:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200626104519.GD71940@ediswmail.ad.cirrus.com>
References: <20200625154651.99758-1-vkoul@kernel.org>
 <20200625154651.99758-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200625154651.99758-2-vkoul@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0 cotscore=-2147483648
 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006260077
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Thu, Jun 25, 2020 at 09:16:49PM +0530, Vinod Koul wrote:
> So we had some discussions of the stream states, so I thought it is a
> good idea to document the state transitions, so add it documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
