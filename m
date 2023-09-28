Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2808B7B16C3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 10:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3ABDEC;
	Thu, 28 Sep 2023 10:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3ABDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695891506;
	bh=mjLUXV0CAVGXxAIgoX649JBoS602O5mijZtXRASunqg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WCoAsNZgHNpNxjpo+9isvGIg2xsc/uBLYQRZs0GdhifqSTb4zHqGS4bIH/7Rx9qeF
	 4PR2Ht2fveOVDGiEJthogH7nDTpD9jnCKGZE60UBtW+XadxpsubV5rn5bvJCIaVmFU
	 vbv87+ijSe9+AnLEy8gSa86E5bIjbjD4mUm2KG9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C1C3F80130; Thu, 28 Sep 2023 10:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BE4F8016A;
	Thu, 28 Sep 2023 10:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63922F801D5; Thu, 28 Sep 2023 10:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E831F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 10:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E831F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=rGtMtAYU
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38S5dcWb014061;
	Thu, 28 Sep 2023 03:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=fmf7E4P+dNZC9Uv
	eMLjyWvKeWz5XnkPtF0Zvjo4B//I=; b=rGtMtAYUz1S8OuhMKPljDwQxy0TFr90
	okxzBbswvkrc1j36UyyyZAbNfaXmjDWrlSNWG9DKcsNObg7wCg6eD4RI286C8/Vp
	oGQgNjiOSm7MaGG12yWeDrdje/hC+ZU+0qo5eQP1bFBzyDV92FtTpSwdISEmOThv
	zNHCXiOiQKy3pTQfY41Kjcvra9EEPqFL88Bs/BQJkFyO38xXBuxkLl5CwCSnJ3pr
	B61y1/eBJ038BVBDBa6x/G+ft4W0RXSzq1HPxPve3eo+rkWubEvYb2uz484U+XHl
	TpCw7a9oD5zO94EIc2DMqagUqn1bDymC3cx9ZFlK3jPHV+4TxCS6+Nw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t9vejdubs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 03:57:27 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 28 Sep
 2023 09:57:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 28 Sep 2023 09:57:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 861033561;
	Thu, 28 Sep 2023 08:57:25 +0000 (UTC)
Date: Thu, 28 Sep 2023 08:57:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
        <rf@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, Abaci Robot
	<abaci@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: cs42l43: Remove useless else
Message-ID: <20230928085725.GL103419@ediswmail.ad.cirrus.com>
References: <20230928085200.48635-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230928085200.48635-1-jiapeng.chong@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: aOvJ5rKary-NUFxN2XQMKnI-OXJ5d3aC
X-Proofpoint-ORIG-GUID: aOvJ5rKary-NUFxN2XQMKnI-OXJ5d3aC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WMSJUMWMO3C3BY7FXLAJ5FMNTAGYGHUK
X-Message-ID-Hash: WMSJUMWMO3C3BY7FXLAJ5FMNTAGYGHUK
X-MailFrom: prvs=4635c08b47=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMSJUMWMO3C3BY7FXLAJ5FMNTAGYGHUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 28, 2023 at 04:52:00PM +0800, Jiapeng Chong wrote:
> The assignment of the else and if branches is the same, so the else
> here is redundant, so we remove it.
> 
> ./sound/soc/codecs/cs42l43-sdw.c:35:1-3: WARNING: possible condition with no effect (if == else).
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6712
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
