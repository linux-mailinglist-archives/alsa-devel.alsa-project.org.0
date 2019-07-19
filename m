Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C66EAAB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 20:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D6216E5;
	Fri, 19 Jul 2019 20:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D6216E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563561069;
	bh=FpvDhUs6jZQIoDoAccgkucJvrEvND2vrIAdvh2nXrYA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rb6QJ4+NWYzqrZx2AuIYQEA7W039X2hhWmNTM41ud9YppbczfYqR+9aEFec9BSXgf
	 TlyyH9LjH/uXGkTvEPjXMvdbrCH2DNYsVzvZQekj6RaNYHsnpQCCyTa+k2z3RfwBps
	 C4LJV4Rrn4G3ayHyzhwfW2hymn4NPWWOFrmjFPBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E9FF8015B;
	Fri, 19 Jul 2019 20:29:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FD89F80272; Fri, 19 Jul 2019 20:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84AF7F800C4
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 20:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AF7F800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 11:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="176364276"
Received: from cvrozas-mobl1.amr.corp.intel.com (HELO [10.254.190.38])
 ([10.254.190.38])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2019 11:29:10 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
 <20190719170610.17610-7-pierre-louis.bossart@linux.intel.com>
 <s5hlfwtzyca.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6bc24e2a-596b-83f4-d022-5f630657c3a1@linux.intel.com>
Date: Fri, 19 Jul 2019 13:29:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hlfwtzyca.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH 6/6] ALSA: hda/intel: stop probe if DMICS
 are detected on Skylake+ platforms
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



On 7/19/19 1:13 PM, Takashi Iwai wrote:
> On Fri, 19 Jul 2019 19:06:10 +0200,
> Pierre-Louis Bossart wrote:
>>
>> +static int azx_check_dmic(struct pci_dev *pci, struct azx *chip)
>> +{
>> +	struct nhlt_acpi_table *nhlt;
>> +	int ret = 0;
>> +
>> +	if (chip->driver_type == AZX_DRIVER_SKL &&
>> +	    pci->class != 0x040300) {
>> +		nhlt = intel_nhlt_init(&pci->dev);
>> +		if (nhlt) {
>> +			if (intel_nhlt_get_dmic_geo(&pci->dev, nhlt)) {
>> +				ret = -ENODEV;
>> +				dev_dbg(&pci->dev, "Digital mics found on Skylake+ platform, aborting probe\n");
> 
> IMO, this can be verbose, dev_info() would be suitable.
> Otherwise user has no idea why the module load is skipped.

sure, will do.

> 
> 
>> @@ -2055,6 +2078,17 @@ static int azx_probe(struct pci_dev *pci,
>>   	card->private_data = chip;
>>   	hda = container_of(chip, struct hda_intel, chip);
>>   
>> +	/*
>> +	 * stop probe if digital microphones detected on Skylake+ platform
>> +	 * with the DSP enabled. This is an opt-in behavior defined at build
>> +	 * time or at run-time with a module parameter
>> +	 */
>> +	if (IS_ENABLED(CONFIG_SND_HDA_INTEL_DETECT_DMIC) || dmic_detect >= 0) {
> 
> Isn't it "dmic_detect != 0" ?  Otherwise passing dmic_detect=0 would
> be treated as positive here.

Ah, good catch. I literally copied the enable_msi example here, which 
relies on >= 0.

	if (enable_msi >= 0) {
		chip->msi = !!enable_msi;
		return;
	}

Not sure what the intention was here.

Using dmic_detect != 0 wouldn't work for the default -1 value,
maybe dmic_detect > 0 is probably a better solution?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
