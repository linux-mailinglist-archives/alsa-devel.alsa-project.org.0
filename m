Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA81966B1C8
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 16:03:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93EB5228;
	Sun, 15 Jan 2023 16:02:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93EB5228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673794979;
	bh=sEDUKFkRL2BNAsh7WyQAagCnUcJwIQeX5GHXFx+Fpts=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EzHolCRiKXahO1Cm1oZGmqrWJJeFLbVdCQChlBi7LXJqw6VzutJRvg/PbJGhmgNQn
	 oWBZIcIgYK4S4ydo+e7yFeGalIzNK2N4Dy5NGTqz4CEvJSs4YDIoW7/h3lWZ9qoRZB
	 h9fNHt//Bru2RiRkIBE8qPacBdcOtbE9JAiU88iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D15F804EC;
	Sun, 15 Jan 2023 16:02:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DDE4F804A9; Sun, 15 Jan 2023 16:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DC0FF804A9
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 16:01:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC0FF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PsQwIqKm
Received: by mail-ej1-x632.google.com with SMTP id qx13so4300246ejb.13
 for <alsa-devel@alsa-project.org>; Sun, 15 Jan 2023 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3bq6rsilb+yzIau6JvOZs+9VdaUZxUWRaQK2SaliZM=;
 b=PsQwIqKmv8mUgQAfKRBTar7hkJFBWu8yHkUFdSFiONL0FtNX3oQmt62fwmI1uJMD+J
 +sddKvh15EIZgSODInndERNNqf33Cxj0ivluoXf/++txbGPkWKElLS3YwqdsE9CxR7MN
 CdenhB8vdwxa1nD/TPDp6Ks/nG7rbqocCxvY5xAvtvDTAq/QfjJZ00bC/UXZ87uvwgLK
 5EBa7NXKP7Zyockn+St7pD/YqdEIrRqXeagIwccNWWpN9BdwkiNngvUrNSCBJvy5LmRf
 D/2VGuv18XneRm2cv6sFDRTVuyjhIDREtzOIfVOKy4maK43/FZ8/uQMgI2RpWSJ/nlCS
 i4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3bq6rsilb+yzIau6JvOZs+9VdaUZxUWRaQK2SaliZM=;
 b=a7ESSxGCnLIjisJuLZAhrUfouJJJY5g/6HVsHu4MrZgqO5imrQ2tHdbodfpt48OQZn
 4O864VoxB69bFhaHHp/gee0hZOoi5ofq2f9sIpvLCpDpLFk5iQci5SWyvgDW0GzjRU/q
 qCvVgSjqdqFm8Z9/3bmLIjdxgGpbfohDzTVHV+VoP5JL0lxxhv6j71Wu3jA7ec6WcDPP
 sdM8FTB6PdZ6jY6afFFuMV2nDm3gZT07n1OMTXYFHiMERu9Xamemhzl9XLEwrAVGp1sX
 DY/buHCyj+ZWpjgYzW3Q0mw1SLdn+o7mUuzUnyHdSngAjgdqS7nuDwu30vBNcnCkOWuf
 5i/A==
X-Gm-Message-State: AFqh2kpWUUjUcdqVKhWUXs9qtGD0hjhJKIzImc6s+vIxhqKJCdlJWbTR
 OtfbT+E4SonX2+e/i92RQmxF7Q==
X-Google-Smtp-Source: AMrXdXvutsPygOCMzesZ9qxp8xuN8emB9CtkFkWEFKnljtZ5h28K7Ck5Gtyv2iBBY6sW3n/hl5B9WA==
X-Received: by 2002:a17:906:850c:b0:7c0:f44d:984 with SMTP id
 i12-20020a170906850c00b007c0f44d0984mr95610347ejx.74.1673794915641; 
 Sun, 15 Jan 2023 07:01:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 kx5-20020a170907774500b007c14ae38a80sm10633909ejc.122.2023.01.15.07.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 07:01:55 -0800 (PST)
Message-ID: <3c2c4da5-c63b-dd2a-c918-4b8163a52512@linaro.org>
Date: Sun, 15 Jan 2023 16:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: Add FSD I2S controller bindings
Content-Language: en-US
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, perex@perex.cz, tiwai@suse.com,
 pankaj.dubey@samsung.com, alim.akhtar@samsung.com, rcsekar@samsung.com,
 aswani.reddy@samsung.com
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121816epcas5p469f952d775cdd709de18ec63b24cedf7@epcas5p4.samsung.com>
 <20230113121749.4657-2-p.rajanbabu@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113121749.4657-2-p.rajanbabu@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> Add bindings for FSD CPU DAI driver which supports stereo channel
> audio playback and capture on FSD platform.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

