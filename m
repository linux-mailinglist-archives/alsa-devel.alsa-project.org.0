Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E490845B50D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:13:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80DF01756;
	Wed, 24 Nov 2021 08:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80DF01756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737988;
	bh=GbQl7VmwYT6Da6FyiGkZm4gjZNzHOqbOrvkiRyHBJmc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrlo0bEz4Nv9d08Izj9FwuhS71JKoSYcAWpzRyGlFS15jMRYnDoZupM5xNfikzD4v
	 6ZeYAn4NDq2LbyU8SWvyTe68nYXjC1d39jc3BQZtLX1QkR5es6+q7ZAwpjCJI95s4t
	 osUL7uZrZiZc5khCMyUOyiI4zoJCNM/65gz08ifo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E91C5F8059F;
	Wed, 24 Nov 2021 08:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E60EEF8049E; Tue, 23 Nov 2021 18:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A89CF80154
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 18:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A89CF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YI/seXBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637687143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pGOFNnsq6hQbfSzZ1S8QHSbquiLsz2uf/jFzpbBf870=;
 b=YI/seXBblx4cvLZvLILxGCtdt/qjqgNqwq2xB9Zlmu6ht1hImRNXKN0raPP2y0pD/7luzp
 tEYMddcEYblA1bNCKsCz5K4aVgOP4r8Hzo3UoUVIjfWw7/x+0PghpNdHntVYBL05AQko4f
 7PeagI8VmqYJMGNBtIAhZllttfBJM6k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-NluYfjoONr6qFsITkq52Lw-1; Tue, 23 Nov 2021 12:05:42 -0500
X-MC-Unique: NluYfjoONr6qFsITkq52Lw-1
Received: by mail-ed1-f71.google.com with SMTP id
 v10-20020aa7d9ca000000b003e7bed57968so18376027eds.23
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 09:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pGOFNnsq6hQbfSzZ1S8QHSbquiLsz2uf/jFzpbBf870=;
 b=YHWzxHJgkMy4H24eYGWydBs8ckuyF+jrSao53rbKgt6/DC+MYJw9n5PtGbJBkYiwfh
 DWghQYD4ys5Oq710Ia8au1ewleNFPUQPpqI2rNYvAFxr7ct2mfXbGaUCuca10WTYDg9W
 dShxXD1rgG5c1Moblts5/9iKeqx9jt0bHc5HagXkOOTCxXfHBP2NuK7JxgkwCW5fYQIG
 XwImw438q6cv6Acc7cJucZn7GYIHtzFPqC4sv8xsCmPfaoPaHeEZw0kEG2VF2STWgbqK
 BcN01DNND4gq4By4XufWuueg67G2cjKS4Xw8anEVb+CMTNPHB2O7c3L1MrtJaAnVmGip
 6CEQ==
X-Gm-Message-State: AOAM530gcp24WKS7NqUW8XWZqKWYAzqL85fNXR7Hq1p5bbzlnN/NLu1r
 oykBh7e2ENfyLoh1VYj5vRyB39tQAReXx1pBB7+jY8dzIlNmoN1H7bOIhu6eB6BNBVJtBIQ0ZT0
 hXq49kLbR170UB3fL26SCqyI=
X-Received: by 2002:a17:906:961a:: with SMTP id
 s26mr9623856ejx.494.1637687141410; 
 Tue, 23 Nov 2021 09:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4G1bs09BzbVicSMtyElfOMBCmrs0kGMkLPlLLrABuxLB8dcws6JHPaJbut24ePtrSUngUcw==
X-Received: by 2002:a17:906:961a:: with SMTP id
 s26mr9623786ejx.494.1637687141113; 
 Tue, 23 Nov 2021 09:05:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gs15sm5423945ejc.42.2021.11.23.09.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 09:05:40 -0800 (PST)
Message-ID: <87af37a2-dc02-2ae0-a621-b82c8601c16c@redhat.com>
Date: Tue, 23 Nov 2021 18:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/11] ACPI / scan: Create platform device for CLSA0100
 ACPI nodes
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Gross <markgross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Yu <jack.yu@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Szu <jeremy.szu@canonical.com>, patches@opensource.cirrus.com,
 Elia Devito <eliadevito@gmail.com>, alsa-devel@alsa-project.org,
 Werner Sembach <wse@tuxedocomputers.com>, platform-driver-x86@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, linux-acpi@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>, linux-kernel@vger.kernel.org
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

Hi Lucas,

On 11/23/21 17:31, Lucas Tanure wrote:
> The ACPI device with CLSA0100 is a sound card with multiple
> instances of CS35L41.
> 
> We add an ID to the I2C multi instantiate list to enumerate
> all I2C slaves correctly.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  drivers/acpi/scan.c                          | 1 +
>  drivers/platform/x86/i2c-multi-instantiate.c | 7 +++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 2c80765670bc..16827a33e93b 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1708,6 +1708,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  		{"BSG2150", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +		{"CLSA0100", },
>  		{}
>  	};
>  
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index 4956a1df5b90..ed25a0adc656 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
>  	{}
>  };
>  
> +static const struct i2c_inst_data clsa0100_data[]  = {
> +	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
> +	{ "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },

This suggests that both amplifiers are using the same GPIO pin as shared
IRQ, is that correct ? Can you share an acpidump of the laptop's DSDT tables ?

Regards,

Hans




> +	{}
> +};
> +
>  /*
>   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -155,6 +161,7 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>  	{ "BSG1160", (unsigned long)bsg1160_data },
>  	{ "BSG2150", (unsigned long)bsg2150_data },
>  	{ "INT3515", (unsigned long)int3515_data },
> +	{ "CLSA0100", (unsigned long)clsa0100_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
> 

