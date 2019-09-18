Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78DEB6143
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E1C11672;
	Wed, 18 Sep 2019 12:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E1C11672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568801832;
	bh=Yg8zyD+v3yrCJYCsAoVvxsoeaiEP6wbGkhFlc81khTg=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZBgxW+hBYB2WwMV7v7q2yMdgBdbXLOkbEGkgAC6FC+WNedRq/Z/kXk1xotUklPFvh
	 XtBk1r4w/MwDFpbcgyACcxsi2Y18frKdKaUTnm2C3CKvgjUKzkrl41tTRMpPTKoIQU
	 enR1QYAZd0TJl20QBHL4qVsrw4qB6LnqCXqBUQ54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C201F80535;
	Wed, 18 Sep 2019 12:15:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC461F80527; Wed, 18 Sep 2019 12:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54F7FF80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F7FF80146
Received: from [78.40.148.177] (helo=localhost)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iAX02-00063i-Ag; Wed, 18 Sep 2019 11:15:50 +0100
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 11:15:49 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <854421d9-8c5b-0960-1864-0cf8f1018696@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-6-ben.dooks@codethink.co.uk>
 <c9d2b321-b344-f5db-f2cb-c213bb5894a6@nvidia.com>
 <854421d9-8c5b-0960-1864-0cf8f1018696@nvidia.com>
Message-ID: <3438cecb8ed89a96cfb30127dbd5e770@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 5/8] ASoC: tegra: set edge mode for TDM
	correctly
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2019-09-18 10:02, Jon Hunter wrote:
> On 18/09/2019 09:54, Jon Hunter wrote:
>> 
>> On 17/09/2019 19:12, Ben Dooks wrote:
>>> In TDM, use the negative edge to drive data and the positive edge to 
>>> sample
>>> data.
>>> 
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>>  sound/soc/tegra/tegra30_i2s.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>> 
>>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>>> b/sound/soc/tegra/tegra30_i2s.c
>>> index 4222839b63bd..d75ce12fe177 100644
>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>> @@ -117,6 +117,8 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai 
>>> *dai,
>>>  	}
>>> 
>>>  	pm_runtime_get_sync(dai->dev);
>>> +	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK,
>>> +			   i2s->is_tdm ? TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE : 0);
>>>  	regmap_update_bits(i2s->regmap, TEGRA30_I2S_CTRL, mask, val);
>>>  	pm_runtime_put(dai->dev);
>> 
>> I would rather set this in the case statement above where the format 
>> is
>> parsed and again drop this 'is_tdm' variable.
> 
> Actually, this should be implemented as shown in the following ...
> 
> https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=sound/soc/tegra-alt/tegra210_i2s_alt.c;h=ee482f27ed2e4710e5e7446918887f8f8ef31285;hb=a960d522a5486aee27605f890034869c4f49d94a#l362
> 
> Jon

Ok, will look at that.

Note, nv-tegra.nvidia.com seems to have a security problem .
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
