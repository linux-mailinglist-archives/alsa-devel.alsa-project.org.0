Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391B6559E5
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Dec 2022 12:14:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998A4AF13;
	Sat, 24 Dec 2022 12:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998A4AF13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671880459;
	bh=x15eW8Kqkn0Sx4bZsjjuZlGP4d1pRHQJ3zGbAhZL4NU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IkI6oLvgOZYze2nKvo0cDBTKR2u9lbV84UfGOQSbXaN6usdqwDKye/k5zsBCo+II8
	 +DjVvnfHhxiFCL2GfVNI0LeGp33MVC49sT1fLWm1oqnWlDAkw39eAeGRNCgiNZ9uxK
	 Q7ZA6H5oKxj/e5KMobHgSXxZr9QXhsKpUwovu39k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B6DDF80249;
	Sat, 24 Dec 2022 12:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930BAF8027C; Sat, 24 Dec 2022 12:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CE2EF802E0
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 12:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CE2EF802E0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h9NJv1kP
Received: by mail-yb1-xb2d.google.com with SMTP id n78so7569429yba.12
 for <alsa-devel@alsa-project.org>; Sat, 24 Dec 2022 03:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+T3Wi0FxR+aQY00oUGjtUElYaHTEjFLNV0YO6IaCnFM=;
 b=h9NJv1kP89kJ0GRcE9rjnc9YCWp4VMHvr8ipvZd7g47/fBlTBStvfj/laeLc8/ZWsD
 V6IcD9VA8qRhL8mwoqQFlpnQhyQOCp9+Ws/f3jdZ7EBR5d9sgBPouZdU2KD3q21J+0Ae
 6HlcYgtwZ2/C6xwPx0oxIwZBOEpIzx/BoHBHi4gGWiBHsrTZNCPFZX0CVmHLdjni4zOv
 9S6Yo1COwWNOdWNDzkk2x7pzyhodJw3hQ16bGBrlDncDmJTzpU0C8cVxWqR7Jylxy2Aw
 MkQL35cKpcdk3hkQUBrQafmtADcPfeiUWQFqYOFB2We6o9Ip3h8DaryqoqP075yi1+AZ
 f+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+T3Wi0FxR+aQY00oUGjtUElYaHTEjFLNV0YO6IaCnFM=;
 b=FPSUN1E9tM6wgd8cY5tK17B8oaOn6siz4DyBoO5c3mEAP4XBJWObPYB2Ug5++voo+K
 ga2oDJ6YygA0ay4dYoWSjQkEF4ZqLCJbJ0Er/r4CCjiSnOiLt6AIGXGt7k2viycIfdnr
 VWvX1AaO8ZYp4v140MNYEDktSonB8VfXUQFB7mEEEjpyAkbE5CBLX18iSeEZMG+mumNC
 XS7m1zvL3I/iyba+wSf39HR/WNtVkF4HQiC9274nrP34ItSK2Wlgi4JzNSVOKbPTe2PJ
 nEQoSlKsUnEPrEDRCL9HXZnLn2QEVzG6L5g/0LE305inCYXUm9DjlAfHk5LZJWKjg2Ps
 RYQw==
X-Gm-Message-State: AFqh2koULCInVu1Z7U0HvRft8e3Qw/nXmS3HdrZGjeM8/gfXkh3dOJSW
 ZoxaXuz7YXSVsmBzwsX9kwIfIs6PgqIDnffuHrHXNA==
X-Google-Smtp-Source: AMrXdXsdBrBzp3zIBNfzByhXKd6O3hYee5f3EPjHDp6AKPkLSeGQkpzTN0Cw8ffKmOR7kJb9uytDzpFHXF6QEkIqiDA=
X-Received: by 2002:a25:aa0d:0:b0:76d:bea0:8a05 with SMTP id
 s13-20020a25aa0d000000b0076dbea08a05mr391174ybi.153.1671880401925; Sat, 24
 Dec 2022 03:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-9-quic_wcheng@quicinc.com>
