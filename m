Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD12F92B5
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 14:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B5E171D;
	Sun, 17 Jan 2021 14:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B5E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610891988;
	bh=0UkWh6NIgLIhhLXboJqI+HPPitKYKUiY1zJSOFW/Zss=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJtMa85dEmU4zZvIzdm0ZI3+ICznLbj+xN8G03scrAW3UlbtJWWo9LdnBuMiUYt0s
	 XE9/g6qKFDELVbF/9LYuEgDnttOiOa7jVrWZbVnnno8tm9VS0FE5ldp4io32Z4YvS2
	 hLnkb600+O25X/MKJIpWozdGdD3F2LrFuRl/RzJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 889DFF8026A;
	Sun, 17 Jan 2021 14:58:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE27F80257; Sun, 17 Jan 2021 14:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B1EEF800C0
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 14:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1EEF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CdezZa8z"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10HDvxmN020822; Sun, 17 Jan 2021 07:57:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=xE1JljvO7ZczxrfosQstnRFJWgh+VIwr03wAOheM0bc=;
 b=CdezZa8zVdzagXQvultXiLHrYOjfm/uNh0rJw0//Hz37qijqyhA4qe4xehM9mUe7+yez
 seEiUFLXbkFVcBZ91YTj3X4L0IU1omfDcVqFCa6dw/e5FoLAkVv8Fx/yvG61wvaxb3ud
 w1CE7t3sH8OkU8gLPHpI3d4eBjU27ea+iW1MArobEB20SIB5IinD418DLmtp7Y+AUAx4
 sQQEJPnfPe6O653mp4igHYXuCEiFzR2ASt4XodBBGcUJ4WU7ESikCL4FingoeI3BbJYP
 2nQ+b0h43jWxtMRQm3yjmCc4uR+fKhlyrpQV2En5NELlKkzWDwwjdyOFrPencJ1ZHom/ nA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 363x3yh1nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 17 Jan 2021 07:57:58 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sun, 17 Jan
 2021 13:27:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Sun, 17 Jan 2021 13:27:53 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5B2EF11CA;
 Sun, 17 Jan 2021 13:27:53 +0000 (UTC)
Date: Sun, 17 Jan 2021 13:27:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Schulman <james.schulman@cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix control name parsing for multi-fw
Message-ID: <20210117132753.GB106851@ediswmail.ad.cirrus.com>
References: <20210115201105.14075-1-james.schulman@cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210115201105.14075-1-james.schulman@cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=826 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101170088
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, david.rhodes@cirrus.com
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

On Fri, Jan 15, 2021 at 02:11:05PM -0600, James Schulman wrote:
> When switching between firmware types, the wrong control
> can be selected when requesting control in kernel API.
> Use the currently selected DSP firwmare type to select
> the proper mixer control.
> 
> Signed-off-by: James Schulman <james.schulman@cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
