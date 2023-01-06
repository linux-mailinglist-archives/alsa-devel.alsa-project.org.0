Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA21865FCC5
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 09:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E4113F5E;
	Fri,  6 Jan 2023 09:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E4113F5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672993900;
	bh=nbunm8mVC6QTvvk6mR+i0EeMrk25uu8XEMaftudElmY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u9O09jNcfZghgx96uDlHmEnuK5leT232/wm7raplqqjt7GNl5L+/knjMap51ddnOM
	 eVMP/p57dZqxA9l13o1tEtMwYdU69yvjP6qmZQijTRrKHdoWsIuDzb7SCcWDrO9jnJ
	 lCvofeWISeDv65xw04XtOpipyykUVgnBl61GuoZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8C1AF8024E;
	Fri,  6 Jan 2023 09:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3856F8024D; Fri,  6 Jan 2023 09:30:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B2FFF8022B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 09:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2FFF8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VPQZX08Q
Received: by mail-wm1-x329.google.com with SMTP id o15so567365wmr.4
 for <alsa-devel@alsa-project.org>; Fri, 06 Jan 2023 00:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5jrLtn8skMYCUXB5w36mPxMFBmvOOBixvoM0MNxf2A=;
 b=VPQZX08QJQA2/rBoVhzNqjs9Q//E7TAtUGS/2sSP0e24M57lKiNkymlTsNnzmZYYF+
 AjN4InbfEfDt3bsnkUBV6weQsvmWq8bF0LL0/UQqFClCFlAu+6w9FhM83X5DjlV3HZLa
 VdtLHQH2Ero13mAUyU8c739+GCwhMrDJUgn98qmGcmWA01YcqV/QNaNG3EWGE5m6Gw3T
 NX7+vrEKYbMkJfOo5zq0EpwEsOwSKYuC4l4XuVLiWjrzTCgmUtDoas5MA+ElYXwtKfRH
 UGMKobEgN5/d/GJzbZ5R5kjxM9Soxsi4t8oipf0aJsR/4jQdbFTFZ7+eSeEfpf1xgfuK
 YIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5jrLtn8skMYCUXB5w36mPxMFBmvOOBixvoM0MNxf2A=;
 b=rxsB9VSVXTZCohIRYyP3j/R2CBh/YrNI1oJ3E97KpmlJYQutu+QS5Nf9cIsZCgDqGU
 NWCTF8DeeqoGUAmZpkTJHioBgmSTDLahtnUC9APCHjcZRcmXgvDj8d/X8jnanmnyc8Qr
 4ko+iMcqRz/EgJ8bdsvlSdisAG1VnWh1sclwsho+aF9D4194uRXV4L5sKknVi9UO38UT
 n6PMgAr0Y5R3bF+4GWuUnrklxfub5fzdmZigkRXEki6DUowxfOAMafs/ewnRe929nQMK
 9m11+J9i/jpb0pKF7HZ357a4/J3oVXxY+M1Yid5+jC94nC2Dks26xX7kpcqpQOoI9LSW
 cnsQ==
X-Gm-Message-State: AFqh2kp4UBEu2one9Yg8rmby0Xu0AQqwK/rXfTx0OgFl3FM+hW3bgdFX
 ztM3m+tj8zI2Ezze/cA61Sog8w==
X-Google-Smtp-Source: AMrXdXth0T1efa07WNTmxF4kDFoDPEKZKZl+aoOg/cdR2N9PPlFzW5PKylKrMGJebkSdtyetneKKoA==
X-Received: by 2002:a05:600c:248:b0:3d3:5d47:271c with SMTP id
 8-20020a05600c024800b003d35d47271cmr37959272wmj.12.1672993831427; 
 Fri, 06 Jan 2023 00:30:31 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a1c7515000000b003d995a704fdsm840230wmc.33.2023.01.06.00.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 00:30:30 -0800 (PST)
Message-ID: <f17c520c-71c2-6b36-bfcf-e817092849f0@linaro.org>
Date: Fri, 6 Jan 2023 09:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V9 5/5] ASoC: dt-bindings: Add schema for "awinic, aw88395"
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, james.schulman@cirrus.com,
 flatmax@flatmax.com, cezary.rojewski@intel.com, povik+lin@cutebit.org,
 yangxiaohua@everest-semi.com, daniel.beer@igorinstitute.com,
 13691752556@139.com, srinivas.kandagatla@linaro.org,
 jonathan.albrieux@gmail.com, steve@sk2.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230106032835.141918-1-wangweidong.a@awinic.com>
 <20230106032835.141918-6-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106032835.141918-6-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: yijiangtao@awinic.com, zhaolei@awinic.com, liweilei@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/01/2023 04:28, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW88395 audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

