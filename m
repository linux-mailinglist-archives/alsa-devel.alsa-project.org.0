Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49D380D8A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 17:44:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23A911775;
	Fri, 14 May 2021 17:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23A911775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621007047;
	bh=sFP73HpIZ6JrsxJtxDv9NrbEzJPW2QZOr8nDVJ/p4aw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3AqHinekYb1s23c9Qam+uj/h5XGmRqrqOpj6IVWRr/ua+qbwtqSlyq1LQNX2sq/w
	 cGulK/x87fFDC0GxXgAPag1YIPkOscMiEd4E0RR9tgNqq+OsDqGkm5leKmCf7y6yeg
	 GTIyzEDZJ09Ej5Wv8cwvGsxaUNSi+IJ2ltZwTiqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE432F804DA;
	Fri, 14 May 2021 17:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE12F80240; Fri, 14 May 2021 13:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E05CFF800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 13:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E05CFF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sDX/4vOZ"
Received: by mail-wm1-x32e.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso1247428wmj.2
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DnsDrIqkWnYf7da8HpIWFBQQt2XImu+6ZyHWBvjrfcE=;
 b=sDX/4vOZ59ic93Kj1k7EQHH5H75TwRxFQdfU97NsB2/Y+xVttZgCu6VcmdiZBbTXV4
 Yd9dS94Y1asR2VIYZN7NEerfwgmtEUFK3NZSUIzeY6J/4AmyVofgnwxiuO5puvulkCHX
 zAH+iCNJUU2yLFhQkplxklOlcyZUbrmQbTIThNq4BukYbZy9X610Bla24hpoPnMCKKtF
 HaX7GWwtAjZyjiNuvWcCoIBPkXTf9xY5aCFfjMGcrbRCdRoMLY/c+VX1+t1XGHSYNqtQ
 /vEAS8jymBn+QTD3oR/5dtU3nH62pPJpzKh6iPn38AjBb8Fr8EpkCArPsjTRrMSNZ8n3
 9CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DnsDrIqkWnYf7da8HpIWFBQQt2XImu+6ZyHWBvjrfcE=;
 b=AEUbdlYZ/5ojEgDmeCl4s+vy/GPeP1U4toKpT4OSMmObh0yaMv9d8znmCaL+iQi3F+
 njCaEX/SWK/GuqgQPRSlkBm0a6ZI8GZ+EWeI+5RyO+ITUE+6nsshjZQ+XNV/mDWDUqSa
 YnJwEP4s3BHI1HljHrYoWyGGVoIiTa3O1AMWJYRrn3wG6/HFbeXsUR2BwJ8jEQQ+8ddc
 FQ8ruo8vEWRcDp1Va9T76VUX5VMB6c6TZrks1JLRtaSXMWKp0e8nb16vrm/bI/pm9/Y3
 QpOyvqtpS0xil4X19hr8KeW9HjTrFJEQ2YS/fv8jTwv8TXB93Fwkjr05yvHqdNmFT9j7
 ySCA==
X-Gm-Message-State: AOAM531tL5ghAi6djaSJsO/LadLhzBM3gX1PbnmYHWM7mfjQfA6K86Kn
 +x3oKk9iyttQEeFALiUtt9Q=
X-Google-Smtp-Source: ABdhPJwViz0BDPUuVH349RqXP0p4zCVFhrVjXNorTYnm55dAjMiaqH0FajvtM+sJwCYcinjBh5k1qQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr21007074wmb.113.1620990517974; 
 Fri, 14 May 2021 04:08:37 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id b10sm7116349wrr.27.2021.05.14.04.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 04:08:37 -0700 (PDT)
Subject: Re: [PATCH v2 00/40] Use ASCII subset instead of UTF-8 alternate
 symbols
To: David Woodhouse <dwmw2@infradead.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
 <d2fed242fbe200706b8d23a53512f0311d900297.camel@infradead.org>
 <20210514102118.1b71bec3@coco.lan>
 <61c286b7afd6c4acf71418feee4eecca2e6c80c8.camel@infradead.org>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <8b8bc929-2f07-049d-f24c-cb1f1d85bbaa@gmail.com>
Date: Fri, 14 May 2021 12:08:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <61c286b7afd6c4acf71418feee4eecca2e6c80c8.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 May 2021 17:39:48 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 keyrings@vger.kernel.org, linux-sgx@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 linux-acpi@vger.kernel.org, Mali DP Maintainers <malidp@foss.arm.com>,
 linux-input@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
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

> On Fri, 2021-05-14 at 10:21 +0200, Mauro Carvalho Chehab wrote:
>> I do use a lot of UTF-8 here, as I type texts in Portuguese, but I rely
>> on the US-intl keyboard settings, that allow me to type as "'a" for á.
>> However, there's no shortcut for non-Latin UTF-codes, as far as I know.
>>
>> So, if would need to type a curly comma on the text editors I normally 
>> use for development (vim, nano, kate), I would need to cut-and-paste
>> it from somewhere

For anyone who doesn't know about it: X has this wonderful thing called
 the Compose key[1].  For instance, type ⎄--- to get —, or ⎄<" for “.
Much more mnemonic than Unicode codepoints; and you can extend it with
 user-defined sequences in your ~/.XCompose file.
(I assume Wayland supports all this too, but don't know the details.)

On 14/05/2021 10:06, David Woodhouse wrote:
> Again, if you want to make specific fixes like removing non-breaking
> spaces and byte order marks, with specific reasons, then those make
> sense. But it's got very little to do with UTF-8 and how easy it is to
> type them. And the excuse you've put in the commit comment for your
> patches is utterly bogus.

+1

-ed

[1] https://en.wikipedia.org/wiki/Compose_key
