Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2D7769508
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 13:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13CCA823;
	Mon, 31 Jul 2023 13:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13CCA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690803442;
	bh=+Pn3oA9FWnt5acy/zVJCg1KCG96BDEaRw5PQnxZu4lE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wg2PWMAuShVNbfuXif9jJIKfF6ApfaN5umxP/oT3who3QlCkdM9lIt8b2By7nt09y
	 iJ9ic7rm2k4MRC7+N1cRn1sjh8TRXZmdqgTBHQryKwVcgLYQb6kKQr+egOvYzwvRn4
	 dQA+tPYLEZUObxy/sOERn2h0+CrEDdXRYc9UE8MM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F9C7F8053B; Mon, 31 Jul 2023 13:36:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 258FDF80153;
	Mon, 31 Jul 2023 13:36:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF532F8016D; Mon, 31 Jul 2023 13:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx1.zhaoxin.com (mx1.zhaoxin.com [210.0.225.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CFDCF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 13:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CFDCF80153
X-ASG-Debug-ID: 1690803363-086e23186a03700001-UKjUFf
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by
 mx1.zhaoxin.com with ESMTP id 6fSYFuG0DOj3xpgP (version=TLSv1.2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 31 Jul 2023 19:36:03 +0800 (CST)
X-Barracuda-Envelope-From: TonyWWang-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 31 Jul
 2023 19:36:03 +0800
Received: from [10.32.65.162] (10.32.65.162) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 31 Jul
 2023 19:36:01 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Message-ID: <b2b5c3ef-cfda-ea22-b1d4-ad2865a53769@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.32.65.162
Date: Mon, 31 Jul 2023 19:36:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI Codec
 Vendor IDs
Content-Language: en-US
X-ASG-Orig-Subj: Re: [PATCH] ALSA: hda: Zhaoxin: Add HDAC PCI IDs and HDMI
 Codec
 Vendor IDs
To: Takashi Iwai <tiwai@suse.de>
CC: <perex@perex.cz>, <tiwai@suse.com>,
	<pierre-louis.bossart@linux.intel.com>, <zhangyiqun@phytium.com.cn>,
	<peter.ujfalusi@linux.intel.com>, <broonie@kernel.org>,
	<chenhuacai@kernel.org>, <cezary.rojewski@intel.com>,
	<siyanteng@loongson.cn>, <amadeuszx.slawinski@linux.intel.com>,
	<evan.quan@amd.com>, <jasontao@glenfly.com>, <kai.vehmanen@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <mkumard@nvidia.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<CobeChen@zhaoxin.com>, <TimGuo@zhaoxin.com>, <LeoLiu-oc@zhaoxin.com>
References: <20230731055932.4336-1-TonyWWang-oc@zhaoxin.com>
 <87v8e0bjx4.wl-tiwai@suse.de>
From: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
In-Reply-To: <87v8e0bjx4.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.32.65.162]
X-ClientProxiedBy: ZXSHCAS2.zhaoxin.com (10.28.252.162) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1690803363
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3707
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
 SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0
 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.112119
	Rule breakdown below
	 pts rule name              description
	---- ----------------------
 --------------------------------------------------
Message-ID-Hash: FIJSTLLDIENETYV4X5TICNKU2SXV67CU
X-Message-ID-Hash: FIJSTLLDIENETYV4X5TICNKU2SXV67CU
X-MailFrom: TonyWWang-oc@zhaoxin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIJSTLLDIENETYV4X5TICNKU2SXV67CU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/31/23 15:48, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 07:59:32 +0200,
> Tony W Wang-oc wrote:
>> @@ -1044,6 +1044,16 @@ void azx_stop_chip(struct azx *chip)
>>  }
>>  EXPORT_SYMBOL_GPL(azx_stop_chip);
>>  
>> +static void azx_rirb_zxdelay(struct azx *chip, int enable)
> 
> It'd be helpful to have a brief function description.  It doesn't do
> any delaying but flip something instead, right?

Yes, you are right.
This function expects to implement two functions: Adjust the priority of
write cycles for KX-5000 and delay some time. Now its only implement the
first function.

> 
>> +{
>> +	if (chip->remap_diu_addr) {
>> +		if (!enable)
>> +			writel(0x0, (char *)chip->remap_diu_addr + 0x490a8);
>> +		else
>> +			writel(0x1000000, (char *)chip->remap_diu_addr + 0x490a8);
> 
> Avoid magic numbers, but define them.
> 

Got it.
This solution operate the register inside the GPU witch do not belong to
HDAC. So will evaluate this patch method again.

>> @@ -1103,9 +1113,14 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
>>  			azx_writeb(chip, RIRBSTS, RIRB_INT_MASK);
>>  			active = true;
>>  			if (status & RIRB_INT_RESPONSE) {
>> -				if (chip->driver_caps & AZX_DCAPS_CTX_WORKAROUND)
>> +				if ((chip->driver_caps & AZX_DCAPS_CTX_WORKAROUND) ||
>> +					(chip->driver_caps & AZX_DCAPS_RIRB_PRE_DELAY)) {
>> +					azx_rirb_zxdelay(chip, 1);
>>  					udelay(80);
> 
> Calling it here looks a bit misleading, especially because it's paired
> with a later call.  Better to put another if block that matches with
> both calls consistently.
> 
Ok.

>> +				}
>>  				snd_hdac_bus_update_rirb(bus);
>> +				if (chip->driver_caps & AZX_DCAPS_RIRB_PRE_DELAY)
>> +					azx_rirb_zxdelay(chip, 0);
> 
> I meant this one.
> 
>> @@ -145,6 +146,7 @@ struct azx {
>>  
>>  	/* GTS present */
>>  	unsigned int gts_present:1;
>> +	void __iomem *remap_diu_addr;
> 
> This is a completely different thing, give some comment.
> 
Its belong to GPU MMIO.

> 
>> +static int azx_init_pci_zx(struct azx *chip)
>> +{
>> +	struct snd_card *card = chip->card;
>> +	unsigned int diu_reg;
>> +	struct pci_dev *diu_pci = NULL;
>> +
>> +	diu_pci = pci_get_device(PCI_VENDOR_ID_ZHAOXIN, 0x3a03, NULL);
>> +	if (!diu_pci) {
>> +		dev_err(card->dev, "hda no KX-5000 device.\n");
>> +		return -ENXIO;
>> +	}
>> +	pci_read_config_dword(diu_pci, PCI_BASE_ADDRESS_0, &diu_reg);
>> +	chip->remap_diu_addr = ioremap(diu_reg, 0x50000);
>> +	dev_info(card->dev, "hda %x %p\n", diu_reg, chip->remap_diu_addr);
>> +	return 0;
> 
> Missing pci_dev_put()?
> 
Yes.

>> @@ -1360,6 +1385,10 @@ static void azx_free(struct azx *chip)
>>  	hda->init_failed = 1; /* to be sure */
>>  	complete_all(&hda->probe_wait);
>>  
>> +	if (chip->driver_type == AZX_DRIVER_ZHAOXINHDMI) {
>> +		azx_free_pci_zx(chip);
>> +	}
> 
> Superfluous parentheses.
> 
>> @@ -1876,6 +1906,10 @@ static int azx_first_init(struct azx *chip)
>>  		bus->access_sdnctl_in_dword = 1;
>>  	}
>>  
>> +	chip->remap_diu_addr = NULL;
>> +	if (chip->driver_type == AZX_DRIVER_ZHAOXINHDMI)
>> +		azx_init_pci_zx(chip);
> 
> No error check?  It doesn't look too serious even if the driver
> continues to load, though.
> 
>> --- a/sound/pci/hda/patch_hdmi.c
>> +++ b/sound/pci/hda/patch_hdmi.c
>> @@ -4501,6 +4501,8 @@ static int patch_gf_hdmi(struct hda_codec *codec)
>>  	return 0;
>>  }
>>  
>> +static int patch_zx_hdmi(struct hda_codec *codec) { return patch_gf_hdmi(codec); }
> 
> Don't put in a single line.
> Or, if it's the very same function, you can rather call patch_gf_hdmi
> directly in the table.
> 

Ok.
> 
> thanks,
> 
> Takashi
