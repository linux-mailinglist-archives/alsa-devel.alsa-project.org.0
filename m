Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01634CD1DB
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 11:01:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE8618EE;
	Fri,  4 Mar 2022 11:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE8618EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646388094;
	bh=SQ/dovxX4NY1VaTmp93es90qldmdY+W1UIQlqDhXpJs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARqahMIHGvQ8/cHI66bCY6Rl2xDuq4o8Bz92qGqqkNpUcSgobWizExjxi80mNt9wI
	 N9mM+GvNK+p6OScLq4YclibFKS8bCpD1dUbcUIDVyxwaR5G+pwyJ4TEMQJKfzh0oCs
	 RV4EvRL/fy2duQBRwokXxNI7Z2wLvmx2Gf4T2t7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEF6F804E4;
	Fri,  4 Mar 2022 11:00:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1484F804E4; Fri,  4 Mar 2022 11:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F6F9F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 11:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6F9F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="kBi4q7QO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2247b5Ct008062;
 Fri, 4 Mar 2022 04:00:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=QWEErRiRWN1/TNCzeHf5WfEfHdlTZ8X8iK6zXZlSBlM=;
 b=kBi4q7QOyrZYtE4asa+JrOP/uCGNM4996vND6b7BSAcxnLmLBJLanx5ea97ZmPQW9ODM
 dGd3jX2y++2Djd4x8vFmOtQtqvEa6NDbjjkR1cGNJCR6VYyeIBOzjVjVpgp9W/9Q0jYV
 7ZhccuNs1qSNC2c7EP7VfQnIx2xZB1/8i+g5zncR4A3RozxaMKn54idDOUpgIZx3UU7l
 WzECScygZeOTL+kJdd/q0h+aVYM9sMNIRWZyakLYOSUd+1nHh3mmvaSMygywkgy2CM2S
 7G0wpX/k4adIDWO3pDxyUkxu5rxG/axg3kvy0rNVx/EP34ymeAzQMHAzh5Q4wQo7y0UM 8w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j1rs2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 04:00:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 10:00:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 10:00:27 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6675A7C;
 Fri,  4 Mar 2022 10:00:27 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:00:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v2] ASoC: wm8350: Handle error for wm8350_register_irq
Message-ID: <20220304100027.GV38351@ediswmail.ad.cirrus.com>
References: <20220304023821.391936-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220304023821.391936-1-jiasheng@iscas.ac.cn>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 2KrBtTRaR9Ej1GARveBYJN7a8ldIOiBw
X-Proofpoint-ORIG-GUID: 2KrBtTRaR9Ej1GARveBYJN7a8ldIOiBw
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Mar 04, 2022 at 10:38:21AM +0800, Jiasheng Jiang wrote:
> As the potential failure of the wm8350_register_irq(),
> it should be better to check it and return error if fails.
> Also, use 'free_' in order to avoid the same code.
> 
> Fixes: a6ba2b2dabb5 ("ASoC: Implement WM8350 headphone jack detection")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
