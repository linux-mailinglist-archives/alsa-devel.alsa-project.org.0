Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1944980AC6D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Dec 2023 19:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD9EF839;
	Fri,  8 Dec 2023 19:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD9EF839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702061260;
	bh=blvUZzpj2CREq+CAx85Qm2ONo2JCdPZE9zcWpmIEu8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TbAgwrrEtA3r5Eu7MysW1cpBAC2vO/mN2Icqqq8JXmjdxjKmBTzRzSJZnR6TqNM9M
	 wdqCOqSONBeoCCb6F5+bp1MfOKWC2JrpYbKwNKrhxau5phlfvanuxx1F0SdMq0H/Mn
	 U8xfrBqs+XRigME7QlGVjZ64/gDptGki7bTj1PYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AA22F80579; Fri,  8 Dec 2023 19:47:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6CE1F8057B;
	Fri,  8 Dec 2023 19:47:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3662EF8024E; Fri,  8 Dec 2023 19:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ECC4F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Dec 2023 19:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ECC4F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hj5haSlR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702061153; x=1733597153;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=blvUZzpj2CREq+CAx85Qm2ONo2JCdPZE9zcWpmIEu8U=;
  b=Hj5haSlRVvI7OSwXUA3+TbefMSzu8wq9pzkrCsv7AVUa8adgVmMrrCPa
   w3Xe+n3oGNWp9Jwm1SNxO33bKm6BLt+Ed+LzR/5QiLo74UuEWNb6/MneG
   xJrXRLF4MTV/UcvlbyWe2dST4KRw23zHaLPTsRLzDuFqurNu597gwklKc
   NNr76cgOWSzRKdHRvtM+PAU86WlPUaz6RxGmByn++blnUgwbf8sDqSq+a
   zr+mbYfe9dbYOGZjpVjo1y1TNVZLfEJbGg9Qma3BVVs/nYX+WXxa7XErM
   nCvJtS/lBorbBaFwnOO4Aebqjwm46sehn8g5a5BrCQiscskY92gHQgY7X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1568616"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="1568616"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 10:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="945504345"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600";
   d="scan'208";a="945504345"
Received: from williamh-mobl.amr.corp.intel.com (HELO [10.212.151.176])
 ([10.212.151.176])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 10:45:22 -0800
Message-ID: <4048c3a3-f694-41c2-b338-57e524544c92@linux.intel.com>
Date: Fri, 8 Dec 2023 12:45:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <20231208162735.GV14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231208162735.GV14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QQ2I6LXMVSAW3A2CJLC5WMI3RC5L7CAI
X-Message-ID-Hash: QQ2I6LXMVSAW3A2CJLC5WMI3RC5L7CAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQ2I6LXMVSAW3A2CJLC5WMI3RC5L7CAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/8/23 10:27, Charles Keepax wrote:
> On Thu, Dec 07, 2023 at 04:29:29PM -0600, Pierre-Louis Bossart wrote:
>> The Bulk Register Access protocol was left as a TODO topic since
>> 2018. It's time to document this protocol and the design of its Linux
>> support.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>> +Concurrency between BRA and regular read/write
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The existing 'nread/nwrite' API already relies on a notion of start
>> +address and number of bytes, so it would be possible to extend this
>> +API with a 'hint' requesting BPT/BRA be used.
>> +
>> +However BRA transfers could be quite long, and the use of a single
>> +mutex for regular read/write and BRA is a show-stopper. Independent
>> +operation of the control/command and BRA transfers is a fundamental
>> +requirement, e.g. to change the volume level with the existing regmap
>> +interface while downloading firmware.
> 
> Is this definitely a show stopper? Not saying that it wouldn't be
> desirable to do both from a speed perspective, but current
> systems that download firmware (I2C/SPI) typically will block the
> bus for some amount of time. There are also some desirable properties
> to a single lock such as not needing to worry about accessing the
> same register in the bulk transfer and a normal command transfer.

There are other cases where we do want to interact with the device even
if we are in the middle of downloading stuff. We currently have a
msg_lock that's used to prevent multiple read/writes from being sent on
the bus, I really don't think it would be wise to use this same
"lightweight" lock for much longer transfers. This could impact response
to alerts, changes in state reported by the hardware, etc.

>> +Audio DMA support
>> +-----------------
>> +
>> +Some DMAs, such as HDaudio, require an audio format field to be
>> +set. This format is in turn used to define acceptable bursts. BPT/BRA
>> +support is not fully compatible with these definitions in that the
>> +format may vary between read and write commands.
>> +
>> +In addition, on Intel HDaudio Intel platforms the DMAs need to be
>> +programmed with a PCM format matching the bandwidth of the BPT/BRA
>> +transfer. The format is based on 48kHz 32-bit samples, and the number
>> +of channels varies to adjust the bandwidth. The notion of channel is
>> +completely notional since the data is not typical audio
>> +PCM. Programming channels helps reserve enough bandwidth and adjust
>> +FIFO sizes to avoid xruns. Note that the quality of service comes as a
>> +cost. Since all channels need to be present as a sample block, data
>> +sizes not aligned to 128-bytes are not supported.
> 
> Apologies but could you elaborate a litte on this? I am not sure
> I follow the reasoning, how does the 48k 32bit DMA implementation
> result in 128-byte limitation? I would have thought 1 channel would
> be 4-bytes and you are varying the channels so I would have expected
> 4-byte aligned maybe 8-byte if the DMA expects stereo pairs.

With the 50x4 default frame size that we're using, a BTP/BRA write
requires 13.824 Mbits/s for TX and 3.072Mbits/s for RX. We have to treat
these "non-audio' streams as respectively 10 and 2 channels of 48kHz
32bit data to reserve the equivalent PCM bandwidth, and that creates an
alignment requirement since the DMA expects all 'channels' to be present
in the same block.

We could try and play with parameters, e.g. I am not sure what happens
if we used 192kHz, maybe that reduces the alignment back to 32 bytes.
But the point is arbitrary sizes *cannot* be handled.

The HDaudio spec also mentions that for efficiency reason it's strongly
recommended to use 128-byte multiples.

> And what exactly do we mean by aligned, are we saying the length
> all transfers needs to be a multiple of 128-bytes?

Yes.

> I think we might have some annoying restrictions on the block
> size on our hardware as well I will go dig into that and report
> back.

That would be very useful indeed, we have to make sure this alignment is
reasonably supported across hosts and devices.
If we can't agree we'll have to make the alignment host-dependent, but
that will make the logic in codec drivers more complicated.
