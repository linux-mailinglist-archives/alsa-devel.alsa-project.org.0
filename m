Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C876FDCC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743B3E7B;
	Fri,  4 Aug 2023 11:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743B3E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142543;
	bh=MMX2/XpxL9ViUog0cOPswNTa6PVRq+6NEuYU4YobfJE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k6OpMffA6fynR0nuix5aHqq92DDGTOwqdNyhXjwttd7Jug//2AtwK5F61Vpf804RS
	 jjL/tefv072V2WUE4jZBEUDBm9NRQmQaRkU9Iceu8OstjKdS5IC/HPdeRtMj56Su/x
	 LrA4ErUUo9oeti1oD9OqK7VUuZnyip0+CmQpE5j0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01C2BF80588; Fri,  4 Aug 2023 11:45:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4E46F80612;
	Fri,  4 Aug 2023 11:44:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CE66F8060A; Fri,  4 Aug 2023 11:44:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C284F8057B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 11:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C284F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=i6CgkZvQ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3749DbxG023497;
	Fri, 4 Aug 2023 04:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=V76O28R4V5m7Yxd
	fHvtUcqjTBQI4PdU+QGJQ89ye07s=; b=i6CgkZvQG6mvmvDUAOhXTrzBVH3vq++
	rF4i0ZUsvmlnB2c1byS8vMEjy8Vlg4ovlJyoPqlBAul063Kv+XDuRRgRzKF1mew7
	2PilUgtHxu5/5oXE4bOHy4c/nKQSDA/Tgu00Qw1GDpyAY/hnIhYUlfeSMiBxFna6
	dHMIu8Ldd+aJ5wRB13UOlEKfAwUbxKBW/Ex0sI8lMLUQAZI30S4wHvhcIxrV5hby
	Mtl00M6NbsRRh6ROpmyk6KnmQpiGLNO1R66ZmaOhnAHw8EFyX6SalJSCEnvIv03Y
	3W0BAQvyfNbL+JqI8LRX1fNgYKG1E4lGA+bnuAa6ArmMSHvy+lIZIsQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6jwjmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 04:44:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 10:44:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 4 Aug 2023 10:44:41 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A6D3C15B6;
	Fri,  4 Aug 2023 09:44:41 +0000 (UTC)
Date: Fri, 4 Aug 2023 09:44:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <vkoul@kernel.org>,
 <vinod.koul@linaro.org>,
        <linux-kernel@vger.kernel.org>,
 <pierre-louis.bossart@linux.intel.com>,
        <bard.liao@intel.com>
Subject: Re: [PATCH 1/2] soundwire: intel_auxdevice: enable pm_runtime
 earlier on startup
Message-ID: <20230804094441.GR103419@ediswmail.ad.cirrus.com>
References: <20230803065220.3823269-1-yung-chuan.liao@linux.intel.com>
 <20230803065220.3823269-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803065220.3823269-2-yung-chuan.liao@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8BVtdkhWAWc7AealSFsuAe2R37e-LTBN
X-Proofpoint-ORIG-GUID: 8BVtdkhWAWc7AealSFsuAe2R37e-LTBN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3NLNJKFXIGSFFZGDTYMHFICRYFWBV6OX
X-Message-ID-Hash: 3NLNJKFXIGSFFZGDTYMHFICRYFWBV6OX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NLNJKFXIGSFFZGDTYMHFICRYFWBV6OX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 03, 2023 at 02:52:19PM +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> As soon as the bus starts, physical peripheral devices may report as
> ATTACHED and set their status with pm_runtime_set_active() in their
> update_status()/io_init().
> 
> This is problematic with the existing code, since the parent
> pm_runtime status is changed to "active" after starting the bus. This
> creates a time window where the pm_runtime framework can report an
> issue, e.g.
> 
> "rt711 sdw:0:025d:0711:00: runtime PM trying to activate child device
> sdw:0:025d:0711:00 but parent (sdw-master-0) is not active"
> 
> This patch enables runtime_pm earlier to make sure the auxiliary
> device is pm_runtime active after powering-up, but before starting the
> bus.
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

Doesn't seem to cause any problems on my SoundWire devices, so
very loosely:

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
