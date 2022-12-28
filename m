Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A865750F
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 11:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A5F8C2D;
	Wed, 28 Dec 2022 11:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A5F8C2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672221927;
	bh=7e2vN3VuRVofR8qqiGnLoPSVL1whzS8WgfvvSwOvp4M=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pR/qyz66GZ3mWrXajV0H6Acs9k06mJqju99O8MPGaPC0pPKtpmyy7FoJjHV2rFGGk
	 GTM8XUDl5SWU5Gm4ejA0uHZdUxqsIp8pem22q9DAj4HXTPa42WmMfnzBqW/HXalgQx
	 Zd06BP1yVT2UyGqOdZR2HmIzlZ3Tv0Q9k50OMp94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50F70F8049E;
	Wed, 28 Dec 2022 11:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC229F8042F; Wed, 28 Dec 2022 11:04:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C472CF800F0
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 11:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C472CF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k+GhWXKi
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BS9hKN0028951; Wed, 28 Dec 2022 04:04:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Y/MNEUhC0eUzVc+ZuefWW42yY8BfPbi2YkZER61J6wY=;
 b=k+GhWXKi00TqpzvW0lJcEk70XOn3H/UieHDL12SFZjq+4gqZ5KfucE3RVBJZPY+uAcbA
 UbpBOt8sAULV+35ePMfPo0eKnzi3lcvbx9FVQyxkV28tty2KFVbHRqSXEv1Pwj9pFVL2
 nwqhhmkEE9X4YBl2dvrrJhUZVENuzc2kXEbZpcQ8gUoAy+eSGwqa2RD6iW9GGTbouLyH
 4SJ0Cm3Euf9T6rwWEyXFlaWH+YN+48138rRqtresVQC7wehAti/0RmUi4jRjYDNcLwUH
 8x1giq4iBOoO5ao9u1yRcSch/ZRi0O3nDAu+ez8WrnrlyXvYOZpZsxFYoOrLu5JLrYoe 6Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3mnxqtu4vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 04:04:21 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Wed, 28 Dec
 2022 04:04:19 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Wed, 28 Dec 2022 04:04:19 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DCCF611CC;
 Wed, 28 Dec 2022 10:04:19 +0000 (UTC)
Date: Wed, 28 Dec 2022 10:04:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Subject: Re: wm8904 and output volume control
Message-ID: <20221228100419.GF36097@ediswmail.ad.cirrus.com>
References: <c7864c35-738c-a867-a6a6-ddf9f98df7e7@gmail.com>
 <20221219095846.GC36097@ediswmail.ad.cirrus.com>
 <a8770d51-86f8-2a68-dd38-9b380f9c355a@gmail.com>
 <20221220100005.GD36097@ediswmail.ad.cirrus.com>
 <9657ab8d-0c60-7c81-b1cb-8a5b43d07c40@gmail.com>
 <20221221165601.GE36097@ediswmail.ad.cirrus.com>
 <3d8c6f60-954d-c5b7-85bc-72509002f3df@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3d8c6f60-954d-c5b7-85bc-72509002f3df@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: XojYOqxkwoWsSqa5ALv-O6wjtQ2XmApK
X-Proofpoint-ORIG-GUID: XojYOqxkwoWsSqa5ALv-O6wjtQ2XmApK
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Michael Walle <michael@walle.cc>,
 Mark Brown <broonie@kernel.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 emanuele.ghidoli@toradex.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 21, 2022 at 06:38:16PM +0100, Emanuele Ghidoli wrote:
> On 21/12/2022 17:56, Charles Keepax wrote:
> >On Tue, Dec 20, 2022 at 08:12:23PM +0100, Emanuele Ghidoli wrote:
> >>On 20/12/2022 11:00, Charles Keepax wrote:
> >>>On Mon, Dec 19, 2022 at 04:20:10PM +0100, Emanuele Ghidoli wrote:
> >>>>On 19/12/2022 10:58, Charles Keepax wrote:
> >>>>>On Sat, Dec 17, 2022 at 12:47:14AM +0100, Emanuele Ghidoli wrote:
> In every case the volume updates, while playing, when you write the relevant register
> (raw i2cset or changing volume using amixer).
> >Yeah that is not quite what I was getting at. I am wondering if
> >volume updates work whilst CP_DYN_PWR==0 and CLK_SYS_ENA==1.
> Why are you wondering? It should be a standard working case (obviously
> with MCLK running). I know, from datasheet, that:
> "CLK_SYS_ENA = 1 and MCLK is not present, then register access will be
> unsuccessful". But it is not our case.

Apologies yes I was intending for MCLK to be on as well, but I
think we have covered this test condition with your "In every
case the volume updates, while playing" comment above.

> Watching another codec driver (wm8964: see out_pga_event comment) and
> the Startup-sequence (of WM8904) in datasheet we figure out that volume
> update must be done after PGA enable.
> I tested another patch, I'm pretty convinced that it is the right way to
> do it. Now it is working in all conditions (even Class G with disabled bypass).
> Maybe some hw guy in Cirrus Logic can dig around?
> Anyway, this is the tested patch, that, to me, sound good:
> 

Yeah this patch looks better, as you say tracks with the
datasheet and other CODECs of the same era have a similar
requirement. I think if send this one as a separate patch we can
go with that and feel free to add my ack:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
