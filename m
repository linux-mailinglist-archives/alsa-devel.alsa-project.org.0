Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09814AB91
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 22:24:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEFDA820;
	Mon, 27 Jan 2020 22:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEFDA820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580160246;
	bh=uDMFUTmf3z/EBFdxYuBu6oLW4xel8NBr/nfTPj8qVdU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OdHaQddY1NSyGVt5yznWARaZqHGeEaHKpjQCEhu2wj2lIm1uazE62IFqf9DdXeyb0
	 zQ1AGUPEIcI6rnZCrrGhn4N2e0qZcVhegTfX/hoCnMac7Bh5Nuc1wtBzREXctfk5AR
	 I1rp5pNoGRO1uqlbiqS9APEN5qFAP0zvTRRCoRY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2B02F80273;
	Mon, 27 Jan 2020 22:21:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CE87F80256; Mon, 27 Jan 2020 22:21:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB8AF8021E
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 22:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB8AF8021E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 13:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,371,1574150400"; d="scan'208";a="231649939"
Received: from ngstahl-mobl1.amr.corp.intel.com (HELO [10.254.190.105])
 ([10.254.190.105])
 by orsmga006.jf.intel.com with ESMTP; 27 Jan 2020 13:21:07 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200127121243.15813-1-cezary.rojewski@intel.com>
 <20200127121243.15813-8-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2631f178-81e5-4981-ce3b-34819a82a29a@linux.intel.com>
Date: Mon, 27 Jan 2020 15:01:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127121243.15813-8-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 07/11] ASoC: SOF: Implement Probe IPC API
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


> +/**
> + * sof_ipc_probe_points_remove - disconnect specified probes
> + * @sdev:	SOF sound device
> + * @desc:	List of probe points to disconnect
> + * @num_desc:	Number of elements in @desc
> + *
> + * Removes previously connected probes from list of active probe
> + * points and frees all resources on DSP side.
> + */
> +int sof_ipc_probe_points_remove(struct snd_sof_dev *sdev,
> +		unsigned int *buffer_id, size_t num_buffer_id)
> +{

cppcheck warning:

[sound/soc/sof/probe.h:83] -> [sound/soc/sof/probe.c:265]: (style, 
inconclusive) Function 'sof_ipc_probe_points_remove' argument 3 names 
different: declaration 'num_id' definition 'num_buffer_id'.

cppcheck --platform=unix32 --force --max-configs=1024 --inconclusive 
--enable=all sound/soc/sof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
