Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D252B78E7F8
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23141DEE;
	Thu, 31 Aug 2023 10:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23141DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470489;
	bh=9xMHCGXlCUpKEPEb6GBr4328lWRBLyfrW8+T9+/rfhE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I3geje/8C99Y3uaHpyKXLjSAHjOwSQ+vPoQWgKJUlavbKOe5QKcZSlF+Zy6NW1hxR
	 jCOK6jm72Ls6wSCQBpb8Zx7N0Y9HWAR9B5/vlPw7DiwDMVFE9k5Qei2h+ZgHBQwthL
	 eHlGGfwSO6SS81ZWcG+VaPy6UkY3b/SjQCKalK8o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB3FF80600; Thu, 31 Aug 2023 10:24:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A42FF805F7;
	Thu, 31 Aug 2023 10:24:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 157B2F80155; Wed, 30 Aug 2023 17:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34114F80074
	for <alsa-devel@alsa-project.org>; Wed, 30 Aug 2023 17:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34114F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=A5P3fCv3
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37U6pHfg024626;
	Wed, 30 Aug 2023 10:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=3dzD33JpTIb1IXTJYjGhku5OWoUY4QPiqST5/HxVc5E=; b=
	A5P3fCv344ZfEcILzif6wwUNn+lfKIwYlJoH5t2jPJ2XQhLSK5Bw+/Pbn8lzNqsk
	JlFCvN/YlcUOyMeerHoq7gkZ3YbJUERSYxTFgPbMz7y9Cx92xEeWECrdLG8tOndD
	dIeZ4kW+FZ8j/dJxTY+IbKBXRo95w2H2p5ZxULjmeOttVk2AhSi0ud28bUcjKrQP
	yM4wexvPspQvHaUKC7+D7BPmi7CNhuaudWbInhcb+zEdWI/5ZdVRiFtiXUmPyT+l
	x6oB3bhmv20As4mWjo5Odj7kQQhfUSXg2uFTRltlHhnJjuYQtHM4Pnlyd+pD4TRz
	sf0gwLwkwbkHec2pgbOShw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyd5yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:55:56 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 30 Aug
 2023 16:55:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 30 Aug 2023 16:55:54 +0100
Received: from [141.131.145.49] (vkarpovich-ThinkStation-P620.ad.cirrus.com
 [141.131.145.49])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8BB6B3561;
	Wed, 30 Aug 2023 15:55:52 +0000 (UTC)
Message-ID: <d1ed5bf6-24e7-53d7-512b-ceab9e0a7e3d@opensource.cirrus.com>
Date: Wed, 30 Aug 2023 10:55:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/7] ASoC: cs35l45: Analog PCM Volume and Amplifier Mode
 controls
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
 <20230828170525.335671-4-vkarpovi@opensource.cirrus.com>
 <ZOz35ABAsLYROJ4c@finisterre.sirena.org.uk>
Content-Language: en-US
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
In-Reply-To: <ZOz35ABAsLYROJ4c@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e2iMeLiTaODRK9vNMFprx6UEquKePOdE
X-Proofpoint-GUID: e2iMeLiTaODRK9vNMFprx6UEquKePOdE
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4606cf803d=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GHBOEIQLITUOOF4DKNAUEUT6MGNCTGQI
X-Message-ID-Hash: GHBOEIQLITUOOF4DKNAUEUT6MGNCTGQI
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:22:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHBOEIQLITUOOF4DKNAUEUT6MGNCTGQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 8/28/23 14:39, Mark Brown wrote:
> On Mon, Aug 28, 2023 at 12:05:22PM -0500, Vlad Karpovich wrote:
>
>> +static int cs35l45_amplifier_mode_put(struct snd_kcontrol *kcontrol,
>> +				      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	snd_soc_component_enable_pin_unlocked(component, "SPK");
>> +	snd_soc_dapm_sync_unlocked(dapm);
>> +	snd_soc_dapm_mutex_unlock(dapm);
>> +	cs35l45->amplifier_mode = ucontrol->value.integer.value[0];
>> +	return 0;
>> +}
> This should return 1 on change (I did see that there's some code which
> generates notifications but it would still be better to flag changes
> here, it makes review a lot easier).
Thanks. I will update patch.
