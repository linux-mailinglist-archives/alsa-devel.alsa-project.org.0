Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 455AC6296B8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 12:04:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D300C167E;
	Tue, 15 Nov 2022 12:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D300C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668510288;
	bh=rkR8j2SSHhVoJFHm0ywK1sDdsDhqWqfWpYcdZf18j18=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXuUbN5Nb3ykfHttPtIXhN9lu5u8xf0+BeYtsVE+PdtboVD9GVwa7miBcJBu4ZNkg
	 xjci8zncfhRr0pgJiQW3C3GGoEtqJxpbu6MMhEOHH5bHV+ceaRtqq5+Zz76Ibzgual
	 6kEqOCBwY/bDYPu3VL2CsVjN0b8r1Ha0oE817Mz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4A6F800AA;
	Tue, 15 Nov 2022 12:03:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C64F80171; Tue, 15 Nov 2022 12:03:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC566F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 12:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC566F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Tl69ybyf"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AF8GHsv027966; Tue, 15 Nov 2022 05:03:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=AlpfajGkz6FVa8KoXmfJEN55IEc1jCwOs18q4zIWuus=;
 b=Tl69ybyfH/hkuJ4mgtcjQs9Yxd14n8RwuyTbjOVM3T3YDwb9gOcMqat1Bi8tp/CKADZL
 JgnCWjZYSNgRFnCjI89+a7aOQjvcX4c+XA6VCY18AeMWEosner7uQLdDlFo12cTOXsSc
 /pMLiVAjXQAw5R8nMK3XSoYozKXsoGfjW6VKkK6+UI1CMLj7zWg0DkEo19BaBZAIwNqn
 7ieMWlBtMRadcq1hCf3uWgvkpV6LMedoc71tKLwWjhivxjsDfmnnaYR9wEURBgGpHVjz
 DedUX2cx3/wbszahqb79iFAYhiuI9bcfwlgyBRo7GPdZct3gjKMw+ZGEFtSw8QyCJCjt 4g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kv73yg4vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Nov 2022 05:03:46 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Tue, 15 Nov
 2022 05:03:45 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Tue, 15 Nov 2022 05:03:45 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4C2E2477;
 Tue, 15 Nov 2022 11:03:45 +0000 (UTC)
Date: Tue, 15 Nov 2022 11:03:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/4] soundwire: Provide build stubs for common functions
Message-ID: <20221115110345.GM10437@ediswmail.ad.cirrus.com>
References: <20221114102956.914468-1-ckeepax@opensource.cirrus.com>
 <20221114102956.914468-3-ckeepax@opensource.cirrus.com>
 <90b01c76-fc65-a57f-9247-fae78241342c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <90b01c76-fc65-a57f-9247-fae78241342c@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 05z7zlNcvNMd6awNwKC6UhIsf7PWmgjA
X-Proofpoint-GUID: 05z7zlNcvNMd6awNwKC6UhIsf7PWmgjA
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

On Mon, Nov 14, 2022 at 10:13:07AM -0600, Pierre-Louis Bossart wrote:
> 
> 
> On 11/14/22 04:29, Charles Keepax wrote:
> > Provide stub functions when CONFIG_SOUNDWIRE is not set for functions
> > that are quite likely to be used from common code on devices supporting
> > multiple control buses.
> 
> So far this case has been covered by splitting SoundWire related code
> away from, say I2C, and with a clear 'depends on SOUNDWIRE'. This is the
> case for rt5682, max98373, etc.
> 
> Is this not good enough?
> 
> I am not against this patch, just wondering if allowing code for
> different interfaces to be part of the same file will lead to confusions
> with e.g. register offsets or functionality exposed with different
> registers.
> 

I guess this is a bit of a grey area this one. Both work, I guess
the reason I was leaning this way is that in order to avoid a
circular dependency if I put all the soundwire DAI handling into
the soundwire code then I have to duplicate the snd_soc_dai_driver
structure into both the sdw and i2c specific code (worth noting
the I2S DAIs are still usable when the part is sdw to the host). But
there are also downsides to this approach in that it will likely have
some small impact on driver size when soundwire is not built in.

Thanks,
Charles
