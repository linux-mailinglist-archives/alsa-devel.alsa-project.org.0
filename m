Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0226124ED
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 01:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29A201814;
	Fri,  3 May 2019 01:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29A201814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556838508;
	bh=WwILI5YSUchcbet0H9rWzhqTL2Typp952Iy20LBHjIA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=np8h0WzEoTWZ6AcmH/9BM7iZtCQDjIUn3D7rOdn+eTIHjBHbxvzmYSJdirqaez9B9
	 opLiqmgK/3y+yoFCqsjALEjX9ChEEwF6lt9PC8cYnuMgFwj4UJ1WwHabp4snxugsw/
	 2OOldTJnK2PgA2SythkfB2kZ/aIu8/FW+7SRdAUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF20CF896EA;
	Fri,  3 May 2019 01:06:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6516BF896C7; Fri,  3 May 2019 01:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C47F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 01:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C47F8075A
Received: from [200.100.0.109] ([23.242.202.27]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MCJYl-1hUp5t4BKz-0097MS; 
 Fri, 03 May 2019 01:06:33 +0200
To: Takashi Iwai <tiwai@suse.de>
References: <1887e6cb-0c33-664c-d3be-c282d8b797de@ecmk.org>
 <s5hmukp3s6o.wl-tiwai@suse.de>
 <c341a56c-be1d-2301-1bde-b8eb403c6391@ecmk.org>
 <s5hmukgeost.wl-tiwai@suse.de>
 <9e12d82d-0b7b-7952-4367-b6fe333c4c5d@ecmk.org>
 <s5hmuk7iqk0.wl-tiwai@suse.de>
From: ecmk <info@ecmk.org>
Message-ID: <5a782605-3c26-eb30-65dc-b4aaa0fa0188@ecmk.org>
Date: Thu, 2 May 2019 16:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hmuk7iqk0.wl-tiwai@suse.de>
Content-Language: en-US
X-Provags-ID: V03:K1:GQQyv3xVaHVLOK7HMVzWx4lfONKJfYph7D1CEDum60hATgqudbH
 sJ4zSdXdVr1B27Lt/fGLzdKGvODlTiiDKDRvxRUzv82mrvElLUchfQM3e5S3seYA0xyQyvu
 oaNDuUC+p21vdLuHel14shBVbLqX4V8YpThn2AveJbW+FtdMdnbcOKlu9QX2RiMC3Est4wy
 Abe4kEk3d7L7MRePl3LyA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kso+6oraH2o=:bGDctywhODW7VW7dRGfvWc
 S2dvexhYj2iMgxihC5EJaND3pd2vR/VkjjUG+jvrfsytN/8WgCTM0G2Utx5OWyCuSyj+d2HAj
 tG22dl4Rv/fV1Cbr98WqAHvNgp/1hdpgqUsMeOVXd8JBQzo3ebUuQLDgqJjonyP/lh9au3ao1
 Afv18OuNh0bPx+ktQt+eJ5b+nQGJ1BeXLaj7nrLCVd9ZYqq16gmug439mWAw2zQPQZWXBKXow
 NM3X+HFxctKXIEqiXJtIguGGDBSDzJ2GWBDxX16FlwCgp4vGBYJHNghRLWRUqhu4BC47/JwA2
 K9MzhINPDiE0ljj8n5ftEd4r/3SnLQuY9n80n1KPFMCCgLBz8DTvMtB4puk/q5QN7jHDCVO0C
 TQJERPIU2Ei3v3UMdkigEwvYkOr5vb14nd9vVLD3rrhHRV2F8herU4A37zawy15nE7a44sAhf
 4bchfxWZ3p5kOjDZgg1Ev0Ez36R17m0oFwWb/jpWkHhiLrh5Q1ADlwW1ubinGJ36EBtiUXMxF
 DFnHrF+EqHzHqCWX7HZYNSi2UkAev2K+Cr4nayxkDRP5MuOqxZ6rFGw4ZdXe5nhGYrepuIbTk
 w3KWbpb7aUnOvv0DNg9nXtpA+UzWnMEa74xI19Fn+LzeeDBwhC4/ch/PgalxKZ7Ful0PInl1J
 JKMUKsp1Om2ULXoE1oM8uoV9n4mNxSMCXrf+INp3iKsuuw2Ga9vTuopgBFd1cwzg3sWaXjzj2
 J9Qy2JDQiyf/xIFrsAEZ1CFvYyWDbKhRj7XYSS0aQCHs8kZOyWe0PpIy5U4=
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Kernel patch needed for Asus Q325UAR
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

Great! Thank you!

On 4/30/19 6:13 AM, Takashi Iwai wrote:
> On Wed, 24 Apr 2019 01:21:36 +0200,
> ecmk wrote:
>> Here is the alsa-info output
> Thanks.  Below is the fix patch.  I'm going to apply it.
>
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: hda/realtek - Apply the fixup for ASUS Q325UAR
>
> Some ASUS models like Q325UAR with ALC295 codec requires the same
> fixup that has been applied to ALC294 codec.  Just copy the entry with
> the pin matching to cover ALC295 too.
>
> BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1784485
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/pci/hda/patch_realtek.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 7da7fa4f4201..42cd3945e0de 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7547,6 +7547,10 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
>   		{0x12, 0x90a60130},
>   		{0x17, 0x90170110},
>   		{0x21, 0x04211020}),
> +	SND_HDA_PIN_QUIRK(0x10ec0295, 0x1043, "ASUS", ALC294_FIXUP_ASUS_SPK,
> +		{0x12, 0x90a60130},
> +		{0x17, 0x90170110},
> +		{0x21, 0x03211020}),
>   	SND_HDA_PIN_QUIRK(0x10ec0295, 0x1028, "Dell", ALC269_FIXUP_DELL1_MIC_NO_PRESENCE,
>   		{0x14, 0x90170110},
>   		{0x21, 0x04211020}),
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
