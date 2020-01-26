Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB69149AC8
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jan 2020 14:23:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E8BF15E5;
	Sun, 26 Jan 2020 14:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E8BF15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580045002;
	bh=70adSlA+jn+m7ZQK8eYQIFC6MhYByrnwRPQFpHaYuWo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XG/wM5ondNWwmZsCPBWfxdKX4d5REwy3mpC1rMVGQcoLXf4b1mBmdKldgBNWv8gwl
	 IoUVgjxPSMmG9nV02kTefT/nVplJKSXEFOeT2mLOvdOlWojkR2pa9Jq0MtQzViLKi0
	 qezSbnFvwJaEzLgU0x6UoFHugc/LSVTsSprlfP1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3CFDF80268;
	Sun, 26 Jan 2020 14:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D735EF80255; Sun, 26 Jan 2020 14:21:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E3F2F800BA
 for <alsa-devel@alsa-project.org>; Sun, 26 Jan 2020 14:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E3F2F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="MryoBnrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580044878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsfHSZG1zHv4p6C/vlcY9hc5HBtWKr/hh4heHf9QvrI=;
 b=MryoBnrhMkc4N4SyooYGKTNf+Ny09FZnknU1EDdXbGkFlvmWW892CxWZfqvWvVTL6yYgZc
 4EJa0bbCCLJwfo+itYVi7EsphkdVM4EPDNmeALNbCJA0bgZ6QGYcLt4ycodPGY42kaSxmW
 lGG5g3QTRk6ptWztcfT8+gQbRrKuNBQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-S4JmZtN3N26R7cr-X8j2JA-1; Sun, 26 Jan 2020 08:21:15 -0500
Received: by mail-wm1-f69.google.com with SMTP id b133so706349wmb.2
 for <alsa-devel@alsa-project.org>; Sun, 26 Jan 2020 05:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jsfHSZG1zHv4p6C/vlcY9hc5HBtWKr/hh4heHf9QvrI=;
 b=Aj5mDo2s1Tgjy3ICclu0YSQlYackVKTzaUGCu7awCIScVG/+TyLEOxeJGeZgOfNPU4
 ZDP2lgU4sH2bSfjrzj9D2Jz88OjplT6mrlWCo/c8o6YAX5/FP+8YAti68Xr6UVlJspBw
 F9/WzlgZEkq/MRCEJhh/bEm37Wy7VJ78Z3F6ULhJAj01WESHRlOMJImba6yxGSMQSU4p
 uPjRQvdksDHz3Q110Q7sZTDuONZ1nbxO41ybuyLwZIHFBfmkQW1KMqbO8RkAEbV2elp1
 IsVPywxGdhkA3nAjHwxovADy2BN9zoDisxnc9S3BdyURX/vTNoN8XobaxSlHH8zIQ3SB
 7fkQ==
X-Gm-Message-State: APjAAAW/kAbrhtuW6jRJDHXVYJFZuKnxxTayvbo2SqJfpMMhEFYW3yrr
 0QOiN0m/4UArT9WhyR8Eo4Vtb0QRBOQb6lUr+gUG6ZFj/YXH+DaKx9IQ6Wu6NXfCvRKEbK8q/k9
 nis53x4Vb/sPDCMyRCfY2vvE=
X-Received: by 2002:a5d:438c:: with SMTP id i12mr15170246wrq.196.1580044873750; 
 Sun, 26 Jan 2020 05:21:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOLjBhFohwN74d32YNsRXrTSPDHEUg9f7VcJVfW0oQG9NOzzjXvBJ78yjkvgoTpZKr+CrySw==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr15170229wrq.196.1580044873506; 
 Sun, 26 Jan 2020 05:21:13 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id x18sm16447490wrr.75.2020.01.26.05.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2020 05:21:12 -0800 (PST)
To: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200125181021.70446-1-hdegoede@redhat.com>
 <20200126013827.72B4D20709@mail.kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c716170-f021-9f42-12ff-36afd4e9bc0c@redhat.com>
Date: Sun, 26 Jan 2020 14:21:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200126013827.72B4D20709@mail.kernel.org>
Content-Language: en-US
X-MC-Unique: S4JmZtN3N26R7cr-X8j2JA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Add Clevo W65_67SB the
	power_save blacklist
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

Hi,

On 26-01-2020 02:38, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.4.14, v4.19.98, v4.14.167, v4.9.211, v4.4.211.
> 
> v5.4.14: Build OK!
> v4.19.98: Build OK!
> v4.14.167: Failed to apply! Possible dependencies:
>      38d9c12c0a6d ("ALSA: hda: Add Gigabyte P55A-UD3 and Z87-D3HP to the power_save blacklist")
>      5cb6b5fc013e ("ALSA: hda: Add 2 more models to the power_save blacklist")
>      b529ef2464ad ("ALSA: hda: Add Clevo W35xSS_370SS to the power_save blacklist")
>      dd6dd5365404 ("ALSA: hda: Add Intel NUC7i3BNB to the power_save blacklist")
>      f91f1806530d ("ALSA: hda: Add Intel NUC5i7RY to the power_save blacklist")
> 
> v4.9.211: Failed to apply! Possible dependencies:
>      38d9c12c0a6d ("ALSA: hda: Add Gigabyte P55A-UD3 and Z87-D3HP to the power_save blacklist")
>      5cb6b5fc013e ("ALSA: hda: Add 2 more models to the power_save blacklist")
>      b529ef2464ad ("ALSA: hda: Add Clevo W35xSS_370SS to the power_save blacklist")
>      dd6dd5365404 ("ALSA: hda: Add Intel NUC7i3BNB to the power_save blacklist")
>      f91f1806530d ("ALSA: hda: Add Intel NUC5i7RY to the power_save blacklist")
> 
> v4.4.211: Failed to apply! Possible dependencies:
>      38d9c12c0a6d ("ALSA: hda: Add Gigabyte P55A-UD3 and Z87-D3HP to the power_save blacklist")
>      5cb6b5fc013e ("ALSA: hda: Add 2 more models to the power_save blacklist")
>      b529ef2464ad ("ALSA: hda: Add Clevo W35xSS_370SS to the power_save blacklist")
>      dd6dd5365404 ("ALSA: hda: Add Intel NUC7i3BNB to the power_save blacklist")
>      f91f1806530d ("ALSA: hda: Add Intel NUC5i7RY to the power_save blacklist")
> 
> 
> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?

Just adding it to 4.19.98 and 5.4 (and 5.5) is fine.
Regards,

Hans

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
