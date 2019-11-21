Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D32B10520C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 13:04:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7371174D;
	Thu, 21 Nov 2019 13:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7371174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574337872;
	bh=vPdjA7XkzDUS2Tpaq20Taiteg67cb3FPLyzffkjxMKg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtHG9eheF8zlBztRvxSmjSR/j97fL4Oa5K3kDrcqeiGwnhgOzfGi874nco1WUfyB7
	 x3EHGJzNMqQE+qiT2lQ5RhDveVsaU9PCmRX609KWM1uIoPhJkMRe2ZArO551zXLBfj
	 CsJtAMDzk6w+Ln+JIzjShLXsbGVJhvFnJ35Or+G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F26EBF8014C;
	Thu, 21 Nov 2019 13:02:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B7A3F80146; Thu, 21 Nov 2019 13:02:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2117F800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 13:02:43 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C914BA0040;
 Thu, 21 Nov 2019 13:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C914BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574337762; bh=ZWnHXCfpU+jprCfwZ0wPbW959gUyTF8h+zoY4Vx2BN0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B070lNtsw5Xd7znLRPJZod3sRQxCeK5LbR4EtBhEjwMTAshJaeu0oonYBkLho1OQH
 hvoRg/xLjEGhQci90pj3puyuwEKu18/e4ZLhcyNt7Qc2AQP96mgMNtrrcuYTrYXG/d
 b/NSjNbcB/KgYL5LDHtUAM7mXMblr/zowqyKQWbM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 21 Nov 2019 13:02:38 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
References: <20191120174435.30920-1-perex@perex.cz>
 <20191121115124.GA4071@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7a527497-6132-c1df-d083-6cd27361eb08@perex.cz>
Date: Thu, 21 Nov 2019 13:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191121115124.GA4071@sirena.org.uk>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: improve the DMI long card
	code in asoc-core
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

Dne 21. 11. 19 v 12:51 Mark Brown napsal(a):
> On Wed, Nov 20, 2019 at 06:44:34PM +0100, Jaroslav Kysela wrote:
> 
>> -	/* make up dmi long name as: vendor.product.version.board */
>> +	/* make up dmi long name as: vendor-product-version-board */
> 
> I'm worried about this from an ABI point of view with people's UCM
> files.  But perhaps I'm worrying about nothing?

Mark,

   this is just the C comment fix. The long name is already in
vendor-product-version-board - no dots as delimiters (but does are allowed in 
the fields like version strings). This code improvement does not change the 
format of the generated long name string from the DMI information.

   Just see the examples in the soc-core.c comment for snd_soc_set_dmi_name():

  * Possible card long names may be:
  * DellInc.-XPS139343-01-0310JH
  * ASUSTeKCOMPUTERINC.-T100TA-1.0-T100TA
  * Circuitco-MinnowboardMaxD0PLATFORM-D0-MinnowBoardMAX

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
