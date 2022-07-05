Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82756774C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 21:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1B216FB;
	Tue,  5 Jul 2022 21:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1B216FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657048009;
	bh=uN8KXVOk4s9eT77BVQYQIGgvMLWSsjxoHpaZkGcRssE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxq903uDLLngb7urs/upinyR8HXPKHYDuG6FWBvbHaMXRvbiNObusT7HRwVqfRryb
	 e2bgTVp1sdqqy8p5TJdbiqJtukCps/4SmF85HEdnuHNGJh/Sxac/+uQIiOpzZAP2mT
	 qACWPSLu2RteQpKPfepJARlwIsT6bSjkkKrQX+XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD2AF800CB;
	Tue,  5 Jul 2022 21:05:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D65F8015B; Tue,  5 Jul 2022 21:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEAFEF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 21:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEAFEF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AJW8PNgt"
Received: by mail-yb1-xb2f.google.com with SMTP id 76so7910230ybd.0
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 12:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wk3DM317Ts86B0YftrStlYUZ4gz4TN2yIrO1HE5SXl4=;
 b=AJW8PNgt3MYe/AxNWntixYEyUSSq5JjLx/5UzSNlKMvoDQ08DKKJSIJMcV7hoU+zbW
 NYqzNsJK1J/CVBQZ7lhFDmv2CmJLT9IKOCdUSfQ8ccK1TdwiuKmq0muvLKoOvnjVVsXt
 4QnyHGecqlgD8g0RLbvnFQv9AiivRVRLanBKV2wgf5Fd0Kda4pX4OxN043PvSQ7FH3AU
 v5NIyDN8HP3D8wjR4LF72vIlw6rZ1s7ZXk64bahLHRC6IWQwguOY4E/xO0EpF1Qov6SO
 78likgj10byap+eWOWBDWQpjvl2oZJm2EqdXzRMb7VwpUnNh/eljY9IDsEbxj8gmByjJ
 DdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wk3DM317Ts86B0YftrStlYUZ4gz4TN2yIrO1HE5SXl4=;
 b=SntOoe/AGuaP8VJPK6p67fMREmRuDDqoI3bbhcdyaXeiq0hrn28lB+dapJm77YJ6jK
 arNf5RamFI0xk+MsBGN+JlAwvXFDBXPjBx35t35ZBeoddxppuXA2gyLC4Ps0TbsoJgvL
 SZrQSZG4q6bPLWSnBZEcKbISraoMBgYJ4aSsTlBMxPvwh0KayfogsEUuyzonKyyCthxM
 4YmhlHxJBb787bvTCTr8wuPA4kcich8ahrr8WhnGT7vXjUEghEnOS8KTfyN44eNko4wK
 3ykPJqG/ZbLUE6vyNYm41TVSA2sgjlRYXnBN3c+cVT6pu4gbcgfPlYVIeS+0Jq4wF7vX
 Klwg==
X-Gm-Message-State: AJIora9K1/mn4ZlSeDusmXnPnNmaWnK8nhLTWHtp7jIaYsO/YcMXHhn+
 0cAKQcRUFTIMdvhfeab29QgGfh4Imtu3ftk5MSg=
X-Google-Smtp-Source: AGRyM1s2Sd4IFAjGDPznLJLfpZnMRgUbI3cKO3MrAuHWwKFMdU/ubcvbnJzWQUHHrKNFbCGEuuydrijbIkdEQkXxKm4=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr39416609ybs.93.1657047935999; Tue, 05
 Jul 2022 12:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220630150135.1799535-1-sbinding@opensource.cirrus.com>
 <20220630150135.1799535-2-sbinding@opensource.cirrus.com>
In-Reply-To: <20220630150135.1799535-2-sbinding@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Jul 2022 21:04:59 +0200
Message-ID: <CAHp75VfXwDAwwmzbcx4g1uEuzhzMJ31K1bsTrwYFZGbz3tLMBw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ACPI: utils: Add api to read _SUB from ACPI
To: Stefan Binding <sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>
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

On Thu, Jun 30, 2022 at 5:17 PM Stefan Binding
<sbinding@opensource.cirrus.com> wrote:
>
> Add a wrapper function to read the _SUB string from ACPI.

...

> +       if (obj->type == ACPI_TYPE_STRING) {
> +               if (strlen(obj->string.pointer) < ACPI_MAX_SUB_BUF_SIZE &&
> +                   strlen(obj->string.pointer) > 0) {
> +                       sub = kstrdup(obj->string.pointer, GFP_KERNEL);
> +                       if (!sub)
> +                               sub = ERR_PTR(-ENOMEM);
> +               } else {
> +                       acpi_handle_err(handle, "ACPI _SUB Length %zu is Invalid\n",
> +                                       strlen(obj->string.pointer));

Three times to evaluate strlen()... Can we do better, please?

> +                       sub = ERR_PTR(-EINVAL);
> +               }
> +       } else {
> +               acpi_handle_warn(handle, "Warning ACPI _SUB did not return a string\n");
> +               sub = ERR_PTR(-EINVAL);
> +       }

-- 
With Best Regards,
Andy Shevchenko
