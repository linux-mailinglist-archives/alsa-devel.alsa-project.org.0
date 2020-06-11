Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9621F63F7
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 10:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23CA166F;
	Thu, 11 Jun 2020 10:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23CA166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591865329;
	bh=lOngdxvlsXKbqiOkSM0Wn2jSBWeuZxN+T6IwGN6vvls=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nEoakqFG7L4oAfUSVoKB3uDIljKeSDLY2Fp8UnQOlGpinPcewqvHsxrTsR46u4U6T
	 +L1RUguzfQk9i9oq+q+FjHN2rJYHswLtViWbTx5yEc+CKLEdlbmcldBxZDTW2N1Dap
	 gFYfNHxULjgPbL//YYauOsh87DCE90r0WaS5+n7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00F7DF8028D;
	Thu, 11 Jun 2020 10:47:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FE8EF8028C; Thu, 11 Jun 2020 10:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE4B9F800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 10:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE4B9F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ldyHCqL6"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05B8g8DS006204; Thu, 11 Jun 2020 03:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=RA8gyM/Boi4nX18h8FqgHUYCugif5lvnF1e0Dqjslrk=;
 b=ldyHCqL6OVILKhdYVG3ldBwKF9gg3jIeoK9awaghoM4AD+XCCnc0/fk+cTnm+MQTAlkX
 l1+7tC9Jbq7zRnq6Pqi4t3/xPzOI24QfL4GaXNyXTJlacv62Dq3o5KLgg6mC4LzNZqJN
 Ywf3Whv6nOF3SP1LUjibfT6yXGSSjHQfh7FqMU34Uu7J4MhfPtyfCwsBst22pe6cXa0l
 MA4cfrpPKN19NeJk2j6eer2JDwiftGiEYEBMgncLdV6d+43vg1EiMSqqaO5yd7G1//kf
 NT0Y6mDR1VdNoHIaal3HgME3uyhLq3sUGrfNRFy2AY1RrTD3gcHqwLdrW3iuVTARo1bd Ew== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 31g7jmynde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Jun 2020 03:47:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 11 Jun
 2020 09:46:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 11 Jun 2020 09:46:59 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1887B448;
 Thu, 11 Jun 2020 08:46:59 +0000 (UTC)
Date: Thu, 11 Jun 2020 08:46:59 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [RFC PATCH] ALSA: compress: Fix gapless playback state machine
Message-ID: <20200611084659.GO71940@ediswmail.ad.cirrus.com>
References: <20200610100729.362-1-srinivas.kandagatla@linaro.org>
 <817d009e-fa09-e897-cfc3-997bf1dd5e30@perex.cz>
 <20200610105820.GA1393454@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200610105820.GA1393454@vkoul-mobl>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=953 spamscore=0 impostorscore=0
 cotscore=-2147483648 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006110068
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Wed, Jun 10, 2020 at 04:28:20PM +0530, Vinod Koul wrote:
> On 10-06-20, 12:40, Jaroslav Kysela wrote:
> > Dne 10. 06. 20 v 12:07 Srinivas Kandagatla napsal(a):
> > > For gapless playback call to snd_compr_drain_notify() after
> > > partial drain should put the state to SNDRV_PCM_STATE_RUNNING
> > > rather than SNDRV_PCM_STATE_SETUP as the driver is ready to
> > > process the buffers for new track.
> > > 
> > > With existing code, if we are playing 3 tracks in gapless, after
> > > partial drain finished on previous track 1 the state is set to
> > > SNDRV_PCM_STATE_SETUP which is then moved to SNDRV_PCM_STATE_PREPARED
> > > after data write. With this state calls to snd_compr_next_track() and
> > > few other calls will fail as they expect the state to be in
> > > SNDRV_PCM_STATE_RUNNING.
> > > 
> > > Here is the sequence of events and state transitions:
> > > 
> > > 1. set_params (Track 1), state =  SNDRV_PCM_STATE_SETUP
> > > 2. set_metadata (Track 1), no state change, state = SNDRV_PCM_STATE_SETUP
> > > 3. fill and trigger start (Track 1), state = SNDRV_PCM_STATE_RUNNING
> > > 4. set_next_track (Track 2), state = SNDRV_PCM_STATE_RUNNING
> > > 5. partial_drain (Track 1), state = SNDRV_PCM_STATE_SETUP
> > > 6  snd_compr_drain_notify (Track 1), state = SNDRV_PCM_STATE_SETUP
> > > 7. fill data (Track 2), state = SNDRV_PCM_STATE_PREPARED
> > > 8. set_metadata (Track 3), no state change, state = SNDRV_PCM_STATE_PREPARED
> > > 9. set_next_track (Track 3), !! FAILURE as state != SNDRV_PCM_STATE_RUNNING
> > 
> > 
> > The snd_compr_drain_notify() is called only from snd_compr_stop(). Something
> > is missing in this sequence?
> 
> It is supposed to be invoked by driver when partial drain is complete..
> both intel and sprd driver are calling this. snd_compr_stop is stop
> while draining case so legit
> 

Not sure I follow this statement, could you elaborate a bit?
snd_compr_stop putting the state to RUNNING seems fundamentally
broken to me, the whole point of snd_compr_stop is to take the
state out of RUNNING.

Thanks,
Charles
