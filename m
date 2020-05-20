Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2646F1DA7F1
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 04:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F41517AD;
	Wed, 20 May 2020 04:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F41517AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589941650;
	bh=kBp0gnvL0avBhyCJvNEf2+/Y38T1A1TsAqkn+CiRxz4=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DeLbmsy3nW/y3O2WLp+61bBPqxJxCNDX4GhJGHd5SOhcexWapAqWQDQgHwKT1HOEt
	 NCicjQ1mpmGSXEnM2+O6a8+gyIsOp6y1DqUChv/sRNafEfxZ8WJgJbAS3daBdH2nR5
	 Qqj77lSgyidjh2du39mcQQOQCAO9Iq4cU8DHJPHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60454F801DA;
	Wed, 20 May 2020 04:25:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 456A6F801F9; Wed, 20 May 2020 04:25:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F397AF80111
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 04:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F397AF80111
IronPort-SDR: 5+S80L+lKp632uVHwvAARw5PgfALqUxIJ6i7iOxGjNgVdGCGo7UKmMKVEBv/K6BO7zNSwZa4Nw
 gPmS1q1MXWrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 19:25:33 -0700
IronPort-SDR: 95UxJTGXRtihLoFhcFvnCoMsN+T5ke9Dhcd61Q4ctVRDM47ILpNA0DbRnKW8bpROTiFyRw3Ywq
 lYPXNYbaN3fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,412,1583222400"; d="scan'208";a="466355705"
Received: from akkong-mobl1.amr.corp.intel.com (HELO [10.254.67.75])
 ([10.254.67.75])
 by fmsmga006.fm.intel.com with ESMTP; 19 May 2020 19:25:32 -0700
To: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: ASoC dailink capture/playback flags
Message-ID: <b8b658b5-9c9b-5174-c2df-31ce34a66d75@linux.intel.com>
Date: Tue, 19 May 2020 21:25:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Wang,
 Rander" <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

Hi,

Some of us at Intel are confused with multiple definitions of 
capture/playback dailink flags (credits to Rander Wang for reporting 
this in https://github.com/thesofproject/linux/pull/2070).

struct snd_soc_dai_link {
[...]

     /* For unidirectional dai links */
     unsigned int playback_only:1;
     unsigned int capture_only:1;

[...]

     /* DPCM capture and Playback support */
     unsigned int dpcm_capture:1;
     unsigned int dpcm_playback:1;
[...]

};

And of course when you start looking at some machine drivers, there are 
confusions, e.g. below with DPCM front-ends using one or the other set, 
and with copy-paste and partial diffs, this propagates without being 
consistent or being noticed:

     [GLK_DPCM_AUDIO_HS_PB] = {
         .name = "Glk Audio Headset Playback",
         .stream_name = "Headset Audio",
         .dpcm_playback = 1, <<<<
         .nonatomic = 1,
         .dynamic = 1,
         SND_SOC_DAILINK_REG(system2, dummy, platform),
     },
     [GLK_DPCM_AUDIO_ECHO_REF_CP] = {
         .name = "Glk Audio Echo Reference cap",
         .stream_name = "Echoreference Capture",
         .init = NULL,
         .capture_only = 1, <<<< should this be .dpcm_capture = 1?
         .nonatomic = 1,
         .dynamic = 1,
         SND_SOC_DAILINK_REG(echoref, dummy, platform),
     },
     [GLK_DPCM_AUDIO_REF_CP] = {
         .name = "Glk Audio Reference cap",
         .stream_name = "Refcap",
         .init = NULL,
         .dpcm_capture = 1, <<<<
         .nonatomic = 1,
         .dynamic = 1,
         .ops = &geminilake_refcap_ops,
         SND_SOC_DAILINK_REG(reference, dummy, platform),
     },

So here are the questions:

- when using DPCM, is there an expectation to use dpcm_ flags only?

- should we instead use playback/capture_only when only one of the two 
dpcm_ flags is set?

- should we flags errors if we ever encounter cases with e.g. 
dpcm_playback = true and capture_only = true?

- do we actually need two sets of definitions? There are very few users 
of the .playback_only and .capture_only flags and only a single place 
where it's checked in soc-pcm.c

Thanks for your feedback

-Pierre


