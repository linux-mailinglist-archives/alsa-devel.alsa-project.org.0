Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A56697C63
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 13:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DFF82E;
	Wed, 15 Feb 2023 13:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DFF82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676465761;
	bh=HBNOJsosA/bCs0wL5PgYCGox9bt9ADD8BD9W7bEoH6o=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WH0JTIHGiVh0v6oYYmklTT6zVHz1HXcUZx4rARd6GfcsIjtLlb+xYXgCa31lC4/y1
	 8wEw9ngPGqM+Dsc+muq2B0vpRpArpMULsfK7Jcgq31TVIVix6W9zebjrhue2j06Rz0
	 lgnPz+j6i63+DcfJzGieOvTDjP+6qTm8gfyenX1M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1431F801C0;
	Wed, 15 Feb 2023 13:55:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BD60F8047C; Wed, 15 Feb 2023 13:55:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 399E4F800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 13:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 399E4F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=OrplJ7Kr
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31FCt212000620;
	Wed, 15 Feb 2023 06:55:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ORSjss06SCuWI7yZs/H3hMHZo9AHloJVroyHnKx9ni0=;
 b=OrplJ7KrEqq2urg+LnqJMlQtlYpaS4WaM1oQUwGmILo/mpJEnRTE/W8Ji4bjejf3gf5L
 GS5jfIFGYYeGIyORkuBj02V3pCPgGtmrlf6lsvafBlGmIFi7t/4NLM+LA4OStiSnPiqz
 sHaPXk1EPxMV1nTLPtDlwA+voXI+95xosaaPpJCBabc1kG44gRZPxdqNStuBptZoxuWO
 XqzoNVv66hzTHaMTjs3Snf14ez4l+oB861YMhPxe2IFOXxTV/+KgN6OXy3jrxFULVjzz
 s85KgtVC4X/kCqtB6U0SDHOSAViieiznK6HuArl+SnGBUpDdHhN2gh1OSpKkFJ/jELg7 RQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nrm8wgqcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 06:55:02 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 15 Feb
 2023 06:55:00 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Wed, 15 Feb 2023 06:55:00 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6830C11A8;
	Wed, 15 Feb 2023 12:55:00 +0000 (UTC)
Date: Wed, 15 Feb 2023 12:55:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH] ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream
 not declared
Message-ID: <20230215125500.GJ68926@ediswmail.ad.cirrus.com>
References: <20230215094643.823156-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230215094643.823156-1-lucas.tanure@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 3go7g3rL2eb0XwZT7a-q1fAcl6GEbr1U
X-Proofpoint-ORIG-GUID: 3go7g3rL2eb0XwZT7a-q1fAcl6GEbr1U
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6UN4JJHT2S3BYHLBAMVZBWCHQIM52UPL
X-Message-ID-Hash: 6UN4JJHT2S3BYHLBAMVZBWCHQIM52UPL
X-MailFrom: prvs=74104ead9d=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UN4JJHT2S3BYHLBAMVZBWCHQIM52UPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 15, 2023 at 09:46:43AM +0000, Lucas Tanure wrote:
> Add sound/pcm.h header to include struct snd_pcm_substream used in
> snd_soc_dapm_update_dai function.
> 
> Fixes: 078a85f2806f ("ASoC: dapm: Only power up active channels from a DAI")
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
