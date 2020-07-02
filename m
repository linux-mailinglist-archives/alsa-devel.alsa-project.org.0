Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CA8211FEB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 11:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8294E16D2;
	Thu,  2 Jul 2020 11:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8294E16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593682285;
	bh=n4dvV1XkBOw1b2ou31MqwcZPGaT8nhOR7VL5KQL0pwk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3ErFUUUElN8vLk56jUKuLr3gkbzmQVa+d3my8PLESIhSy10cWYZ9f5KrgWgjawTF
	 Xz4ZQ8cmmKLb6qpUKOzuvKQk0TEBAvOzIvk7Iut+Af714lBba7Le2QibjVGerfyZrY
	 8eI1qEBzvcMDFNJxhs4U/mHV3xt2fXG/0+x3hOBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CEDDF80245;
	Thu,  2 Jul 2020 11:29:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03325F8022D; Thu,  2 Jul 2020 11:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C6C6F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 11:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C6C6F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WZQ6L/Qj"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0629GRWs025172; Thu, 2 Jul 2020 04:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=w/ZS+NN9FMNqtzEq9OQKf0Dckp7KEUTUNyMoLvBWt9c=;
 b=WZQ6L/QjPlMClTw0JnquXUosNNOeyziiyBkJf/gVbYIDDOOZUAOC/SJ3ll1GciP3iy6C
 bw0QvzHkfthhYIi0pb68qy3uqUjG+Qkew3rdcF/r9Nsc+WP5DyvkJj4a9TeZcLjLnejd
 OU0C0NSEuQZPPQNYq6kzWk+vhRpq9+usv1+NQOSjdxnUiO34EyiBZCaZR+oNHJN5RSR0
 jlDzLg6Jix5Se/5fzuTcNYB+TQyjkQ42kuFIsQnUrf6FeuKSN1rPFv8HvMaP9pEmG7hf
 SFUNnuRW1JlzxI0dN6GZrWgsjAH5m9qiftjFAWyfSbOv5/2vpplxh5T3eASpNHmZtKtl rQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 31x2hpy9ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jul 2020 04:29:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 2 Jul 2020
 10:29:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 2 Jul 2020 10:29:30 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A13B7448;
 Thu,  2 Jul 2020 09:29:30 +0000 (UTC)
Date: Thu, 2 Jul 2020 09:29:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <puyou.lu@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: wm8974: fix Boost Mixer Aux Switch
Message-ID: <20200702092930.GM71940@ediswmail.ad.cirrus.com>
References: <1593657025-4903-1-git-send-email-puyou.lu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1593657025-4903-1-git-send-email-puyou.lu@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=736 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 cotscore=-2147483648 suspectscore=1 priorityscore=1501 spamscore=0
 clxscore=1011 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2007020069
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
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

On Thu, Jul 02, 2020 at 10:30:25AM +0800, puyou.lu@gmail.com wrote:
> From: Puyou Lu <puyou.lu@gmail.com>
> 
> Clear BIT6 of INPPGA means not muted (Switch On).
> 
> Signed-off-by: Puyou Lu <puyou.lu@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
