Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1AA87837A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 16:27:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6202E0F;
	Mon, 11 Mar 2024 16:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6202E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710170849;
	bh=PE1Bf4VbdQgAuWtq0+E7lFlpiUpbWAvzt5gpUklHuFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=feux4iPvdaIYreCNg1JSRMn7XMA+rjro6HKWK+HzZ1Izkk8gDfY+mk1QN7H1rSo8A
	 2sBxj/OC5uNBhM2o3fNOEMkGJbPi9YqMZ7qtuAB97itgU7gRMHDyf9XLg2mBrYLg2D
	 91/fAHdGrNom6Q95Zp+yekNaBBaRkcpVhVU1engM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F02E3F8058C; Mon, 11 Mar 2024 16:26:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 691C8F8057D;
	Mon, 11 Mar 2024 16:26:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3381BF8028D; Mon, 11 Mar 2024 16:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7AF3F8014B
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 16:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7AF3F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=imjPOvWq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710170710; x=1741706710;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PE1Bf4VbdQgAuWtq0+E7lFlpiUpbWAvzt5gpUklHuFw=;
  b=imjPOvWqDJqYQqv0HMDuYJbXlemYhz6/gVUVBBq8wC1CMFUm3w2FSqoy
   +dER6gVvl0DMzBbuUIo1btOdaWMCsDUOksZEEaw0pArWyEq3RkpY0SjAa
   F4613eBOxLgWu6HYWYUwzD+nf7os60d96MX2aLtsG3b8yGqS7TQzCiW2l
   cP97ry+ApmD05p5j9i6Uc3OlsxAIzKcA6nIcxMV5wrwhehy+vZA0WFEOD
   Erakc54/519eBsczSDE/xm0baDRwzoAeDfKzUIC2AAIT+LQynBV4aFv9f
   nvR4H04oNwMp175a2sstECk10FWS4CyeZD/JsHkmFItQgHbcDTEtX9iMz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4953842"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000";
   d="scan'208";a="4953842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000";
   d="scan'208";a="11782707"
Received: from brianlap-mobl.amr.corp.intel.com (HELO [10.212.126.207])
 ([10.212.126.207])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:25:05 -0700
Message-ID: <58c91c6d-b828-41fd-9001-a399cc2cab99@linux.intel.com>
Date: Mon, 11 Mar 2024 10:25:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
Content-Language: en-US
To: "Ding, Shenghao" <shenghao-ding@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>, "13916275206@139.com" <13916275206@139.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "mengdong.lin@intel.com" <mengdong.lin@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "Lu, Kevin" <kevin-lu@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "soyer@irl.hu" <soyer@irl.hu>, "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>
References: <20240305132646.638-1-shenghao-ding@ti.com>
 <52752743-b4fc-44b3-96d8-21c8cfd2bc3c@linux.intel.com>
 <433f1e2469ec4f33b4c0a06d03775652@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <433f1e2469ec4f33b4c0a06d03775652@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JFHJJ5EMMDMPLOKMFL5NWMHKLCZMT5JY
