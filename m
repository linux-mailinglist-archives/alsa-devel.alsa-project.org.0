Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC1535AC8
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 09:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B279716D9;
	Fri, 27 May 2022 09:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B279716D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653638253;
	bh=FuO/s0zqOg86iI/2HJNUqmXn61QKbRQXZW+yL5Znynw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WKQvzOu6TuN/v54f+RNMSpF6DACh3FjAG8u2a8NCyH9dXj/anz9zRz7qRO1+nwztf
	 inJXC6pXfW4Yx1Wd5b5wFCAA1i4HzM4LVkhO5c2JnyNCsWS66B72NEHb6aWPuyhEOv
	 i7CXNI9F2PfGJ0dik762E4LjgimzLmItvQXgn+uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB32F800D0;
	Fri, 27 May 2022 09:56:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1B2F802DB; Fri, 27 May 2022 09:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BF3BF80100
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 09:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF3BF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j8PKh2u6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24R6JKfu016200;
 Fri, 27 May 2022 02:56:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=N+a9sb4xyr+qi8RTEZxVC+qM4rBN4R20YOVvSGD6lo8=;
 b=j8PKh2u6yDGf2+VO5JdvM2Mt0rP0d05xL/Rmg18BbqJJyMzHXfKvbRIoesohK9khzSwp
 Pn1qFNa7n0noe/ZjbsCiB8Kx5Ug+XfiTjzNgSVZlDKFZh1S3gT2eLrfY3zSEfZTP9LIE
 lqr9k7uwL0GIoX/bGKtZuC9w0j63p70YXTvpteBkaWK+SyRM3akUw0Uv/fIxWoCAxiA6
 uFD4rvrzguUGue0QRLjQWDhzaMbNIbwcyCUNi/isJEs3fxDmK6tC1VupCb1P4ffuhBxW
 CLUMhFoYgUhhE4sZFCNILUndvjZK5VfKtO14AejZhbaFENsHGM3/rQk5AnsEZFPI9IIW WQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g93u4k9ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 May 2022 02:56:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 27 May
 2022 08:56:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 27 May 2022 08:56:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E6CCE46C;
 Fri, 27 May 2022 07:56:22 +0000 (UTC)
Date: Fri, 27 May 2022 07:56:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH] ASoC: wm8962: Fix suspend while playing music
Message-ID: <20220527075622.GR38351@ediswmail.ad.cirrus.com>
References: <20220526182129.538472-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220526182129.538472-1-aford173@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: CdI6fm166QBGAmMEVa5QrgUYS6Ve4eqZ
X-Proofpoint-GUID: CdI6fm166QBGAmMEVa5QrgUYS6Ve4eqZ
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, aford@beaconembedded.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 Mark Brown <broonie@kernel.org>, Stephen Kitt <steve@sk2.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, May 26, 2022 at 01:21:28PM -0500, Adam Ford wrote:
> If the audio CODEC is playing sound when the system is suspended,
> it can be left in a state which throws the following error:
> 
> wm8962 3-001a: ASoC: error at soc_component_read_no_lock on wm8962.3-001a: -16
> 
> Once this error has occurred, the audio will not work again until rebooted.
> 
> Fix this by configuring SET_SYSTEM_SLEEP_PM_OPS.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
