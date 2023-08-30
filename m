Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DDA78D6C8
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Aug 2023 17:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3161DC;
	Wed, 30 Aug 2023 17:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3161DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693407708;
	bh=a5hED7uUigfFo0VrP6B4eFDZ7S4H79YZ0cZ5dwJFspc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WMplC3tu3QmhyKfenev0oXvASBsGp1boXzZQIwpRmSIoz0w8Krc7Luj38HAJXf7lA
	 bajNQLKWJBNkfAFnYksLP8CxIF3rUN1OPOyTqt11BEim5MQtLAytEoNC1EvFQFW9ES
	 QLAu8JA9AyD2rtkbFD960ResLcAjK+kUpbANbOeo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF53BF804DA; Wed, 30 Aug 2023 17:00:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D109F800F5;
	Wed, 30 Aug 2023 17:00:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EA79F80155; Wed, 30 Aug 2023 17:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92CCAF80094
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 17:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92CCAF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=STvijXg8
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37U7gEVE026115;
	Wed, 30 Aug 2023 10:00:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=nY6mVvv6rW6BhL4
	MqzQFYP/NvGfCvBh5V3UfYUMt3Qc=; b=STvijXg8VhtiCnXcKhtViWah2cFCb2w
	hipYvB/Xhno62yxDTxCb6e3aVIsWXxLZUZNFWT/GD+/zdGkhZ788C2Xvwo/4NxEL
	JsNf1URvi2HaZGcLV6rdAdmltF274DDr7/rqu4ij5nO9oQsC5DTcPlO/jIa49Brn
	FLx23DwLcoKNY3ruu0L+X4ZdR1wwGVKWO3J7u3B3nWUyzvUIb+IK2IjCje5yTbC5
	kklzbWUq+RqjJ6WQVrGMBxwg/RRo3hGmC2lVkhwA6F0xsNCjYogRtZp5H732XwXp
	aD63dgYXQAXq2MbOa6p0zdraSuSbmf6zOxPE6/bepdaruNFaVWbR1XA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyd38v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:00:40 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 30 Aug
 2023 16:00:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 30 Aug 2023 16:00:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E6F183561;
	Wed, 30 Aug 2023 15:00:37 +0000 (UTC)
Date: Wed, 30 Aug 2023 15:00:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Lee Jones <lee@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        Linus Torvalds
	<torvalds@linux-foundation.org>,
        <regressions@lists.linux.dev>
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
Message-ID: <20230830150037.GW103419@ediswmail.ad.cirrus.com>
References: <ZO8oNb2hpegB6BbE@debian>
 <87cyz4he2u.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87cyz4he2u.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: NK8Mq90hyYK6qZ7mtTDHX5VrG2uIuS3d
X-Proofpoint-GUID: NK8Mq90hyYK6qZ7mtTDHX5VrG2uIuS3d
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: U54EASBT57NTEOAYTYP4BIMRWXTXU4HI
X-Message-ID-Hash: U54EASBT57NTEOAYTYP4BIMRWXTXU4HI
X-MailFrom: prvs=4606023fff=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U54EASBT57NTEOAYTYP4BIMRWXTXU4HI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 30, 2023 at 03:09:13PM +0200, Takashi Iwai wrote:
> On Wed, 30 Aug 2023 13:29:57 +0200,
> Sudip Mukherjee (Codethink) wrote:
> > 
> > Hi All,
> > 
> > The latest mainline kernel branch fails to build alpha, csky and s390
> > allmodconfig with the error:
> > 
> > drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
> >  1138 | static int cs42l43_runtime_resume(struct device *dev)
> >       |            ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
> >  1124 | static int cs42l43_runtime_suspend(struct device *dev)
> >       |            ^~~~~~~~~~~~~~~~~~~~~~~
> > drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
> >  1106 | static int cs42l43_resume(struct device *dev)
> >       |            ^~~~~~~~~~~~~~
> > drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
> >  1076 | static int cs42l43_suspend(struct device *dev)
> >       |            ^~~~~~~~~~~~~~~
> > 
> > git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
> > 
> > I will be happy to test any patch or provide any extra log if needed.
> 
> Adding __maybe_unused for those PM functions should work around it,
> something like below.  Could you check it?
> If it's confirmed to work, I'll submit properly.
> 
> 

This is probably the correct fix:

https://lore.kernel.org/lkml/20230822114914.340359-1-ckeepax@opensource.cirrus.com/

Just waiting on it to be reviewed.

Thanks,
Charles
