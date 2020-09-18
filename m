Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A34270330
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 19:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8EBC16BC;
	Fri, 18 Sep 2020 19:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8EBC16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600449910;
	bh=/38sCnnGHcfMZ3Sjv2gPt67SF3hZdmylDOkWmbxNVvM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vo+oqXPP/RFnSQppGgG2PWC+hXmI57LHaOl6PHd8RTC0Xr8HCSAdAhyMaJfXCMQ8d
	 GfbrQTT8Fzophuvf94AIWzXq05dC6WPhU0+IOZkNYTKl+vNTx7Hw0XZ00v/4yCrCHj
	 Qew9D/M0uIqIefHXQYSykeIuaYyK6vUWuL0T7YHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF672F8013A;
	Fri, 18 Sep 2020 19:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72677F8015A; Fri, 18 Sep 2020 19:23:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57CD5F8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 19:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57CD5F8013A
Received: by mail-io1-f67.google.com with SMTP id v8so889527iom.6
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 10:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=saPAo/gkpaoA/GYSZXQC6We2mkx7qeNuAH87yYUAsJQ=;
 b=WH+A1GKEYpG/IhwRxvispbltzzKPFh5793zDwtmkpEWKPFIvatkWvVE9QqUGBUS+QU
 tKlg3sucoqM9ahQttEATI73qP6Tlng8jrifh0o2Y1VDkJKYv0QgbtHNiNqHZ0YqemHkZ
 voglCwv+VkkatieU8tsXrVb0hAMTHZiAZMxGWdQPG8NMqvOa4O1XVysFm2S/0J6ZZk+0
 cW78XpRTmojXVVjiXBnXocSC6P0ikXF1NaKnt+9nbSICfMjRhomAZdvqtw75UYdA486b
 jVg5JwOX8PpaWLTQfSe1zo+tupBqlGlhAlTU+CWWeqyP9Ixwn5841AN+qTnbSDJMfOU7
 CKPQ==
X-Gm-Message-State: AOAM5323vLSikHzkQa75Ri/CdXdofrG2ekD0G5crrjdaOGiJwHRLa7zY
 gIckyD2kWLw8Jj+VcZi9tg==
X-Google-Smtp-Source: ABdhPJyQ+DL7qDKH3YsIUl8R6ZI+YVf+VlM/80iVcWJIL+opE0hCMTL+s+EECMXJ3hDnBHuyiPrigA==
X-Received: by 2002:a02:7fcf:: with SMTP id r198mr30732372jac.24.1600449796568; 
 Fri, 18 Sep 2020 10:23:16 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z26sm1983844ilf.60.2020.09.18.10.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 10:23:15 -0700 (PDT)
Received: (nullmailer pid 3819029 invoked by uid 1000);
 Fri, 18 Sep 2020 17:23:13 -0000
Date: Fri, 18 Sep 2020 11:23:13 -0600
From: Rob Herring <robh@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Message-ID: <20200918172313.GA3818893@bogus>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600247876-8013-3-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600247876-8013-3-git-send-email-viorel.suman@oss.nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Fabio Estevam <festevam@gmail.com>
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

On Wed, 16 Sep 2020 12:17:56 +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml        | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/sound/fsl,xcvr.example.dts:29.30-31 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/fsl,xcvr.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1365072

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

