Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86168592609
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 20:48:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA5C1844;
	Sun, 14 Aug 2022 20:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA5C1844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660502889;
	bh=KANH+VfZE3ntxuhx96834tqyoYdxrDOe789KT055ePA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B23g06uEZt3i4VfoSPW27c/2D9ZPy/ucDHv4S+5d3BorjEoWNMHUeoltKmy3qYmc7
	 qaJUYZMGKaZSfN7qNgBtqHnCZL+n/MWJ16w8eP6oHm6SX2k12LeEzJXFtsV60Db0jj
	 S56E+hsF1T8PqRe6/K4vaHTJQMRrSyITyuowdrEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F6D0F804C1;
	Sun, 14 Aug 2022 20:47:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8E5EF800B8; Sun, 14 Aug 2022 20:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4355EF800B8
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 20:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4355EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZcNgkuU+"
Received: by mail-qv1-xf32.google.com with SMTP id u8so4143916qvv.1
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 11:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dudlmWjuSuvNbi9ZYyo/rAhbjJyLDMtzGN5G53OzaMo=;
 b=ZcNgkuU+zWbAKcAGArBWE8maGMxvPQ7VlP0YNqDbjIPV8BeVbWwnoua6cHVFuLyH4l
 Y+eaEC5T+XPw1vLxXzcQsWDey3KX78uyEbjfuqi4pwC+42YiT39WsUA628D79tfh6K8d
 4DY725D0GLL5UQ+8tL59nOSTxuD88uzXAM37WpK1T7DkyyJN4R0TRPKJW10UE5YXaqS6
 qUDPl03aM301291lSSXaacqjwyNXXJDtlXWf0TNGiKDbQiFzQ0K9B20MCltUdnOy1i+Y
 z0mGQlMIyw7XXHzaEHp31ukbzY5PON8ezIqMqYl5d4JQW2i4XMjGkbiQjLyDVBSeOjLN
 6u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dudlmWjuSuvNbi9ZYyo/rAhbjJyLDMtzGN5G53OzaMo=;
 b=RHa00rDwAj7IwX32YMm+ZejlAeQEpbRRjEMCMHedizxOrZPgq/D86MYKQnTR+0wa6L
 U9RiPBsYzQ87Zxe9q9Ls5FeXN8r7ODnHrLI2r8uoztgp2uz/TOP9ba1E2UqutWUDksxc
 i3yi3zmoY2+g3Vf+898je4hW8fI6HD0CMCmd1SWn+n3NHYn7WC17qqVwEjW3tXc4Lu4A
 xDt8KeWpNKzOY89TsqPYLNuetB0Brd9ZMjmmG+F3pSBE358fk/YNm3nsG2cOlmSoLxeK
 JDfcVAgUfxS7BmwgVl4y/eYjrCxcz5nXQvFjYBYM0p3yh39kBXxkFicH1O+ulRlVScxX
 c47w==
X-Gm-Message-State: ACgBeo1zJ5BvhYR6c4aDbIE5evxYioWpHVkQxovNZBaP3yt6/0qdPv5b
 vycyMjBbLd0JntYWY6skQoXFv8CueX8NDj20dq4=
X-Google-Smtp-Source: AA6agR4oQuZQwsVyjXb+7L9CQIbO7cRvAMkkYymfXxeLEfz+ouuOzmVVtEFPSsbedtPUWQLE/CKEUbV8wlJCDhKD/P0=
X-Received: by 2002:a05:6214:5290:b0:479:5df:e654 with SMTP id
 kj16-20020a056214529000b0047905dfe654mr10935326qvb.97.1660502823159; Sun, 14
 Aug 2022 11:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
In-Reply-To: <20220814080416.7531-1-khalid.masum.92@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Aug 2022 21:46:26 +0300
Message-ID: <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
To: Khalid Masum <khalid.masum.92@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On Sun, Aug 14, 2022 at 11:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>
> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
> populated with properties from FW node props. Make this happen by
> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
> the flag to store the multi_link value from intel_link_startup. Use
> this flag to initialize bus->multi_link.

...

>         /*
>          * Initialize multi_link flag
> -        * TODO: populate this flag by reading property from FW node
>          */
> -       bus->multi_link = false;
> +       bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
> +               == FWNODE_FLAG_MULTI_LINKED;

NAK (as far as I understood the context of the comment and the change itself).

These flags are for devlink, we do not mix FW properties with those
internal flags anyhow. The comment suggests that this should be a
property. Also commit message doesn't explain the relation to devlink.

-- 
With Best Regards,
Andy Shevchenko
