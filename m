Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E55377B8
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 11:37:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41B61AE2;
	Mon, 30 May 2022 11:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41B61AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653903471;
	bh=ngTEQ1jJnEngIKYk2bLDjVKF32DnxqGFV8sjS6CgpbA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJQrxdtlkBUbhoiNJ54toOLwCkhjneuwGTUF7EYPbLyboBOmHWfsKLfIG/567+Z26
	 c1Uw3othmTN2V7TMaqSUd1p5TdTcFptQMQ4jsyXm4u+QRxVQWEBUvkYW2RlQOr5ujd
	 gds5OeeJ22wDgwsw9uaKepeFNsVoorsGQtu2dnL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47783F800DE;
	Mon, 30 May 2022 11:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F8CF8019D; Mon, 30 May 2022 11:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14A54F80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 11:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14A54F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MTyV2daK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U7BcHP005120;
 Mon, 30 May 2022 04:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=bKYxbNoDM4nFff5z/xz7MZN4pi94siKAcbuwm7LZsXI=;
 b=MTyV2daKaf1XPM0ut6qXecvk8tqcJYCCf0pSocuqvTrRSSHosKwn71PCrLVHbYOVPEIh
 Z/blHKXVRAdusGxQ1RLCcZD1i7ehfsRaxWmRvpy3Tu10Oe1X0ALS/8zZ7dkRXiZT36zw
 JKB6nPgjZjBUYeoMfn89C8K7gmin0Qd+AZKGAAqeq7Uow6JCfxpz5CCbPVCiBiZwNWVz
 PKIkJK2MB3ekIhwairlV7SR5Rp4UuK4n2ht5lBoTpMxvMFUEiyV4eJX7LsN0eI7pgm9Q
 e8gXu2KtOQb0AOcrpbAa5o1VPR8vLoYPyJfAKfNKrsqMSsA9tWX/1gwrNQUN7Y7lBCQG XA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gbg5nhkwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 May 2022 04:36:40 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 30 May
 2022 10:36:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 30 May 2022 10:36:39 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1AE57468;
 Mon, 30 May 2022 09:36:39 +0000 (UTC)
Date: Mon, 30 May 2022 09:36:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4 00/17] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Message-ID: <20220530093639.GT38351@ediswmail.ad.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <871qwf0x8t.wl-tiwai@suse.de>
 <20220530090846.GS38351@ediswmail.ad.cirrus.com>
 <87czfvxtsc.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87czfvxtsc.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: HZLJ07Ac1ZXEmC-ipJehlWyWwDW3SLbV
X-Proofpoint-GUID: HZLJ07Ac1ZXEmC-ipJehlWyWwDW3SLbV
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Mon, May 30, 2022 at 11:18:43AM +0200, Takashi Iwai wrote:
> On Mon, 30 May 2022 11:08:46 +0200,
> Charles Keepax wrote:
> > 
> > On Fri, May 27, 2022 at 06:13:38PM +0200, Takashi Iwai wrote:
> > > On Wed, 25 May 2022 15:16:21 +0200,
> > > Vitaly Rodionov wrote:
> > > The idea to add / delete controls by the control element change
> > > doesn't sound good; as already mentioned in my reply to the previous
> > > patch set, the change of the control elements can be triggered too
> > > easily by any normal users who have the access to the sound devices.
> > > It means thousands of additions and removals per second could be
> > > attacked by any user.
> > > 
> > 
> > This I am a little less sure how we handle. I mean arn't there
> > already a few ways to do this? Both the existing ASoC wm_adsp
> > stuff, and the topology stuff (used on all new Intel platforms,
> > so very widely deployed) let you create controls by loading a
> > firmware file. Also within ALSA itself can't user-space create
> > user ALSA controls? Is there some rate limiting on that? How is
> > this issue tackled there?
> 
> The creation of kctls via firmware loading would be OK, as the code
> path can't be triggered so frequently.  Is it the case for this patch
> set?  There was too little information about the implementation (and
> more importantly, how to use the controls), so it's hard to judge...
> 

Yeah that should be what is happening here. Although it looks
like this code might be removing all the controls if the firmware
is unloaded. I will discuss that with the guys, we normal just
disable the controls on the wm_adsp stuff.

Thanks,
Charles
