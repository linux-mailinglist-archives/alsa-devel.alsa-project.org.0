Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C520991AAC3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 17:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0190F1945;
	Thu, 27 Jun 2024 17:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0190F1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719501140;
	bh=pDBuML2E1f5ix9l+LrF/TBBSl3qcVEyxGqQ4XE4J3dA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a3q8E5N1jk2r4ylY7tAzonsnSmWFzQLg9cF2/3LMDPa6k15oTPmq7Q9tLJ+u6TsiT
	 hKx2QNHSiFLs0n1/eUDJs7ZJ+IzMMYjSZv5KT5HoE/DZBd+wZ1ZXd0y2QPf6uJppRq
	 c5rlZrgjBdo4lDyGwPy9Jd9CQ4I2VDLNw+HGB4SU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F89F80588; Thu, 27 Jun 2024 17:11:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBBE2F805A8;
	Thu, 27 Jun 2024 17:11:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09B3EF80423; Thu, 27 Jun 2024 17:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0D1DF8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 17:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0D1DF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VyWHHClM
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-63bce128c70so15721907b3.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 08:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501100; x=1720105900;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eKrz5JnDYe7CFRd5tpf8rGwprLDwDWvC7s8h12MoL2Q=;
        b=VyWHHClMo1zZvsaoo665hATHRNsmH42tL+JBrmJo/sbBxHfdUtuI9tbCNGVqCpmcno
         9Nq296amowsVhPOQHIZYb37PF3eMvXHWOQxhoTxDb99e/PSCiy4ewBt47kW6A2QoMV2o
         cktkdu21hrRo5MXocNSk2V1ocHpdtMMXy0VbrQuvfb5ZXF8hChYu4b7vWv0W8F2VWkKC
         0XPm+Y4xkhtXzGjSKQA3LBqXRKtHfA3xhEjsDgrioc3kou6YB8QYuh9GlKaoVARZSQ5s
         7xw/gzSJLj4FDwemYwJUre6b644iRjmK/fEgh1yH79bGGY4Sgll/eqtW9oPBi3ItYfMU
         k07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501100; x=1720105900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKrz5JnDYe7CFRd5tpf8rGwprLDwDWvC7s8h12MoL2Q=;
        b=Owt4QZ+qWPebtp5sLJYYt+nPON/tKb8RZCCBw6wJNEtOLw5ef/BEHP1AovYZmzOP9o
         T3JXJB4ymejol11Uj/AcMp6hnnj+YTx2yFeYMgHwRxtaOn6fhHGm3jFez+UGij//FPWI
         RK1+VMU+rBue9m6Nr3FdpqscBqOkTpzaKaHZHL7CMh8KdeLSuXQK3VIPXxuvMLN1B/dd
         cVV6j0wCEMaP+k6lUxN1X2AL32GuCwAvC0fRwbq2LU0SrB6Zjbmm6drovq8fSTobNUe4
         gPdqvBrZYiPwRo5UEQepvYNkdzUViaQUjR3mxrLYbU6bI1Nr0/450ynfXAk5a4tyf0JV
         nPmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+b75Q/9cI/24fjOnnHl0mJfRIGHrH3fF6dj45tr+uuOSSPTKCa9fvaiXJvHgAW7zZ4XWMOmhap1hw62EuN0uSuCPACUb6zWmtPZY=
X-Gm-Message-State: AOJu0YxgCs5v3isvrQkP3pJQRGobx5PTW2N6IG8XLWKwZ0B8YrTEc1Fz
	amo6sc7T4tpBacAm9WTC6M/Byujn/7M0oP63QS5I7J9M/DQ5aIG4EwwpI8SthvMWA2VldioI4jP
	E4XyjNiW+Opp5s1lrBIV6YUVSLdodEGyZ5Neo3g==
X-Google-Smtp-Source: 
 AGHT+IF+4VnbD/5IKiEA7MzcB8Bhjepz8rzkvxe5mUJa9AmOxnk+Npwkq8GtkrvrJQZDda9LBk+CGA0iDZFfuAQ/anw=
X-Received: by 2002:a05:690c:1c:b0:62f:aa9a:93c6 with SMTP id
 00721157ae682-649a05ce6e6mr13057017b3.8.1719501099578; Thu, 27 Jun 2024
 08:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
 <tlaykv4bx6uizimz3jnprevwbuvygitvacbbdixzrwq4llaz6e@6qpswvidl4iq>
 <da3e3b46-d8fd-4938-baa3-a7f95ec19d95@linaro.org>
In-Reply-To: <da3e3b46-d8fd-4938-baa3-a7f95ec19d95@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 18:11:28 +0300
Message-ID: 
 <CAA8EJprK8scCfCkZTi1auK16SYM_Y-JntuijYyjkYd5LZYbAXg@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: JIULBPKW4DT326RBULZS7PFVUUQW6R6U
X-Message-ID-Hash: JIULBPKW4DT326RBULZS7PFVUUQW6R6U
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIULBPKW4DT326RBULZS7PFVUUQW6R6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 at 17:34, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 27/06/2024 14:38, Dmitry Baryshkov wrote:
> > On Thu, Jun 27, 2024 at 12:55:20PM GMT, Srinivas Kandagatla wrote:
> >> Add support to parse static master port map information from device tree.
> >> This is required for correct port mapping between soundwire device and
> >> master ports.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> ---
> >>   sound/soc/codecs/wsa884x.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> >> index a9767ef0e39d..72ff71bfb827 100644
> >> --- a/sound/soc/codecs/wsa884x.c
> >> +++ b/sound/soc/codecs/wsa884x.c
> >> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
> >>      wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
> >>      wsa884x->sconfig.type = SDW_STREAM_PDM;
> >>
> >> +    /**
> >> +     * Port map index starts with 0, however the data port for this codec
> >> +     * are from index 1
> >> +     */
> >> +    if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> >> +                                    WSA884X_MAX_SWR_PORTS))
> >> +            dev_info(dev, "Static Port mapping not specified\n");
> >
> > Same comment. Either dev_warn (if it's something to warn about) or
> > dev_info.
> >
> > Or, as your commit message mentions that it is required, it should be an
> > error if the port mapping is not specified.
>
> This is an optional property for older SoCs which have 1:1 port map
> between device and master.

Then the commit message is inaccurate. Could you please fix it?

>
>
> --srini
> >
> >> +
> >>      pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
> >>      pdev->prop.simple_clk_stop_capable = true;
> >>      pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> >>
> >> --
> >> 2.25.1
> >>
> >



-- 
With best wishes
Dmitry
