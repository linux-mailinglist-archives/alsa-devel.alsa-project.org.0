Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6039F4DF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 13:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C77616BE;
	Tue,  8 Jun 2021 13:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C77616BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623151476;
	bh=yg+r/1lmpyFdSFW5Vyg+IKVINQllKoKFKHi7vxP5v5U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ybxv8WOtTUKtuzLC2yw2GWaw4lantpdD2EzJm+TJd6Yyp2iVvhk8d644REMNaeguJ
	 AcmUk+aYcZRzKP5ZVWR7ydMwD3PrZzXFq3PypWN9TGtkgezyDBeNgAZKF+cel81vEt
	 8JP/Qut+6SUK4oLLPKsukvPdNpmPKw/3883RwFSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8308F80227;
	Tue,  8 Jun 2021 13:23:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73FA3F800FD; Tue,  8 Jun 2021 13:23:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DAE2F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 13:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DAE2F800FD
IronPort-SDR: etG45+//QzIPAtDQSeZy3RUSUpW/EKe1AZ9YRa15L1ew0u/iZ+eAFt9JtM6pZFEeBkX/hvQZe9
 t2KHiboHfv8w==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202965401"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="202965401"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:22:53 -0700
IronPort-SDR: jEUsQyqlRSmJQF7TSzRI9wByQfNJbgALb/JQGIfcwEkbdiMKwFiFHKb3aEiYqXzfISSi31zMUg
 Goy4dnqWNhLQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="440423605"
Received: from mkwongx-mobl.amr.corp.intel.com (HELO [10.212.74.13])
 ([10.212.74.13])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:22:52 -0700
Subject: Re: [PATCH 2/2] ASoC: Intel: boards: use software node API in Atom
 boards
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
 <20210607223503.584379-3-pierre-louis.bossart@linux.intel.com>
 <0e8e01f6-d249-cc3e-2020-f6e5c81a4732@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a67817d5-5fd2-c5a5-e366-4e6534d2e4c9@linux.intel.com>
Date: Tue, 8 Jun 2021 06:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0e8e01f6-d249-cc3e-2020-f6e5c81a4732@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 broonie@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


>>   static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
>> @@ -617,6 +634,8 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
>>   	struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
>>   
>>   	gpiod_put(priv->speaker_en_gpio);
>> +	device_remove_software_node(priv->codec_dev);
> 
> This is a problem, nothing guarantees codec_dev not going away before
> snd_byt_cht_es8316_mc_remove() runs. Although the only thing which I can come up
> with where this happens is unbinding the i2c-controller driver I still would like
> us to take this scenario into account.

Is this possible really? the codec driver will register a component 
that's used by the ASoC card, I was assuming that there was some sort of 
reference count already to prevent this unbinding from happening.

> I think it would be better to use device_create_managed_software_node() to tie
> the lifetime of the swnode to the lifetime of the device, this also removes
> the need for all the goto err cases (and introducing a remove function in
> the bytcr_rt5640.c case).
> 
> This does mean that we could end up calling device_create_managed_software_node()
> on the same device twice, when the machine driver gets unbound + rebound, but
> that is an already existing issue with our current device_add_properties() usage.
> 
> We could fix this (in a separate commit since it is an already existing issue)
> by adding a PROPERTY_ENTRY_BOOL("cht_es8316,swnode-created") property to the
> properties and checking for that being set with
> device_property_read_bool(codec, "cht_es8316,swnode-created")
> 
> Or we could move the device_put(codec_dev) to snd_byt_cht_es8316_mc_remove().

that sounds like a better plan if you want to manage explicit 
dependencies - regardless of how which API is used to manage properties.