In-Reply-To: <20221223233200.26089-9-quic_wcheng@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 24 Dec 2022 13:13:11 +0200
Message-ID: <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
Subject: Re: [RFC PATCH 08/14] usb: dwc3: Add DT parameter to specify maximum
 number of interrupters
To: Wesley Cheng <quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 24 Dec 2022 at 01:33, Wesley Cheng <quic_wcheng@quicinc.com> wrote:
>
> Allow for the DWC3 host driver to pass along a XHCI property that defines
> how many interrupters to allocate.  This is in relation for the number of
> event rings that can be potentially used by other processors within the
> system.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>  drivers/usb/dwc3/core.h |  2 ++
>  drivers/usb/dwc3/host.c |  5 ++++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 476b63618511..67d6f0ae81d2 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1446,6 +1446,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         u8                      tx_thr_num_pkt_prd = 0;
>         u8                      tx_max_burst_prd = 0;
>         u8                      tx_fifo_resize_max_num;
> +       u8                      num_hc_interrupters;
>         const char              *usb_psy_name;
>         int                     ret;
>
> @@ -1468,6 +1469,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>          */
>         tx_fifo_resize_max_num = 6;
>
> +       /* default to a single XHCI interrupter */
> +       num_hc_interrupters = 1;
> +
>         dwc->maximum_speed = usb_get_maximum_speed(dev);
>         dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>         dwc->dr_mode = usb_get_dr_mode(dev);
> @@ -1511,6 +1515,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>                                 &tx_thr_num_pkt_prd);
>         device_property_read_u8(dev, "snps,tx-max-burst-prd",
>                                 &tx_max_burst_prd);
> +       device_property_read_u8(dev, "snps,num-hc-interrupters",
> +                               &num_hc_interrupters);

bindings change?

> +       /* DWC3 core allowed to have a max of 8 interrupters */
> +       if (num_hc_interrupters > 8)
> +               num_hc_interrupters = 8;
> +
>         dwc->do_fifo_resize = device_property_read_bool(dev,
>                                                         "tx-fifo-resize");
>         if (dwc->do_fifo_resize)
> @@ -1589,6 +1599,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         dwc->imod_interval = 0;
>
>         dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
> +
> +       dwc->num_hc_interrupters = num_hc_interrupters;
>  }
>
>  /* check whether the core supports IMOD */
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 8f9959ba9fd4..09037299da53 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1050,6 +1050,7 @@ struct dwc3_scratchpad_array {
>   * @tx_max_burst_prd: max periodic ESS transmit burst size
>   * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
>   * @clear_stall_protocol: endpoint number that requires a delayed status phase
> + * @num_hc_interrupters: number of host controller interrupters
>   * @hsphy_interface: "utmi" or "ulpi"
>   * @connected: true when we're connected to a host, false otherwise
>   * @softconnect: true when gadget connect is called, false when disconnect runs
> @@ -1275,6 +1276,7 @@ struct dwc3 {
>         u8                      tx_max_burst_prd;
>         u8                      tx_fifo_resize_max_num;
>         u8                      clear_stall_protocol;
> +       u8                      num_hc_interrupters;
>
>         const char              *hsphy_interface;
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index f6f13e7f1ba1..52a284fdd704 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -66,7 +66,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
> -       struct property_entry   props[4];
> +       struct property_entry   props[5];
>         struct platform_device  *xhci;
>         int                     ret, irq;
>         int                     prop_idx = 0;
> @@ -112,6 +112,9 @@ int dwc3_host_init(struct dwc3 *dwc)
>         if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
>                 props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
>
> +       props[prop_idx++] = PROPERTY_ENTRY_U8("num-hc-interrupters",
> +                                                               dwc->num_hc_interrupters);
> +
>         if (prop_idx) {
>                 ret = device_create_managed_software_node(&xhci->dev, props, NULL);
>                 if (ret) {



-- 
With best wishes
Dmitry
