Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD1194634
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 19:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0406B1671;
	Thu, 26 Mar 2020 19:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0406B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585246413;
	bh=/wPQeHQHV/7SHo4IM/lN4x5I4kLRINKcgTTIRQZ7Jzg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DK5AMTWsqA+hWpNOFY/9GDp5GPZSd26etIQuGYh16LWHNQCv08GtIW7t+WOQ3VT7t
	 HEEfIs7QI06AK5V4day8FFRT0j9/imu9p2YTdB4T60rliwelz4ktFIOHLOTNeQc4Rx
	 Ju/Og2N9WJoZRh03RZlMrRyk7CMvWN5xI+eHZxMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB91F80095;
	Thu, 26 Mar 2020 19:11:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7FF4F8011B; Thu, 26 Mar 2020 19:11:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AFEAF8011B
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 19:11:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AFEAF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="juuAq0BV"
Received: by mail-ot1-x343.google.com with SMTP id l23so6899646otf.3
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 11:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YhlPOmXcGnG8hY5/n4Rc4Ud1PlJc6DCiH3w8bH9jgA=;
 b=juuAq0BVbd9bZbja9OFkt7uNZXVWqyGIDfbiA3QRhbibaBlkPutZInslij8oo0cC0t
 ywFcJzot4Q3vZj5qBfeu58YWsGT/mzOPj8rSzcOfv6vvSMJqh22XMu96Zmo0WkQvHDG6
 TqdSLzSm9UmHL0hJB6GxoatccMY3Ds5gvfmFdXRhl7ZGW+W5ZVSGv2zNSHYok8x8hZfw
 Tmv/MBNch+h93NadU3AF4FafTacqqnVsgNj762ZXGc3xXvk8I7hwMvPK8Hr8KZy+x1/V
 jSx3HBBtEPwU7QEGj70SpMHfqO6rsFKFuDuUvYJXSwfSjkmiRJmBHAdMNMbH3etGoyLM
 VWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YhlPOmXcGnG8hY5/n4Rc4Ud1PlJc6DCiH3w8bH9jgA=;
 b=tZEgxNBvJN1kVyB7C5/eMKwkI2e0NYaZjggxc9a4Q8dECdJOcDZ9SDmdTCv8+dh5Gg
 osR9z7OgEuFQDsvtdsGx3+Ue9nJdoVF4H7B3TAiW9+1nisZVk9L/wnwbgBqNEZS/Q/yC
 tvnzDBkVLHLpZsVlgBPW1L5+WiQV0kwmCTER6EOqxu9gHUymeRrOC3n4kVI0nJ9YH5Wi
 OAJOFJBgYnXkQNHIb4aySWJhQwd8zL+FOofbmRVORBFUdAAUAox7YUUli5Lx0GeuVRza
 CI1h2sFewYXJWQ9q1gEJKm3kwpkd0IDZP0YAGrScREw8Dq5mE/JQ9w66bY9Guw5Nt5e4
 dj0g==
X-Gm-Message-State: ANhLgQ07j7YJ1hCc9RalLBTQErRSKxDbjee9ll2JeMj0EzDREgUxXv6D
 ICBPfOfd1nxGbQp2KRiSnrqZ1MMnLFhs9tr1P0i5Kw==
X-Google-Smtp-Source: ADFU+vtnsrY0SvGGuyhyEDxG4HlKNc11UYt2YYt5XneIx9ZfoBUvmFOwrbpnjLWdDdtsGrZaES/vzsQyDppgAcomc0E=
X-Received: by 2002:a4a:e217:: with SMTP id b23mr5959513oot.91.1585246302559; 
 Thu, 26 Mar 2020 11:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200326172457.205493-1-saravanak@google.com>
In-Reply-To: <20200326172457.205493-1-saravanak@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 26 Mar 2020 11:11:06 -0700
Message-ID: <CAGETcx8YWthXcUrs8ii=O_MO8pepjpwcqzCshe0Dd8uhUUL79A@mail.gmail.com>
Subject: Re: [PATCH v2] slimbus: core: Set fwnode for a device when setting
 of_node
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, Android Kernel Team <kernel-team@android.com>,
 John Stultz <john.stultz@linaro.org>, LKML <linux-kernel@vger.kernel.org>
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

On Thu, Mar 26, 2020 at 10:25 AM Saravana Kannan <saravanak@google.com> wrote:
>
> When setting the of_node for a newly created device, also set the
> fwnode. This allows fw_devlink feature to work for slimbus devices.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/slimbus/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
> index 526e3215d8fe..44228a5b246d 100644
> --- a/drivers/slimbus/core.c
> +++ b/drivers/slimbus/core.c
> @@ -163,8 +163,10 @@ static int slim_add_device(struct slim_controller *ctrl,
>         INIT_LIST_HEAD(&sbdev->stream_list);
>         spin_lock_init(&sbdev->stream_list_lock);
>
> -       if (node)
> +       if (node) {
>                 sbdev->dev.of_node = of_node_get(node);
> +               sbdev->dev.fwnode = of_fwnode_handle(node);
> +       }
>
>         dev_set_name(&sbdev->dev, "%x:%x:%x:%x",
>                                   sbdev->e_addr.manf_id,
> --

Hi Srinivas,

Btw, I sent another patch that's on top of this patch.
https://lore.kernel.org/lkml/20200326173457.29233-1-saravanak@google.com/T/#u

That fixes of_node_get() handling. Didn't notice it before I sent this
patch. Otherwise would have made it a series. Sorry about the trouble.

Thanks,
Saravana
