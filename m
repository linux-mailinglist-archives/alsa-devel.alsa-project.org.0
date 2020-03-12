Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D25182CD5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 10:56:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5C216A6;
	Thu, 12 Mar 2020 10:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5C216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584006961;
	bh=r8lOFpeY+jfhB3anM/CBKcIPbYMfMBKYdFHDqdIhYcM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZjxdcIvsuZ+cWdT7r0+1lsGuC/9mzyCYfquCHA5wExUbHs6BsLdzrTt1suL8mdlrA
	 VkuHrbPPhgdxrGmvFzmh5jnNegIy5vDI4jO1s7ZWwiX9Nn7je99NLM5RWIs47fMAWJ
	 ZK78j2+idZjEKzTmgl5qwNekn/ByThLO06EAcyBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB1CF801D9;
	Thu, 12 Mar 2020 10:55:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8258F8020C; Thu, 12 Mar 2020 10:54:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09EB4F800BE
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 10:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09EB4F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dq4SjmVf"
Received: by mail-wm1-x341.google.com with SMTP id 25so5338282wmk.3
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gti9dtiZNXKPmQ12a2+yifX0C9HtE+cfekK36Alolzs=;
 b=dq4SjmVfRXEXLGf6KzFd107WHVwswuMrYi5FmbxhUGVv5eERMbFQBkASi7Llscm4FP
 xIsSZVR2rpyGH8AgzFUaZ0rNeF5+oGG3rSIP7vIqnLYGm5TiMdF/Ic3KVgGkq+zANr8X
 IgeYhDn24Xd2HbIuIvP2BtlOtYBQep43Gb3HPyA7zj7mOjSu9iwtQuFG60G7Ri6q78Qg
 GavDRFXM3IxuvEoHjQR6+PFONSFQQFPCiF0yaRne6Hup+Ep7X8O7ndAKob9oQlMcYzRh
 y2TsyebvoV2bh+1QB4sxbC/XQ8/Yj6g9zNm+OWto2Nu8T6Uf3d02SAlIqLylqtN6QYJr
 HDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gti9dtiZNXKPmQ12a2+yifX0C9HtE+cfekK36Alolzs=;
 b=biPxB+WTWNCqWFusBXdH3lb0J1aiKIVQyVkSNjkm/4z4tKgandk9oIFjSTU1rudT7i
 OhQHMZnkWoe1ueNQ8iZUw2qQ+4SDGtBiO+Z9Gbob5ACmCy7GbIwWWJPLEjLNrgMmEJTg
 s4KCGj9G2yB3zJrCNsOT1/Z1QJ6xmsuU753zGeMmsmrXvLxQSxVOiVQ4huwWyOVoVx03
 eNX4F5IUJotql2W/LYv6F31jyw7dD/Xsldj2JLapqzSZaaoemchqi7oRSFnYiiQBE+PR
 78kvjGVf23xaiIwWOAHzPYacxFkx6rS0A+TYchwdk1xrGtognZ/DsaeOMwU73OIaQFP4
 /Aiw==
X-Gm-Message-State: ANhLgQ120CuN78RtkN7yIPHVnQ1VonrRNWMKEOlrNSMJyglcnmf52tjI
 uH1Schvgfm+Vusn41Q355zfCBDiIaO4=
X-Google-Smtp-Source: ADFU+vsMbysNTXcN2q4IMGtlnBj3yPlfcmijwA+eQf8BxyMDoFt8TILdrdv7jcTX52d/tu1Ks8hgdA==
X-Received: by 2002:a1c:9d41:: with SMTP id g62mr4148682wme.131.1584006895796; 
 Thu, 12 Mar 2020 02:54:55 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h13sm16748590wrv.39.2020.03.12.02.54.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 02:54:54 -0700 (PDT)
Subject: Re: [PATCH 2/2] ASoC: wsa881x: mark read_only_wordlength flag
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, vkoul@kernel.org
References: <20200311113545.23773-1-srinivas.kandagatla@linaro.org>
 <20200311113545.23773-3-srinivas.kandagatla@linaro.org>
 <2c56d592-719f-bd87-25cb-c5028bde729b@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ec587d04-274a-32dc-ed2d-cdb8fbdf788d@linaro.org>
Date: Thu, 12 Mar 2020 09:54:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2c56d592-719f-bd87-25cb-c5028bde729b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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



On 11/03/2020 18:58, Pierre-Louis Bossart wrote:
> 
> On 3/11/20 6:35 AM, Srinivas Kandagatla wrote:
>> WSA881x works in PDM mode so the wordlength is fixed, which also makes
>> the only field "WordLength" in DPN_BlockCtrl1 register a read-only.
>> Writing to this register will throw up errors with Qualcomm Controller.
> 
> it'd be good to clarify the nature of these errors, i.e.
> 
> a) is this the Slave device responding with a NAK?
> b) is this the Slave device responding with COMMAND_IGNORED, and those 
> responses not handled by the controller?
> c) something else?


With the current version of Qcom SoundWire controller driver, it can 
only know if the write succeeded or not based on completion interrupt. 
There are no details of the actual error code visible to the driver. But 
the new version of the same controller is expected to return better 
error codes.

thanks,
srini

> 
> Thanks!
