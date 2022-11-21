Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E678663233C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 14:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E694E;
	Mon, 21 Nov 2022 14:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E694E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669036475;
	bh=vAuUmGBlc51M2gBom+7MllMWTgr0r4TdTuPBna3jS7k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJjmG1WT5p5QsmVHBxzYOEZNmccE4drgrXJbpPE1xEYjmibFYpbrE/xsBC4m4/FtM
	 q7GzlChus470oMlCly5W3DtVvs27U+31U5bLBc9ft/p0hPbp6fNxUzeWwaavMoI1oG
	 O1CaDqYUkECWuRyOxaohdVbHHEMEQBJtSE/2g8JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FCBBF800F3;
	Mon, 21 Nov 2022 14:13:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4AE9F8028D; Mon, 21 Nov 2022 14:13:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5B81F800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B81F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jDT7kxfM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ALCdRCB008204; Mon, 21 Nov 2022 07:13:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=05ANpNcoPXhJ7RrJcplQMHmGzGUwmkUTtSBazj355Wk=;
 b=jDT7kxfMFl9gDXniI8bsgk3ArwSF4VGBfOYVZkBZ51pPzQTEZ1cH/5iwE+vyM/r4vuyV
 joUsEFeF8Vp4ePsdFmZanJl40B7mSToXrtnHdDxzeH8O/H41WKuYMPdNCw+RHPMwdodC
 O/qgz/o7Gb7RB8AUyJWKe/cpHPNn5CD+P62Ao0fvRaKWyXySUtTxPJzFxwr4dWn8VRMA
 aG/Cc9yVQEkG+mACEsG0N2d44cSyJPaB18YTaRo5aCunpa4dJ6Znw4uHl9hZHbVn/wLX
 c41vlZPcB1069unPIAa+6t1g/rnrKFP6UnfRTm23x1GiOGSwf9+GXDGyGUy7laqmyRCc Mg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6t5g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 07:13:30 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:13:28 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Mon, 21 Nov 2022 07:13:28 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F0060468;
 Mon, 21 Nov 2022 13:13:27 +0000 (UTC)
Date: Mon, 21 Nov 2022 13:13:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Message-ID: <20221121131327.GU10437@ediswmail.ad.cirrus.com>
References: <20221114102956.914468-4-ckeepax@opensource.cirrus.com>
 <202211210539.6lHevRnx-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202211210539.6lHevRnx-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: YmcFds_xBpu5r6B5_0P-EOXQMOc9hnsF
X-Proofpoint-GUID: YmcFds_xBpu5r6B5_0P-EOXQMOc9hnsF
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, oe-kbuild@lists.linux.dev,
 patches@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, oe-kbuild-all@lists.linux.dev,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com, lkp@intel.com
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

On Mon, Nov 21, 2022 at 01:50:55PM +0300, Dan Carpenter wrote:
> Hi Charles,
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Minor-SoundWire-clean-ups/20221114-183333
> patch link:    https://lore.kernel.org/r/20221114102956.914468-4-ckeepax%40opensource.cirrus.com
> patch subject: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
> config: loongarch-randconfig-m041-20221114
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 

Thanks for the spot I will fix this up and do a v3.

Thanks,
Charles
