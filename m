Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD083909B3
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 21:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 532CF1771;
	Tue, 25 May 2021 21:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 532CF1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621971252;
	bh=fpKmVfupsIfpY6rK+QtpGNOxxfDFfQJZc/FU/Kgr5R4=;
	h=To:From:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HvSP+GeAXhWQnij3FyPhpPQo56PoT7mgBiF9Z4nwhosC4tj4v22BFkpawwBdCIGb9
	 ufBGZ62lWMW/pCfrccUWK22tu7o9/I9zsHOrkloAwHk/5thaZ/jtNtV6w70xQy8Vfh
	 fK6M5vR7y+JKmeHIschsGBZz6MYhZlOob7/wQye0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA165F800F7;
	Tue, 25 May 2021 21:32:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0FAF800CB; Tue, 25 May 2021 21:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E793F800B6
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 21:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E793F800B6
IronPort-SDR: SgfZn1WyKHkRkFdmqK2V5pwBqh7RLHyR8zgC/RgNAnjWiG9h0zscpge8/swrcqvAbe/ZyN+Vhq
 3cZPLV7tjlVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="263487313"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="263487313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 12:32:29 -0700
IronPort-SDR: twFpFJ6pNL60T5QLZ9Lc5na/90nj84gbZBKFc3Mq3X8wf3JebOuXwzlsI7x4LvEpGAnZXCx+mk
 oFo5iAtLMNNg==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443564680"
Received: from mdebbage-mobl.amr.corp.intel.com (HELO [10.212.87.116])
 ([10.212.87.116])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 12:32:29 -0700
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Sparse errors
Message-ID: <6b86f44e-82e0-3530-b579-1b054f459880@linux.intel.com>
Date: Tue, 25 May 2021 14:32:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Hi Takashi,
Sparse reports a lot of new issues in our last checks with more options:

export ARCH=x86_64 CF="-Wsparse-error -Wsparse-all -Wno-bitwise-pointer 
-Wno-pointer-arith -Wno-typesign -Wnoshadow -Wno-sizeof-bool"
make -k sound/ C=2

most are linked to the __user and pcm_format_t restricted types, but I 
found the simpler ones below which are useless comparisons. I can send a 
patch for the last but not sure how to address the first two.

Thanks for your feedback
-Pierre

sound/core/info.c:95:38: error: self-comparison always evaluates to false

	if (pos < 0 || (long) pos != pos || (ssize_t) count < 0)
		return false;

not sure what the second comparison is meant to check?

sound/drivers/opl3/opl3_midi.c:183:60: error: self-comparison always 
evaluates to false

This indeed makes no sense. the voice_time and vp->time are not changed 
in the loop, the test is either redundant or something else is missing.

sound/pci/lx6464es/lx_core.c:677:34: error: self-comparison always 
evaluates to false

That seems like dead code indeed:

	u32 channels = runtime->channels;

	if (runtime->channels != channels)
		dev_err(chip->card->dev, "channel count mismatch: %d vs %d",
			   runtime->channels, channels);
