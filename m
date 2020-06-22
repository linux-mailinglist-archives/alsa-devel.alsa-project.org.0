Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C2203A76
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 17:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A8016F9;
	Mon, 22 Jun 2020 17:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A8016F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592838926;
	bh=OTNTmYUDDw5e5NPlJYWt/PuyUSyuLSODtNeny2bMAG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHYORCLx7oU6qF9J++clp6y6Af/5H8eCYDEwceIQoe9SaDznc4Sah8g2mOOTRJBQG
	 7dSOKa4gCY1KpUlOHm66bmGplj/fp/97dlLf1KReuhJMr1C/nrMm4hs7LC79SlYbNB
	 ZfHkROejeNsVnAJp6Vx2YfA2U511an/XYEt3SasQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D4E4F8010D;
	Mon, 22 Jun 2020 17:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0CBF8010E; Mon, 22 Jun 2020 17:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 048BCF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 17:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 048BCF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="pXnn7VoV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05MF80B4019238; Mon, 22 Jun 2020 10:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=YA68rp2GcBNVbHKDQJaNZbD5aBuB8Gj1QhN4VwD4g18=;
 b=pXnn7VoViKb8ETOJPdlZm51DIPoT5w5oQZwY4HWFHDXP282cCpDAZglLe8A0cPjKou9E
 IuOYXhQUQh/MumzOWrCXkKprNWkKy9PQ3WuXb72IGD3/W+URRmbls64fGds2IRi8dSs8
 1hTkTSp6+pbJHSXkKLge8W5G7tYoNZfkcAfERdeWSqSgsjX3p2yxWMonJzhZykY4P/Zj
 uf0QO2U4Pt00lJO9wN2uUXYLE52ebMiRL9+Bw6MNVjBwlMueJNsgJ8t1Frw/2aQ193yF
 rIPKyfW0n0Ep3Q0KgmMVBWfTA3xsOkX+Oi3SZm51RlmMc3s7psODNBa8gx9+Hbq4tuiQ WQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 31sfv1tftd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 22 Jun 2020 10:13:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 22 Jun
 2020 16:13:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 22 Jun 2020 16:13:34 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4884C2C5;
 Mon, 22 Jun 2020 15:13:34 +0000 (UTC)
Date: Mon, 22 Jun 2020 15:13:34 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
Message-ID: <20200622151334.GW71940@ediswmail.ad.cirrus.com>
References: <20200622065811.221485-1-vkoul@kernel.org>
 <20200622065811.221485-2-vkoul@kernel.org>
 <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 clxscore=1011
 malwarescore=0 cotscore=-2147483648 spamscore=0 priorityscore=1501
 suspectscore=2 phishscore=0 mlxlogscore=871 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220114
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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

On Mon, Jun 22, 2020 at 08:28:48AM -0500, Pierre-Louis Bossart wrote:
> On 6/22/20 1:58 AM, Vinod Koul wrote:
> >+                                        +----------+
> >+                                        |          |
> >+                                        |   OPEN   |
> >+                                        |          |
> >+                                        +----------+
> >+                                             |
> >+                                             |
> >+                                             | compr_set_params()
> >+                                             |
> >+                                             v
> >+         compr_free()                   +----------+
> >+  +-------------------------------------|          |
> >+  |                                     |   SETUP  |
> >+  |           +------------------------>|          |<---------------------------------+
> >+  |           | compr_drain_notify()    +----------+                                  |
> >+  |           |                              |                                        |
> >+  |           |                              |                                        |
> >+  |           |                              | compr_write()                          |
> >+  |           |                              |                                        |
> >+  |           |                              v                                        |
> >+  |           |                         +----------+                                  |
> >+  |           |                         |          |                                  |
> >+  |           |                         |  PREPARE |                                  |
> >+  |           |                         |          |                                  |
> >+  |           |                         +----------+                                  |
> >+  |           |                              |                                        |
> >+  |           |                              |                                        |
> >+  |           |                              | compr_start()                          |
> >+  |           |                              |                                        |
> >+  |           |                              v                                        |
> >+  |     +----------+                    +----------+  compr_pause()  +----------+     |
> >+  |     |          |    compr_drain()   |          |---------------->|          |     |
> >+  |     |  DRAIN   |<-------------------|  RUNNING |                 |  PAUSE   |     |
> >+  |     |          |                    |          |<----------------|          |     |
> >+  |     +----------+                    +----------+  compr_resume() +----------+     |
> >+  |           |                           |      |                                    |
> >+  |           |                           |      |                                    |
> >+  |           |                           |      |                                    |
> >+  |           |                           |      |          compr_stop()              |
> >+  |           |                           |      +------------------------------------+
> >+  |           |       +----------+        |
> >+  |           |       |          |        |
> >+  +-----------+------>|          |<-------+
> >+     compr_free()     |   FREE   |  compr_free()
> >+                      |          |
> >+                      +----------+
> a) can you clarify if we can go from running to free directly? is
> this really a legit transition? There's already the option of doing
> a stop and a a drain.
> 

This is allowed in the current code, the kernel sends the stop
internally in this case, so it kinda does go through the setup
state just not from the users view point. I am not sure I have a
good handle on if that makes sense or not.

> c) no way to stop a paused stream?

Currently the code does allow this and it certainly makes sense
so should probably be added.

Thanks,
Charles
