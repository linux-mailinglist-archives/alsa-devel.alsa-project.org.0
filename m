Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7B53F5E8
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 08:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D77D1A23;
	Tue,  7 Jun 2022 08:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D77D1A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654582335;
	bh=cy9uNWbGfNysOs2/FNu/nH6hUhE88r4XdswXzNOMvlU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ub0NGQJWlo0vcWtlL/DtiWqMkc+6+gyaAn7l1yUqF4JLcL3A0A9A+pYsBwLJsZlSN
	 F6wZDUELFZBfmWlJIcTzOyVvMoGrHkh2myKLMSbIK25L7+Tafzs5XQNFgQ8ZWTLGh/
	 EFBl26WiA1lyNcGpSt4XspuHkDvJOmAKGVZhpf0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F97F80526;
	Tue,  7 Jun 2022 08:10:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83C9FF801D8; Mon,  6 Jun 2022 19:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4CC2F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 19:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4CC2F80116
Received: by mail-il1-f173.google.com with SMTP id h7so4817993ila.10
 for <alsa-devel@alsa-project.org>; Mon, 06 Jun 2022 10:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HOgnxEn2ntmtyghL8kOb8yKeTcYGElnyCDEZZ25iRQw=;
 b=mINX7BxAQ4NmgZhcnOzc+0CAhholviLpa2ONBpIjrGhXdiulZOCA4JC24DeWa7AMmI
 RjeWrpf3p/sJ8d9TwEet197+mRkr0ADbqxDrmi4oPgY2R/2Uev5zI8rTPKXuRreLSSU3
 XqMEplxm1BSv+kinSkM6TxfaXqW2HXnE4RTaOY7IQyLepDDTr0xBb2AZvyxGdFyQ3uM4
 Jcwp6Gv6fWjShTO2SKZXdP2qFFc82su5hPJBpgNPOX5ImQK6mC/ZzAQQFMXFcO9klR/V
 3WydHToDD4gD2cQt5dgl5+Z9awa9SpvuvEYJpT7Lsku5vHJ9CoX4UqA4A1SRzuxKXd7u
 oFrA==
X-Gm-Message-State: AOAM5306Yqby30ySfxhumOsQPxtQYIAVyNSDoBfyfjjs03wUKfJtxz3H
 mu/HWZZUfXB7/lXO8yl+1Q==
X-Google-Smtp-Source: ABdhPJxXRz8rpxHVMQETrBoM9cb8XJJozkw5PJACTm4qK/vhBn8tviwY3PyY58j2eoaPB/u3qpK33w==
X-Received: by 2002:a05:6e02:184f:b0:2d3:d0c2:d56a with SMTP id
 b15-20020a056e02184f00b002d3d0c2d56amr13953839ilv.174.1654535872910; 
 Mon, 06 Jun 2022 10:17:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a92c0d1000000b002d3da8e4af5sm6121750ilf.23.2022.06.06.10.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 10:17:52 -0700 (PDT)
Received: (nullmailer pid 911134 invoked by uid 1000);
 Mon, 06 Jun 2022 17:17:47 -0000
Date: Mon, 6 Jun 2022 12:17:47 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 00/23] Update Documentation/ cross-references
Message-ID: <20220606171747.GB899329-robh@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1654529011.git.mchehab@kernel.org>
X-Mailman-Approved-At: Tue, 07 Jun 2022 08:10:18 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, x86@kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, alsa-devel@alsa-project.org,
 keyrings@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-phy@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Markus Mayer <mmayer@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-cachefs@redhat.com,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
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

On Mon, Jun 06, 2022 at 04:25:22PM +0100, Mauro Carvalho Chehab wrote:
> Hi John,
> 
> There were a number of DT binding conversions and other docs change that
> were not updated. Address them, in order to keep the cross-references on
> a sane state.
> 
> Patch series is against v5.19-rc1 (and applies cleanly on the top of
> today's -next).
> 
> Mauro Carvalho Chehab (23):
>   dt-bindings: mfd: bd9571mwv: update rohm,bd9571mwv.yaml reference
>   dt-bindings: interrupt-controller: update brcm,l2-intc.yaml reference
>   dt-bindings: arm: update vexpress-config.yaml references
>   dt-bindings: reset: update st,stih407-powerdown.yaml references
>   dt-bindings: mfd: rk808: update rockchip,rk808.yaml reference
>   dt-bindings: mmc: exynos-dw-mshc: update samsung,pinctrl.yaml
>     reference
>   docs: netdev: update maintainer-netdev.rst reference
>   docs: filesystems: update netfs-api.rst reference
>   Documentation: update watch_queue.rst references
>   Documentation: KVM: update s390-pv.rst reference
>   Documentation: KVM: update amd-memory-encryption.rst references
>   Documentation: KVM: update msr.rst reference
>   Documentation: KVM: update s390-diag.rst reference
>   MAINTAINERS: update arm,hdlcd.yaml reference
>   MAINTAINERS: update arm,komeda.yaml reference
>   MAINTAINERS: update arm,malidp.yaml reference
>   MAINTAINERS: update cortina,gemini-ethernet.yaml reference
>   MAINTAINERS: update dongwoon,dw9807-vcm.yaml reference
>   MAINTAINERS: update maxim,max77693.yaml reference
>   MAINTAINERS: update snps,axs10x-reset.yaml reference
>   objtool: update objtool.txt references
>   ASoC: wm8731: update wlf,wm8731.yaml reference
>   arch: m68k: q40: README: drop references to IDE driver

Applied patches 1-5,17,18,20
