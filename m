Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE631042CB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 19:03:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF801763;
	Wed, 20 Nov 2019 19:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF801763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574272983;
	bh=uxbXy9/iJgLQOv01+SxGY5d2Ybfhcti8BjVvQ5tIGT0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGwM3zyP0hpXjmVDj4UbCcI3E9O4tyaGotspZafeU1jl3Awd3tjGe5+WRXDpQPrGF
	 LzgEZHF4W0oA8oT73SBk4a705K2MDjp3lbF/6LFyo6HOXxkl+RwyMiJOnrde/f0FO5
	 M4ws+KllgzwcsJg9whajolDlMZQZwZEjDDxyixjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75B4CF8021C;
	Wed, 20 Nov 2019 18:57:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7047CF80217; Wed, 20 Nov 2019 18:57:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4762F8020C
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:57:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 67EFFA0047;
 Wed, 20 Nov 2019 18:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 67EFFA0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574272653; bh=/6d09bopjOQk6yTxYG/bAw2SIn2ob3JhQ0vFTccW9YM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tNBRwtTHy6m6xafHotzjnlUOatm6QcJiPNAE0H69tUXWIufSKbf++rnUfmvwQRc6h
 Q3rQtEc3xYLLZta9Mihi+DenfxterMI8jC36W/LgCmqdK3KoK+0/H7yxPBPw2mZjuK
 CrGTp1j3nKU0ZpSIGc/WIphUlqQx8iB5bIckR+y4=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 20 Nov 2019 18:57:29 +0100 (CET)
To: ALSA development <alsa-devel@alsa-project.org>
References: <20191120175411.31619-1-perex@perex.cz>
 <20191120175411.31619-2-perex@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cdbba225-f622-4e4c-1132-850b94fcb004@perex.cz>
Date: Wed, 20 Nov 2019 18:57:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191120175411.31619-2-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 2/2] ASoC: Intel - do not describe I/O
 configuration in the long card name
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

Dne 20. 11. 19 v 18:54 Jaroslav Kysela napsal(a):
> The long card name might be used in GUI. This information should be hidden.
> 
> Add CONFIG_SND_SOC_INTEL_USER_FRIENDLY_NAMES configuration option.

Grr. It should be CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES. v4 patches
were sent.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
