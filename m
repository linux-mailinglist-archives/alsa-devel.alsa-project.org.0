Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA177FC1D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 18:29:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94207825;
	Thu, 17 Aug 2023 18:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94207825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692289784;
	bh=M5vizv/ucjvl18dOwhMFXlFRanUNXU//G2+Phfes9dY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ANfnPO2FfHFRMzdTvhG3XVskVgzWAeHH8fUcSCgrX3eAuH/0ixPPB71YhLRVt3NKP
	 qHjDKTIw6HKeeaKI9hB3J6nQz3Sq6sQBrGoA/yvqxVuV6Sb4HiQ+IsWvy1cLyeifND
	 sbvBj1lZIz2ge579BhkmQVjC7kq9zZRpMwJtwtpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBEB4F8025F; Thu, 17 Aug 2023 18:28:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F018F8016A;
	Thu, 17 Aug 2023 18:28:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17531F8016D; Thu, 17 Aug 2023 18:28:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 627ADF80074
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 18:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 627ADF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eL+1MDfW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692289714; x=1723825714;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M5vizv/ucjvl18dOwhMFXlFRanUNXU//G2+Phfes9dY=;
  b=eL+1MDfW0NHzrI1Gqr7Wk9pb9uZpvCaDgHP8y9oY1qDB4r/Do4KswQdH
   CPjCwQwZsTGtRhEvLG78/Tano4R4Xs100ydIGBOcaZHpFdlHRNUi4ksm1
   gcjjWE4NHMczGRCkJJ2cn8cTpv2dFLZSDlB3GY/QvMNYkmVhTY4SHUVtP
   h/JSthu5plwPxMa4Xs79P4uLvAHbPQvPj7+g7gBHyfAmbdI62YQirZhPq
   OG2QVSYRO9SHF4KoE1dlSvbgsYCftBu5lfA+Mkwxur0ZGB6B58spEV2C0
   BCeAFvtVubVHZ05HV/gozxnvnUkWSmDaIeuygzc4VQl1XP3GY0T/emPHY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376622327"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="376622327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="728203369"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="728203369"
Received: from cerondon-mobl1.amr.corp.intel.com (HELO [10.212.36.16])
 ([10.212.36.16])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 09:28:25 -0700
Message-ID: <6adf5b5d-fa61-667f-2c6c-6211d28d1ddb@linux.intel.com>
Date: Thu, 17 Aug 2023 11:28:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2] ASoC: tas2783: Add source files for tas2783 soundwire
 driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Baojun Xu <baojun.xu@ti.com>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, shenghao-ding@ti.com, kevin-lu@ti.com,
 krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 shumingf@realtek.com, herve.codina@bootlin.com, povik+lin@cutebit.org,
 ryans.lee@analog.com, ckeepax@opensource.cirrus.com,
 sebastian.reichel@collabora.com, fido_max@inbox.ru,
 wangweidong.a@awinic.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, peeyush@ti.com, navada@ti.com, tiwai@suse.de,
 mengdong.lin@intel.com
References: <20230814121158.4668-1-baojun.xu@ti.com>
 <b28b5187-e775-4c4d-635e-9b867a19588e@linux.intel.com>
 <19414ebc-1c33-4482-965d-681f15f06654@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <19414ebc-1c33-4482-965d-681f15f06654@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6HO2GU7C47HGBWPJJLEEDA2RVS4AGVDU
X-Message-ID-Hash: 6HO2GU7C47HGBWPJJLEEDA2RVS4AGVDU
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HO2GU7C47HGBWPJJLEEDA2RVS4AGVDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/17/23 10:12, Mark Brown wrote:
> On Thu, Aug 17, 2023 at 09:17:50AM -0500, Pierre-Louis Bossart wrote:
> 
>>> +		goto out;
>>> +	}
>>> +	/* Read the primary device as the whole */
>>
>> I can't figure out what this comment means
> 
> It's part of...
> 
>>> +		dev_err(tas_dev->dev, "%s, regmap doesn't exist.\n",
>>> +			__func__);
>>> +		return -EINVAL;
>>> +	}
>>> +	/* Read the primary device */
>>
>> What is a primary device?
> 
> ...a thing where they're trying to present multiple devices as a unified
> device with grouped control, it looks like there's some hardware support
> for this.

Let me clarify the comment: SDCA peripheral can have multiple functions,
each with its own address space and can operate independently. So I am
just trying to have clarity on what 'device' means here.

>>> +	/* Failed got calibration data from EFI. */
> 
>> I don't get what the dependency on EFI is. First time I see a codec
>> needing this.
> 
>> Please describe in details what you are trying to accomplish.
> 
> It seems fairly normal to store calibration details in the device
> firmware?

No objection on the device firmware, but why use an EFI variable?

There is on-going work to standardize with ACPI, and there's also a
request_firmware(). Not sure what the direction is to read from an EFI
variable. I've been in SDCA circles since the beginning and never heard
about this, ever. I am not saying it's bad, just surprised and curious
on a 3rd way of getting information needed for initialization.

>>> +	if (crc == tmp_val[21]) {
>>> +		time64_to_tm(tmp_val[20], 0, tm);
>>> +		dev_dbg(tas_priv->dev, "%4ld-%2d-%2d, %2d:%2d:%2d\n",
>>> +			tm->tm_year, tm->tm_mon, tm->tm_mday,
>>> +			tm->tm_hour, tm->tm_min, tm->tm_sec);
> 
>> What is this about? Why would a codec care about time?
> 
> I can see someone finding it helpful to confirm when the calibration data
> that got applied was generated to make sure they're testing/using what
> they thought they were.

Ah yes, I missed that. I wasn't sure if this was a log on when the
calibration finished, if this is a log on when the calibration data was
generated that's a different story indeed.

>> In addition, it's rather surprising that on attachment there is not a
>> single regmap access?
> 
> Don't know if there's something different with Soundwire but for I2C/SPI
> devices it's a reasonable pattern to only actually start initialising
> the registers when the device actually becomes active.  Not checked that
> this is actually happening.

that's precisely the point, there's an io_init() routine which is when
the peripheral is attached on the bus and the earliest time when the
registers can be initialized.

But there isn't a single initialization happening, which is different to
all existing SoundWire codec drivers. Maybe it's fine, I am just asking
the question if this was intentional.
