Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 201438BE17C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 13:57:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2F4205;
	Tue,  7 May 2024 13:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2F4205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715083067;
	bh=7SblqolKjySmEc6V7cBH+cBlOqX473FOdbBoGQaq4bk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k593RS+eiPwFdVxs4QTBlaaKhszvLJ9k/GY0UwC1FY+RXR4OgJeYxkkNm0PCm+xoC
	 LNhpBobEnYG8MZREgaMIp5On6mNwIsrji72U0g0qljIL4p2Y63AVHBRl9H9ga0NBxH
	 AXnwQBVnLeR6comqONYHI9pf2HbcuvHIQj2CAr5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDBD8F805A9; Tue,  7 May 2024 13:57:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A942F80152;
	Tue,  7 May 2024 13:57:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13A83F80152; Tue,  7 May 2024 13:57:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B671F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 13:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B671F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dj+djPZm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4475oO0n004102;
	Tue, 7 May 2024 06:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=ftBlVY/8+8MJLqv
	he1wF4ZSuv2MhawQfCqt8ygN3VQI=; b=dj+djPZm7UuJ4P1+gdmrC6npbftpIzV
	Cn7oGOBQ94BeHYmQqp5rYZKlYgM6FZqeYDcR0h4yd2qreGTqIAQFKVvlZe51PSn5
	fEQEUE28InOBFMIi7968yoZkf1ecC/VLfi0Wa6UFogK6XdidF5inddpDg+ZBy5Pj
	yJs6PDiB+QDDarDxVILc53kk6pslk4FY7Sm5CZJWddfSLoTtXIrk2SVOXtLlwMew
	D3YprLNu8d+EHHyfaDiirnemaycRdSUB4Lg+wCPFoSWYmL2+WNGXYkPnu2UcNgHy
	Q/r7wIyubU0Csb6k0N7Oa6i30Lwmx9pmDSAl2j9uAPuPdcAIKsphE/w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xy2cmh154-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 06:57:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 12:57:11 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 7 May 2024 12:57:11 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id F1C16820244;
	Tue,  7 May 2024 11:57:10 +0000 (UTC)
Date: Tue, 7 May 2024 11:57:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Lars-Peter
 Clausen" <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] ASoC: Constify channel mapping array arguments in
 set_channel_map()
Message-ID: <ZjoXFedPicgq8fyP@opensource.cirrus.com>
References: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
 <20240507-asoc-x1e80100-4-channel-mapping-v1-1-b12c13e0a55d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-1-b12c13e0a55d@linaro.org>
X-Proofpoint-ORIG-GUID: _LFPFoz0pvkHmcCFOZwADU6UMjJP1mf7
X-Proofpoint-GUID: _LFPFoz0pvkHmcCFOZwADU6UMjJP1mf7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EWEH4DAPSLW2OTIKIWNG6XX6FD2FDRRB
X-Message-ID-Hash: EWEH4DAPSLW2OTIKIWNG6XX6FD2FDRRB
X-MailFrom: prvs=28571464dd=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWEH4DAPSLW2OTIKIWNG6XX6FD2FDRRB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, May 07, 2024 at 12:27:30PM +0200, Krzysztof Kozlowski wrote:
> There is no need for implementations of DAI set_channel_map() to modify
> contents of passed arrays with actual channel mapping.  Additionally,
> the caller keeps full ownership of the array.
> 
> Constify these pointer arguments so the code will be safer and easier to
> read (documenting the caller's ownership).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  include/sound/cs35l41.h                 |  4 ++--
>  include/sound/soc-dai.h                 |  8 ++++----
>  sound/soc/codecs/adau7118.c             |  6 ++++--
>  sound/soc/codecs/cs35l41-lib.c          |  4 ++--
>  sound/soc/codecs/cs35l41.c              |  3 ++-

For the cs35l41 bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
