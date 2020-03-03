Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AF7177565
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 12:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B17E1670;
	Tue,  3 Mar 2020 12:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B17E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583235701;
	bh=UXMhDI/Ql+Furl3D/dbvU82sBdWIKg63ndO+GYoJ1Hg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDQHSvvSaVC1qss7HrvdjG9/Y2Ne1L4fd0/FWnw8TdhDdnJqpUJQYzhCVMsOFkxyv
	 i1sOI0SceSIBRJQ+0wsZP4S/gZtH7hAx5yigq1YzZnzmOCK7+aSUD7Ix+G/wLo8fY1
	 0qyCRDu0BFWeUv5pDT50qA5tA4y9gXhNQ9paJyBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31CD3F80245;
	Tue,  3 Mar 2020 12:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE415F8025F; Tue,  3 Mar 2020 12:39:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E69CF80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 12:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E69CF80131
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 03:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="240044033"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 03 Mar 2020 03:39:46 -0800
Date: Tue, 3 Mar 2020 13:39:45 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
In-Reply-To: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
Message-ID: <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Tue, 3 Mar 2020, Dan Carpenter wrote:

> We're passing "&posn" instead of "posn" so it ends up corrupting
> memory instead of doing something useful.
[...]
>  	/* send IPC to the DSP */
>  	err = sof_ipc_tx_message(sdev->ipc,
> -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
> +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
>  				 sizeof(*posn));

ack, thanks, this is clearly wrong. This function is not used by current 
platforms, so the bug has gone unnnoticed. Most platforms either rely on 
direct MMIO queries of the DSP position, or the periodic position updates 
DSPs send after each ALSA period. This function for host to query DSP 
position via IPC is thus not used, although it's part of the generic audio
DSP IPC interface.

For the SOF folks in CC, I wonder should we keep this function at all? 

Anyways, that's probably a longer discussion, so while it's there, 
the code should be correct, so for the patch:
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Br, Kai
