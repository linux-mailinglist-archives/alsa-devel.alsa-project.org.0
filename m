Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F0B107BF4
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Nov 2019 01:18:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 954E3184B;
	Sat, 23 Nov 2019 01:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 954E3184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574468288;
	bh=c6I06BYghwWT5RHPF6GuEpBYncnN93A7f/znn+HDQKM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJbqGozmhNzauSjfgkdWX9On/Spn5GsmsNELviyfTxEnEVaOUuB5FTdxHm3gK2VjJ
	 OcpkOs034XNvgFX5elJOUsr8dnEyqh0KfRxAW3U6mJ6dkpr941K+YQDGCgVXRuEFKy
	 GockIfTLExYKixcHv5/Xn7TlOsOOHeHB6TFQQ8HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E047F8014A;
	Sat, 23 Nov 2019 01:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA978F80140; Sat, 23 Nov 2019 01:16:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
 [209.85.219.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A5D0F800F0
 for <alsa-devel@alsa-project.org>; Sat, 23 Nov 2019 01:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A5D0F800F0
Received: by mail-yb1-f193.google.com with SMTP id g38so3408072ybe.11
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 16:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AWbc+0xnr2iQmZkFdWIsFKG7VK+BrYiOiqfXMahXEMs=;
 b=tgPAzWlZYtyw6qFgY6yTZeFyFaSJ3iRu+uDSD/u0DJtIOU06xemHLyaw2NbY6HNxdy
 Sh7tP8gjys4kPszRn5grK7jRhOc/i5m3/sEQ1vMG9WX0kLZQI5lmmE4b2FrKuPXAtoF+
 s0rH5jY8ipqAVZi0yCIw4OsV5+fLxQkC7eBfUD2UavVQGLL4eLoXRlZH79WQQVrQwUKC
 mfbNjs0jRJnnSp1jf1zHvyCrUe4JyyWIdievAt4e5CzX0vVgI1NvalFlaEb54PZUvYka
 BHLYpXmp5Cv7/st4dV+k/G7pFJ+1W+xkyS+GX2Snf+V+hGSyRp46XYtw832ciW+Wslff
 RwhA==
X-Gm-Message-State: APjAAAXgfkaYgPVmzh58xTV+nEitjute9e2Qa7SuupiwuobR52pmZCEI
 WS4G0rdlakyHZiEcKJtdxw==
X-Google-Smtp-Source: APXvYqz/sLrbRW9iMhll2c9BISO6QwOZWioWX9WaKgBH2VVlBP61QPYa8IBQnSEMMKkjvnDGqcxnsA==
X-Received: by 2002:a25:ab87:: with SMTP id v7mr13072126ybi.329.1574468178231; 
 Fri, 22 Nov 2019 16:16:18 -0800 (PST)
Received: from localhost ([172.58.139.180])
 by smtp.gmail.com with ESMTPSA id n128sm2333957ywc.99.2019.11.22.16.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 16:16:17 -0800 (PST)
Date: Fri, 22 Nov 2019 18:15:58 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191123001356.GA5528@bogus>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
 <20191121170509.10579-10-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121170509.10579-10-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v4 09/12] dt-bindings: gpio: wcd934x: Add
 bindings for gpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Nov 21, 2019 at 05:05:06PM +0000, Srinivas Kandagatla wrote:
> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

However, this should be referenced from the main file:

gpio@42:
  type: object
  allOf:
    - $ref: ../gpio/qcom,wcd934x-gpio.yaml#

And better to move the example there to be complete.

Rob
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
