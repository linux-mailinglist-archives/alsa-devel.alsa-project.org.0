Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5C07241C9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 14:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3867B6C0;
	Tue,  6 Jun 2023 14:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3867B6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686053521;
	bh=wytzUZAjqIkqBlTfVLhMKqF6mSNaVJFQIVcUR9DXWTA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mBM8y7jPNByi1yJUnjrzdf/pmWnPK/5+5H17jDGmw0CIYGHK4FqXD+yqE8l6hHZAG
	 ddrh54Ahw8iaL3jcPTYf+4Wg2eB/vIUmJ6gy31/HG/CkszeJpflehIeneLwdjrZdVB
	 UXPempOIusBk0c8wDJqABjy28KKtAR8P+dyRjuwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1B73F804DA; Tue,  6 Jun 2023 14:11:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3C6F8016C;
	Tue,  6 Jun 2023 14:11:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EA30F80199; Tue,  6 Jun 2023 10:27:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15723F800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 10:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15723F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k2tMSad9
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f6ef9a928fso48438585e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 01:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040045; x=1688632045;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7b2+Qyu8EyCwI9uCO/ngkuaBvEJKk44e8Um7k+rss7s=;
        b=k2tMSad9qqiFW32keOEeawcFQxOxvV37k27LBEKsAp7imfK1O8Qnm8orPC98yUD5VM
         RfR0WrQ8xsHGxJ5V61d9ao22YfOai5JpGzL/N0Tq2Z1NP6jJCdGNTIuTI9Dsl1/fAbax
         4c8o/+VDaIvdhT5Plyhog0eDFrqjchm31wyKJDsiuVZ2/KOdLD7f75RxF2gVATKkF8OJ
         YmpmUNd2DgO+SYAuxf4kHJ9htGkJQoNYkh45s2rIVSUFI1DV3D9J4ms+bmCmU7mJO6Cq
         PvIBlY8NpSnY/ELhG0DT/AaKb8iClLB4qdMIEHjUa2+/jCqLdNAIh+rJfVnsmkI85Abq
         F1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040045; x=1688632045;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b2+Qyu8EyCwI9uCO/ngkuaBvEJKk44e8Um7k+rss7s=;
        b=eEVjZmFBcodo3qjbVm9lmmUAlrF2sr9jA/C1vdh9IpZRp69G1Yw7ASKB5runyc9gdG
         Xcq3AXkdfMsxL9FNOrC7P1OaR2Cv2F/xCD8z7unz8DwBZvBvnhOZI++qZJ6SAYvsGIVs
         Rf5ATnLqc5tf0l925Js2VTtpa0VGRgEokAZTcsjyQgKBQ8TvSHwMMFXamZVRLSFk1Mzr
         lROVb+9JnOP82783PRMn5YJDu16rImXqoXoQvnVxk6itMfyWObtHU4nvsWU9Mz5HkeHx
         HpnnJdPvgFUpZZeGWhqyKTcUZ3VqVhnihH75v2k09d0oKoNu23hc0GCe01l/TFlXdUMx
         4PSw==
X-Gm-Message-State: AC+VfDyDjV1L5sUreoVwRPfnDoaChB2C2sdzHb813iYPZrlkO1PRHpSH
	DPOvJ+eo0kQoRg7U6L7mEQnJOQ==
X-Google-Smtp-Source: 
 ACHHUZ4CvGFYjyEXRax13FYIyrxlMq65lsC9dq5BCJonk9sAvqi0+AuQGCJa33m5vL7x5aSXlj379Q==
X-Received: by 2002:a05:600c:3797:b0:3f4:2492:a91f with SMTP id
 o23-20020a05600c379700b003f42492a91fmr1349943wmr.27.1686040045441;
        Tue, 06 Jun 2023 01:27:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c205200b003f427687ba7sm13164440wmg.41.2023.06.06.01.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:27:24 -0700 (PDT)
Date: Tue, 6 Jun 2023 11:27:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: walker.chen@starfivetech.com
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: starfive: Add JH7110 TDM driver
Message-ID: <ZH7t6Nc+NTcGpq/3@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4BRIXU4PW3DJBFE3GKPJ7OHZSLAKUOST
X-Message-ID-Hash: 4BRIXU4PW3DJBFE3GKPJ7OHZSLAKUOST
X-Mailman-Approved-At: Tue, 06 Jun 2023 12:11:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4BRIXU4PW3DJBFE3GKPJ7OHZSLAKUOST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Walker Chen,

The patch fd4762b6b5cf: "ASoC: starfive: Add JH7110 TDM driver" from
May 26, 2023, leads to the following Smatch static checker warning:

	sound/soc/starfive/jh7110_tdm.c:584 jh7110_tdm_clk_reset_get()
	warn: passing zero to 'PTR_ERR'

sound/soc/starfive/jh7110_tdm.c
    564 static int jh7110_tdm_clk_reset_get(struct platform_device *pdev,
    565                                     struct jh7110_tdm_dev *tdm)
    566 {
    567         int ret;
    568 
    569         tdm->clks[0].id = "mclk_inner";
    570         tdm->clks[1].id = "tdm_ahb";
    571         tdm->clks[2].id = "tdm_apb";
    572         tdm->clks[3].id = "tdm_internal";
    573         tdm->clks[4].id = "tdm_ext";
    574         tdm->clks[5].id = "tdm";
    575 
    576         ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(tdm->clks), tdm->clks);
    577         if (ret) {
    578                 dev_err(&pdev->dev, "Failed to get tdm clocks\n");
    579                 return ret;
    580         }
    581 
    582         tdm->resets = devm_reset_control_array_get_exclusive(&pdev->dev);

The devm_reset_control_array_get() function returns NULL if it's
an optional request.  But this is not optional.

    583         if (IS_ERR_OR_NULL(tdm->resets)) {

So that means this should be an if (IS_ERR()) check.

--> 584                 ret = PTR_ERR(tdm->resets);
    585                 dev_err(&pdev->dev, "Failed to get tdm resets");

Or if optional was intended then NULL should not be treated as an error
case, but as a special kind of success case (no error message).  See
my blog for a long form of this information:

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

    586                 return ret;
    587         }
    588 
    589         return 0;
    590 }

regards,
dan carpenter
