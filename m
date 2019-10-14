Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60806D6868
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 19:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C73301616;
	Mon, 14 Oct 2019 19:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C73301616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571073915;
	bh=KdA9YAar9+aQRR9OJXIy4d45nJPEdTprPhLH31xZv7Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkDDHW5Fz+WTuEmchA6wpnG7iimsP4OEdbaqoMDH/hXqM4545W8hb1U4sihYIEjeu
	 MWarGnhZJq+3KKbwYBsiscmUcgUG/qiEuL/NmQymICnFBquHuHny60Ogjzy3tYrRoF
	 3nK9mW5gG0eo8rK3tVCM6HGyhiep3lBLwAiN8pAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F7BF80322;
	Mon, 14 Oct 2019 19:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6A08F80362; Mon, 14 Oct 2019 19:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59AAFF8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 19:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59AAFF8011D
Received: by mail-oi1-f196.google.com with SMTP id i185so14359199oif.9
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 10:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qJCcCwWiFIxJcw2Jdg9V+O1M8ZjIoFh7ZOsXdBxCzq0=;
 b=WxL2YW5/StxbXZsIyzAhw7SBRz1VK7Syx0itA+JwUtio8VOzNBcoeTZDaHcWeMvgJg
 SVOV8RwOHLab2TWgiEnNg/8dGjvjosa/qIzbrPyV5p4tKWWuPJZVz0kPUoVMS1Uhca9u
 Zu+GenwWpUoCHWZliTG5hCghvZfLWBS26ZcB7YqnkEXw4RCIBloZw25J8cO4Or8E8DJn
 1+UY8O8jnZR5SjISATYlFR0eRoKv2V86WZkCYJaTnm+WbcYfRRpx7kWDeM1GuhmwH4Yd
 MqVi2rBberbBir2F2WC7y2IYUYJ3ZTCJKQQkivFuh+/oUPkxDBYrpNKMwgf+7jImJG8d
 fTiA==
X-Gm-Message-State: APjAAAXeON1zPnMPtZDm0H8dsCCOVb+Tko0qq8I7/QdwFn9MNHdb1Vfp
 XHvr0RReKqeAnxXILhQdBQ==
X-Google-Smtp-Source: APXvYqyl8C+G6gF0tXpJKNiR3JY4RW32++v32wyk+wIsOY3IBCJi6VPS3rnrwjCHvo8VjvycF/inUQ==
X-Received: by 2002:aca:36d5:: with SMTP id d204mr24591658oia.51.1571073804360; 
 Mon, 14 Oct 2019 10:23:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 21sm5229311oin.26.2019.10.14.10.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 10:23:23 -0700 (PDT)
Date: Mon, 14 Oct 2019 12:23:22 -0500
From: Rob Herring <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191014172322.GA16336@bogus>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014180059.06.I0df85fe54162426e31f60a589d9b461c65df2faa@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 tzungbi@google.com, broonie@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 06/10] ASoC: dt-bindings: cros_ec_codec:
 add SHM bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 14 Oct 2019 18:20:18 +0800, Tzung-Bi Shih wrote:
> - Add "reg" for binding to shared memory exposed by EC.
> - Add "memory-region" for binding to memory region shared by AP.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  .../bindings/sound/google,cros-ec-codec.txt   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
