Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF31B4B48
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 19:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0DC616A1;
	Wed, 22 Apr 2020 19:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0DC616A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587575196;
	bh=BH8tpbpe981/e0pANkwZtQltucd09KtWoHay2+u8+iI=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C91AXNCymv8rbmENVga8jopEM+U4mYBZJaKm8HJsXDsqls2CqUKFkJmjfNxtHd3IG
	 JHJ0ERpvwHH4MFskW5H5clDUNJsa9gMeo2K5NnUywpb5maN04LtlU6FxOOEGxmO3Xj
	 4IN8AUjCloS1QsYuI+M6JuIzZkxBTLORtV6m1ayM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8CC8F8020C;
	Wed, 22 Apr 2020 19:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE86FF801D9; Wed, 22 Apr 2020 19:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A203EF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 19:04:43 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CA56FA003F;
 Wed, 22 Apr 2020 19:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CA56FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1587575081; bh=/R1VvLAqQHPrpWwdJMq8nH56YnfP3SEUEtkNev9MYy8=;
 h=From:Subject:To:Cc:Date:From;
 b=jeUmwDU6kYtjs0becdQug3xHsWiU20eWa0EDHG+Zs5ps6b0I134//RtJ9OQs9inT2
 jgqnQQJqKHeXsTKHP/qbG8jSCw6eNif7sW0Auzpx54+hG1xWOx/HQ+fd/Zfb2VTMID
 F8jV5ENVy0AyHTOnwOEFL7hKcZOTyWjpoj9+uwps=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 22 Apr 2020 19:04:36 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
Subject: ASoC driver names
To: Mark Brown <broonie@kernel.org>
Message-ID: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
Date: Wed, 22 Apr 2020 19:04:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Hi all,

   I am fighting actually with the ASoC driver names. The current situation, 
where each hardware variant (card name) is mapped to the driver name is not 
very practical (and not correct). The driver name should describe the common 
part (usually the controller - like 'HDA-Intel' or bus 'USB-Audio').

   I am talking about the situation, where the ASoC card name is set via the 
device tree (snd_soc_of_parse_card_name) like in [1], but the change may be 
considered for other drivers like Intel SST:

Card driver name: Lenovo-YOGA-C63
Card name: Lenovo-YOGA-C630-13Q50
Card long name: LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216

[1] 
https://github.com/alsa-project/alsa-tests/pull/3/commits/1b5a552cff06c6039fbcf41b3117fc73712010df

   My question is, can we change / add the more apropriate driver names 
conditionally with a new kernel CONFIG option? Will you accept this change?

   The goal is to group the related UCM2 configurations and do the required 
split inside the UCM2 top-level configuration file based on card components 
string or other card identificators (related to the driver).

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
