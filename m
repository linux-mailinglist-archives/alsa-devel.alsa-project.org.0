Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6823F79841D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 10:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C78852;
	Fri,  8 Sep 2023 10:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C78852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694162062;
	bh=YDHvAELDG5qxsjVC7gmsXRm6ieJ9QaP6SBG8K+7YIrE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V+IutM2AP5Yuc2lg++jc5GQMRILa38I5yGvARyzdOXXNeLedLruA3Vsq0DohjaWk3
	 LThCB2C0elj9LYw4rkbpEVuWTlgEXsXqKFSCgaKp6mB6K4uiHxIscUjT9NZegWqF/5
	 HE3BtvOEC70rSv/0bc/hjKmudLCghJeOmwWp5aUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644D8F80551; Fri,  8 Sep 2023 10:33:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8AD5F8047D;
	Fri,  8 Sep 2023 10:33:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC1C8F80494; Fri,  8 Sep 2023 10:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CF13F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 10:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF13F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PajhVRDW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3885XP36019373;
	Fri, 8 Sep 2023 03:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=GlK6kxYnBUNfM4D
	NEqZcTn84mMCaz2xXCQlng8PUdaE=; b=PajhVRDWvzW3kAT9jQJJXNO6hcCj8qI
	DS7CxMJX7HX+T3JXtgol9rXqbcWiJUaBV1K6sC2EMWhVDqQCm6xuUfR5uwK1d9/S
	OhSDl0jKm6X0mbXAVdP9f8zfxyl4DicA/j9NbxuUyxGPiobvKoqXtbued2q9O6uj
	eQfslmppgFek+voM+dXTr4/hbtcB0r0ZA//e+VKtiCcqs6k7EdEme79xmg2zGkPg
	dmTfKj4wzCbJThln1xS92pWw1akPpPhw2onUfbKDyk5GLT9HKs6XejMq+b4K0lRy
	/cCfBoh5l6QgqDJvL9pCXXfBB0UeYVEPNML/neQsB9o/hpYj0bzvyuQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex7sq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 03:33:10 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 8 Sep
 2023 09:33:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 8 Sep 2023 09:33:08 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E7E0F11AA;
	Fri,  8 Sep 2023 08:33:07 +0000 (UTC)
Date: Fri, 8 Sep 2023 08:33:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: kernel test robot <lkp@intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
        ALSA Development Mailing List
	<alsa-devel@alsa-project.org>
Subject: Re: sound/soc/soc-pcm.c:1082:1: warning: the frame size of 1324
 bytes is larger than 1024 bytes
Message-ID: <20230908083307.GP103419@ediswmail.ad.cirrus.com>
References: <202309080339.rbPMLUjl-lkp@intel.com>
 <76bf0f24-3d7c-0249-bf5c-3abb1a3641d0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <76bf0f24-3d7c-0249-bf5c-3abb1a3641d0@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: HPrv4GO4q4lpLi5Xq8GxFASyLN6oephl
X-Proofpoint-GUID: HPrv4GO4q4lpLi5Xq8GxFASyLN6oephl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XUMCFEE6AQGX4VBR4WHHDYSLXFN2ZB36
X-Message-ID-Hash: XUMCFEE6AQGX4VBR4WHHDYSLXFN2ZB36
X-MailFrom: prvs=4615c3d576=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUMCFEE6AQGX4VBR4WHHDYSLXFN2ZB36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 07, 2023 at 10:20:56PM -0400, Pierre-Louis Bossart wrote:
> 
> 
> On 9/7/23 15:23, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   4a0fc73da97efd23a383ca839e6fe86410268f6b
> > commit: ac950278b0872c87bcef6153fd9c119265c8ba83 ASoC: add N cpus to M codecs dai link support
> > date:   3 months ago
> > config: i386-buildonly-randconfig-006-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080339.rbPMLUjl-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080339.rbPMLUjl-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309080339.rbPMLUjl-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    sound/soc/soc-pcm.c: In function '__soc_pcm_hw_params':
> >>> sound/soc/soc-pcm.c:1082:1: warning: the frame size of 1324 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >     }
> >     ^
> 
> isn't this the same issue that Charles Keepax wanted to address with
> "[PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params"?
> 
> That's clearly no longer an ARM-only issue and it does look like a
> compiler issue.
> 

Shoot yeah I think I forgot to respin that patch will do it this
morning.

Thanks,
Charles