X-Message-ID-Hash: JFHJJ5EMMDMPLOKMFL5NWMHKLCZMT5JY
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JFHJJ5EMMDMPLOKMFL5NWMHKLCZMT5JY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>>> +			dev_sum == 0) {
>>> +			dev_dbg(tas_dev->dev, "No dev in calibrated data
>> V2.");
>>> +			return;
>>> +		}
>>> +		crc = crc32(~0, cali_data.data, 12 + dev_sum * 24) ^ ~0;
>>> +		if (crc == tmp_val[3 + dev_sum * 6]) {
>>> +			tas2783_apply_calibv2(tas_dev, tmp_val);
>>> +			dev_dbg(tas_dev->dev, "V2: %ptTs", &tmp_val[40]);
>>> +		} else {
>>> +			dev_dbg(tas_dev->dev,
>>> +				"V2: CRC 0x%08x not match 0x%08x\n",
>>> +				crc, tmp_val[41]);
>>> +		}
>>> +	} else {
>>> +		/* Calibrated Data V1 */
>>> +		/* 8 devs * 20 bytes calibrated data/dev + 4 bytes Timestamp
>> */
>>> +		crc = crc32(~0, cali_data.data, 164) ^ ~0;
>>> +		if (crc == tmp_val[41]) {
>>> +			/* Date and time of when calibration was done. */
>>> +			tas2783_apply_calibv1(tas_dev, tmp_val);
>>> +			dev_dbg(tas_dev->dev, "V1: %ptTs", &tmp_val[40]);
>>> +		} else {
>>> +			dev_dbg(tas_dev->dev,
>>> +				"V1: CRC 0x%08x not match 0x%08x\n",
>>> +				crc, tmp_val[41]);
>>> +		}
>>
>> The CRC check should be used to determine if the v1 or v2 should be used.
>> This is really broken IMHO, you could detect the wrong layout then flag that
>> the CRC is bad without even trying the other layout...
> 
> It seemed not easy to add an extra CRC in V1, especially for the old device in the end users.
> As you know, the V1 is stored in raw data. In order to take care of the
> old devices have been already in the end users, the V1 part has to keep here.

I was referreing to the existing CRC at the end...

 * V1:
 *	Calibrated Data of Dev 0(unique_id offset 0) (20 bytes)
 *	Calibrated Data of Dev 1(unique_id offset 1) (20 bytes)
 *	Calibrated Data of Dev 2(unique_id offset 2) (20 bytes)
 *	Calibrated Data of Dev 3(unique_id offset 3) (20 bytes)
 *	Calibrated Data of Dev 4(unique_id offset 4) (20 bytes)
 *	Calibrated Data of Dev 5(unique_id offset 5) (20 bytes)
 *	Calibrated Data of Dev 6(unique_id offset 6) (20 bytes)
 *	Calibrated Data of Dev 7(unique_id offset 7) (20 bytes)
 *	TimeStamp of Calibration (4 bytes)
 *	CRC (4 bytes) <<<< HERE
 *	Reserved (88 bytes)

Presumably the CRC covers all the data above, so you could first check
if the format is V1 or V2 by checking the CRC values, then check the
binary value as confirmation. You're doing the opposite comparison.

>>> +	}
>>> +}
>>> +
>>> +static void tasdevice_dspfw_ready(const struct firmware *fmw,
>>> +	void *context)
>>> +{
>>> +	struct tasdevice_priv *tas_dev =
>>> +		(struct tasdevice_priv *) context;
>>> +	struct tas2783_firmware_node *p;
>>> +	struct regmap *map = tas_dev->regmap;
>>> +	unsigned char *buf = NULL;
>>> +	int offset = 0, img_sz;
>>> +	int ret;
>>> +
>>> +	if (!fmw || !fmw->data) {
>>> +		dev_warn(tas_dev->dev,
>>> +			"%s: failed to read %s: work in bypass-dsp mode.\n",
>>> +			__func__, tas_dev->dspfw_binaryname);
>>> +		return;
>>> +	}
>>> +	buf = (unsigned char *)fmw->data;
>>> +
>>> +	img_sz = get_unaligned_le32(&buf[offset]);
>>> +	offset  += sizeof(img_sz);
>>> +	if (img_sz != fmw->size) {
>>> +		dev_warn(tas_dev->dev, "%s: size not matching, %d %u.",
>>> +			__func__, (int)fmw->size, img_sz);
>>> +		return;
>>> +	}
>>> +
>>> +	while (offset < img_sz) {
>>> +		p = (struct tas2783_firmware_node *)(buf + offset);
>>> +		if (p->length > 1) {
>>> +			ret = regmap_bulk_write(map, p->download_addr,
>>> +			buf + offset + sizeof(unsigned int) * 5, p->length);
>>> +		} else {
>>> +			ret = regmap_write(map, p->download_addr,
>>> +				*(buf + offset + sizeof(unsigned int) * 5));
>>> +		}
>>> +
>>> +		if (ret != 0) {
>>> +			dev_dbg(tas_dev->dev,
>>> +				"%s: load FW fail: %d, work in bypass.\n",
>>> +				__func__, ret);
>>> +			return;
>>> +		}
>>> +		offset += sizeof(unsigned int) * 5 + p->length;

>>> +		} else {
>>> +			/* Capture stream is the echo ref data for voice.
>>> +			 * Without playback, it can't be active.
>>
>> That makes case for [1] above.
>>
>> I also don't get the concept of 'active'. Even when the playback is muted, you
>> do want to provide a reference stream, don't you?
> When playback is muted, it will turn off echo ref.

What does 'turn off' mean?

This could be
a) the echo reference is made of zero-value samples but is transmitted
on the link
b) the echo reference is no longer transmitted and the stream is
disabled with a bank switch.

>>
>> Also don't we have a potential race condition, you set the 'pstream'
>> status for the playback but use it for capture. What tells you that this cannot
>> be executed concurrently?
> Capture in tas2783 can be unmute during playback is unmute.
> No playback, no capture.

I can't follow your answer.

What I was asking is whether we can have a case where tas_dev->pstream
can be tested while it's being set by another thread.

>>> +			 */
>>> +			if (tas_dev->pstream == true) {
>>> +				ret = regmap_update_bits(map,
>>> +					TAS2873_REG_PWR_CTRL,
>>> +					TAS2783_REG_AEF_MASK,
>>> +					TAS2783_REG_AEF_ACTIVE);
>>> +				if (ret) {
>>> +					dev_err(tas_dev->dev,
>>> +						"%s: AEF enable failed.\n",
>>> +						__func__);
>>> +					goto out;
>>> +				}
>>> +			} else {
>>> +				dev_err(tas_dev->dev,
>>> +					"%s: No playback, no AEF!",
>> __func__);
>>> +				ret = -EINVAL;
>>> +			}
>>> +		}
>>> +	}
>>> +out:
>>> +	if (ret)
>>> +		dev_err(tas_dev->dev, "Mute or unmute %d failed %d.\n",
>>> +			mute, ret);
>>> +
>>> +	return ret;
>>> +}
> 
