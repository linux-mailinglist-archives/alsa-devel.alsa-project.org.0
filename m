Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3545199FB2
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 22:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879B51658;
	Tue, 31 Mar 2020 22:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879B51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585684942;
	bh=zvJLZ1Yiyd3wNasFIHUvdsiN9vMWVMooFuGGJBtZzKU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kiBCTbsoXUHmSBekoGBT6slyHuLO47UPUBTC2VHcyqopWQT42ApOHi5fqDV7DMGZ6
	 eIJ5yiY1/JAP3XBZJp1eHqpA7jXUbnm8AdCv1oXzfVr9hB2UGdBerCHm9Uvwk7iqWN
	 hp9wEryBmHR30HkCDJSThv3uEZUqLRwI9GURpiUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EBE2F80140;
	Tue, 31 Mar 2020 22:00:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B27BAF80146; Tue, 31 Mar 2020 22:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DE88F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 22:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE88F8010D
Received: by mail-io1-f67.google.com with SMTP id h131so23112642iof.1
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 13:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=s9DFvHioEqxQs6sviOj1Sm2a5WFW4fOhlT5MmKmuEBU=;
 b=OKpyHAMV0VNjJg/T16H7HK7gFvxhMjGBeUaYar/p/eVe+jrLkrqQjtGdDVzoHfCdPy
 OZBffQ0RmOknJ9rCt6r3t9cvBYnAaAKsZKB6W3AGkwSYRGOXzrnRcHXi5uCWvQFp7DTV
 j4ZSljC48CX7lwd41spUXj5zZTi9W9e/bqhkjN3O/SQp3tRn6yb9MbqeQ8lULMLqAzR0
 X1CRFqXiguFzDFH5T3Do2c44Lh+FiXkS3ImCj9d+wmIofGFmMEQ03DCoWl++uuv4G8+u
 sxZW9hheOMcdJ4YPe6yagmH5bdo++wVqpImG06UsGIchvMJm1jHQFTTdickJZgPl0aFS
 7rZg==
X-Gm-Message-State: ANhLgQ0e311ZYCqpMXMxhBItdofOdVzgsgwbk8VD87ngrU2ZgAuM8+tz
 CL3dfkrVOEo+6L5A+UnXSw==
X-Google-Smtp-Source: ADFU+vvHXBGG9b+jJlsNae2tD54vi6RyRFIDg9NuHSbI3xqW9sGB/or7YPwGuRQfIT0By0v/er67tg==
X-Received: by 2002:a5d:8b57:: with SMTP id c23mr17020954iot.161.1585684831803; 
 Tue, 31 Mar 2020 13:00:31 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id p69sm5718490ill.46.2020.03.31.13.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 13:00:29 -0700 (PDT)
Received: (nullmailer pid 5074 invoked by uid 1000);
 Tue, 31 Mar 2020 20:00:28 -0000
Date: Tue, 31 Mar 2020 14:00:28 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: convert rockchip spdif
 bindings to yaml
Message-ID: <20200331200028.GA5018@bogus>
References: <20200324123155.11858-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324123155.11858-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, heiko@sntech.de,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 24 Mar 2020 13:31:53 +0100, Johan Jonker wrote:
> Current dts files with 'spdif' nodes are manually verified.
> In order to automate this process rockchip-spdif.txt
> has to be converted to yaml.
> 
> Also rk3188.dtsi, rk3288.dtsi use an extra fallback string,
> so change this in the documentation.
> 
> Changed:
> "rockchip,rk3188-spdif", "rockchip,rk3066-spdif"
> "rockchip,rk3288-spdif", "rockchip,rk3066-spdif"
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changed V2:
>   dmas and dma-names layout
> ---
>  .../devicetree/bindings/sound/rockchip-spdif.txt   | 45 -----------
>  .../devicetree/bindings/sound/rockchip-spdif.yaml  | 94 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-spdif.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
