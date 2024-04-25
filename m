Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF68B1CF7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 10:41:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973D1A4B;
	Thu, 25 Apr 2024 10:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973D1A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714034511;
	bh=sP7++6OAzaPFWsPsSpkIZpMrzB9xWv+ocfnpCqEGOs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pJSaIRTAQpOZDn6BsZwYHkgaQ8ErY885SZlFKNLZ3dnIQVWLj/+ebC69VSHyYPYcr
	 vuvHdypyx3XUf9BMGAjJXYiQZb9csEYfY+TRlG9giIYDRxbmVPc+3TZS+vzQF8w4GM
	 cI5NgfDC5LvAXC+lr5en7h7a0wYnPuQoEfyPiuDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB4BF8057E; Thu, 25 Apr 2024 10:41:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D19AF80548;
	Thu, 25 Apr 2024 10:41:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58BF4F80423; Thu, 25 Apr 2024 10:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F4E4F8003A
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 10:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4E4F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=d8xKjkKY
Received: from [192.168.1.152] (unknown [222.129.33.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 97B1D3F07E;
	Thu, 25 Apr 2024 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714034457;
	bh=gWDfLqsgq1EVCLKRekHfR8XJ9SA7eQ9+zvXhglVtoNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=d8xKjkKY5PHWGp81Bo12uZtpEybIct5SI1SqqTPIw76NgIA++vJ+URLBoeg2c9sbu
	 pp2Cf9dlZSB/+9wtbh3YFqkx5eC2foW4e2dZ490XR/PFQPbJpyPd0JGccfd2B32H+H
	 xKiTcHWj9837e2jczb+TKD0IA1w52yYrvUI9lvpn312zW5Ybz0KqUr2oMtDTGyb5eb
	 0sdEGz4dqPU9jPtWC2IUWI6WnXYUtRPpFFTM2RtwAN61JKYl5dVmQmaEVzZ2O55XS4
	 o24/DKsVEMHiRppT4bOIm/vw8v23MQ3T9W+IfWqugIrx/3yrZxabqWzRP0CGa3pc6E
	 o0AElLKr9v/1g==
Message-ID: <11d5d3db-d5ba-4a02-9c58-400075f2918e@canonical.com>
Date: Thu, 25 Apr 2024 16:40:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] ALSA: hda/ASOC tas2781: align the path of firmware
To: Takashi Iwai <tiwai@suse.de>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com
References: <20240425072000.22284-1-aaron.ma@canonical.com>
 <87h6fpc21p.wl-tiwai@suse.de>
 <3ba54d1d-7b09-4257-9f05-9a1182bf03dc@canonical.com>
 <87edatc001.wl-tiwai@suse.de>
Content-Language: en-US
From: Aaron Ma <aaron.ma@canonical.com>
Autocrypt: addr=aaron.ma@canonical.com; keydata=
 xsBNBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAHNIUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPsLAdwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrazsBNBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAHCwF8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
In-Reply-To: <87edatc001.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: E2AINCWTIITOF46G6KMR3KH6HI6BCAKA
X-Message-ID-Hash: E2AINCWTIITOF46G6KMR3KH6HI6BCAKA
X-MailFrom: aaron.ma@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2AINCWTIITOF46G6KMR3KH6HI6BCAKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 4/25/24 16:36, Takashi Iwai wrote:
> On Thu, 25 Apr 2024 09:54:17 +0200,
> Aaron Ma wrote:
>>
>>
>> On 4/25/24 15:52, Takashi Iwai wrote:
>>
>>      On Thu, 25 Apr 2024 09:20:00 +0200,
>>      Aaron Ma wrote:
>>      
>>          TI upstream the files in ti/tas2781 for linux-firmware.
>>          Make the driver find the correct files.
>>          
>>      Note that the upstream linux-firmware provides symlinks to
>>      ti/tas2781/* files, so it's not "incorrect", so far :)
>>
>> $ find . -iname TIAS2781RCA2.bin
>> ./ti/tas2781/TIAS2781RCA2.bin
>>
>> Only one bin file found.
>> Could you point it out clearly?
> 
> See WHENCE file.  It has "Link:" entries, and copy-firmware.sh creates
> corresponding symlinks.

Oh, missed it.
Retrieve the patch.

Thanks,
Aaron

> 
> 
> HTH,
> 
> Takashi
> 
>>
>> Thanks,
>> Aaron
>>
>>      thanks,
>>      
>>      Takashi
>>
>>          Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>>          ---
>>           include/sound/tas2781.h           | 1 +
>>           sound/pci/hda/tas2781_hda_i2c.c   | 2 +-
>>           sound/soc/codecs/tas2781-comlib.c | 2 +-
>>           3 files changed, 3 insertions(+), 2 deletions(-)
>>          
>>          diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
>>          index 99ca3e401fd1..72119cc32c0f 100644
>>          --- a/include/sound/tas2781.h
>>          +++ b/include/sound/tas2781.h
>>          @@ -21,6 +21,7 @@
>>           /* version number */
>>           #define TAS2781_DRV_VER                                                1
>>           #define SMARTAMP_MODULE_NAME                                           "tas2781"
>>          +#define TAS2781_FIRMWARE_ROOT                                          "ti/tas2781/"
>>           #define TAS2781_GLOBAL_ADDR                      0x40
>>           #define TAS2563_GLOBAL_ADDR                      0x48
>>           #define TASDEVICE_RATES                                                (SNDRV_PCM_RATE_44100 |\
>>          diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
>>          index 75f7674c66ee..72dc1469655f 100644
>>          --- a/sound/pci/hda/tas2781_hda_i2c.c
>>          +++ b/sound/pci/hda/tas2781_hda_i2c.c
>>          @@ -649,7 +649,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
>>                tasdevice_dsp_remove(tas_priv);
>>           
>>                tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
>>          -     scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%04X.bin",
>>          +     scnprintf(tas_priv->coef_binaryname, 64, "%sTAS2XXX%04X.bin", TAS2781_FIRMWARE_ROOT,
>>                                      codec->core.subsystem_id & 0xffff);
>>                ret = tasdevice_dsp_parser(tas_priv);
>>                if (ret) {
>>          diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
>>          index 3aa81514dad7..96fe1b855ec9 100644
>>          --- a/sound/soc/codecs/tas2781-comlib.c
>>          +++ b/sound/soc/codecs/tas2781-comlib.c
>>          @@ -277,7 +277,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
>>                 */
>>                mutex_lock(&tas_priv->codec_lock);
>>           
>>          -     scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
>>          +     scnprintf(tas_priv->rca_binaryname, 64, "%s%sRCA%d.bin", TAS2781_FIRMWARE_ROOT,
>>                                      tas_priv->dev_name, tas_priv->ndev);
>>                crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
>>                tas_priv->codec = codec;
>>          --
>>          2.34.1
>>

