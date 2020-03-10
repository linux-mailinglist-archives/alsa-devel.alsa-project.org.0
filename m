Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F08180B3C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 23:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F601661;
	Tue, 10 Mar 2020 23:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F601661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583878454;
	bh=8eeIOOxTFKfrNPRdzshTlDgFcra8crpYZhZGD6Taf3k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7EGJXhtuVV0If0+qJt6jWUajsxb8cTTnoI1+NkRdtZL43htNB4NQaE65S7T6F+8o
	 LZrLDFzwkpiC0nBwhIQ/8mffp6O9/x6yNpBseiDrWpBGHrELMZ83fxenbYvsWqOrGl
	 ph8YIgZ1XtSPNNnT0krXzyc6X7plm3la7seroSHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 299F1F8021C;
	Tue, 10 Mar 2020 23:12:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A30F80217; Tue, 10 Mar 2020 23:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53E8BF800BC
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 23:12:24 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 85C3EA0040;
 Tue, 10 Mar 2020 23:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 85C3EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1583878343; bh=FDhDmNzbn6vlA1IsshL7jpIRcjBekyUEbTy3Dlea5Cg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CrXWD5CVpCOeD7ZOgeu/T24hEquH4Pz+3GfMpVwUh81buCdlTN0u4pgmzmIA5mI6M
 44yQ12WfhYl7l6ItYSq3YsmM3r7IW+ZVfk/CznHbntVWKotlGpNPSzhTL3W9KDvyg9
 +RLNA0x9It6/D4eqPtGGzUBydFZni8It7x9jKkls=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 10 Mar 2020 23:12:18 +0100 (CET)
Subject: Re: [alsa-devel] [PATCH 3/6] ASoC: Intel: common: add match tables
 for ICL w/ SoundWire
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
 <20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d5e15895-7d10-7255-692c-c5c89d3ae1be@perex.cz>
Date: Tue, 10 Mar 2020 23:12:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200110222530.30303-4-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Dne 10. 01. 20 v 23:25 Pierre-Louis Bossart napsal(a):
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> The two configurations are with the Realtek 3-in-1 board requiring all
> 4 links to be enabled, or basic configuration with the on-board RT700
> using link0.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Hi,

   I just looking to this code and I miss the Kconfig selection for RT codecs 
in the SOF SDW driver. How we can enable this driver without selecting 
SND_SOC_ALL_CODECS ?

   I believe that those changes should be in sync with the machine description.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
