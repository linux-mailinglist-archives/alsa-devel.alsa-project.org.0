Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B739512E35
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 10:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064FC82E;
	Thu, 28 Apr 2022 10:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064FC82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651134365;
	bh=beK4f2dzjDAE0MrJa4Q3lZ8T9c1a516FBWj+Yv4uTX4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfDeqmFZhpt2A1LbrWkFRiwVPTy/lrIDBLKAf6PwcwEVroZuQJp5TZu/I+icML1N3
	 mV4fp+sx1yrUHkuvl7cyMEuoPF/IXRD/uz10fiT/Iz1ZxZ/e/lwGf0koc2I133Cllt
	 G4RxwpoqNTsi7a8SsacvXtD3SVNBinHxTv+kiOUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934DAF800F2;
	Thu, 28 Apr 2022 10:25:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5578AF8016E; Thu, 28 Apr 2022 10:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27C4FF800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 10:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C4FF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JHmoA1J4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S85KIx014079;
 Thu, 28 Apr 2022 03:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Pm7r4W1Cm//VcduQTiTK26jaLSZ7r2ZK0U6VdwqHIWA=;
 b=JHmoA1J4Uuq1Ef7gUpLGXwMVvmgOEVlK+pNeFhphAOhoHQ5abU/AgcnXFwHHhVSqtnrN
 xrO4FsZeAka+u1k4Ih6L8gsqOs/LBfk8tjmPpyxtT+AlFsu4AMGD+SSMGidnbZMPdpbp
 tj8BgLo/fgRXxEniXerGvObmR1mhzfBoQKOieQhds58/zs0Z1uS7TvAlgdQ4Mmlt08mr
 nMMvfa366girDwbc6fA2LdXC1VjpoegKVG/mA/5dFQWLaSvjOEDoy//8v1yb1vO+q0aQ
 bWdaJbTtKvgyI5rkrivN381EQv0D2Rd1fItidKO2CznKb+c70LAPDGgU2BdhzcHysW6k zg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fprt61uw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Apr 2022 03:24:57 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 09:24:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 28 Apr 2022 09:24:56 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 06E5446C;
 Thu, 28 Apr 2022 08:24:56 +0000 (UTC)
Date: Thu, 28 Apr 2022 08:24:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Nicola Lunghi <nick83ola@gmail.com>
Subject: Re: [PATCH] ASoC: wm8960: Add ACPI support
Message-ID: <20220428082456.GJ38351@ediswmail.ad.cirrus.com>
References: <20220427212916.40145-1-nick83ola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220427212916.40145-1-nick83ola@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 48N1y2DSeMR1C6Z9PycqBZyN_VANppph
X-Proofpoint-ORIG-GUID: 48N1y2DSeMR1C6Z9PycqBZyN_VANppph
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Wed, Apr 27, 2022 at 10:29:16PM +0100, Nicola Lunghi wrote:
> HID made of either Wolfson/CirrusLogic PCI ID + 8960 identifier
> 
> This helps enumerate the Waveshare WM8960 WM8960 Hi-Fi Sound
> Card HAT on the Up2 platform.
> 
> The scripts at https://github.com/thesofproject/acpi-scripts
> can be used to add the ACPI initrd overlay.
> 
> This commit is similar to the commit:
> 960cdd50ca9f ("ASoC: wm8804: Add ACPI support")
> 
> Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
