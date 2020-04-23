Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C21B6105
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30B7716AF;
	Thu, 23 Apr 2020 18:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30B7716AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659617;
	bh=W3uD2gwryLuskQHLPCX8Akn/QB77A4eru/o/IX4cj2s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E5znqr0axO2aSUlTp79wQmsueE5CRowTYnlqvX6FKuM1bnngNiiXDYRyc/VZcXDVB
	 KN8P8hkYGaKroXyURjfpRneCkgADy81VCip65CBbP7KAi6oYB9SNey8NAQIKnMnB5w
	 w6J3mh6JDUcCowuPnAx+9CH7b/fS1Xd7ZT6YSw2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F730F8029A;
	Thu, 23 Apr 2020 18:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46200F8028B; Thu, 23 Apr 2020 18:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55401F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55401F800FF
IronPort-SDR: WZDsYOkL1ZeR3a+wCHxv0/X2nwkf3LkkSee30v7qtUb+6ktt67qx4ZEWOiMcB98+c5b8q1wh6P
 Gqp9Fwy3zunQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 09:30:08 -0700
IronPort-SDR: uHiq6D+GWhLPsWP5TaI/Afuzmd3GMTkOI9Fch2IrixFERvxXLJ1sTQwJOWwJsPLeSQ61e0x08f
 KDEs1rjWj2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="256040300"
Received: from lsatpatx-mobl.gar.corp.intel.com (HELO [10.251.150.156])
 ([10.251.150.156])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2020 09:30:08 -0700
Subject: Re: ASoC driver names
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
References: <c57f21dc-412d-3057-6150-b96d96a20727@perex.cz>
 <20200423110437.GF4808@sirena.org.uk>
 <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7b44a625-fe88-5eac-280f-daa15a7c83dc@linux.intel.com>
Date: Thu, 23 Apr 2020 11:17:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e31a20e6-91ab-2f30-f496-064bea07762a@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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



> +#ifdef CONFIG_SND_SOC_DRIVER_NAMES
> +       if (!card->driver_name) {
> +               dev_warn(card->dev,
> +                        "ASoC: Card driver does not set the driver name\n");
> +               return -EINVAL;
> +       }

I am all for Jaroslav's proposal of making the driver name the basis for 
UCM identification. we've been working on this since e.g. the addition 
of the sof- prefix creates a driver name that makes no sense after a 
truncation of the card name to 16 characters [1] [2] - still WIP.

Making the card name more user-friendly is also a good thing, there's 
also a nice hidden feature when the card name contains spaces, the last 
word - typically the codec - is used for the card ID.

But reporting an error when the driver name is not set is a bit extreme 
and would break all Intel boards. I think we want to encourage people to 
move to the suggested solution, but do we want to break existing setups?
I must admit I also don't see a generic solution when the card is 
generated from a DT description, it's not straightforward to translate 
parsed elements into human-readable ones.

While I am at it, I think we should probably avoid using the DMI 
information for the long card name. It's just awful. It might be a 
better idea to add it in the component strings (if it fits) so that UCM 
can use it internally, but it's really horrible. Even with the clean-ups 
suggested by Jaroslav I ended-up with this horror of a long name on my 
test device:

root@Zotac:~# cat /proc/asound/cards
  0 [rt5640         ]: SOF - sof-bytcht rt5640
                       ZOTAC-XXXXXX-XX-CherryTrailFFD

If we really wanted to be user-friendly we'd use something like

"SOF card for Baytrail/Cherrytrail devices with Realtek RT5640 codec"

and apply the same pattern for all machine drivers.

[1] https://github.com/thesofproject/linux/pull/2021

[2] 
https://github.com/alsa-project/alsa-ucm-conf/pull/20/commits/4cc7fe4493c237253cb43cf7d33c32ec975a0691
