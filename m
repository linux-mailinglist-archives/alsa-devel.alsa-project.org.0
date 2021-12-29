Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA30481179
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 11:02:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537B1174D;
	Wed, 29 Dec 2021 11:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537B1174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640772137;
	bh=XZK1uAr1/i9928mRWbk2azjjAJWnc9UkICqJFbDMJks=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKVT8Aq38Z548h1P2kD1MQeujb0HFkZtR3X9KgmCwlg853uQnIoAXYNKxxCgzhefj
	 imDgBZ6T9XhS1ao4vZHREIqQ6cNftz2DAHqq15OhKr44bUpjroFTei9rxrkCQX6z71
	 DuZvSzAd/RHHo/qWLPPnUpjg80Y2DTXO6axZWuk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C118FF80224;
	Wed, 29 Dec 2021 11:01:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9CD9F800CE; Wed, 29 Dec 2021 11:01:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A710F800CE
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 11:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A710F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Axia0UVF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BT7PVOI031288;
 Wed, 29 Dec 2021 04:01:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=4F/7U4Me8cfZbbk9EadC4gHfPNQnvUJxSbtUYa3hpWo=;
 b=Axia0UVF0lD0ZeQYOVZGZVem07+mNas2x81lfAlfOI0xEh1+OU+UFEj/6ISFsjWZRSnb
 jDIHiCoOadvYdqKK9AWtEtZ7H6uob6Lzj1w7W3pL7kXkHh9asSuqBO/oVwLY4JRbnhT0
 F7gWhSSyeQiV53D9Me9rohAVzUmS3ll1LQwmjeDXe/iGi94n/YgjuONXP+ZF+JBQFWoH
 C1Amcjdh1KIqtBLK+lY5MArBhiNslHfDWSt9tk3ffyU5pA1jfdIBHmpn5wuVuG/IAL3C
 CqoGzXMuNspDsQxoNNGVj1Fh4snl7kxWL+taTur64S8D3V8r3saUQmjoMs96aZY7auuK fA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3d7ksg9j73-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Dec 2021 04:01:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 29 Dec
 2021 10:00:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 29 Dec 2021 10:00:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 89BBE11C7;
 Wed, 29 Dec 2021 10:00:54 +0000 (UTC)
Date: Wed, 29 Dec 2021 10:00:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH RESEND 2/2] ASoC: cs4265: Move reset_gpio to local scope
Message-ID: <20211229100054.GZ18506@ediswmail.ad.cirrus.com>
References: <20211222141920.1482451-1-festevam@gmail.com>
 <20211222141920.1482451-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211222141920.1482451-2-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 5xi1Va85YxBVM1hDJowF0-nfq0KEZzEE
X-Proofpoint-ORIG-GUID: 5xi1Va85YxBVM1hDJowF0-nfq0KEZzEE
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Paul.Handrigan@cirrus.com, james.schulman@cirrus.com
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

On Wed, Dec 22, 2021 at 11:19:20AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> There is no need to keep 'struct gpio_desc *reset_gpio' inside
> the private structure becase reset_gpio is only used inside the
> probe() function.
> 
> Move it to a local scope.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Patch looks fine, but I do have a slight doubt would it perhaps
be better to add a remove function that puts the device back into
reset, thus keeping the private member? Feels like it might be a
nicer state to leave the chip in if the driver unbinds.

Thanks,
Charles
