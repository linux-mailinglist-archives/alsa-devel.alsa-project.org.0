Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19252204E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:56:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A071A46;
	Tue, 10 May 2022 17:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A071A46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652198184;
	bh=g9q4l+wmm5k5IP36hNbeho2xHvMl31rcZiilbzNaDRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvMnpgNhqaRytQJMTl+3jQwnr/ETNuPa1c++82r3qRzkKYfLm0q9a0fpukYg0S7Ad
	 nGzLSF/wXZeF5VpmtXKcfvZQ7SjRAmEhgWiKD2yTo5PrNOiSEmq9NIwkIRE8JILz/0
	 mjkg9nw3haUnN+iCnffoOye+jOKLKYlI1J0zMf5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66156F804BD;
	Tue, 10 May 2022 17:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DA9CF804BB; Tue, 10 May 2022 17:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734EFF8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734EFF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CVcITX6N"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A4ORnt025518;
 Tue, 10 May 2022 10:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=O1r9WJZyt40J+0RN2MRQFBgLwHBs+wtdx2VZZTMOA2A=;
 b=CVcITX6N0CRWVmiJUDSnVYOMs6Lic7jKw1euRSpw3XSCYU53hvq0D9UTTG3ycB3Xnhem
 qyccSf+nLzQw7wskSleQ59j2QHSO4TD22VYfEknaZp6UVDlADCETZ4IyoyaGKM1h3GeQ
 q+GVpu4VzYFi1vsU8OA6s4/nlUzexeBsfTTi6SAee131jWhY5GJsLOoZwxbCoREQNQmM
 FVTy59HCPcN5z+P/BwX+irnOV9Jt0EsSzUkun+fHfCC1f7SIdnnnDgDcaGzEOCYrEHCA
 ni2/v4c9Jdbz6eEqJ0qYYL3rx5GF3kcqPThF77+Vk3h/vXY7pD6lzhOdMQDWJD2IUpKj 1w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp6152tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 May 2022 10:55:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 16:55:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Tue, 10 May 2022 16:55:11 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 60264475;
 Tue, 10 May 2022 15:55:11 +0000 (UTC)
Date: Tue, 10 May 2022 15:55:11 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH 2/6] ASoC: cs35l36: Fix the error handling of
 cs35l36_i2c_probe()
Message-ID: <20220510155511.GD38351@ediswmail.ad.cirrus.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
 <20220510153251.1741210-3-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220510153251.1741210-3-zheyuma97@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: YLx8iFfdTQRK9C8syZN8cmNWTsNgy7H0
X-Proofpoint-ORIG-GUID: YLx8iFfdTQRK9C8syZN8cmNWTsNgy7H0
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 tanureal@opensource.cirrus.com, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 broonie@kernel.org, james.schulman@cirrus.com, linux-kernel@vger.kernel.org
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

On Tue, May 10, 2022 at 11:32:47PM +0800, Zheyu Ma wrote:
> The driver should goto label 'err' when failing at regmap_read().
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
