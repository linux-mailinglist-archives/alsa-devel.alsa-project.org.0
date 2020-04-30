Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2C1BF858
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 14:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBD3C168F;
	Thu, 30 Apr 2020 14:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBD3C168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588250609;
	bh=wonenQ7wT9y+YgM0paNEoVvi/OCEJAZOGjAESoOmmeU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JJ+SymyGDvVJSqk+Typnrt2O7gl2fz/mXF7ZfhzP8vMJldLEGRGp7spSKOAZRW6l+
	 cbrSTIW+7O0QcUiJXMGyVfC0f3H2bXKvKEoZ6QwdvfMhi3LuWYCU5aVG4Xd/u+Lp8v
	 oq4c3K2Imh35QUhkQRYr+NwFRJZfGzLhVuFaiJuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAEDBF800B6;
	Thu, 30 Apr 2020 14:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF41F801DB; Thu, 30 Apr 2020 14:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B77DF80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 14:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B77DF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="MyXancF3"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eaac76e0000>; Thu, 30 Apr 2020 05:41:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Apr 2020 05:41:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Apr 2020 05:41:30 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Apr
 2020 12:41:30 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 30 Apr 2020 12:41:30 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eaac7740003>; Thu, 30 Apr 2020 05:41:29 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] DPCM for Tegra
Date: Thu, 30 Apr 2020 18:11:23 +0530
Message-ID: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588250478; bh=iOTBcDsLLgLJQNleti1NyLgN7hxMgJVLaYlGA0OF9uM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=MyXancF3Zn1YW8lTjlAnrdqdJsnfZSi2IMP6aRcvGmuQldaw9Ll0QThJ9byqHBFzX
 2oKXdykB2Vmd6lQ4PXYhReD3K4VqdTs/lDVnZOrNuP7sbHc9KCXXf8WT3GudVwAoot
 IHtQvJtDaGel/USTbevevWmyBh6i/pPFMU02akxvC8o7nLsEqkLTIQ69mwi1Ro3vhC
 HdD69WSlG5WNr9DCOLV4pzqNpkrQ0jSoUwEqwPOE/gsBhVyBgGuxWZwqQBvLTFPgu9
 5dmqlB71yP6A8nSqrDPgTwdBtN7NIjbsLfzLbHzys6PmWfcDRtScp4YyzoCxaq8sXq
 TzPR4cCpSgGYQ==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, atalambedu@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

Hi Mark,

Earlier I had sent Tegra ASoC series [0] for review and writing back
to follow up on the same.


Background
==========
There were following concerns on [0]:

 - Usage of mixer control overrides in each driver for PCM parameters.

 - Exposure of routing controls to the user.

The comments are mostly captured in [1] and [2].

There was a suggestion to use DPCM for the Tegra audio requirements.

Note: As of now, below does not cover specific solution for propogation
of audio configurations or PCM parameters (like sample rate, sample size
and channels).

DPCM Testing
============
Since then I was looking into internals of DPCM and was trying to get it
working with Tegra. I was able to get following things working.

 - Audio playback/capture over I2S/DMIC/DSPK.
 - Audio resampling use case.
 - Mixing of two audio streams with resampler in the path.

Objective was to understand and get audio working with DPCM. Please note
that I used simple-card DPCM driver for a quick testing on top of the above
Tegra Audio series. I had to tweak the simple-card driver a little, but
currently keeping it out of the scope of current discussion.

At a high level Tegra Audio HW is depicted as below.

|     Front End PCMs     |  SoC DSP   |     Back End DAIs    |

                         *************
ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
                         *           *
ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
                         *    XBAR   *
ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
                         *           *
ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
                         *           *
                         *           * <----DAI<4>-----> MIXER
                         *           *
                         *           * <----DAI<N>-----> ...
                         *************

Note:
-----

 * XBAR is just a cross bar interconnecting one component to another.
   Specific switch needs to be programmed for audio data to flow from
   one component to another.

 * SFC or Mixer are separate HW blocks and separate ASoC drivers are
   written for these. These drivers were not sent earlier as part of
   initial upstream series [0].


Follow up queries
=================
Based on the above experience I do have few follow up queries and request
for your inputs on this.

 a) Can I use a DAPM Mux control to activate a BE path? This in turn can
    program required switch in XBAR.

    This is needed for following reasons:

    - For an open platform like Jetson, we want to give maximum flexibility
      for a user to customize their audio paths. Number of connected
      components and order of these can vary depending on a use case.

    - Allow re-use of audio components across multiple use cases.
      For example, number of SFC instances are lesser than PCM playback or
      capture devices.

 b) I have modelled SFC and MIXER as backends. Is this allowed?

    This was done to include SFC or MIXER HW components as part of the
    sound card and use like below in one of the audio use cases.
 
    ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
    ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

    I used following workaround to connect multiple BE components.
    With this I can see PCM callbacks happen for all BE DAIs along the DAPM
    path. The obective was to connect multiple components together and (a)
    was used to connect one component to another. Each "-->" here connects
    two components and it is a switch in XBAR. 

    ---
      sound/soc/soc-pcm.c | 2 +-
      1 file changed, 1 insertion(+), 1 deletion(-)

      diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
      index e256d43..ee7af55 100644
      --- a/sound/soc/soc-pcm.c
      +++ b/sound/soc/soc-pcm.c
      @@ -1494,7 +1494,7 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 
 	  /* get number of valid DAI paths and their widgets */
 	  paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
      -			dpcm_end_walk_at_be);
      +			NULL);
 
 	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
 			stream ? "capture" : "playback");
    -- 

 c) Hostless mode did NOT work:
     - Following audio path was intended to be tested:
       I2S1 --> SFC --> I2S2

     - [3] offers two options:
         * CODEC<->CODEC: If I were to use a separate DAI link for each BE to BE
           connection, then it will result in a similar design what we have
           currently.

         * Hostless: I did not come across references for this.
           (Any references in this regard will be helpful)


May be the current Tegra ASoC design is more suitable for component model as you
had previously mentioned. I wanted to understand if above, especially (a) and (b),
are acceptable in this regard or if there are better options to interconnect
multiple ASoC components.

Looking forward for your feedback.

Thanks,
Sameer.

References
==========
[0] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=159664&archive=both&state=*
[1] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-6-git-send-email-spujar@nvidia.com/
[2] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-4-git-send-email-spujar@nvidia.com/
[3] https://www.kernel.org/doc/html/v5.6/sound/soc/dpcm.html
