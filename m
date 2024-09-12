Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCFD977E5D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAD691908;
	Fri, 13 Sep 2024 13:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAD691908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226221;
	bh=ak0oM6R+aQCqIdmgcyfTd+zaQr3ycIgnJT5Jwb25V3E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DNWzXCh3klAxCCYeCu3MuV6ndzmZj0vikrxtXVrdppWIFBgnpb8UP5/JQXazs4Yl1
	 MmsofPzlvhhImCQe6pZstGmsYopG7lG63qPbt84K3MAH1gs2NfIVg5F43l2lDDCcid
	 sNaQdkfdsPKOA4U8S7rRPk5j2bCkjl01Bxe1xhjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12276F80C07; Fri, 13 Sep 2024 13:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 874F7F808C9;
	Fri, 13 Sep 2024 13:13:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E77C4F801F5; Thu, 12 Sep 2024 11:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DC0AF80107
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 11:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC0AF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=LCBfkY5S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726134913; x=1757670913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ak0oM6R+aQCqIdmgcyfTd+zaQr3ycIgnJT5Jwb25V3E=;
  b=LCBfkY5SWyBM26ULOx+dyvDGclnDrc6pGujcmuauXOka2P3EPqou5P5+
   Q7iOYMEAa3OA2sWQfS1jBNUp0ixEbFt6oVTFCq09jtJfNq1uowwdflUFW
   upu+XUVRRB4UcRhNFnqCQoSgooT6WpA1HskGsBMxmE5vY4QAdmavJ4EBt
   XcjZUJFHC2w1cCJSiS1ZM6g62p2059Lz2oLJpHpxRqbeRF0a3QF4mH/zQ
   fQBFLY2Mmk4CCNhTP5wvQkzaOzypwjO/hx8nbldESdBi73HvPOSdtO7Ug
   rDG8IR0mE8mSmGzquKjQr1GlIGjeL2uuJgWEOeIaY6oxARrm3kTwKe6bP
   A==;
X-CSE-ConnectionGUID: T/B5t8f4R/WLMPbvf6HuCg==
X-CSE-MsgGUID: PI/UPcP3QuiZ0PEyxZoDhw==
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600";
   d="scan'208";a="34843216"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Sep 2024 02:55:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 02:54:44 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 02:54:41 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>
CC: <alexandre.belloni@bootlin.com>, <alsa-devel@alsa-project.org>,
	<andrei.simion@microchip.com>, <broonie@kernel.org>,
	<codrin.ciubotariu@microchip.com>, <lgirdwood@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <nicolas.ferre@microchip.com>,
	<perex@perex.cz>, <tiwai@suse.com>
Subject: Re: [PATCH 3/3] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
Date: Thu, 12 Sep 2024 12:53:38 +0300
Message-ID: <20240912095337.41507-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ae7a3386-5e11-4d9b-84a5-8e6a79c91c52@tuxon.dev>
References: <ae7a3386-5e11-4d9b-84a5-8e6a79c91c52@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=978bd9a2a=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GCZB4FLAZN7HO6TWBPAPTKUDORBWDIZI
X-Message-ID-Hash: GCZB4FLAZN7HO6TWBPAPTKUDORBWDIZI
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:13:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCZB4FLAZN7HO6TWBPAPTKUDORBWDIZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>  struct mchp_pdmc {
>>  	struct mic_map channel_mic_map[MCHP_PDMC_MAX_CHANNELS];
>> +	spinlock_t busy_lock;		/* lock protecting busy */
>>  	struct device *dev;
>>  	struct snd_dmaengine_dai_dma_data addr;
>>  	struct regmap *regmap;
>> @@ -124,6 +126,7 @@ struct mchp_pdmc {
>>  	int mic_no;
>>  	int sinc_order;
>>  	bool audio_filter_en;
>> +	u8 busy:1;

> Can the spinlock and busy flag be replaced by an atomic variable?

I will use atomic_t variable with atomic_set and atomic_read.
I will do a test and send V2.

>>  };
>>
>>  static const char *const mchp_pdmc_sinc_filter_order_text[] = {
>> @@ -167,10 +170,19 @@ static int mchp_pdmc_sinc_order_put(struct snd_kcontrol *kcontrol,
>>  		return -EINVAL;
>>
>>  	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
>> -	if (val == dd->sinc_order)
>> +
>> +	spin_lock(&dd->busy_lock);
>> +	if (dd->busy) {
>> +		spin_unlock((&dd->busy_lock));

> You can remove () around (&dd->busy_lock). Valid for the rest of occurrences.

OK. Got it!

>> +		return -EBUSY;
>> +	}
>> +	if (val == dd->sinc_order) {
>> +		spin_unlock((&dd->busy_lock));
>>  		return 0;
>> +	}
>>
>>  	dd->sinc_order = val;
>> +	spin_unlock((&dd->busy_lock));
>>
>>  	return 1;
>>  }

