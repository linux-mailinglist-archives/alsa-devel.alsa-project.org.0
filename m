Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0113CD3B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 20:40:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D2017A8;
	Wed, 15 Jan 2020 20:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D2017A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579117232;
	bh=+RhEoKDazEhlsoGpCWIIDiE1VI1lYaZYzqj3gi18uqw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDKDbHIqoZSEu4MAA7eRAt0TgXqh+qK76wr/eIb0DZ7Po+UPLwmul8+bkv/RGgzDK
	 W9wmc1/eAcOyqcYndQUG5S0DFTBjqUg/0/wQPJu1dio4SwnYMoI4SzM9cM6ieV2rXl
	 0H2G7FLEiU+7RSm7Pwez+rk///r6tQDraNaNOZW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A33C4F8014B;
	Wed, 15 Jan 2020 20:38:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A50BDF801EB; Wed, 15 Jan 2020 20:38:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E1EAF800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 20:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1EAF800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 11:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="256908850"
Received: from sbreyer-mobl.amr.corp.intel.com (HELO [10.255.228.18])
 ([10.255.228.18])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2020 11:38:31 -0800
To: ojab // <ojab@ojab.ru>
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
 <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7de214eb-d6a0-3f86-9eb3-76488f0ec99f@linux.intel.com>
Date: Wed, 15 Jan 2020 13:38:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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


>> This patch won't revert cleanly, can you try the following hack on v5.4
>> to see if this improves the card registration? Thanks!
> 
> 
> Yep, it works with the patch.

ok, thanks for testing! So that leaves us with two options:

a) remove the error handling after soc_dapm_add_routes() to be backwards 
compatible with Intel problematic machine drivers. Not really nice for 
everyone else.

b) remove this error conditionally so that legacy Intel solutions still 
work but new ones deal with errors upfront.

I am not sure if there's a 'clean' way to implement b), maybe with a 
Kconfig selected by some machine drivers? Morimito-san, any suggestions 
now that we've root caused the problem (copied again below for reference)?


diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 88978a3036c4..796d14feab4d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1076,8 +1076,8 @@ static int soc_probe_component(struct snd_soc_card 
*card,
         ret = snd_soc_dapm_add_routes(dapm,
                                       component->driver->dapm_routes,
                                       component->driver->num_dapm_routes);
-       if (ret < 0)
-               goto err_probe;
+       //if (ret < 0)
+       //      goto err_probe;

         /* see for_each_card_components */
         list_add(&component->card_list, &card->component_dev_list);
@@ -2065,13 +2065,13 @@ static int snd_soc_instantiate_card(struct 
snd_soc_card *card)

         ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
                                       card->num_dapm_routes);
-       if (ret < 0)
-               goto probe_end;
+       //if (ret < 0)
+       //      goto probe_end;

         ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
-                                     card->num_of_dapm_routes);
-       if (ret < 0)
-               goto probe_end;
+                                             card->num_of_dapm_routes);
+       //if (ret < 0)
+       //      goto probe_end;

         /* try to set some sane longname if DMI is available */
         snd_soc_set_dmi_name(card, NULL);
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
