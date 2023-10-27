Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29727D935C
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 11:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFEBA4D;
	Fri, 27 Oct 2023 11:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFEBA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698398286;
	bh=PpN8b2xGvbyf/xbmK81y/HbwPMh1FbVEd1c2d91ulTY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eaijSuuj3xImGlJfNR8jPCpQ0guU/E1vinFKP3CjrW5GKKKlqbaqAphYrFP/evcvq
	 Lbd5TAn6PudykROeYlzZdP4fG89E7AD/+dMZEnQGU9bOov5A/BQotNDz786Yn9TlAn
	 NZ6j6HLxhdjvnjKuNMmbLgQr+EtUxM1wabYcZBlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D12D1F80557; Fri, 27 Oct 2023 11:17:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 542C3F8014B;
	Fri, 27 Oct 2023 11:17:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8B35F80165; Fri, 27 Oct 2023 11:17:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4637AF8012B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 11:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4637AF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Zw1T0FHy
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39R72kZK003929;
	Fri, 27 Oct 2023 04:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=IQXWbf2rdXsAh+N6t/RZbBPgcHcYu+iy6Dxgz29565I=; b=
	Zw1T0FHyciBYJOt2LmN8f5q+X0cv01T6ys8d/kFPK9NFlnkiQrKl14YXOW5xbid7
	LAqcgA9UBUqiENCa2+sByy8IeMYyEWujxzfFID8d206ITV3gQBX63fzm6A/b0/HT
	kIXbidhPWePg6/TVN8RFAVgQsCGLkLHeCZTeDqdTRrd5eg0f+TSEB9Yl/xwc9JVf
	vTY2dh9xBRaK9J6iodGkSYhlEoBIgAuW45d/SzNQPMD0CHYhEXX3ye0uuZVJ3S6Y
	fAcN3lLAXVWbcNmiX5A0N+N4kDu88BL3hClaCCBdJF1KcWdt3JVLtBRq/qsP8VOu
	wtGnA5ZSyY1Au6dnyrQbzg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tywqt120w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Oct 2023 04:17:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 27 Oct
 2023 10:16:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 27 Oct 2023 10:16:58 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52A7715B6;
	Fri, 27 Oct 2023 09:16:58 +0000 (UTC)
Date: Fri, 27 Oct 2023 09:16:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
	<amadeuszx.slawinski@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	<perex@perex.cz>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: dapm: Simplify widget clone
Message-ID: <20231027091658.GB103419@ediswmail.ad.cirrus.com>
References: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: yygX_o_qR03_N97cAi_2Qm6SOzGdwDh9
X-Proofpoint-GUID: yygX_o_qR03_N97cAi_2Qm6SOzGdwDh9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BZEUVW6O3RUNGVEGK4G7IELQ6WVPHCSM
X-Message-ID-Hash: BZEUVW6O3RUNGVEGK4G7IELQ6WVPHCSM
X-MailFrom: prvs=5664332b2c=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZEUVW6O3RUNGVEGK4G7IELQ6WVPHCSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 26, 2023 at 01:35:49PM +0200, Amadeusz Sławiński wrote:
> New DAPM widgets are created based on a provided template. When cloning
> the data, the name and stream name also need to be cloned. Currently the
> data and the names are initialized in different places. Simplify the
> code by having entire initialization in one place.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
