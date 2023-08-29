Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB578C21C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 12:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B35950;
	Tue, 29 Aug 2023 12:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B35950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693304087;
	bh=GHsW9TKx3xR4JxNT6/oKArKZrI3tYYaiVxf3xzOjRRk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nADzT1Yy4Id6OhURhQ0zd9l2dCwgBBN8f2cyazvcNk+/iO8lWBo4mBlHgcNaiRH1e
	 rxzgUmiq2hDIfo6VbhTzXYaqCwX/Z8oqkyXPo62fwKpb9o+BysW8i6TcpIuFTA7F5G
	 RiczlI7rrlcqFwDQ+/kQZdmhAGOfp2S3MgTr5rxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8F52F80249; Tue, 29 Aug 2023 12:13:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53591F800F5;
	Tue, 29 Aug 2023 12:13:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDEADF80155; Tue, 29 Aug 2023 12:13:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D7D9F80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 12:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D7D9F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=VEzF34tH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37TA3TE2030487;
	Tue, 29 Aug 2023 05:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=q7oZvrbwkLp9AYr
	QEMRkOA7qRZqp2CnvpKxS1A2TLXQ=; b=VEzF34tHFnW+5raBipsWQ/m45C92Eyh
	FnwjGA3ZB6WiTYlMNBz7xabKqDJlUGkeDTx1Nx8WrL69c5Svkd/OPX6JbDknZxUy
	BouAcE2nWz+QTCmEsP2QgW+CPHVzhUNrZjxQTlfv4jBhPBsaZNbckxO+6umRar5D
	3vJnzva5boUtGH/kog6S9dNBBOLEaBkgVsGdijB0jKJZMUXPjF7uIaDbicN8BPvE
	oNMWRN97d1Lj6ChxRWTEvgZQzyswbUkK/zLhP79tWhXQBl0XnGQ43aVa9/mh/ql/
	fabmrFhHM+Wr7ajrPeHwFyPe+hcbpP8W1R9/Hwk+2FGJ053LqhOI2ww==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj2sff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 05:13:29 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 11:13:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 29 Aug 2023 11:13:27 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9D7815B6;
	Tue, 29 Aug 2023 10:13:27 +0000 (UTC)
Date: Tue, 29 Aug 2023 10:13:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>
Subject: Re: [PATCH 7/7] ASoC: cs35l45: Add AMP Enable Switch control
Message-ID: <20230829101327.GU103419@ediswmail.ad.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
 <20230828170525.335671-7-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230828170525.335671-7-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: nulj9butcyKNvwHlsnBYZ02Vhlp4i9Q5
X-Proofpoint-GUID: nulj9butcyKNvwHlsnBYZ02Vhlp4i9Q5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: S2DUOUCFRYMUZKSHRPMOFY6C7MAJ7RWK
X-Message-ID-Hash: S2DUOUCFRYMUZKSHRPMOFY6C7MAJ7RWK
X-MailFrom: prvs=4605abc1a5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S2DUOUCFRYMUZKSHRPMOFY6C7MAJ7RWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 12:05:25PM -0500, Vlad Karpovich wrote:
> The "AMP Enable Switch" is useful in systems with multiple
> amplifiers connected to the same audio bus
> but not all of them are needed for all use cases.
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
