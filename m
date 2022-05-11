Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC768522E28
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 10:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1B9194A;
	Wed, 11 May 2022 10:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1B9194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652257236;
	bh=OyAhROpWV5Td+mReH04hqwdw7uSDGnxHxUth1s5Aqss=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScOE6gokU/2BXI0HbGW92X/VeCT9JulY48abUEhV1rue0ZYmg8E5WaU3aIvJhzM8z
	 CQ0wEHAB9onuNBOGiLtEIbeVK4S0/UyxiA+Pkti9EF9xBlu2Cgah+BgmKUe84Gfgvy
	 DsYRIu7kJ9LysoAGaCD8RvIV14py9LmP3O/UiZzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A62CFF80212;
	Wed, 11 May 2022 10:19:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC1CEF8015B; Wed, 11 May 2022 10:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82306F800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 10:19:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82306F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="X/3dG21/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B5qhP6003641;
 Wed, 11 May 2022 03:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=0eyRXSzf2QZB1V1ZCvvAzIQwDPvDlifjrkBSxcnFh7k=;
 b=X/3dG21/THnsqn3xvVDJV7nBNb2uX3RASEZOxhlxHUmf2g1V1x7zXUdEe3G6H6iUR2EE
 qSeviXRexB23jr/HDRT5MqR/mBN2HeIfCyn3d17u2DA/1xeoCs1/pHGBqwxTGtP75K4n
 hlIdfkAzDbWzXWrNwwoVg6fbE7xGmWDkR5X2U4l7zZVhckfAfF/9rrOZ5mQuxeiZ7Lxe
 DN7gEIsQBzl3LOgraV2EsKJ0q/KG37qby4cnYBMAy99MI2VrE/2XDftX0QeYq7IcZahs
 KELzsUi1WjJWU+9NoxBoZWBVXHtM9H0W1x3GPS1zY0qlS1v4ghbD7VNVn3dznWbACmn+ gg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp616bnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 May 2022 03:19:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 09:19:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 11 May 2022 09:19:23 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 42408B10;
 Wed, 11 May 2022 08:19:23 +0000 (UTC)
Date: Wed, 11 May 2022 08:19:23 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH v2] ASoC: cs42l56: Fix the error handling of
 cs42l56_i2c_probe()
Message-ID: <20220511081923.GF38351@ediswmail.ad.cirrus.com>
References: <20220510155410.GC38351@ediswmail.ad.cirrus.com>
 <20220511015514.1777923-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220511015514.1777923-1-zheyuma97@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: DR3sAZuLLq0ll-Wlxagsrk4CxHQgi-si
X-Proofpoint-ORIG-GUID: DR3sAZuLLq0ll-Wlxagsrk4CxHQgi-si
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 david.rhodes@cirrus.com, rf@opensource.cirrus.com, broonie@kernel.org,
 james.schulman@cirrus.com, linux-kernel@vger.kernel.org
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

On Wed, May 11, 2022 at 09:55:14AM +0800, Zheyu Ma wrote:
> The driver should goto label 'err_enable' when failing at regmap_read().
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
> Changes in v2:
>     - Fix the typo in the subject
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
