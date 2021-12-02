Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FC4666C8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 16:36:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524C22712;
	Thu,  2 Dec 2021 16:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524C22712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638459413;
	bh=Z/qod2XEhAneJzhZvOtZ5obyMzTTS6GCbsfjEG6FnkQ=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D3LANA2KvgsD1nPH2tUsXupgKbakyfvUiFKxb9TjTv3rv+jr/ouPQsgcbQLJGvIkJ
	 BXd2dG+m6qin0kv+8gAB+G6NjN0q3wcYdjTIPGwYYgH+YW/OOFNrwt932GSPyvaWO2
	 1iRvKjy1Egpk7Syi2WDkDnt2uJpQIe4rCOvl9k5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC365F800CE;
	Thu,  2 Dec 2021 16:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80FF6F802A0; Thu,  2 Dec 2021 16:35:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97783F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 16:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97783F800EE
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 6AA80C80089;
 Thu,  2 Dec 2021 16:35:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id atP1JqNwd2LU; Thu,  2 Dec 2021 16:35:24 +0100 (CET)
Received: from [192.168.178.21] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 084EBC80086;
 Thu,  2 Dec 2021 16:35:24 +0100 (CET)
Subject: Re: [PATCH] ALSA: hda/realtek: Fix quirk for TongFang PHxTxX1
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20211202152843.818617-1-wse@tuxedocomputers.com>
Message-ID: <e49f141f-3d00-7e11-908e-4227feb9cf5b@tuxedocomputers.com>
Date: Thu, 2 Dec 2021 16:35:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211202152843.818617-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Am 02.12.21 um 16:28 schrieb Werner Sembach:
> This fixes the SND_PCI_QUIRK(...) of the TongFang PHxTxX1 barebone. This
> fixes the issue of sound not working after s3 suspend.
>
> When waking up from s3 suspend the Coef 0x10 is set to 0x0220 instead of
> 0x0020. Setting the value manually makes the sound work again. This patch
> does this automatically.
An educational question: Is there any, at least partial, documentation available on what these Coef values actually do
besides https://www.kernel.org/doc/html/v5.15/sound/hd-audio/realtek-pc-beep.html ?
>
> While being on it, I also fixed the comment formatting of the quirk.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>
> ---
>  sound/pci/hda/patch_realtek.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 9ce7457533c96..d3a16843c7afd 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6503,22 +6503,25 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
>  /* for alc285_fixup_ideapad_s740_coef() */
>  #include "ideapad_s740_helper.c"
>  
> +static const struct coef_fw alc256_fixup_tongfang_reset_persistent_settings_coefs[] = {
> +	WRITE_COEF(0x10, 0x0020), WRITE_COEF(0x24, 0x0000), WRITE_COEF(0x26, 0x0000),
> +	WRITE_COEF(0x29, 0x3000), WRITE_COEF(0x37, 0xfe05), WRITE_COEF(0x45, 0x5089),
> +	{}
> +};
> +
>  static void alc256_fixup_tongfang_reset_persistent_settings(struct hda_codec *codec,
>  							    const struct hda_fixup *fix,
>  							    int action)
>  {
>  	/*
> -	* A certain other OS sets these coeffs to different values. On at least one TongFang
> -	* barebone these settings might survive even a cold reboot. So to restore a clean slate the
> -	* values are explicitly reset to default here. Without this, the external microphone is
> -	* always in a plugged-in state, while the internal microphone is always in an unplugged
> -	* state, breaking the ability to use the internal microphone.
> -	*/
> -	alc_write_coef_idx(codec, 0x24, 0x0000);
> -	alc_write_coef_idx(codec, 0x26, 0x0000);
> -	alc_write_coef_idx(codec, 0x29, 0x3000);
> -	alc_write_coef_idx(codec, 0x37, 0xfe05);
> -	alc_write_coef_idx(codec, 0x45, 0x5089);
> +	 * A certain other OS sets these coeffs to different values. On at least
> +	 * one TongFang barebone these settings might survive even a cold
> +	 * reboot. So to restore a clean slate the values are explicitly reset
> +	 * to default here. Without this, the external microphone is always in a
> +	 * plugged-in state, while the internal microphone is always in an
> +	 * unplugged state, breaking the ability to use the internal microphone.
> +	 */
> +	alc_process_coef_fw(codec, alc256_fixup_tongfang_reset_persistent_settings_coefs);
>  }
>  
>  static const struct coef_fw alc233_fixup_no_audio_jack_coefs[] = {
