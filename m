Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9638B7F94A2
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:38:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC0683B;
	Sun, 26 Nov 2023 18:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC0683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020318;
	bh=GFjYrTCfkrcNlzy76CnGX/PrYanNuFlmv/Z3zWIO/Dg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KMhPzkE+clrJ7Udo+ogwQkBa2MbyNC04b1FczFbL3ZCvQ76nDC9CefJy0h1TyVBqK
	 l1ibQnVo7ubs4Xr7Q6Sfu7AbgWCpMmLqc++QpUpCUYBIMNhcZX6sY0nBMu29gl5Nvk
	 GQUl/jkhFpq+WuDH7Vwt4wSTAdP0C1B/oXManT7U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6C6F805A1; Sun, 26 Nov 2023 18:38:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77606F8057A;
	Sun, 26 Nov 2023 18:38:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89EDCF802E8; Fri, 24 Nov 2023 11:27:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A7C9F80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 11:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A7C9F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=o9eawzzl
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AO6SOAQ004050;
	Fri, 24 Nov 2023 04:27:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=GFjYrTCfkrcNlzy
	76CnGX/PrYanNuFlmv/Z3zWIO/Dg=; b=o9eawzzl9C1r6i65S18DgOGn2eUvokm
	KI2jLX6DmjQagDcrUFfNL/jWaCMZX49ndZaP12wGyGFOqIS9QM+uxul0/P/5iyrK
	DcWBqO7N4OAJn/opM9J+9vg3gt8LYuquMupkZgnn3gepZmMZgcMl1YmaxIoT+2rp
	GCv6aN3om7dPAcXL99I2ivmNb1pfTQTrRClY4JWyG1kzrpilTRT9apoR7AQSTOQG
	4pHzZkfRJ+s6jNFuFwbIMGvcwLE2zrBD+g/0rXE2bNUpz6qkAf9vBhw8wkATJVU2
	+CZqAdXu+jb8YWT9X3O/BkCC2V+4bw+beWj+Mf2JUQNewBnwPPLrvvg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uetjpen7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 04:27:09 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 24 Nov
 2023 10:27:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Fri, 24 Nov 2023 10:27:07 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B349215B6;
	Fri, 24 Nov 2023 10:27:07 +0000 (UTC)
Date: Fri, 24 Nov 2023 10:27:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] ASoC: cs43130: Allow configuration of bit clock and
 frame inversion
Message-ID: <20231124102707.GR32655@ediswmail.ad.cirrus.com>
References: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231124095030.24539-1-mstrozek@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: fx8UwrWDODrje-Twg2iLTFxL51XwNoX4
X-Proofpoint-ORIG-GUID: fx8UwrWDODrje-Twg2iLTFxL51XwNoX4
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=6692f2b4fb=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: AYDZOJ5WY4V64662CKK5NUZSLOG7HTNQ
X-Message-ID-Hash: AYDZOJ5WY4V64662CKK5NUZSLOG7HTNQ
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:36:43 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYDZOJ5WY4V64662CKK5NUZSLOG7HTNQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Nov 24, 2023 at 09:50:30AM +0000, Maciej Strozek wrote:
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
