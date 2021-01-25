Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C6302324
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 10:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A452E17F4;
	Mon, 25 Jan 2021 10:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A452E17F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611566017;
	bh=7Gl5aRz8ioeKjdBozAcxP6C9dwb1uUfS/LWfaNwMfLE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tljy6G2dikoFl/8cSMpmx3zUfSePoYgKMUEPjEVUbfGGXOm0pnAKlfUiHqT1D2yJg
	 +FXS/y0+trM8s6o1ntPPjtaiRkeO3M/l7G9k4Po/RXHDIgSHqAkuAsgGqdvV1nuttO
	 ViFC9q2F6nCzLdLMxrswNqeoSCDHX27JzbB2C8uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04389F80218;
	Mon, 25 Jan 2021 10:12:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79551F80259; Mon, 25 Jan 2021 10:11:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14B33F80130
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 10:11:49 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 32865A003F;
 Mon, 25 Jan 2021 10:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 32865A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1611565908; bh=/Q6Y7Ux+wc3gTedRmnRLeuS5mmGypQ36iagEDeOvH6A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HIqdroh6UgiQiZKGAh9zPU4QEE0vTluilCT46oHMlZ+/agirVGjIrHmJvhV2WqtKC
 lbo2dr21U7jNWQdsKOVhtma+E2O7TBhvYm91Cu5AkgyLlQL7d71PGRxcjMuwt8JOdX
 HZVPYXWuAoCohFTrL6KUtXW6sVdB72gCUT1RGOZY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 25 Jan 2021 10:11:42 +0100 (CET)
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: add PCI id for TGL-H
To: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210125083051.828205-1-kai.vehmanen@linux.intel.com>
 <s5h35yp5rli.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e04b942a-0f61-2c6c-ceb1-393668cfe549@perex.cz>
Date: Mon, 25 Jan 2021 10:11:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5h35yp5rli.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>, Xiuli Pan <xiuli.pan@intel.com>
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

Dne 25. 01. 21 v 9:49 Takashi Iwai napsal(a):
> On Mon, 25 Jan 2021 09:30:51 +0100,
> Kai Vehmanen wrote:
>>
>> From: Bard Liao <bard.liao@intel.com>
>>
>> Adding PCI id for TGL-H. Like for other TGL platforms, SOF is used if
>> Soundwire codecs or PCH-DMIC is detected.
>>
>> Signed-off-by: Bard Liao <bard.liao@intel.com>
>> Reviewed-by: Xiuli Pan <xiuli.pan@intel.com>
>> Reviewed-by: Libin Yang <libin.yang@intel.com>
>> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> Is this needed for 5.11 or only for 5.12?
> (Or potentially needed for 5.11.x stable later? -- then we can take it
>  now, too)

All patches sent by Kai today are required to add support for the SoundWire
device Dell TGL-H SKU 0A5E in 5.11. But I think that this standalone patch may
enable the DMIC only platforms.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
