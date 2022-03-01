Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1FF4C8CE6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 14:46:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0641B38;
	Tue,  1 Mar 2022 14:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0641B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646142359;
	bh=BCBvXqrGW9YtqQRFTPKbvePOHTeL6erPpn36p9vhFX8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHbEfSMtUrB2qL6fuWUAWebCmQ7xMsYsN02DDtCWR0WkYuXa4J2swQ+l1eSKTXRHo
	 RUJWIR1larL16Q/Guaj3CrUbW1tSu8j8D18UMBiAkGdyTQ9kiDudh8M4rw31+1u4VK
	 FTC0zipdez9qIwFWCvn8FcyxWudns0FBIA/FwtYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36C18F80095;
	Tue,  1 Mar 2022 14:44:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ADE8F80227; Tue,  1 Mar 2022 14:44:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5052F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 14:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5052F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Nuw2yz1P"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2212QZLU012202;
 Tue, 1 Mar 2022 07:44:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=XGTFnldwedz70fyr8zbmj2k250TYlofeHT07pTVLZjM=;
 b=Nuw2yz1PoLpuSKfs6zIh0cJGHtc2MqQ+PAoju5qZansffM0NSfxGxG4i/qINW15us/9W
 Y6CeI1r0Yd49qppC8XxzRFGKtdqMEtmfawf5gkLYw5V4DL8N4VPvhP0XhOUN+BKkHijK
 3TEZIv1B7DaG04rpSeaRRhs3cygzhSky1dRJ8sIvZ8dUAKPqVlHojsnT01bu32Kqt/GH
 /WLn0BVKYy8vCKRrrtRI2PiRbRWMu88HdBySoVGvTyufGzZJn/0UM8v945H8B/ol+Cbt
 elSwPzTqpwc8RehqV8foGsB3gZSPJvp4O3e6WnvSqvyZYO3fQ5p1TcOgoN6ocJbOtZ3t MQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3egyuxsf7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 01 Mar 2022 07:44:43 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Mar
 2022 13:44:41 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 1 Mar 2022 13:44:41 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A2617B06;
 Tue,  1 Mar 2022 13:44:41 +0000 (UTC)
Date: Tue, 1 Mar 2022 13:44:41 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] wm8962: add a simple DMIC enable control
Message-ID: <20220301134441.GK38351@ediswmail.ad.cirrus.com>
References: <3542af028b622ec1513810b014c35a94b82a94c0.camel@puri.sm>
 <20220202104657.GA18506@ediswmail.ad.cirrus.com>
 <99b847d17e8ac399dba10842ec20091df926aa06.camel@puri.sm>
 <20220202133511.GB18506@ediswmail.ad.cirrus.com>
 <62ee89792a3f8921b4aad4d47f4db0bf2adb33f0.camel@puri.sm>
 <20220203110518.GF18506@ediswmail.ad.cirrus.com>
 <7b3306d7a80f605973c932a0a4679bcac067ae8a.camel@puri.sm>
 <20220204172116.GG18506@ediswmail.ad.cirrus.com>
 <fca54f527f619e21c19918ed3165d9ec8f85f6f6.camel@puri.sm>
 <20220207142129.GB112838@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220207142129.GB112838@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 4MkE5PJ4NbQutlrQIrrLgKN5_4Ww1epN
X-Proofpoint-ORIG-GUID: 4MkE5PJ4NbQutlrQIrrLgKN5_4Ww1epN
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kernel@puri.sm, patches@opensource.cirrus.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org, geert@glider.be,
 daniel.baluta@nxp.com
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

On Mon, Feb 07, 2022 at 02:21:29PM +0000, Charles Keepax wrote:
> On Mon, Feb 07, 2022 at 11:49:32AM +0100, Martin Kepplinger wrote:
> > Am Freitag, dem 04.02.2022 um 17:21 +0000 schrieb Charles Keepax:
> > > On Fri, Feb 04, 2022 at 10:43:53AM +0100, Martin Kepplinger wrote:
> > Volume itself indeed is good now. Recorded voice is very "metallic" and
> > "shallow" if you know what I mean - and distorted when using MAX
> > volume. The gnome audio recorder doesn't show *any* signal in the UI,
> > so that must still be kind of bad - even though I understand recorded
> > voice way better now than before.
> > 
> 
> My first thought is that the signal is clipping somewhere in the
> chain. You have a lot of the gaines up very high from when you
> were trying to working around the low signal level issues.
> 
> Can we be clear here on what paths are in play here. Presumably
> the gnome audio recorder is capturing over the I2S. When you say
> you can understand the recorded voice way better now, do you mean
> in the file captured by the gnome audio recorder? Or are you
> listening to that on another path, like direct to the headphones?
> 
> > thanks for all the time and help, and sorry for all the wrong amixer
> > output I sent you,
> > 
> 

Hey, just wanted to check everything was going ok on this stuff?
Did the volume tweaks get things sounding more normal, and any
other problems you guys are having?

Thanks,
charles
