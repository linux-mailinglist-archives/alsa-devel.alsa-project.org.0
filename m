Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D63F151DF3
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 17:12:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D56F1683;
	Tue,  4 Feb 2020 17:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D56F1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580832761;
	bh=YNJeDB+9c90eTj+JnK84Z9Wap549ZF/VAIQIDUt3Jgw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wzt9YpCikvCCDHn/4sAmqJ8x64anfydaKlJMDQsH3yFNhx2C/xW8dVxeOY2OmZJcP
	 zNqrVuJNo/Am1x1XxvWKWsOim9rR3uhZBQHaDqEd+8Xna8fJtadNZzvyx0bqCarxvV
	 Mcr0dgDMaqthm9lIHwydauBYq2pB+u7hU16+EckU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1658DF801DB;
	Tue,  4 Feb 2020 17:11:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBCBF80162; Tue,  4 Feb 2020 17:10:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0AD0F800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 17:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AD0F800AB
Received: from a89-182-229-123.net-htp.de ([89.182.229.123]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1iz0mj-0000G3-TW; Tue, 04 Feb 2020 17:10:46 +0100
To: Takashi Iwai <tiwai@suse.de>, Nikhil Mahale <nmahale@nvidia.com>
References: <20200204102746.1356-1-nmahale@nvidia.com>
 <s5hblqer46q.wl-tiwai@suse.de>
From: Martin Regner <martin@larkos.de>
Message-ID: <76637766-5ba9-5590-9bc5-1e25ea186b04@larkos.de>
Date: Tue, 4 Feb 2020 17:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <s5hblqer46q.wl-tiwai@suse.de>
Content-Language: de-DE
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - Fix DP-MST support for NVIDIA
	codecs
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

Applied the new patch. The device is detected correctly by pulseaudio.
Thanks for your efforts.

On 04.02.20 12:18, Takashi Iwai wrote:
> On Tue, 04 Feb 2020 11:27:46 +0100,
> Nikhil Mahale wrote:
>> If dyn_pcm_assign is set, different jack objects are being created
>> for pcm and pins.
>>
>> If dyn_pcm_assign is set, generic_hdmi_build_jack() calls into
>> add_hdmi_jack_kctl() to create and track separate jack object for
>> pcm. Like sync_eld_via_acomp(), hdmi_present_sense_via_verbs() also
>> need to report status change of the pcm jack.
>>
>> Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). Update
>> hdmi_present_sense_via_verbs() to report plug state of pcm jack
>> object. Unlike sync_eld_via_acomp(), for !acomp drivers the pcm
>> jack's plug state must be consistent with plug state
>> of pin's jack.
> Thanks, the new patch looks better.
>
>> Fixes: 5398e94fb753 ("ALSA: hda - Add DP-MST support for NVIDIA codecs")
>> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
> We need Cc to stable here.  I'll add it when applying.
>
> Also, it deserves Reported-by from Martin.
> Martin, could you retest with this patch?  I'll queue the patch once
> after confirmation.
>
> Just one minor nitpick:
>
>> +		if (spec->dyn_pcm_assign && pcm_jack && !do_repoll) {
>> +			int state = 0;
>> +
>> +			if (!!(jack->pin_sense & AC_PINSENSE_PRESENCE))
>> +				state = SND_JACK_AVOUT;
> The "!!" is superfluous.  I'll drop it.
>
>
> Takashi


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
