Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8C144E52E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 11:57:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99303166B;
	Fri, 12 Nov 2021 11:56:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99303166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636714653;
	bh=BloTkN8X8usgngL7gfhlZxmugdVr+s/mlIJSdL/MhXc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE/VpwOqL+6kH+Gx8rL/hy0IUnSgo2UZpazSmUSwGRLj6bTHQSh5KiDpogrtkRMkQ
	 O8W80K/zoE+1lT1sIAzT9e5RIgsoD/XQbRWzNHVqIyljgon679xE9F17f02QjsSw2h
	 +USmpluDI/kF+DEvO1TIwKO8M5Ro4z4/ai2a2Ha0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6A9F800C1;
	Fri, 12 Nov 2021 11:56:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7C97F8049E; Fri, 12 Nov 2021 11:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F2C5F8014D
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 11:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2C5F8014D
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 3BA1EC8009C;
 Fri, 12 Nov 2021 11:56:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id tvCNWA5uMmMo; Fri, 12 Nov 2021 11:56:01 +0100 (CET)
Received: from [192.168.178.21] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 8F3F2C80099;
 Fri, 12 Nov 2021 11:56:00 +0100 (CET)
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASRock NUC Box 1100
To: Takashi Iwai <tiwai@suse.de>
References: <20211112094711.963474-1-wse@tuxedocomputers.com>
 <s5h8rxt3cx3.wl-tiwai@suse.de>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <db285b5c-9ac7-84b7-3123-1411259f5208@tuxedocomputers.com>
Date: Fri, 12 Nov 2021 11:56:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5h8rxt3cx3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

Am 12.11.21 um 11:07 schrieb Takashi Iwai:
> On Fri, 12 Nov 2021 10:47:11 +0100,
> Werner Sembach wrote:
>> This applies a SND_PCI_QUIRK(...) to the ASRock NUC Box 1100 series. This
>> fixes the issue of the headphone jack not being detected unless warm
>> rebooted from a certain other OS.
>>
>> When booting a certain other OS some coeff settings are changed that enable
>> the audio jack. These settings are preserved on a warm reboot and can be
>> easily dumped.
>>
>> The relevant indexes and values where gathered by naively diff-ing and
>> reading a working and a non-working coeff dump.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: <stable@vger.kernel.org>
> Thanks, the change looks almost good but in some small details:
>
>> +static void alc233_fixup_asrock_nuc_box_1100_no_audio_jack(struct hda_codec *codec,
>> +							     const struct hda_fixup *fix,
>> +							     int action)
> The function name could be a bit shorter?  It might be possible that
> the fixup could be re-used by others, too.
>
>> +{
>> +	/*
>> +	 * The audio jack input and output is not detected on the ASRock NUC Box 1100 series when
>> +	 * cold booting without this fix. Warm rebooting from a certain other OS makes the audio
>> +	 * functional, as COEF settings are preserved in this case. This fix sets these altered
>> +	 * COEF values as the default.
> Fitting in 80 columns is still preferred, to align with other code.
>
>> +	alc_write_coef_idx(codec, 0x1a, 0x9003);
>> +	alc_write_coef_idx(codec, 0x1b, 0x0e2b);
>> +	alc_write_coef_idx(codec, 0x37, 0xfe06);
>> +	alc_write_coef_idx(codec, 0x38, 0x4981);
>> +	alc_write_coef_idx(codec, 0x45, 0xd489);
>> +	alc_write_coef_idx(codec, 0x46, 0x0074);
>> +	alc_write_coef_idx(codec, 0x49, 0x0149);
> Can be put in the coef_fw table and processed via
> alc_process_coef_fw() instead?
>
>
> thanks,
>
> Takashi

Done. I was not aware of the alc_process_coef_fw() function, thanks.

Testing now and then sending v2.

Kind regards,

Werner Sembach

