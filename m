Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221C521556
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 065C118A8;
	Tue, 10 May 2022 14:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 065C118A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652185525;
	bh=OyB4iLtj8Dt/AY+CvearDc61JREuQbHFQ2VgrFI+JcY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VH9VYcPuL9Es69TuczYPsNQAnZHDsVAv2JhhNm59y+b6Q3fXUu5C4Br/IVhzoET0+
	 nub0dhiw3TlZUKnglqB3SsMdd9dSOCOyfq/IOf8nquhZguPLrto/16sH6OgU6XpP5k
	 fAW0/Tgo6h3iAOtAc7YUEPL3mKICJ3YiIVwSaHd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023FEF80544;
	Tue, 10 May 2022 14:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0F12F8025D; Mon,  9 May 2022 19:34:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A307BF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 19:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A307BF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jyR+xTAU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2496VWU3001166;
 Mon, 9 May 2022 12:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=t6gq3R+AfB/aX2+wHeecRH0o6mpd0KKT9eW7emaNAQ0=;
 b=jyR+xTAUDxgPGnIrGmO1aayZ3EC3Y+ukJc+fN/QD0F7LYLNenVC2UfMNHFR7dovCAUNj
 1XDNo7bmNxl1jD/j53RG9Rc7sXHxZoJLJScs0A9xAnoj3uvnhlnPIr3LLdKZa3NO4nDr
 dLDL4RBZDyfxFiG2qb2kN00ItmCkLaq8cXlWJN7cndmGx+AeIUODIhhYCzPaZhB8wZtG
 VXJtCufWWcljLGPPrZSAk9A3IJ4FuFq15IWulcUtn3AbDox/i/EJIa48K6BstGiqWPGB
 Ic3PiLtDOpoc5VdYbAxEEALgKlzRmb7FtuRw2Wytbzapfut171bQYo7bC28B7FlC2bRT Ow== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nu0a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 12:34:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 18:34:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 18:34:13 +0100
Received: from [198.90.202.102] (lon-sw-dsktp002.ad.cirrus.com
 [198.90.202.102])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B83C8476;
 Mon,  9 May 2022 17:34:13 +0000 (UTC)
Message-ID: <1b64582b-59f0-5eb5-5873-8102f99f649b@opensource.cirrus.com>
Date: Mon, 9 May 2022 18:34:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 00/26] ALSA: hda: cirrus: Add initial DSP support and
 firmware loading
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20220427150720.9194-1-vitalyr@opensource.cirrus.com>
 <YmljEm6jUr3Odsv9@sirena.org.uk> <s5hbkw7m6ew.wl-tiwai@suse.de>
 <Ynj5PG0flJhn9iYD@sirena.org.uk>
From: Vitaly Rodionov <vitaly.rodionov@opensource.cirrus.com>
In-Reply-To: <Ynj5PG0flJhn9iYD@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z6-T7Ijtgp9gP4qhW1kfctbLi5AMhiRz
X-Proofpoint-GUID: Z6-T7Ijtgp9gP4qhW1kfctbLi5AMhiRz
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Tue, 10 May 2022 14:21:49 +0200
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

Hi Mark, Takashi

On 09/05/2022 12:21 pm, Mark Brown wrote:
> On Mon, May 09, 2022 at 10:55:35AM +0200, Takashi Iwai wrote:
>> Mark Brown wrote:
>>> On Wed, Apr 27, 2022 at 04:06:54PM +0100, Vitaly Rodionov wrote:
>>>> The CS35L41 Amplifier contains a DSP, capable of running firmware.
>>>> The firmware can run algorithms such as Speaker Protection, to ensure
>>>> that playback at high gains do not harm the speakers.
>>>> Adding support for CS35L41 firmware into the CS35L41 HDA driver also
>>>> allows us to support several extra features, such as hiberation
>>>> and interrupts.
>>> There's a bunch of changes for this driver in the ASoC tree, it looks
>>> like the bits that touch ASoC will need basing off those.
>> How is the situation for the time being?
>> I've been off in the last weeks, so couldn't follow the whole
>> thread.
> No change, Vitaly didn't update or respond as far as I remember.  We'll
> need a new version.

Sorry for delay, yes we have re-based version, I will send again.

Thanks,

Vitaly

