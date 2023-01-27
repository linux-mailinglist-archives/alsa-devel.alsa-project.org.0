Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EF67E4A7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C03EC6;
	Fri, 27 Jan 2023 13:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C03EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821301;
	bh=4Vsf2Baxp2u5lfik9AoPXZGetxaEpdosQ926sWxhjSI=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CXb8rFI/bztpGpu4IZlL/aOqCuPwaxdCqwVnt8CbN6QgJOx0rV0NmGChWH4Ey6EKS
	 5pPSsv5hzop9y9eO7XP9T0psEuN0hmYOoQZu4Dmj85SRznoWbmVBOOBh/juWy7VTVX
	 z7zGAhOxb69EEHzDSBsmvur1doEx3diu7fNcJkWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BA6DF804C2;
	Fri, 27 Jan 2023 13:07:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C5FDF804C2; Fri, 27 Jan 2023 13:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C984F802E8
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C984F802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U5ZspJ1K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674821220; x=1706357220;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=4Vsf2Baxp2u5lfik9AoPXZGetxaEpdosQ926sWxhjSI=;
 b=U5ZspJ1K8R6v7+PYq8WXQSK10YPUb9rI/ES3aHcdtp5PGVGTaHoTy+Dd
 P9lMgbJFZCNrN6zuYAes5FPWfVZ4F15nkMKlOOvgUOLh/uolzd2lxUQXm
 OMaMceTeXrCxPlNde6qVmghBikNrSFT6y5XNVxHujjSvpc7ad0hU+9H+q
 3KpMG2NFVDbyek5BC7sPquSnK3Xwcyit1lXBsr4BQo9vxHOlYABTbx3wj
 Sw20ZJgm5Be+G9KFdOQfLkPc59E0hKswnTkZzUtI3djSqJ3wa8QsmvkR3
 bLFqf4lnH7x5w7lQihPtVeHmijrZZjyIBT51xwJSv4msNJrbvCodrFsTn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="354372031"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="354372031"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:06:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="613167019"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="613167019"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO [10.252.30.130])
 ([10.252.30.130])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:06:53 -0800
Message-ID: <73a05d42-9be3-88da-13d7-4d43db27e578@linux.intel.com>
Date: Fri, 27 Jan 2023 14:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 00/18] ASoC: SOF: ipc4: Multi-stream playback and capture
 support
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

wow, something messed up the subject line, which should have been:

[PATCH 00/18] ASoC: SOF: ipc4: Multi-stream playback and capture support

-- 
Péter

On 27/01/2023 14:00, Peter Ujfalusi wrote:
> Hi,
> 
> The following series will enable multi-stream support for playback and capture
> streams.
> Currently only a single PCM can be connected to a DAI, with the multi-stream
> support it is possible to connect multiple PCMs to a single DAI.
> 
> To achieve this we need to make sure that DAIs/AIF are only set up once since
> other stream could be connected to it later.
> 
> We also need to introduce reference or use counting for widgets to make sure
> that they are not going to be destroyed while other streams are still using
> them.
> 
> With the multi-stream support we also need to extend our current locking scheme
> which worked well for simple paths.
> 
> The first patch was sent to the mailing list, but it is not yet applied and I
> have included in this series as it is a direct dependency:
> https://lore.kernel.org/alsa-devel/20230117121615.25690-1-peter.ujfalusi@linux.intel.com/
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (3):
>   ASoC: SOF: Avoid double decrementing use_count in sof_widget_setup on
>     error
>   ASoC: SOF: Protect swidget->use_count with mutex for kcontrol access
>     race
>   ASoC: SOF: ipc4-pcm: Do not run the trigger pipelines if no spipe is
>     stored
> 
> Ranjani Sridharan (15):
>   ASoC: SOF: ipc4-topology: No need to unbind routes within a pipeline
>   ASoC: soc-pcm: Export widget_in_list()
>   ASoC: SOF: sof-audio: Set up/free DAI/AIF widgets only once
>   ASoC: SOF: sof-audio: Only process widgets in the connected widget
>     list
>   ASoC: SOF: pcm: do not free widgets during suspend trigger
>   ASoC: SOF: topology: Set IPC-specific trigger order for DAI links
>   ASoC: SOF: Introduce PCM setup/free PCM IPC ops
>   ASoC: SOF: ipc4-pcm: Define pcm_setup/free ops
>   ASoC: SOF: ipc4: Add flag to skip triggering pipelines during FE DAI
>     trigger
>   ASoC: SOF: sof-audio: Populate the PCM stream pipeline_info
>   ASoC: SOF: ipc4-pcm: Use the PCM stream's pipeline_info during trigger
>   ASoC: SOF: Introduce struct snd_sof_pipeline
>   ASoC: SOF: ipc4-pcm: Rename 'data' variable to trigger_list
>   ASoC: SOF: ipc4-pcm: Implement pipeline trigger reference counting
>   ASoC: SOF: ipc4-topology: Protect pipeline free with mutex
> 
>  include/sound/soc-dpcm.h        |   2 +
>  include/sound/sof/ipc4/header.h |   3 +
>  sound/soc/soc-pcm.c             |   3 +-
>  sound/soc/sof/core.c            |   1 +
>  sound/soc/sof/intel/hda-dai.c   |  92 ++-------
>  sound/soc/sof/ipc3-control.c    |  46 +++--
>  sound/soc/sof/ipc3-topology.c   |  32 ++-
>  sound/soc/sof/ipc4-control.c    |  33 ++-
>  sound/soc/sof/ipc4-pcm.c        | 343 +++++++++++++++++++++++++-------
>  sound/soc/sof/ipc4-priv.h       |   2 +
>  sound/soc/sof/ipc4-topology.c   |  48 ++++-
>  sound/soc/sof/ipc4-topology.h   |  12 ++
>  sound/soc/sof/ipc4.c            |   2 +
>  sound/soc/sof/pcm.c             |   5 +-
>  sound/soc/sof/sof-audio.c       | 226 ++++++++++++++-------
>  sound/soc/sof/sof-audio.h       |  54 ++++-
>  sound/soc/sof/sof-priv.h        |   1 +
>  sound/soc/sof/topology.c        | 114 +++++++----
>  18 files changed, 714 insertions(+), 305 deletions(-)
> 

