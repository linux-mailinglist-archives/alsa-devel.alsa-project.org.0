Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A85BC637885
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 13:06:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45EBD16FB;
	Thu, 24 Nov 2022 13:06:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45EBD16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291612;
	bh=02pheQx8lBP7IbXX4AoycAQAlnMfReBCV0HscPePpkw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoPnUZruWx3dcR3sshqxLzDYhHjhCGPE6uLov9PdB6yad/m8pP+FqIhhCh1gXx9Hx
	 HDX3u3WlzTnRyWed1iCiTNJohbS5+Gv6/cDXTMSHwLcIUhQXxN/8dampMZ4JguVwmw
	 8L2urYj1MuTFwwCICut7eKsQeOKTJo1NWYRuWOTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06081F80149;
	Thu, 24 Nov 2022 13:05:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C830F80431; Thu, 24 Nov 2022 13:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC62F80245
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 13:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC62F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FOOEEfcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669291547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7LQd7RRPNUeESAr+1LKMJrjT4VQDOqKGjXqPqUPd5c=;
 b=FOOEEfcVWT/fBOW8RjTtEVYorbcxHujZzikTiiD/TUakIw+NDJFTvvE3wOiBuVB26O2QyA
 LjkAlVUuhInSKdQVF2qhY5UxzGMK85thgaSpuZQ2ca9bA73VtBlF3VHsvGWVP5sFQJ81yZ
 xE2AScaP+Dnvi1yCiDbOZ/xdts2NdgI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-972jBHIjN0eOXnmR32MG0w-1; Thu, 24 Nov 2022 07:05:45 -0500
X-MC-Unique: 972jBHIjN0eOXnmR32MG0w-1
Received: by mail-ej1-f72.google.com with SMTP id
 qw20-20020a1709066a1400b007af13652c92so1085778ejc.20
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 04:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7LQd7RRPNUeESAr+1LKMJrjT4VQDOqKGjXqPqUPd5c=;
 b=1Ejzy8FqOgMHbAQm4GYsmswBe8RMD6d2DoaJMg6Zy/4hr5g6obrO3+aDJzxZVksHh8
 ElOVVQKjgKlVICLLc5OXIb1OmsZRXZAdDeLsUIa0VyKHnfR6LxTBOKpURVZ6n007QNlT
 Jf4umOpQL+lrN/jsn5O5pLGO5qpB9W+17w6zcEgRgkUPbQngmk2kldXkkdVAbEQ/yPLh
 8LvAYY61K97qCKIrPSB9VHtMLVHDyLZPzyQhGMH+bsUJYOxp5IcgZjST1BhgaoOyoQgY
 e6JexciqXAm5/rYofMOaLQLUbOP5tFC0fVvbxven3SBNALTDIJRzs3kybbtyqk+lAL+m
 ZNQQ==
X-Gm-Message-State: ANoB5pm5XJsZ4IoACQO7QLHh+yVvJBJFqwF5MZTFAesvtQjSLruQtI98
 lysMY+aVdN4Hq/4HbfHe77i0JmlccyhhXe+yEEG1PKSIcANwln4bSB4m+18QIRwVGipxy1f5WR1
 livGiQpe+lXuhquKThMCRLsY=
X-Received: by 2002:a17:906:850d:b0:7ae:21bc:89f0 with SMTP id
 i13-20020a170906850d00b007ae21bc89f0mr27278512ejx.132.1669291543985; 
 Thu, 24 Nov 2022 04:05:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6g9TJYi8s+6j8RI3ddhpDUwVfztYD6fUpPOggYB3f55bxdVlHPVJ4aBETtbEQU7Xvh6Rkc6Q==
X-Received: by 2002:a17:906:850d:b0:7ae:21bc:89f0 with SMTP id
 i13-20020a170906850d00b007ae21bc89f0mr27278494ejx.132.1669291543758; 
 Thu, 24 Nov 2022 04:05:43 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 gc34-20020a1709072b2200b00772061034dbsm342285ejc.182.2022.11.24.04.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 04:05:43 -0800 (PST)
Message-ID: <b1aae548-e18c-9b81-4d00-0a41b23c19e4@redhat.com>
Date: Thu, 24 Nov 2022 13:05:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/2] ALSA: hda: cs35l41: Use ACPI_COMPANION to read
 acpi properties
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Gross <markgross@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20221124110718.3925934-1-sbinding@opensource.cirrus.com>
 <20221124110718.3925934-3-sbinding@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221124110718.3925934-3-sbinding@opensource.cirrus.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
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

Hi,

On 11/24/22 12:07, Stefan Binding wrote:
> Currently the driver finds the acpi_device used to read certain
> properties using the HID, however, this is not necessary, as the
> acpi_device can be obtained from the device itself.
> 
> With the ACPI_COMPANION correctly set, we can also simplify how
> we obtain the reset gpio.

Typically when you write "also do ..." in a commit message
that is a hint to yourself that it might be better to split
the commit into 2 commits which each do only 1 thing, for easier
review. But e.g. also to easier see what is going on if a bisect
points out the commit as being the first bad one.

So once the issues with patch 1/2 are resolved, please consider
splitting this patch into 2 smaller patches.

Regards,

Hans


> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  sound/pci/hda/cs35l41_hda.c | 50 ++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
> index e5f0549bf06d..50cbbcce4946 100644
> --- a/sound/pci/hda/cs35l41_hda.c
> +++ b/sound/pci/hda/cs35l41_hda.c
> @@ -1214,16 +1214,15 @@ static int cs35l41_get_speaker_id(struct device *dev, int amp_index,
>   * And devm functions expect that the device requesting the resource has the correct
>   * fwnode.
>   */
> -static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
> -			       const char *hid)
> +static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, int id, const char *hid)
>  {
>  	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
>  
>  	/* check I2C address to assign the index */
>  	cs35l41->index = id == 0x40 ? 0 : 1;
>  	cs35l41->channel_index = 0;
> -	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
> -	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 2);
> +	cs35l41->reset_gpio = gpiod_get_index(cs35l41->dev, NULL, 0, GPIOD_OUT_HIGH);
> +	cs35l41->speaker_id = cs35l41_get_speaker_id(cs35l41->dev, 0, 0, 2);
>  	hw_cfg->spk_pos = cs35l41->index;
>  	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
>  	hw_cfg->gpio2.valid = true;
> @@ -1255,39 +1254,36 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>  	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
>  	u32 values[HDA_MAX_COMPONENTS];
>  	struct acpi_device *adev;
> -	struct device *physdev;
> +
>  	const char *sub;
>  	char *property;
>  	size_t nval;
>  	int i, ret;
>  
> -	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
> +	adev = ACPI_COMPANION(cs35l41->dev);
>  	if (!adev) {
> -		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n", hid);
> +		dev_err(cs35l41->dev, "Failed to find an ACPI device for %s\n",
> +			dev_name(cs35l41->dev));
>  		return -ENODEV;
>  	}
>  
> -	physdev = get_device(acpi_get_first_physical_node(adev));
> -	acpi_dev_put(adev);
> -
> -	sub = acpi_get_subsystem_id(ACPI_HANDLE(physdev));
> +	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l41->dev));
>  	if (IS_ERR(sub))
>  		sub = NULL;
>  	cs35l41->acpi_subsystem_id = sub;
>  
>  	property = "cirrus,dev-index";
> -	ret = device_property_count_u32(physdev, property);
> -	if (ret <= 0) {
> -		ret = cs35l41_no_acpi_dsd(cs35l41, physdev, id, hid);
> -		goto err_put_physdev;
> -	}
> +	ret = device_property_count_u32(cs35l41->dev, property);
> +	if (ret <= 0)
> +		return cs35l41_no_acpi_dsd(cs35l41, id, hid);
> +
>  	if (ret > ARRAY_SIZE(values)) {
>  		ret = -EINVAL;
>  		goto err;
>  	}
>  	nval = ret;
>  
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret)
>  		goto err;
>  
> @@ -1307,11 +1303,10 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>  	/* To use the same release code for all laptop variants we can't use devm_ version of
>  	 * gpiod_get here, as CLSA010* don't have a fully functional bios with an _DSD node
>  	 */
> -	cs35l41->reset_gpio = fwnode_gpiod_get_index(acpi_fwnode_handle(adev), "reset", cs35l41->index,
> -						     GPIOD_OUT_LOW, "cs35l41-reset");
> +	cs35l41->reset_gpio = gpiod_get_index(cs35l41->dev, "reset", cs35l41->index, GPIOD_OUT_LOW);
>  
>  	property = "cirrus,speaker-position";
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret)
>  		goto err;
>  	hw_cfg->spk_pos = values[cs35l41->index];
> @@ -1322,41 +1317,41 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>  			cs35l41->channel_index++;
>  
>  	property = "cirrus,gpio1-func";
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret)
>  		goto err;
>  	hw_cfg->gpio1.func = values[cs35l41->index];
>  	hw_cfg->gpio1.valid = true;
>  
>  	property = "cirrus,gpio2-func";
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret)
>  		goto err;
>  	hw_cfg->gpio2.func = values[cs35l41->index];
>  	hw_cfg->gpio2.valid = true;
>  
>  	property = "cirrus,boost-peak-milliamp";
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret == 0)
>  		hw_cfg->bst_ipk = values[cs35l41->index];
>  	else
>  		hw_cfg->bst_ipk = -1;
>  
>  	property = "cirrus,boost-ind-nanohenry";
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret == 0)
>  		hw_cfg->bst_ind = values[cs35l41->index];
>  	else
>  		hw_cfg->bst_ind = -1;
>  
>  	property = "cirrus,boost-cap-microfarad";
> -	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	ret = device_property_read_u32_array(cs35l41->dev, property, values, nval);
>  	if (ret == 0)
>  		hw_cfg->bst_cap = values[cs35l41->index];
>  	else
>  		hw_cfg->bst_cap = -1;
>  
> -	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, nval, -1);
> +	cs35l41->speaker_id = cs35l41_get_speaker_id(cs35l41->dev, cs35l41->index, nval, -1);
>  
>  	if (hw_cfg->bst_ind > 0 || hw_cfg->bst_cap > 0 || hw_cfg->bst_ipk > 0)
>  		hw_cfg->bst_type = CS35L41_INT_BOOST;
> @@ -1364,14 +1359,11 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
>  		hw_cfg->bst_type = CS35L41_EXT_BOOST;
>  
>  	hw_cfg->valid = true;
> -	put_device(physdev);
>  
>  	return 0;
>  
>  err:
>  	dev_err(cs35l41->dev, "Failed property %s: %d\n", property, ret);
> -err_put_physdev:
> -	put_device(physdev);
>  
>  	return ret;
>  }

