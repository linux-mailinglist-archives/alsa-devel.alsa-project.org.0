Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE1E177AAA
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 16:39:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FCF9167C;
	Tue,  3 Mar 2020 16:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FCF9167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583249994;
	bh=oR0mymt3qg2VGBNa5uFGa5ECNGmPwilx9ScAGNlOOx8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m1/1rck8QcLlDDjNla1gy+1Bv56fd4v8ItCAHE9fVDkvekrCwHsmYc+++bI4OO1Mk
	 Av9aFuSW9ZpiThgOMF5tjnHldQplnJpa+HCp+KEdGxsYRa/931o3cvJbxQAZz2V591
	 FqkIAxG45gyGMeTZDBrwk4+kKPIYgAoxI/Doudqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 975C4F8028E;
	Tue,  3 Mar 2020 16:37:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D18F80271; Tue,  3 Mar 2020 16:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6EBBF8026A
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 16:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6EBBF8026A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 07:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="412777799"
Received: from jinzhiti-mobl2.amr.corp.intel.com (HELO [10.255.230.140])
 ([10.255.230.140])
 by orsmga005.jf.intel.com with ESMTP; 03 Mar 2020 07:37:48 -0800
Subject: Re: [PATCH] ASoC: SOF: Fix snd_sof_ipc_stream_posn()
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20200303101858.ytehbrivocyp3cnf@kili.mountain>
 <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <993233ff-1492-5a87-1026-09af76f6fc7f@linux.intel.com>
Date: Tue, 3 Mar 2020 09:36:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2003031321410.2957@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Keyon Jie <yang.jie@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
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



>> We're passing "&posn" instead of "posn" so it ends up corrupting
>> memory instead of doing something useful.
> [...]
>>   	/* send IPC to the DSP */
>>   	err = sof_ipc_tx_message(sdev->ipc,
>> -				 stream.hdr.cmd, &stream, sizeof(stream), &posn,
>> +				 stream.hdr.cmd, &stream, sizeof(stream), posn,
>>   				 sizeof(*posn));
> 
> ack, thanks, this is clearly wrong. This function is not used by current
> platforms, so the bug has gone unnnoticed. Most platforms either rely on
> direct MMIO queries of the DSP position, or the periodic position updates
> DSPs send after each ALSA period. This function for host to query DSP
> position via IPC is thus not used, although it's part of the generic audio
> DSP IPC interface.
> 
> For the SOF folks in CC, I wonder should we keep this function at all?
> 
> Anyways, that's probably a longer discussion, so while it's there,
> the code should be correct, so for the patch:
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

I checked all the way to 5.2 and it was never used, so indeed wondering 
what the purpose of this function was.
