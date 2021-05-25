Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B179338FFA9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 13:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4035A1733;
	Tue, 25 May 2021 13:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4035A1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621940530;
	bh=ht6Ee3NvyhXkILpj/XLyhe9+f/4Z4upedP1d89YlXY4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ee0nTdmAsJNNuF1vsATdeLqA/hOTosA5rDrCqtuFfAxtb2IufYXgpxF8MF7T90Ltp
	 Ys7pw0lYgw3lDsg4ishWgCc01ay6XN8uImF7d26kHIis/D4kBD1wMLmmGne7soN6E7
	 wMrTYBYZEP5L/YQ+2vGNhoBtf63bKI6GR+nGnCuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAFCFF801F5;
	Tue, 25 May 2021 13:00:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19541F801EB; Tue, 25 May 2021 13:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2658F80113
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 13:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2658F80113
Received: from 1.general.hwang4.uk.vpn ([10.172.195.16])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <hui.wang@canonical.com>)
 id 1llUnX-0004Ig-4k; Tue, 25 May 2021 11:00:31 +0000
Subject: Re: [PATCH v2] ALSA: hda/realtek: Chain in pop reduction fixup for
 ThinkStation P340
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com
References: <20210524192437.27838-1-peter.ujfalusi@linux.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <f3904185-3734-45e6-00a9-b5878bcee63b@canonical.com>
Date: Tue, 25 May 2021 19:00:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524192437.27838-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com
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

Looks fine to me.

Thanks,

Hui.

On 5/25/21 3:24 AM, Peter Ujfalusi wrote:
> Lenovo ThinkStation P340 uses ALC623 codec (SSID 17aa:1048) and it produces
> bug plock/pop noise over line out (green jack on the back) which can be
> fixed by applying ALC269_FIXUP_NO_SHUTUP tot he machine.
>
> Convert the existing entry for the same SSID to chain to apply this fixup
> as well.
>
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi Takashi,
>
> Changes since v1
> - instead of deny_list use chained fixup to fix the plock/pop noise
>
> Changes since RFC:
> - Fixed up the PCI ID
>
> ever since I have this workstation (three weeks) the plock/pop noise on playback
> start bugged me. So far the only solution I have found is to disable the
> power_save which I find acceptable on a desktop compared to the pops.
>
> The alsa-info.sh output is can be found here:
> http://alsa-project.org/db/?f=414b1b236fc73db386ad4f938bc3b304f6b30b05
>
> Missing details from alsa-info output:
> # lspci -nnk | grep -A2 Audio
> 00:1f.3 Audio device [0403]: Intel Corporation Comet Lake PCH cAVS [8086:06c8]
>          DeviceName: Onboard - Sound
>          Subsystem: Lenovo Device [17aa:1048]
>
> CPU: i9-10900k
>
> The machine have ALC623 codec and the jacks are correctly discovered and they
> do what they supposed to be.
> When I have the headset connected to the front and audio is routed there the
> line out (green jack) from the back still prodices the plock/pop.
>
> Is there a known quirk for similar issue or a better way to handle it?
>
> [1] https://lore.kernel.org/alsa-devel/20210524152533.7479-1-peter.ujfalusi@linux.intel.com/
>
> Thanks you,
> Peter Ujfalusi
>
>   sound/pci/hda/patch_realtek.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 3e269de84079..e2e0ee7b137d 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6543,6 +6543,7 @@ enum {
>   	ALC295_FIXUP_ASUS_DACS,
>   	ALC295_FIXUP_HP_OMEN,
>   	ALC285_FIXUP_HP_SPECTRE_X360,
> +	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
>   };
>   
>   static const struct hda_fixup alc269_fixups[] = {
> @@ -8109,6 +8110,12 @@ static const struct hda_fixup alc269_fixups[] = {
>   		.chained = true,
>   		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1,
>   	},
> +	[ALC623_FIXUP_LENOVO_THINKSTATION_P340] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc_fixup_no_shutup,
> +		.chained = true,
> +		.chain_id = ALC283_FIXUP_HEADSET_MIC,
> +	},
>   };
>   
>   static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> @@ -8412,7 +8419,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x1558, 0x971d, "Clevo N970T[CDF]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
>   	SND_PCI_QUIRK(0x1558, 0xa500, "Clevo NL53RU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
>   	SND_PCI_QUIRK(0x17aa, 0x1036, "Lenovo P520", ALC233_FIXUP_LENOVO_MULTI_CODECS),
> -	SND_PCI_QUIRK(0x17aa, 0x1048, "ThinkCentre Station", ALC283_FIXUP_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x17aa, 0x1048, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
>   	SND_PCI_QUIRK(0x17aa, 0x20f2, "Thinkpad SL410/510", ALC269_FIXUP_SKU_IGNORE),
>   	SND_PCI_QUIRK(0x17aa, 0x215e, "Thinkpad L512", ALC269_FIXUP_SKU_IGNORE),
>   	SND_PCI_QUIRK(0x17aa, 0x21b8, "Thinkpad Edge 14", ALC269_FIXUP_SKU_IGNORE),
> @@ -8677,6 +8684,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
>   	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
>   	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
>   	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
> +	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
>   	{}
>   };
>   #define ALC225_STANDARD_PINS \
