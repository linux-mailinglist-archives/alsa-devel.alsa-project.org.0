Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6EC629588
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:15:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32854167F;
	Tue, 15 Nov 2022 11:14:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32854167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668507348;
	bh=mFdqENpU9yYjM2xU7SgN3jlwhEuRSG7ryg+EO9Rmn78=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imtjEuDSn2xTkXVIKfYuCwKMmwXA0HfF1esv/hX28XvWLCVMyqkiz5bf+yXTrS5zZ
	 V8AfcoeC3oW1kSUfpDwCNAbckauS7dfmcO2cAL+ESs4mgptDOmUR5lG8HlkFAVp9QN
	 ki8YzbzzlAXnHo52LlI0TwEXwh8UWOGh2tsbqBOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF85BF8047C;
	Tue, 15 Nov 2022 11:14:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80C85F80171; Tue, 15 Nov 2022 11:14:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33C07F800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:14:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33C07F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lYybNmBa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AF8Hj8c031896; Tue, 15 Nov 2022 04:14:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=s1Qw8uKWDXVG3mn+1lbe8MUKFNzigWkLGZ+Sj9Y4uZM=;
 b=lYybNmBawgPOfP+6sap0zx5MEO17FZkXuCwbrwZVOGB4toQ5igr+8ErNcMedw5MPI/mb
 tH3NXV0+f2qkRAYzb44RvGovqUT5QucJbzYcGsAx0ehfYnpSJyCn3pV8qDi0MHZzWGIW
 +SLEamTtBUVVQyNiM0ylCTXfHNXNR7C4hrReD/vUXLntIIh9nxCz4X1EsCDX1ikSCVnQ
 7G80ljdcAGj49a+EqVp54EobbBgI2QlvRmXIODbTXPRUXVNTatB26tNdPi0xYY+DDyLM
 KpqX60M5kqTWXJM6i1je7553cEeMobexE7gRANolU+12kTV5LTc5qTpRDC3VNoDkb5Wu xg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kv73yg398-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 04:14:43 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 15 Nov
 2022 04:14:41 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Tue, 15 Nov 2022 04:14:41 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6FEB5B12;
 Tue, 15 Nov 2022 10:14:41 +0000 (UTC)
Date: Tue, 15 Nov 2022 10:14:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Message-ID: <20221115101441.GL10437@ediswmail.ad.cirrus.com>
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
 <20221114102956.914468-4-ckeepax@opensource.cirrus.com>
 <bbc432e7-c52f-7e35-03d1-401cb68501cb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bbc432e7-c52f-7e35-03d1-401cb68501cb@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: _R82frNhOQOY7HML5SsZmlzICTjlQfby
X-Proofpoint-GUID: _R82frNhOQOY7HML5SsZmlzICTjlQfby
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On Mon, Nov 14, 2022 at 10:14:19AM -0600, Pierre-Louis Bossart wrote:
> 
> 
> On 11/14/22 04:29, Charles Keepax wrote:
> > It is rather inefficient to be constantly enabling/disabling the PM
> > runtime as we print out each individual register, switch to holding a PM
> > runtime reference across the whole register output.
> 
> the change is good, but technically the pm_runtime resume happens for
> the first read and suspend with a delay if use_autosuspend() is enabled,
> so presumably we'll see the same number of resume/suspend with the
> existing code and the suggested change.
> 
> Maybe update the commit message to mention that we constantly change
> reference counts, as you did in the next patch?

Yeah agree, I will respin the commit message.

Thanks,
Charles
