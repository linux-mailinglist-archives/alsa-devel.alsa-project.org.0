Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD228E695
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 20:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9671752;
	Wed, 14 Oct 2020 20:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9671752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602700896;
	bh=ipZ8ZDCyuKASPr8Y4k991jKvFK+t9ZMjAhvXJ7QFPt8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=twciwUbnDzcxBH7dTNMWPBVwmU5lAHL7AyRfy07OPMJ/92zXSyLVVEbuZ9zS7KHTm
	 oyOo3dKWZgxHj5PHX2P1usILsTOfSOU1tDYpqCvjSSiPjN9J2B/kvUhvl3VmGBviK/
	 LixBjNsyvZYyOYoiX97DqEeJUYMnRT/eoRGCYmWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC49F8021D;
	Wed, 14 Oct 2020 20:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB6BBF80217; Wed, 14 Oct 2020 20:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B64BF8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 20:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B64BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rxenAejX"
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A12FD22247
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 18:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602700778;
 bh=ipZ8ZDCyuKASPr8Y4k991jKvFK+t9ZMjAhvXJ7QFPt8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rxenAejXqVTbRUS0ad30QBTTnS//uIpVDQvT5jwUH4g4O+e9BohkMoktK8xrNZXLd
 Xu3l4UCCpJPqJ16uluOYzLJEdeutMpL8DUfK/2Tx9yV1byeiRumDTQFlXtrz9mZifq
 fXtZxNU787ETEmh2y6hSw10wlTWHGAF2+VMW0yQ8=
Received: by mail-oi1-f173.google.com with SMTP id c13so236538oiy.6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 11:39:38 -0700 (PDT)
X-Gm-Message-State: AOAM53253ad618GNfLQqUhISchAKewPKD2++i1qqm//iur2IWCTlEMzi
 gfxek/l11tUAfakpz41SgbcTNp3ZDFdLZ3YoXg==
X-Google-Smtp-Source: ABdhPJwtxhFlBxtHfSQbYp/Zz1Fzpq1G/aOTdazdjlGlk6mXcM3ifdAV2tLiIw43JP9g0OxQFq3WXRMjzUzheD3HrX8=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr459940oiy.106.1602700777799;
 Wed, 14 Oct 2020 11:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014145418.31838-2-rf@opensource.cirrus.com>
In-Reply-To: <20201014145418.31838-2-rf@opensource.cirrus.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 14 Oct 2020 13:39:26 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+qdcHc9H7qUVwLieHrLM8E20HZXa8DkarMiuXfCh8WOQ@mail.gmail.com>
Message-ID: <CAL_Jsq+qdcHc9H7qUVwLieHrLM8E20HZXa8DkarMiuXfCh8WOQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] of: base: Add of_count_phandle_with_fixed_args()
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 - <patches@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
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

On Wed, Oct 14, 2020 at 9:54 AM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
>
> Add an equivalent of of_count_phandle_with_args() for fixed argument
> sets, to pair with of_parse_phandle_with_fixed_args().
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  drivers/of/base.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  9 +++++++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ea44fea99813..45d8b0e65345 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1772,6 +1772,48 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
>  }
>  EXPORT_SYMBOL(of_count_phandle_with_args);
>
> +/**
> + * of_count_phandle_with_fixed_args() - Find the number of phandles references in a property
> + * @np:                pointer to a device tree node containing a list
> + * @list_name: property name that contains a list
> + * @cell_count: number of argument cells following the phandle
> + *
> + * Returns the number of phandle + argument tuples within a property. It
> + * is a typical pattern to encode a list of phandle and variable
> + * arguments into a single property.
> + */
> +int of_count_phandle_with_fixed_args(const struct device_node *np,
> +                                    const char *list_name,
> +                                    int cells_count)
> +{

Looks to me like you can refactor of_count_phandle_with_args to handle
both case and then make this and of_count_phandle_with_args simple
wrapper functions.

> +       struct of_phandle_iterator it;
> +       int rc, cur_index = 0;
> +
> +       if (!cells_count) {
> +               const __be32 *list;
> +               int size;
> +
> +               list = of_get_property(np, list_name, &size);
> +               if (!list)
> +                       return -ENOENT;
> +
> +               return size / sizeof(*list);
> +       }
> +
> +       rc = of_phandle_iterator_init(&it, np, list_name, NULL, cells_count);
> +       if (rc)
> +               return rc;
> +
> +       while ((rc = of_phandle_iterator_next(&it)) == 0)
> +               cur_index += 1;
> +
> +       if (rc != -ENOENT)
> +               return rc;
> +
> +       return cur_index;
> +}
> +EXPORT_SYMBOL(of_count_phandle_with_fixed_args);
> +
>  /**
>   * __of_add_property - Add a property to a node without lock operations
>   */
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 5cf7ae0465d1..9f315da4e9da 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -377,6 +377,8 @@ extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
>         struct of_phandle_args *out_args);
>  extern int of_count_phandle_with_args(const struct device_node *np,
>         const char *list_name, const char *cells_name);
> +extern int of_count_phandle_with_fixed_args(const struct device_node *np,
> +       const char *list_name, int cells_count);
>
>  /* phandle iterator functions */
>  extern int of_phandle_iterator_init(struct of_phandle_iterator *it,
> @@ -886,6 +888,13 @@ static inline int of_count_phandle_with_args(struct device_node *np,
>         return -ENOSYS;
>  }
>
> +static inline int of_count_phandle_with_fixed_args(const struct device_node *np,
> +                                                  const char *list_name,
> +                                                  int cells_count)
> +{
> +       return -ENOSYS;
> +}
> +
>  static inline int of_phandle_iterator_init(struct of_phandle_iterator *it,
>                                            const struct device_node *np,
>                                            const char *list_name,
> --
> 2.20.1
>
