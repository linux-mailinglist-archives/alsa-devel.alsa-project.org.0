Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80B512F48
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 11:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 021031622;
	Thu, 28 Apr 2022 11:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 021031622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651136952;
	bh=MuuzqHc4nGdYpATXt3BkwUwNdQuo7gtirBTkpeMB39o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5KhIJGhHZqLIzq4tacZxIvH2oGmOvk8JFOjZWuTeopUR1HZY0nwfZfsBDmUAqLqi
	 dnbTwTqfUXqvYqHTCG6Fx38boY9C+DM7AV4LBSSNrb6txgTk+yiNG+e+0kyX/es73g
	 j+cC62G3o1fzOz+uIVTqZ7LAxraVBGslEjSoNZk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DAAF80311;
	Thu, 28 Apr 2022 11:08:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86FE6F804B0; Thu, 28 Apr 2022 11:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558A0F80311
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 11:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558A0F80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YkovVDIR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S84mPk013671;
 Thu, 28 Apr 2022 04:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=WP0jfX+u18xRGrXz7wgtAH3RwX3NKBGpQWDoH9rv7Gs=;
 b=YkovVDIRrJU25Ul+FqJgapaBv14XBQjw8S1RdZCiXhvO+TmJhoSwpsWDUbWLW+Kv6Dts
 e6C1YWcXhfIhwaZJdI3vFW/+LPozc4398kXGW6KDqdLRuuPqC9TCJZ09/jGAkoXTp+3h
 doI3J+3XcwUB1jAETskhwJE1aLaokdp+A+bkKXT2Bc93CY3z5zFnyaYfRpadTcnYFnbU
 7a1tvthToWKdleTMZoQ99MhxG4j/I0zbiU5xV41eii+xn+ESEAtcZW18FUoRM2tJMUU4
 7Sy3FhN0llbAak6Rc6MjCDzx/uCafe0ro1Nw8E5omT0REfcM6su7B5e5w+LPzmI2TUBX IQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt61w17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 04:08:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 10:08:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 28 Apr 2022 10:08:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6BAC546C;
 Thu, 28 Apr 2022 09:08:09 +0000 (UTC)
Date: Thu, 28 Apr 2022 09:08:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: Re: [PATCH 08/26] ASoC: cs35l41: Move cs_dsp config struct into
 shared code
Message-ID: <20220428090809.GM38351@ediswmail.ad.cirrus.com>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
 <20220427150720.9194-9-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427150720.9194-9-vitalyr@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: tgiAzA0tUhqIn6ztX7eY1jQsRUCwIYfI
X-Proofpoint-ORIG-GUID: tgiAzA0tUhqIn6ztX7eY1jQsRUCwIYfI
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, Apr 27, 2022 at 04:07:02PM +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> This can then be used by HDA code to configure cs_dsp.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
