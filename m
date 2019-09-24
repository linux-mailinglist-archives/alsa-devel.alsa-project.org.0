Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341ABC93D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 15:54:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B011169C;
	Tue, 24 Sep 2019 15:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B011169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569333254;
	bh=auShAq5hri2zRQ1Hwe7kdB+ADL22AyhVu5qnKhlQvdA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0FVTioYnd8PANs8pDhiPkIiEVkL+URl8bsZgLSrSEZLM97pPcrWxV0vQsZ8MQlro
	 rvNLxjyer1RcapR2fmd7jGkJ+VOGo6Hfd5+PnxDZ0nljKpJeu4m2cbyN+iLsQpu0MG
	 P3Mmx92S+GzJN9nAPqhZS4SNJWFGZWEPMIg3clnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9057EF80533;
	Tue, 24 Sep 2019 15:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6FAF8045F; Tue, 24 Sep 2019 15:52:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74173F80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 15:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74173F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pg5hU4PQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8ODYJKo001987; Tue, 24 Sep 2019 08:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=3CEdDXJdXhrulpp/9+go2cPzB7WyclrQQOwaa8x/toM=;
 b=pg5hU4PQIR/j8mrOl+auWdemTt4WFqsJqxF66hZg3ppLBM1evP2wNcFqTUWpzQPSy8JI
 /j9LmAMEhysEQM38dBxtIIpR8/ZHy6XsqBFPyvBVuO7h8BT7pHXfCaQshvlrD3t8Reev
 jiW37/e5HURhodIodgQkH3ecYxXDOxzrIig9Pj1djD3R2UAQuSqDqxf+6f9MVK5rYxQL
 zieJ2rpqlFTJGEHSNQFH+a2HEOncBtnyid8u4StDEHyZhrNHJPujmMsH7I00yBGXTWQq
 cYbefIQKjtgMphBy6KugzmN8CTCbzK3tvlk/bpdV6EpZgTHqoVTWPKQrHkavlR687/20 tg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2v5h925cdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 24 Sep 2019 08:52:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 24 Sep
 2019 14:52:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 24 Sep 2019 14:52:20 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DAF772B3;
 Tue, 24 Sep 2019 13:52:19 +0000 (UTC)
Date: Tue, 24 Sep 2019 13:52:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <20190924135219.GQ10204@ediswmail.ad.cirrus.com>
References: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
 <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
 <878168cb-07e0-cdfd-37e9-9b9fb229155b@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878168cb-07e0-cdfd-37e9-9b9fb229155b@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1909240136
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] Propagating audio properties along the audio path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Sep 23, 2019 at 12:47:33PM +0200, Marc Gonzalez wrote:
> On 20/09/2019 11:50, Marc Gonzalez wrote:
> 
> > One more concern popped up: if the audio stream changes mid-capture
> > (for example, a different TV program uses different audio settings),
> > then I would detect this in the eARC receiver, but it's not clear
> > (to me) how to propagate the info to the DSP...
> > 
> > I'm not even sure when the HW params actually get applied...
> > Is it for SNDRV_PCM_IOCTL_PREPARE? SNDRV_PCM_IOCTL_START?
> 
> I enabled debug logs in the sound layer:
> echo "file sound/* +fpm" > /sys/kernel/debug/dynamic_debug/control
> 
> and sprinkled dump_stack() in several driver callbacks.
> 
> When I run 'tinycap /tmp/earc.wav -t 10 -r 44100 -b 32'
> I see the open/SyS_openat call and the capture ioctl call
> which together generate calls to
> 1) dpcm_fe_dai_open
> 2) dpcm_fe_dai_hw_params
> 3) dpcm_fe_dai_prepare
> 4) dpcm_fe_dai_trigger
> 
> But everything looks "synchronous", as in "reaction to user-space commands".
> I don't see how "asynchronous" events are dealt with, such as the stream
> params changing while a capture is active?
> 

In general the ALSA framework doesn't really allow for stream
params to change whilst the stream is active. Doing so is
also normally very hard for the types of hardware usually
involved. For example changing the clocks on a running I2S bus,
very difficult to get both ends to pick up those changes at
exactly the correct sample. Some newer buses like soundwire
have more support for things like this were the ends of the
link can synchronise changes but even there that is normally
used for adding/removing streams from the bus, not reconfiguring
a running stream.

In your case above I would imagine the system would probably be
setup where the DSP handles the conversion between the params
requested from the receiver and those requested by user-space.
One of the intentions of DPCM was to allow the backend
(DSP-receiver here) to have different params to the frontend
(DSP-userspace here). Although as you note you still probably
need to add something to propogate those changes to the DSP. What
form does the physical link between the receiver and the DSP
take?

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
