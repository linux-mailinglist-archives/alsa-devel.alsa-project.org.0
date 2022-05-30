Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A453852B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 17:43:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFA81F5E;
	Mon, 30 May 2022 17:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFA81F5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653925437;
	bh=oUIGuRs6+k7bvWFP0sdBmNmBYlGFaJ/cOXSBqo9C/tk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tDiYcH3K1t6XfDk7aFc6ocC1ttmHxj3n9fiTXrdhHDhI17YJQpcaW5DIt7pjnLuX9
	 263YJhQMYTRCkYM7nXQ3LV4QsjfceTOvAxUO5gvvP4jvCbWyHRXSlIVl2wKL/bNPPY
	 4S8hQ/izEbhDLcI9xnMCk1R0eNlTE4Bh6/OvOoVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DAD2F801F5;
	Mon, 30 May 2022 17:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18593F8019D; Mon, 30 May 2022 17:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3804F80124
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 17:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3804F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="EaW6SU16"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24UCWckK031719;
 Mon, 30 May 2022 10:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=11pjfbwnqjvFmqlfNXE5HUVDU57yELpFdGSoDPUvib0=;
 b=EaW6SU162fEQ3FQZQS8yM52QevUSykbIP7szsvIQrEb/gSmowud+PoSL3ncvInveHswo
 zqoyxta/V876bobfonBUffqiM92yxSrSgbSAVK+x5zgwWmrQ+ehAVswLe9vFI/USQAv7
 AJFek2WDrQIAQOsYpCpklQ7cJl/YVbATj+FzzdvuydibWNAbLpICwbYLGEAcnyDgkPCC
 L9iRCmtLp1Dk1pB1n8ABXbkhpgm6Od4dYbWX7vRi+1FGzYFjqTVgRT+Nh03xCqr/qsOk
 Y1AL8AJF47tD+eX31FVcD68vBv8CArCnZRFlqxvVMrWq33Xg0MB47KqNE1BBmdjKZ4uo 8w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gbh51hvjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 May 2022 10:42:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 30 May
 2022 16:42:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 30 May 2022 16:42:40 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A46BF11D1;
 Mon, 30 May 2022 15:42:40 +0000 (UTC)
Date: Mon, 30 May 2022 15:42:40 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.18 089/159] ASoC: tscs454: Add endianness flag
 in snd_soc_component_driver
Message-ID: <20220530154240.GW38351@ediswmail.ad.cirrus.com>
References: <20220530132425.1929512-1-sashal@kernel.org>
 <20220530132425.1929512-89-sashal@kernel.org>
 <YpTSkjYKAZLcOykC@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YpTSkjYKAZLcOykC@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 4OiTsCAEN3KNyoBVMCYlj_vrrrXL9qyJ
X-Proofpoint-ORIG-GUID: 4OiTsCAEN3KNyoBVMCYlj_vrrrXL9qyJ
X-Proofpoint-Spam-Reason: safe
Cc: Sasha Levin <sashal@kernel.org>, steven.eckhoff.opensource@gmail.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Mon, May 30, 2022 at 04:20:02PM +0200, Mark Brown wrote:
> On Mon, May 30, 2022 at 09:23:14AM -0400, Sasha Levin wrote:
> > From: Charles Keepax <ckeepax@opensource.cirrus.com>
> > 
> > [ Upstream commit ff69ec96b87dccb3a29edef8cec5d4fefbbc2055 ]
> > 
> > The endianness flag is used on the CODEC side to specify an
> > ambivalence to endian, typically because it is lost over the hardware
> > link. This device receives audio over an I2S DAI and as such should
> > have endianness applied.
> > 
> > A fixup is also required to use the width directly rather than relying
> > on the format in hw_params, now both little and big endian would be
> > supported. It is worth noting this changes the behaviour of S24_LE to
> > use a word length of 24 rather than 32. This would appear to be a
> > correction since the fact S24_LE is stored as 32 bits should not be
> > presented over the bus.
> 
> This series of commits doesn't feel like a good idea for stable,
> it will probably be safe but it's effectively new feature stuff
> so out of scope and there's some possibility we might uncover
> some bug which might've been being masked.

Strongly agree here, no need to back port these to stable.

Thanks,
Charles
