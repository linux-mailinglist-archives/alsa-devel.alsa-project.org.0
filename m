Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548D60852D
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 08:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289CC95C5;
	Sat, 22 Oct 2022 08:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289CC95C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666420612;
	bh=6us6qdgHY2DoiUApOrTyFZIyOLiKqdm4RCK3wGpTE+Y=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TypmfE30EU0l1ncH96MRqfIupKjqxikPRWcvrzoIodDmDYldCiIaGRh1K8M62ZbX6
	 LN7vwnL3wZHfMomGgHdlGlDblTx7lg7boSbntJXBXNRcKtO99pMAeI4UXPaj5HsGLW
	 bFhHryt+s+iQYae3aqoQR4Pg6m5QDOkLHcLs3b5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5CBF8012A;
	Sat, 22 Oct 2022 08:35:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86AADF80246; Sat, 22 Oct 2022 08:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F2D0F80130
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 08:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F2D0F80130
Received: from [77.247.85.102] (helo=[192.168.44.12]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1om86p-0006gD-1E; Sat, 22 Oct 2022 08:35:51 +0200
Message-ID: <2c028797-b313-be93-7b1e-8d838e694948@leemhuis.info>
Date: Sat, 22 Oct 2022 08:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [Regression] Bug 216613 - Sound stopped working with v6.0.3 on Lenovo
 T14 Gen2i: ASoC: error at snd_soc_component_probe
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1666420554;
 89646574; 
X-HE-SMSGID: 1om86p-0006gD-1E
Cc: alsa-devel@alsa-project.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 =?UTF-8?Q?Grzegorz_Alibo=c5=bcek?= <grzegorz.alibozek@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216613 :

>  Grzegorz Alibożek 2022-10-21 19:26:43 UTC
> 
> After upgrade kernel from 6.0.2 to 6.0.3 on Lenovo T14 Gen2i, sound stopped working.
> dmesg:
> 
> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: failed to create hda codec -12
> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: ASoC: error at snd_soc_component_probe on ehdaudio0D2: -12
> paź 21 21:11:45 kernel: skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: failed to instantiate card -12
> 
> [reply] [−] Comment 1 Grzegorz Alibożek 2022-10-21 19:56:43 UTC
> 
> Created attachment 303070 [details]
> trace

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.0.2..v6.0.3
https://bugzilla.kernel.org/show_bug.cgi?id=216613
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
