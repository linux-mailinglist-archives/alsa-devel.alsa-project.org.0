Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492013C700
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 16:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371AA17AF;
	Wed, 15 Jan 2020 16:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371AA17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579100951;
	bh=ODzR4l3tpJ5efAVoqjYyZ4AT3DoRSe2QRrra6ktTJNA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXo/ZLh2W5MuSTUK9c4AbRo5rVAE8dbO9nYTuViamqUKXcpCtz6RJjLNzCnp7CtU6
	 89nUVtgCb/rRIlEkdaQLw7PQ+vBkhFCQ9VpfHX+3q1VLOX9WTIhs3r/OQ2QAOp0I4P
	 XWZmyyFORyfLeW87/+rJO2GEwAQ7dZLTBsYu7PNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FAAF801F8;
	Wed, 15 Jan 2020 16:07:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF436F801EB; Wed, 15 Jan 2020 16:07:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FBA5F800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 16:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FBA5F800CC
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 07:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
 d="diff'?scan'208";a="256802220"
Received: from sbreyer-mobl.amr.corp.intel.com (HELO [10.255.228.18])
 ([10.255.228.18])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2020 07:07:15 -0800
To: ojab // <ojab@ojab.ru>
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
Date: Wed, 15 Jan 2020 09:07:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------97225A65C771DFF3C8326034"
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a multi-part message in MIME format.
--------------97225A65C771DFF3C8326034
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/15/20 5:57 AM, ojab // wrote:
> On Wed, Jan 15, 2020 at 4:41 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> Please post the results of alsa-info.sh somewhere so that we can take a
>> look.

Thanks, I think that confirms my theory.

> 5.3.0: http://alsa-project.org/db/?f=d82b3ef237a5050dfb73231ba114e45a6a4420ef

In this case, there's a warning on the routes:

[   22.364318] skl_n88l25_s4567 skl_n88l25_s4567: ASoC: Failed to add 
route iDisp3_out -> direct -> iDisp3 Tx

> 5.4.0: http://alsa-project.org/db/?f=d922b77306a1287eae3624d241f3d46d347c8098

And we know that in 5.4 errors on routes caused the card registration to 
stop. I *think* the patch was  daa480bde6b3a9 ("ASoC: soc-core: tidyup 
for snd_soc_dapm_add_routes()")

This patch won't revert cleanly, can you try the following hack on v5.4 
to see if this improves the card registration? Thanks!



--------------97225A65C771DFF3C8326034
Content-Type: text/x-patch; charset=UTF-8;
 name="routes.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="routes.diff"

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 88978a3036c4..796d14feab4d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1076,8 +1076,8 @@ static int soc_probe_component(struct snd_soc_card *card,
 	ret = snd_soc_dapm_add_routes(dapm,
 				      component->driver->dapm_routes,
 				      component->driver->num_dapm_routes);
-	if (ret < 0)
-		goto err_probe;
+	//if (ret < 0)
+	//	goto err_probe;
 
 	/* see for_each_card_components */
 	list_add(&component->card_list, &card->component_dev_list);
@@ -2065,13 +2065,13 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
 				      card->num_dapm_routes);
-	if (ret < 0)
-		goto probe_end;
+	//if (ret < 0)
+	//	goto probe_end;
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
-				      card->num_of_dapm_routes);
-	if (ret < 0)
-		goto probe_end;
+					      card->num_of_dapm_routes);
+	//if (ret < 0)
+	//	goto probe_end;
 
 	/* try to set some sane longname if DMI is available */
 	snd_soc_set_dmi_name(card, NULL);

--------------97225A65C771DFF3C8326034
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------97225A65C771DFF3C8326034--
