Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547E8537978
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 12:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D606C1AE1;
	Mon, 30 May 2022 12:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D606C1AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653908079;
	bh=oSCjQ3szroM2hFhCpY30NhbKfAR6VPWu8cqyeDf9pXk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKjuJkjGNFAhQ4phWxoYcz2NIMaPwjvsWvWkPq4tiy0qrtRYwiiteRGO7pMI02Sxw
	 7fjR1GUGICzD1vxZnPsCUx7GHQznprvk+Aut0hGzMpyOT/beSw/8hjWHkWQAO5U7j/
	 bNwvMNQNZ/27wqaPyO+nzpGM2EiodiQMTHZbOrCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48FDCF801F5;
	Mon, 30 May 2022 12:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CE5FF8019D; Mon, 30 May 2022 12:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7363AF800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 12:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7363AF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="itK/QRva"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24U8hF83003487;
 Mon, 30 May 2022 05:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=CA7nSWc/bxcs60/+XFOKN9BKEj4sNIHLXQRef45Ouz4=;
 b=itK/QRvas1VOFmAx1tGQVS8tXAkZrU0HtCz5g0+ns/oy+9uJoYx7Sp14C9UPYgSEaEFa
 s26TqFGUHhFnRGWO7TRynmdViDpFgRVwYJfe5FUO2GRIlrlfO1xRHGiQbmB1qIhn+qTS
 9FANWfOsdO9yodylCu3pAP6zwXfLqTX4Dl7oaaoTOssh0j87lrxDn5fLEICe0TysvuO+
 0W0uBGRqfRI4yGSZvVVLyYbVkNAawnHXv6L8oapfMebVzYkiRW2fKeicyZXgeDdfm4t7
 e9vB7499KaUGezMa6qLpyXaMf6KUyL/xYdUG/02WhMc59KoOPKfCssJ1OSRAJKvZj83+ +g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gbg5nhnm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 May 2022 05:53:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 30 May
 2022 11:53:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 30 May 2022 11:53:29 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 876A946C;
 Mon, 30 May 2022 10:53:29 +0000 (UTC)
Date: Mon, 30 May 2022 10:53:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4 00/17] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Message-ID: <20220530105329.GV38351@ediswmail.ad.cirrus.com>
References: <20220525131638.5512-1-vitalyr@opensource.cirrus.com>
 <871qwf0x8t.wl-tiwai@suse.de>
 <20220530090846.GS38351@ediswmail.ad.cirrus.com>
 <87czfvxtsc.wl-tiwai@suse.de>
 <20220530093639.GT38351@ediswmail.ad.cirrus.com>
 <87a6azxr7h.wl-tiwai@suse.de>
 <20220530103415.GU38351@ediswmail.ad.cirrus.com>
 <871qwbxpsb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871qwbxpsb.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 8UOBs33TfOfRbSmlXAAfeQgRZvOOO0el
X-Proofpoint-GUID: 8UOBs33TfOfRbSmlXAAfeQgRZvOOO0el
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>, patches@opensource.cirrus.com,
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

On Mon, May 30, 2022 at 12:45:08PM +0200, Takashi Iwai wrote:
> On Mon, 30 May 2022 12:34:15 +0200,
> Charles Keepax wrote:
> Well, if an ALSA control can trigger the firmware loading, that's
> already fragile.  A firmware loading is a heavy task, which should
> happen only at probing and/or resuming in general.  Do we have other
> drivers doing the f/w loading triggered by a kctl...?
> 
> > I guess we could look at adding locked versions of the add
> > control functions as well if that might be preferred?
> 
> If the patterns of additional kctls (specific for firmware?) are
> fixed, we may create all such kctls beforehand and let them inactive
> unless the corresponding firmware is really loaded, too.
> 

I am afraid we do, basically all the Wolfson/Cirrus audio devices
allow you to select the firmware through a kctl. The patterns of
controls are specific to the firmwares, so we can't really create
them ahead of time. One could maybe look at changing when the
firmwares are loaded, such as attempting to load all possible
firmwares on boot or something but its a fairly sizable change
that isn't without some side effects.

Thanks,
Charles
