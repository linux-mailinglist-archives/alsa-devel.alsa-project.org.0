Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A702BE51CD
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 18:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B71186F;
	Fri, 25 Oct 2019 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B71186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572022762;
	bh=oRujLfOyEXt/2KVVygCYlAOn2xuGB2Yg+KE4aypto6w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qUDWB+0iIc/GxsntxcREAki/+0/PEECkTFGFJc6nUyWqRgsrbVkAM7EnQYsegas2x
	 ckZrNVH4ZO25a6l1KzBWJwzAE1C6TBs7IE9a5qe+763K1UHrvuuQFu6g5CqJ9z6o8t
	 q/go7YRdTui0a1kQAf9cPB8LYbon4ljJwK77QqbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36EFFF8036F;
	Fri, 25 Oct 2019 18:57:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 122E9F8036F; Fri, 25 Oct 2019 18:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB451F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 18:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB451F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 09:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; d="scan'208";a="373604667"
Received: from davidpat-mobl2.amr.corp.intel.com (HELO [10.251.153.16])
 ([10.251.153.16])
 by orsmga005.jf.intel.com with ESMTP; 25 Oct 2019 09:57:27 -0700
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1571994691-20199-1-git-send-email-brent.lu@intel.com>
 <3ce80285-ddb5-653d-cf60-febc9fd0bdee@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C740320822@PGSMSX108.gar.corp.intel.com>
 <219281e5-d685-d584-0d22-5dcf3ca2bec2@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C74032096B@PGSMSX108.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <618b3202-6418-a7e2-9b8e-bc32c01d46ed@linux.intel.com>
Date: Fri, 25 Oct 2019 11:57:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CF33C36214C39B4496568E5578BE70C74032096B@PGSMSX108.gar.corp.intel.com>
Content-Language: en-US
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Richard Fontana <rfontana@redhat.com>, Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>, "M,
 Naveen" <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: eve: implement set_bias_level
 function for rt5514
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



On 10/25/19 11:14 AM, Lu, Brent wrote:
>>
>> Can you clarify if the rt5514 needs the MCLK while it's doing the hotword
>> detection?
> 
> No, running the detection does not raise the bias level so the set_bias_level
> will not be called. The mclk is only turned on then off in mixer control's handler
> (rt5514_dsp_voice_wake_up_put) when enabling the hotword detection.
> 
>>
>> My point is really that this patch uses a card-level BIAS indication, and I'd like
>> to make sure this does not interfere with the audio DSP being in D3 state.
> 
> The function checks the name of dapm so it would only react when rt5514's
> bias level is changing. And also the idle_bias_off of the codec driver is true so
> it's target_bias_level should not be overwritten in the dapm_power_widgets()
> function. The behavior should be similar to the previous patch which is using
> supply widget.

Ah yes, I did miss this test:

+	if (!component || strcmp(component->name, RT5514_DEV_NAME))
+		return 0;

Looks good then, thanks for the explanations.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
