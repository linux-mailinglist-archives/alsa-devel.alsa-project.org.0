Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9861B60FC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B00836;
	Thu, 23 Apr 2020 18:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B00836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659516;
	bh=Ozu45AcB0akaiqA7a7nCWaxFnxVzLeQ6GqdX5qNnSkQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OLU6DFlywME3prnL0in62IcjeX//haUklYvDl59lWQJpG/KAqG8w4kM1+F4rWSExj
	 sny4hwpgIraA9CXud+NiqCVR+vjwzxNEE4xxKHM4UTR+Muqz0Jri9kkoBphB0rStul
	 +kfxxqTyKu9PsgIh4E9aPPxYO4iHC1XprRkdGM9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA415F801EC;
	Thu, 23 Apr 2020 18:30:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8CCCF800FF; Thu, 23 Apr 2020 18:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18CFDF800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18CFDF800FF
IronPort-SDR: JfyMQhAl0N8pjeVn2txo7i6PRkvDX66dXOZ2kW43qxLJJVo5ms0wr8I8BeND8WiGAGNPKfNOyc
 +12QB/TvRavw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 09:30:04 -0700
IronPort-SDR: UNefJvYbiTcKTk792Mp5r3nPF0Fy7J/OJ8QqHVado8TorxELV8QjsBZc/v/FE10dJyryO4dNSZ
 nxqKRVn8Mu1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="256040227"
Received: from lsatpatx-mobl.gar.corp.intel.com (HELO [10.251.150.156])
 ([10.251.150.156])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2020 09:30:03 -0700
Subject: Re: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of
 condition items
To: libin.yang@linux.intel.com, perex@perex.cz, alsa-devel@alsa-project.org
References: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4b5a1e72-9d8c-221d-f0ea-df44f1ffb1d5@linux.intel.com>
Date: Thu, 23 Apr 2020 08:06:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: libin.yang@intel.com
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



On 4/22/20 8:58 PM, libin.yang@linux.intel.com wrote:
> From: Libin Yang <libin.yang@intel.com>
> 
> UCMv2 supports "If" statement and will merge the same items with
> compound_merge(). If the items have the same id, it will fail to
> add the config items. And the id of the item in an array is
> automatically generated with the increased number. It is probably
> that some items to be merged have the same id. Let's add prefix
> in the id to avoid such situation.
> 
> For example:
> 
> If.seq1 {
> 	Condition {
> 		Type ControlExists
> 		Control "name='PGA1.0 1 Master Playback Volume'"
> 	}
> 	True {
> 		EnableSequence [
> 			cset "name='PGA1.0 1 Master Playback Volume' 50"
> 		]
> 	}
> }
> 
> If.seq2 {
> 	Condition {
> 		Type ControlExists
> 		Control "name='PGA2.0 2 Master Playback Volume'"
> 	}
> 	True {
> 		EnableSequence [
> 			cset "name='PGA2.0 2 Master Playback Volume' 50"
> 		]
> 	}
> }
> 
> If.seq3 {
> 	Condition {
> 		Type ControlExists
> 		Control "name='PGA3.0 3 Master Playback Volume'"
> 	}
> 	True {
> 		EnableSequence [
> 			cset "name='PGA3.0 3 Master Playback Volume' 50"
> 		]
> 	}
> }
> 
> If seq1, seq2 and seq3 conditions are true, UCM will fail to initialize.
> 
> This patch rename the config id to avoid the same id conflict.

The example confuses me completely, I checked three times and the seq1, 
seq2 and seq3 parts configure different controls.

Can you clarify what the conflict is and what id you were referring to?


