Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F476FDCD
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1ACE72;
	Fri,  4 Aug 2023 11:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1ACE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142558;
	bh=zkWX9kC1KAvC7SvuCDzfvR/VLkzcWXWS5llhQQ8Ffhw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rwckH17wDpxCUNb5cH1JG0EdpUNDCd/5QHhpcZVzEa7qqeesXPtElgTMy8ebVpD8I
	 ey45jBK5OYxYmFtZliGMGBLfAQoNXWnyVD5/2Ux/w5lBly7/AZ8l9F2lBFFmnyzYt4
	 pZFo6u3aUfySoYZEpBtOMLHRd46wkxOseo9Wr7g4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3611F80615; Fri,  4 Aug 2023 11:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07002F805A8;
	Fri,  4 Aug 2023 11:45:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 916E0F80614; Fri,  4 Aug 2023 11:45:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ADADF80580
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 11:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ADADF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=e87WDpxx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3749DbxH023497;
	Fri, 4 Aug 2023 04:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=OCofsKAt8Ejf/ZS
	ErfSKkZTlVh+VkY8Gp9t1OATALhU=; b=e87WDpxxvOBWRKRQkJnFWJiJp5FENic
	zXL9c3OJz6TXOoxGGsvqMezw0FwELxewAIx5nh//pzItg5BJ0z0J7BlPHgujB5Rz
	2Tw+1M8KmKgD+7nPE5vrhDkXrFbQwydit7HBaFcDlkLNByue86sn9Y+C9yvk91tz
	VfA0e2hFMjUko00+2RO/NWly31haOkROXpyogiLEX5cDvNbsTPcaEnr0NRVaqSGp
	7MyBp1UXpJ6qLoZKWaQEQU55vx0mqP0cpAII5PF579VP7w9mm8eKfNsDAYWB17yp
	JHc3mFlEkq+bhFDdtFmiNfdykM1q8is0ubvseKAbRFNPe6cJTHOhWvA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6jwjn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 04:45:01 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 10:45:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 4 Aug 2023 10:45:00 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F14D33563;
	Fri,  4 Aug 2023 09:44:59 +0000 (UTC)
Date: Fri, 4 Aug 2023 09:44:59 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <vkoul@kernel.org>,
 <vinod.koul@linaro.org>,
        <linux-kernel@vger.kernel.org>,
 <pierre-louis.bossart@linux.intel.com>,
        <bard.liao@intel.com>
Subject: Re: [PATCH 2/2] soundWire: intel_auxdevice: resume 'sdw-master' on
 startup and system resume
Message-ID: <20230804094459.GS103419@ediswmail.ad.cirrus.com>
References: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
 <20230803065220.3823269-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803065220.3823269-3-yung-chuan.liao@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: _2qWJouHkS0ldpw8Pj0ZAC4yyfVIg6Po
X-Proofpoint-ORIG-GUID: _2qWJouHkS0ldpw8Pj0ZAC4yyfVIg6Po
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YHJBTLUMW2GGB2KB7NKO27MHU2WPJKCD
X-Message-ID-Hash: YHJBTLUMW2GGB2KB7NKO27MHU2WPJKCD
X-MailFrom: prvs=3580138b0b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHJBTLUMW2GGB2KB7NKO27MHU2WPJKCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 03, 2023 at 02:52:20PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The SoundWire bus is handled with a dedicated device, which is placed
> between the Intel auxiliary device and peripheral devices, e.g.
> 
> soundwire_intel.link.0/sdw-master-0/sdw:0:025d:0711:01
> 
> The functionality of this 'sdw-master' device is limited, specifically
> for pm_runtime the ASoC framework will not rely on
> pm_runtime_get_sync() since it does not register any components. It
> will only change status thanks to the parent-child relationship which
> guarantees that the 'sdw-master' device will be pm_runtime resumed
> before any peripheral device.
> 
> However on startup and system resume it's possible that only the
> auxiliary device is pm_runtime active, and the peripheral will only
> become active during its io_init routine, leading to another
> occurrence of the error reported by the pm_runtime framework:
> 
> rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
> sdw:0:025d:0711:00 but parent (sdw-master-0) is not active
> 
> This patch suggests aligning the sdw-master device status to that of
> the auxiliary device. The difference between the two is completely
> notional and their pm_status shouldn't be different during the startup
> and system resume steps.
> 
> This problem was exposed by recent changes in the timing of the bus
> reset, but was present in this driver since we introduced pm_runtime
> support.
> 
> Closes: https://github.com/thesofproject/linux/issues/4328
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
