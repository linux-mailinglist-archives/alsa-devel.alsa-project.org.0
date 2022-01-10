Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0456A488D80
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 01:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863E4174C;
	Mon, 10 Jan 2022 01:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863E4174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641775108;
	bh=rPkUylNVUezuIYM+c0Vfu+IRS0vBOc1aCL++9jJ/GCk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3cre3glAuj+YFba0U3zgElGwlEB7Msa+QSIwJoBzSTCNUGKPKiNsnmK4rHCpZ8+j
	 01J8dHpGidaPQMOEGs76yplPrR/ebMLb+2xJPoQfFVpcKtz7WQYdAfLv8gi6SZNxr/
	 WT1HB5/HFM2ZHwVsoUEjHDs55e+8PCIn8lhl4tig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA87F800DA;
	Mon, 10 Jan 2022 01:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A30EF800DA; Mon, 10 Jan 2022 01:37:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA417F800DA
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 01:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA417F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IXg7or6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641775033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zxl/i6xPComcT6YmUIEakng6IutlfifeQcb42TWWbfY=;
 b=IXg7or6h53d4eFXp8+PtA7a6OUe+bGgvwaC380SxCyHztAlQcRt+mC/G903pnQb0XuPBq7
 dWrwW/NBST+71AApgVCyaL2cJsUM0h0uIioYaD+BeCLLwLwWOPYkL1UScZ2DEHKGKXi35h
 b/g/qtYMwVxxquqnVN0zkpoj7ljN5no=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-pMQuLBOkMjOtZwkz2hZ2mg-1; Sun, 09 Jan 2022 19:37:09 -0500
X-MC-Unique: pMQuLBOkMjOtZwkz2hZ2mg-1
Received: by mail-ot1-f72.google.com with SMTP id
 y35-20020a9d22a6000000b0058f1cced940so2410772ota.1
 for <alsa-devel@alsa-project.org>; Sun, 09 Jan 2022 16:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=Zxl/i6xPComcT6YmUIEakng6IutlfifeQcb42TWWbfY=;
 b=nA8kcvVgScdY05IS0ly35zHVCHqcfvROPxcKsYCNNm0nGIZNHTJ+NBEYqPSwOBpEGZ
 KwhUiwVPszkRQ19jTjyZyLstuLhzpSLWXjtkP9BYfY6y8VMBxWAJfsGiZWcXi8PtCWfD
 zYVoVgYuaYu+JRNagpKgF7Om37U3EKFBvQgJe4D6genFEj9iVXd2gCtIrNb/henAXOEf
 n8G7gbWLwzUvZJOuf/DKTDbq33vCvgTf7ysBUp5LkRilK+y5pjK4mRq2W+ekxsteDNJa
 4Shep9VRIdO7nd6CsJ8nWLqvo2UUtW4KHQ4hSZYJOwiq6r8atJDxcNsIb1UsrPbwp+o4
 r/cw==
X-Gm-Message-State: AOAM531XTOiaiW84a6xBSeAfh76zRrpaJCS0lbW+19CTNUTyyUNdyKVj
 uvF/HbQrdt6JWwx2DcD9OyLUdgtuLfrOZBubw+EZY9YdZ7KYD7sqoIfqW7BxjhMzVTcuLeLE2m6
 yl2EnCEO0Ul823dynRsVPTNQ=
X-Received: by 2002:aca:c1c2:: with SMTP id
 r185mr17201225oif.168.1641775028822; 
 Sun, 09 Jan 2022 16:37:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1WDAjJnMR/rvsDoyXzabUpWZLutH7yJAHjAx+6w1tefW0dHxl8BF/M0ttmI/P81FUuhFQVg==
X-Received: by 2002:aca:c1c2:: with SMTP id
 r185mr17201200oif.168.1641775028481; 
 Sun, 09 Jan 2022 16:37:08 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id be30sm935402oib.50.2022.01.09.16.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 16:37:08 -0800 (PST)
Subject: Re: [PATCH] ALSA: hda: cs35l41: fix double free in cs35l41_hda_probe()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220108140756.3985487-1-trix@redhat.com>
 <CAHp75VfbSmgeyi=8q1_he7mpGrNxYAOewKYWD=h8BSuxz2XWOw@mail.gmail.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <0c0926d9-9b72-1519-7e22-e90ffc229940@redhat.com>
Date: Sun, 9 Jan 2022 16:37:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfbSmgeyi=8q1_he7mpGrNxYAOewKYWD=h8BSuxz2XWOw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "nathan@kernel.org" <nathan@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


On 1/9/22 2:33 PM, Andy Shevchenko wrote:
>
>
> On Saturday, January 8, 2022, <trix@redhat.com 
> <mailto:trix@redhat.com>> wrote:
>
>     From: Tom Rix <trix@redhat.com <mailto:trix@redhat.com>>
>
>     Clang static analysis reports this problem
>     cs35l41_hda.c:501:2: warning: Attempt to free released memory
>             kfree(acpi_hw_cfg);
>             ^~~~~~~~~~~~~~~~~~
>
>     This second free happens in the function's error handler which
>     is normally ok but acpi_hw_cfg is freed in the non error case
>     when it is still possible to have an error.
>
>     Consolidate the frees.
>
>     Fixes: 7b2f3eb492da ("ALSA: hda: cs35l41: Add support for CS35L41
>     in HDA systems")
>     Signed-off-by: Tom Rix <trix@redhat.com <mailto:trix@redhat.com>>
>     ---
>      sound/pci/hda/cs35l41_hda.c | 12 ++++++------
>      1 file changed, 6 insertions(+), 6 deletions(-)
>
>     diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
>     index aa5bb6977792c..265ace98965f5 100644
>     --- a/sound/pci/hda/cs35l41_hda.c
>     +++ b/sound/pci/hda/cs35l41_hda.c
>     @@ -476,7 +476,6 @@ int cs35l41_hda_probe(struct device *dev,
>     const char *device_name, int id, int i
>             ret = cs35l41_hda_apply_properties(cs35l41, acpi_hw_cfg);
>             if (ret)
>                     goto err;
>     -       kfree(acpi_hw_cfg);
>
>             if (cs35l41->reg_seq->probe) {
>                     ret = regmap_register_patch(cs35l41->regmap,
>     cs35l41->reg_seq->probe,
>     @@ -495,13 +494,14 @@ int cs35l41_hda_probe(struct device *dev,
>     const char *device_name, int id, int i
>
>             dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x),
>     Revision: %02X\n", regid, reg_revid);
>
>     -       return 0;
>     -
>      err:
>             kfree(acpi_hw_cfg);
>     -       if (!cs35l41->vspk_always_on)
>     -               gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
>     -       gpiod_put(cs35l41->reset_gpio);
>     +
>     +       if (unlikely(ret)) {
>
>
> This is double weird. First of all, wtf unlikely is here? Second, I 
> commented on the patch that does something with this driver and 
> pointed out to the return 0 in some cases. This one seems a band aid.

Unlikely to have an error.


>     +               if (!cs35l41->vspk_always_on)
>     +                     
>      gpiod_set_value_cansleep(cs35l41->reset_gpio, 0);
>     +               gpiod_put(cs35l41->reset_gpio);
>     +       }
>
>             return ret;
>      }
>     -- 
>     2.26.3
>
>
>
> -- 
> With Best Regards,
> Andy Shevchenko
>
>
