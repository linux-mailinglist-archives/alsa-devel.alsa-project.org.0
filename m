Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF895F2153
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Oct 2022 07:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C832908;
	Sun,  2 Oct 2022 07:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C832908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664687122;
	bh=tRS+4rk0neIko6krOBTC/aMuE7VwXHEOPhxjwaHoI7M=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jm6lPcAsC2HZ83LG8wf3zUsrOn+IPdc2VoVDVSX4VNKRPvLeo8MqXsnS9hYMSHHAx
	 1PImdrS4OtmcgIb/KEHnmEQ459NNEl21hOcC0/uBkPPj51okYK3wCQkoIb5jqKmn1p
	 g9MJ/+EcCXG210IwDBOT4X1OVX9kH7qkMZRQM+Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B780BF8013D;
	Sun,  2 Oct 2022 07:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 880BCF800A7; Sun,  2 Oct 2022 07:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32D27F800A7
 for <alsa-devel@alsa-project.org>; Sun,  2 Oct 2022 07:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D27F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="B75SfVi7"
Received: by mail-pl1-x636.google.com with SMTP id h10so4451778plb.2
 for <alsa-devel@alsa-project.org>; Sat, 01 Oct 2022 22:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date; bh=BP98Qhg0Vw2/EI4u+dbuEGMcjtMFTJLF0hbSYcg2sjc=;
 b=B75SfVi7GE1a59BQ19FY8dMR95EdWDvG056LAM3W1v5OsVKTIVeJA708iLDGJszNcl
 nL7kKQVb8B8CGaSKEZS94Ypyt6dGStNMh8/txwNqeuRhQMUeZdU3Lwm7fL3awxWTHCO0
 +GD9inIJRpQ2RHLI14TtVXihGLywdubOSZdaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=BP98Qhg0Vw2/EI4u+dbuEGMcjtMFTJLF0hbSYcg2sjc=;
 b=ddAjhaNaJnKvlGISAkfJAxzKTP7N0OPf3TDSveKHTswuVPhdk1qVjU16C53ajd++rF
 6tgNf0TgbeAGAWjZkj6x7ijexhm2h8N2IAsZB9q8kT7ue6UIMe69TTvAP/ADyxCAmBF2
 sbClaoGrQYjpaX/zQV8bO0VFdaJ85OCfH4oQGiv0fxVKkaXBgJvsVat9g8BcAj+KCXLf
 nHdFZ5KED2jI81wKGqFIl+vk39DtJ5zmWCjv2+ASpNjUUVaZtOA0et/VR47ZF00uY2YI
 trmh/llPQtA7oXw9BYbk0yGLjYWPK8oHyqsYwU82fUExfzJmkBGf6+xXDFP0slGUohwo
 aMjw==
X-Gm-Message-State: ACrzQf2qqo3pATTbtMzRjtNUJTUeU6ih3lQkCXZYdcSUZxo9gcXQfHqK
 Gaf3B/9mZhwkOHDE1VhjgQtHYQ==
X-Google-Smtp-Source: AMsMyM6fKXAMxCLETcr2reyfv3XA8+n9bfpgE+exQbP07iXDVQ553zrPhshj7qa+8b2wTMH36p7m8A==
X-Received: by 2002:a17:902:e5cf:b0:17a:af:d828 with SMTP id
 u15-20020a170902e5cf00b0017a00afd828mr16435963plf.127.1664687058264; 
 Sat, 01 Oct 2022 22:04:18 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.124])
 by smtp.googlemail.com with ESMTPSA id
 k14-20020a6555ce000000b0043057fe66c0sm4330069pgs.48.2022.10.01.22.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Oct 2022 22:04:17 -0700 (PDT)
Message-ID: <a9a94d2d-5379-7e0b-b27c-cad0f569a773@schmorgal.com>
Date: Sat, 1 Oct 2022 22:04:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221001200039.21049-3-doug@schmorgal.com>
 <202210020642.ts8UPw06-lkp@intel.com>
From: Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH 2/2] ASoC: wm8961: add support for devicetree
In-Reply-To: <202210020642.ts8UPw06-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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

On 10/1/2022 3:23 PM, kernel test robot wrote:

>>> sound/soc/codecs/wm8961.c:974:34: warning: 'wm8961_of_match' defined but not used [-Wunused-const-variable=]
>       974 | static const struct of_device_id wm8961_of_match[] = {
>           |                                  ^~~~~~~~~~~~~~~

Oops, nice catch by the kernel test robot. I will submit a V2 patch that
does this part exactly how the wm8960 driver does it, including
.of_match_table in wm8961_i2c_driver. Waiting to see if I get any other
feedback on V1 first.

Thanks,
Doug
