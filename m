Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB3631AF96
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 08:25:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96245169C;
	Sun, 14 Feb 2021 08:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96245169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613287546;
	bh=+NMSIBLjTkocWyPOSnvr93/kvnpENQ5T0Ff2GrIMIaA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bVAaT0XaPaO3DgJDVrPWni8zXg4P49xFrMCmkUFiLxszlRK3Qk9r51JSPBVMZB3+4
	 qv/mS0lDsZD3dunRxB83PysF8y9fgNwqKqhAK7ZBjDTnrnHZwmawNIDWmfzfSeInrb
	 HMS7xxwXiF2qMos4acdATOyCrQX8FWcBFG6mXBxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D41EAF800B2;
	Sun, 14 Feb 2021 08:24:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26429F80155; Sun, 14 Feb 2021 08:24:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48885F800B2
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 08:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48885F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IlTfhDgy"
Received: by mail-wr1-x430.google.com with SMTP id t15so4792892wrx.13
 for <alsa-devel@alsa-project.org>; Sat, 13 Feb 2021 23:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=rsfpdVU9nQUkb0Hn8plZhbJavn6Bn7sQcQYoj21h4m4=;
 b=IlTfhDgyeX7NlFLj1Qy8cZXkjOh4CDjkh3fL6WxzPDTLt4tMJbtK1xGBSKQCgWHoUE
 iyol2OTeR9Nt33GxtwvIPeSIZWIr4+lCvM0Fd2QnmsnflgcRlOfZfrP+BP3Vmjkslv4f
 +MNYKDk9RtIy0PragzSOC3JBJRTaGtxrzkEuBQEOTOIWR/dh0nCcvq5hL+NDT2+ObrjM
 FWGv4ftrPRq364EJRb3/igB1NzjfCs83u7Y42T2h7zTSJ1kIslzkqJ91ZbJLCeJHNMhU
 rRCT8e2gAIzrhP78inSrvl7ClYBw+j2syGK3d071fdWleXIiv9kkLrypG+L6NjYnBCZm
 S3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=rsfpdVU9nQUkb0Hn8plZhbJavn6Bn7sQcQYoj21h4m4=;
 b=C5gvgihdu1ZxuiqCiAlW1EX49KJ50bTZTYjHbJaKL6t0yi4jEzCe2XiM/zvejxz1Tx
 tkS5mFPDF0b2+av25LFgLLB6Dw1v723DwUgWOQ487TaW903lPHzUTB1LDaA2jC3QmbHq
 Oqns9m8lGjVBPRVto665IYTTaGiRYXZMkT9ArGED+yASMcl1m0rtrvu3+tmWRsLst9yP
 OilHtvbhpe4bqBXy2po6rg+r6zLY29SijijeKwXKvwuUDr5XAGJcp7pHh4lXysvIk++S
 6KEghia1HQyBvxw5w+KXsVh8Gfmi69xz/ubL6wD2zvMG2W0fQYiJOGOWLETw7KismhYW
 a1hA==
X-Gm-Message-State: AOAM5331eIm+TjN8yqX19fZegqr4cMhPyz5KSaWfVny26g9wHInauxpo
 MJeyz3hFc9F3snt4hJRfLvc=
X-Google-Smtp-Source: ABdhPJwHSBNZry74vzpPl+hsTNtlQYui+V4CKjLpOsGwaZofy8Bn1YF2X1eBC+TGSNehle+8iW/Yqw==
X-Received: by 2002:a5d:408a:: with SMTP id o10mr12148922wrp.427.1613287442135; 
 Sat, 13 Feb 2021 23:24:02 -0800 (PST)
Received: from [0.0.0.0] ([2a01:4f8:c17:e10a::1])
 by smtp.gmail.com with ESMTPSA id o83sm20894670wme.37.2021.02.13.23.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 23:24:01 -0800 (PST)
Subject: Re: [PATCH v3 1/3] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Randy Dunlap <rdunlap@infradead.org>, Perry Yuan <Perry.Yuan@dell.com>,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com,
 mgross@linux.intel.com
References: <20210112171723.19484-1-Perry_Yuan@Dell.com>
 <cc83351b-a19a-9a3e-d511-4553cf4d7ef0@infradead.org>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <68bd09cd-2bdb-2c4e-f38d-a28a7fb0cb48@gmail.com>
Date: Sun, 14 Feb 2021 15:23:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cc83351b-a19a-9a3e-d511-4553cf4d7ef0@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Mario.Limonciello@dell.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 platform-driver-x86@vger.kernel.org, broonie@kernel.org
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

Hi Randy.

On 2021/1/13 1:39, Randy Dunlap wrote:
> On 1/12/21 9:17 AM, Perry Yuan wrote:
>> +config DELL_PRIVACY
>> +	tristate "Dell Hardware Privacy Support"
>> +	depends on ACPI
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	depends on DELL_LAPTOP
>> +	depends on LEDS_TRIGGER_AUDIO
>> +	select DELL_WMI
>> +	help
>> +	This driver provides support for the "Dell Hardware Privacy" feature
>> +	of Dell laptops.
>> +	Support for a micmute and camera mute privacy will be provided as
>> +	hardware button Ctrl+F4 and Ctrl+F9 hotkey
> 
> 	End above with a period '.' please.
> 
>> +
>> +	To compile this driver as a module, choose M here: the module will
>> +	be called dell_privacy.
> 
> Please follow coding-style for Kconfig files:
> 
> from Documentation/process/coding-style.rst, section 10):
> 
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.
> 
> 
> thanks.
> 

Thank you for the review.
Format checked again and will be updated in V4.
