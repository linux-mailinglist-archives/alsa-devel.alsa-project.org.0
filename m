Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36A5B3CD3
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 18:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B1F1693;
	Fri,  9 Sep 2022 18:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B1F1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662740278;
	bh=hCk/M+ei6mtNx+mPDVV3Ig89xe30s7qQjDeHbh87eTw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pK6fGfrCu95OtNj2QdXfuf+pjXCo54uCPUkH/eF0jomfLrCxt1mfMKHFNZzTlSvjV
	 4/tGLtMX5+qJIpWuF0KFfNGMikXFD00LvJsgrMoXD4p840wqDTrYGcXIqaXIxHUXLe
	 PVIevGSGvnt1ZH3E/Y3WqPGFB/jfP/i4kRstneVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64495F8032B;
	Fri,  9 Sep 2022 18:16:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 138B4F8023A; Fri,  9 Sep 2022 18:16:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CF9AF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 18:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF9AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="M74U+SR/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2895aPIn014512;
 Fri, 9 Sep 2022 11:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=0LNLMREyF5kJJgwuJGbEQYx89rPhx/7FxKJ+y8sHgso=;
 b=M74U+SR/xFOyjL5Yd8vaYN5nOMG05D2LuG2ZLLequWgbIJBMSLIFBIKks71n5joggxPt
 DsYDofPEu/Tibf/3TlUnGfgrDm81ZycDq0UUIzo4ky4uXnh3Z7wLYPr+N0s7E/2/ifcl
 iM8qcqz/dhihehviCf2CmvFR6pSxp9XLByzAEeQ+9C+qTdFquAJSA9g1A4j06QD8SENv
 aFVSTgHqNkcDruyTrr0PFKNFdTtjugloZEgcCdx1wVI7lcw/LpvcZrOFD57wWPMAkeKZ
 f4TLnuf9Qdb75KhlENf08rMpWMI7YY8iqHFnLc9C6uIq3JUb5dRJoJdSMbGm+lGwoHWu fw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jc4b2hu9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 11:16:50 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 9 Sep
 2022 11:16:48 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Fri, 9 Sep 2022 11:16:48 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 474012C5;
 Fri,  9 Sep 2022 16:16:48 +0000 (UTC)
Message-ID: <a7c2df88-766a-4657-8379-649a5ae93ac4@opensource.cirrus.com>
Date: Fri, 9 Sep 2022 17:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 00/10] Support for CS42L83 on Apple machines
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>, James Schulman
 <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, "Lucas
 Tanure" <tanureal@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220909135334.98220-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hV03cIsYarymZq2cwhZT7i_S0oaKwdrQ
X-Proofpoint-ORIG-GUID: hV03cIsYarymZq2cwhZT7i_S0oaKwdrQ
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
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

On 09/09/2022 14:53, Martin Povišer wrote:
> Hi all,
> 
> there's a CS42L83 headphone jack codec found in Apple computers (in the
> recent 'Apple Silicon' ones as well as in earlier models, one example
> [1]). The part isn't publicly documented, but it appears almost
> identical to CS42L42, for which we have a driver in kernel. This series
> adapts the CS42L42 driver to the new part, and makes one change in
> anticipation of a machine driver for the Apple computers.
> 
> Patch 1 adds new compatible to the cs42l42 schema.
> 
> Patches 2 to 7 are taken from Richard's recent series [2] adding
> soundwire support to cs42l42. They are useful refactorings to build on
> in later patches, and also this way our work doesn't diverge. I made
> one fix: I added a call of common_remove at the end of i2c_probe should
> the cs42l42_init call fail (both before and after the split to
> cs42l42-i2c.c). Also s/Soundwire/SoundWire/ in the changelogs.
> 

Mark: I've no objection to you taking my patches from this chain instead
of waiting for me to re-send them myself. I can rebase my remaining
patches onto this chain. But I do have comments on patches #4 and #7.

I've been very busy and don't have time right now to deal with
re-sending my original patch chain.
