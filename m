Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEAF4F5A64
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 12:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599AD16CD;
	Wed,  6 Apr 2022 12:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599AD16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649239347;
	bh=jOfeicbw/JScyVhh53psjDYGnbIZcXcpErltoVQ17I0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W4fLyjUFbNOFFEPbl3dVUnf9lbOalu5bJb9P4qao2oyOuCn60uo7sLzkNPAoYQ27D
	 CgwQL4OyRUtn4I+VeebZpzk4sAxjHHLOZmf7cxfTyVbYFnu2H7YlgnQlB/28m/4aQT
	 ACQBVMr6nI/wJpcvEDtxyw2nqNGVki3HjUdPkjRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7387F8019B;
	Wed,  6 Apr 2022 12:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F06FBF80161; Wed,  6 Apr 2022 12:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6408FF80054
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 12:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6408FF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="iNLU6lLl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2369U3LH017684;
 Wed, 6 Apr 2022 05:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=sPI0KE262NMl5/Dd//VQ2u+CPs7TTFSV0fZrVrMi8pU=;
 b=iNLU6lLlA9LTbz034bLu9e6yO6hks9uAqdmCLlJX/mwQ0QGVovSOjUQd6WgtxyGUAP2f
 KhCuWjYST7x/EdMjbHQY+H7XS4mMp/x+UUSA6uycll49gM4o1/AZ5BTZRa0/99B93gnV
 sL3LkzqXpjJ10jG1jJT9IGyNdqivhIA9P+s1i1GqPKdHIZ0TOa2sM0H6SwgRybffJJ0M
 r6B5dDYW7iBwfHjKNqcvR5L2r2E5S4XVJhwDomzrooW3poVTteiXc5Yf6p0pTejiO6PE
 eH9waaxewp6EuafkhGkwjn+u9vQ3NVSvteYe0MP7UZ9IT18im9QgZxR5bk4FNd5Iziqu hQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3f6jwnvryv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Apr 2022 05:01:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 11:01:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 6 Apr 2022 11:01:21 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A8E0FB1A;
 Wed,  6 Apr 2022 10:01:21 +0000 (UTC)
Date: Wed, 6 Apr 2022 10:01:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH] ASoC: wm8731: Disable the regulator when probing fails
Message-ID: <20220406100121.GV38351@ediswmail.ad.cirrus.com>
References: <20220405121038.4094051-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220405121038.4094051-1-zheyuma97@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: S2HnYa2CZmleDIUjLpESqyKuo9NJ9nV_
X-Proofpoint-GUID: S2HnYa2CZmleDIUjLpESqyKuo9NJ9nV_
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

On Tue, Apr 05, 2022 at 08:10:38PM +0800, Zheyu Ma wrote:
> When the driver fails during probing, the driver should disable the
> regulator, not just handle it in wm8731_hw_init().
> 
> The following log reveals it:
> 
> [   17.812483] WARNING: CPU: 1 PID: 364 at drivers/regulator/core.c:2257 _regulator_put+0x3ec/0x4e0
> [   17.815958] RIP: 0010:_regulator_put+0x3ec/0x4e0
> [   17.824467] Call Trace:
> [   17.824774]  <TASK>
> [   17.825040]  regulator_bulk_free+0x82/0xe0
> [   17.825514]  devres_release_group+0x319/0x3d0
> [   17.825882]  i2c_device_probe+0x766/0x940
> [   17.829198]  i2c_register_driver+0xb5/0x130
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---

Mark just merged a big chain overhauling a lot of this driver, at
the very least this patch is going to require a rebase on top of
that lot.

Thanks,
Charles
