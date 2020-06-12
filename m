Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFC1F7A78
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 17:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960BC1681;
	Fri, 12 Jun 2020 17:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960BC1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591974767;
	bh=t6dtLZNEGznbzIXH2Lnx85ryBuz4UqpYTkyQ/UlDpY0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Za3ghJkFiVVH5qnyvjCDDE7N83oLX2vgXebWRHNO9el9tRYOc3dRO4+dZKn6Y0i9j
	 cw6vvAl2yo/lOqQcOzAtHQOuqmRq02R0sQsTrug+6SRlL8lzramV7dbkPUW4D34rDq
	 3rX5BsElj3/hg6DGO8bAwD2O/Ng85xSeTHdY22WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1488F80252;
	Fri, 12 Jun 2020 17:11:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98CB7F8021C; Fri, 12 Jun 2020 17:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93771F800CC;
 Fri, 12 Jun 2020 17:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93771F800CC
IronPort-SDR: /Eitfc4LX1NHzw1dDt3TgJ+r6td7ZK84VYJALAJC1xHq5eXAqTKJqInMvTN67M6LRVTSTkSPfB
 qP3oRbgzB4cQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 08:10:49 -0700
IronPort-SDR: 4JkrYmtVboNNLbg7cW9Y+q1f7vsTRdAMJ04hamINWV9k6cd5qkRCTTwAchhXdS1BfCUaJTaJy9
 zmnTBKNCk9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; d="scan'208";a="315152617"
Received: from rrhill-mobl1.amr.corp.intel.com (HELO [10.254.71.222])
 ([10.254.71.222])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2020 08:10:47 -0700
Subject: Re: [Sound-open-firmware] [PATCH v3] ASoC: SOF: Intel: hda: Clear
 RIRB status before reading WP
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <1591959048-15813-1-git-send-email-brent.lu@intel.com>
 <s5h5zbwczuk.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2006121522440.3186@eliteleevi.tm.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8530e0d0-de78-3f60-a849-99ef4f577ae0@linux.intel.com>
Date: Fri, 12 Jun 2020 09:45:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2006121522440.3186@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 sound-open-firmware@alsa-project.org
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



On 6/12/20 7:24 AM, Kai Vehmanen wrote:
> Hey Brent,
> 
> On Fri, 12 Jun 2020, Takashi Iwai wrote:
> 
>> On Fri, 12 Jun 2020 12:50:48 +0200, Brent Lu wrote:
>>>
>>> Port commit 6d011d5057ff ("ALSA: hda: Clear RIRB status before reading
>>> WP") from legacy HDA driver to fix the get response timeout issue.
>>> Current SOF driver does not suffer from this issue because sync write
>>> is enabled in hda_init. The issue will come back if the sync write is
>>> disabled for some reason.
>>>
>>> Signed-off-by: Brent Lu <brent.lu@intel.com>
>>
>> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> thanks, looks good now:
> 
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

CI results initiated by Kai don't show any regression and change looks 
good so:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Brent!
