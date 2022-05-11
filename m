Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9835234DA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 15:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CCF01A8E;
	Wed, 11 May 2022 15:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CCF01A8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652277544;
	bh=lfb7ZaCFEGVuwi+/iACnDsaJqSRNPFtXl5+VmEc3ytA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCZiv2vQ9l1cPQxdH3nO7bdb3HDGEwbjvF4x7G566kHhKMvZLRSa/Gctckxqu9mqa
	 XsPPHwJc/F48uSwKIJfdpF4qu1BXbrf/VHGkrdzkwhJi6/Oe9pUtb5Lh05K/w0752V
	 /0iaKhlBOhaIfVdlsCRfwEgDsjXJVT87tdQ1b3S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98592F804B2;
	Wed, 11 May 2022 15:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E07FBF804B2; Wed, 11 May 2022 15:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F18F8015B
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 15:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F18F8015B
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id B4B55C80099;
 Wed, 11 May 2022 15:58:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id fSmKOxGlGNEQ; Wed, 11 May 2022 15:58:04 +0200 (CEST)
Received: from [192.168.178.82] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id E1A7AC80091;
 Wed, 11 May 2022 15:58:03 +0200 (CEST)
Message-ID: <71fadca3-7750-2fc0-c04a-f05ab4e85112@tuxedocomputers.com>
Date: Wed, 11 May 2022 15:58:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ALSA: hda/intel: Add quirk for TongFang devices with pop
 noise
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220511133828.13724-1-wse@tuxedocomputers.com>
 <s5h35hggpao.wl-tiwai@suse.de>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <s5h35hggpao.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, imre.deak@intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

Am 11.05.22 um 15:41 schrieb Takashi Iwai:
> On Wed, 11 May 2022 15:38:28 +0200,
> Werner Sembach wrote:
>> When audio stops playing and sometimes when it starts playing, there is an
>> audible "pop" noise when using headphones on most Tongfang GMxMxxx,
>> GKxNxxx, GMxZxxx, GMxTxxx, and GMxAxxx devices.
>>
>> Disabling power saving for the Realtek codec fixes this noise. Presumably
>> it is triggered on some power event in the audio circuit.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: stable@vger.kernel.org
> Usually this denylist is a last resort if any other methods never
> helped.  Is it the case?

I also tried setting codec->power_save_node = 0; in a patch_realtek.c quirk.

static void alc274_fixup_pop_noise(struct hda_codec *codec, const struct
hda_fixup *fix, int action)
{
       codec->power_save_node = 0;
}

That initially seemed to work, but when I tested it again a day later
after a fresh install, it didn't anymore. I don't know what is
different. On the install before, I did some debugging with boot
parameters and other stuff, cant reproduce anymore what exactly.

I took the line from alc274_fixup_bind_dacs which fixes the pop noise
when applied to the devices, but does a lot of random other stuff too
not meant for the device.

I think I only ever warm rebooted when trying other fixes including that
one, maybe that's the reason for the different behavior a day later ..

Kind Regards,

Werner Sembach

>
>
> thanks,
>
> Takashi
