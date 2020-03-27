Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC88195438
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 10:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299E71670;
	Fri, 27 Mar 2020 10:41:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299E71670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585302118;
	bh=amIFGdIvDfe1Dr0iTC7JS/zaIXGsKbsydq8XFFVZzE0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4yPKFHTxvn2moAZ8PppNCqRVorVJV0E/5PhCP2QRgOtv9HVzFfEGWjUcz30ZSQ9C
	 dwVZ32hmD9XP24F58OLMYp3nOgb6GFXlXyM42boiuIuPzU1gs7CbeGlrn5oiWX1ViX
	 m2Rez3MsRBrkxm67Dojajz5Q6VbztSggCFEfBUEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 372E7F80147;
	Fri, 27 Mar 2020 10:40:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5B7F80158; Fri, 27 Mar 2020 10:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF772F8011B
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 10:40:11 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 40434A003F;
 Fri, 27 Mar 2020 10:40:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 40434A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1585302010; bh=wFYQK7d0Ga2PuiXqPnRXGAnnw+PEToIxQj/rlQo5cng=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UwbNfhlaEkDbJPpvs3YILyC0FJ09y3mPPIGx5Q48ti/1nfeL4NjxC98Bld5YqDncx
 ZxiyOO6c/BTa0WcGf1uKU/JTjJ/3t5huWtr04Hzl9CAQ77REjpcRNxDw2fDx+O7Jk0
 fgD0XnJ02o+Tp434H0AQEgUb8dJitvKx+8zKuR5g=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Mar 2020 10:40:06 +0100 (CET)
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
To: Takashi Iwai <tiwai@suse.de>, sylvain.bertrand@gmail.com
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
 <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
 <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
 <20200326200415.GA1321@freedom> <s5hlfnmfcdt.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
Date: Fri, 27 Mar 2020 10:40:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <s5hlfnmfcdt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Dne 27. 03. 20 v 9:08 Takashi Iwai napsal(a):
> On Thu, 26 Mar 2020 21:04:15 +0100,
> sylvain.bertrand@gmail.com wrote:
>>
>> On Thu, Mar 26, 2020 at 03:36:23PM +0100, Jaroslav Kysela wrote:
>>> I agree. Also, the snd_pcm_direct_sw_params() does nothing, because the
>>> sw_params are already cached in the pcm structure (see comment). It means
>>> that the dmix (direct) plugins operates with those cached values. Just set
>>> sw_params like for any other PCM handle. The dmix uses those values (if
>>> possible).
>>
>> This is the "if possible" which would impacts the way how code should do setup
>> right, but:
>>
>> Let's take the case of a classic plugin "pipeline":
>> pcm:plug->...->direct::dmix->hw
>>
>> >From the top plugin (usually plug) to the direct::plugin, the "sw_params" pcm
>> op is usually pcm_generic.c:snd_pcm_generic_sw_params which does recurse down.
>> This recursion down will stop once pcm_direct.c:snd_pcm_direct_sw_params is
>> reached, then will recurse up, without error.
>>
>> But pcm.c:snd_pcm_sw_params will copy anyway the provided sw_params into each
>> recursed back pcm if the "sw_params" pcm op return no error code, which is the
>> case.
>>
>> Then looking at pcm.c:snd_pcm_sw_params_current, I get those "wrong" sw_params,
>> then I get no way to know something went wrong.
>>
>> Why "wrong", because they may significantly differ from the bottom hw plugin
>> sw_params which some fields are used to configure the kernel driver.
>>
>> for instance, a fast_op status call will recurse down to
>> pcm_dmix.c:snd_pcm_dmix_status, which will call the hw plugin fast op status
>> function which will use _its_ tstamp_type field for the ioctl call, but will
>> "override" the trigger_tstamp field computed with the "wrong" sw_params
>> tstamp_type!
>>
>> It happens that the monotonic_raw and monotonic clocks can have audio
>> significant difference. Additionally, the other sw_params field might cause
>> similar issues.
> 
> The tstamp type handling in dmix is certainly buggy, yes.
> It should have been restricted with the slave PCM unless it's
> compatible.

Yes, it's a bug which should be fixed in dmix instead to use a workaround in 
the app. The easiest way is to return an error in set sw_params, but it may 
cause problems for the app which assumes that this timestamp mode can be set 
freely. Perhaps, we can add a timestamp translation layer (not easy, I know).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
