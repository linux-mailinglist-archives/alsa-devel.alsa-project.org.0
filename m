Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604C1900FC
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 23:13:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D820F1654;
	Mon, 23 Mar 2020 23:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D820F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585001606;
	bh=TlqdFVuoCW9uFo5tZeQXk9dbCXTD+xfqE20BT5zqtxA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D7lhJp4JJihNR+Fr3/zagabmlsC8HNRFBJH1Kk6BvrTB8Gw/Ph9NAqo6vfcVx/FVx
	 nTp/UQl/c9ShZsVXUIphzcTXKjKzZ5Sow7fmEF6LhjikN+s66qRJ3sgw+wWceiyHMj
	 51Jk0L7GBo5v5RhpY04Uh3mom9iY2kzoCmou/XyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B416CF8015A;
	Mon, 23 Mar 2020 23:11:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B9CF80158; Mon, 23 Mar 2020 23:11:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2CD0F80095
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 23:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2CD0F80095
Received: by mail-io1-f66.google.com with SMTP id q128so16069290iof.9
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 15:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CXIO1RuJbIyd33SKijqeKvFhxWfXHto+5uHWG1/sMRA=;
 b=cpgCcegx0Umrn++LPOYTsYe3zpbvQKVjtfy10BXtaSsE9+J237rWvs8ZnlNnYi0zRg
 f+s8sfrVhdjedhQha0V0GUFu436U6uyJLppC/l8bpY8Qg3759yLtq92onMpyizI9i1XK
 nFT+5iNW4Rv43rWs7viL3l2QTE9i7F5OIwqBzR9jQ5I8oM54+TcEsNzZJuTOYOAGc+lk
 eAdllS34rzVOzQK54AarWCsrYcD4rcnYpVh/957LPdEJg9GUu0ndAuaUWrJSskOE8F5C
 rq0FXV7crhAE3isUBsKk5Im0PndSSNd4tL9H6fROu42SILfiWwf3vXUbhCzxsXwSZzCH
 6zhQ==
X-Gm-Message-State: ANhLgQ31O7zpy0voPTkFkIz6H9FC5YwuYpT6dW+6jHu2jYubcLWHhzZK
 Sra49tOCyW69eSBL8KLIWw==
X-Google-Smtp-Source: ADFU+vuxvKf/q1ZfFJJiZuqcHHfTUME8CXHg4jNa1UZ/F14DpnV8NJR/r/bzHrCDo4Qu5Piq/XFZzg==
X-Received: by 2002:a5d:958f:: with SMTP id a15mr20875411ioo.170.1585001495416; 
 Mon, 23 Mar 2020 15:11:35 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id h9sm414079iow.37.2020.03.23.15.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:11:34 -0700 (PDT)
Received: (nullmailer pid 28519 invoked by uid 1000);
 Mon, 23 Mar 2020 22:11:33 -0000
Date: Mon, 23 Mar 2020 16:11:33 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: sound: convert rockchip i2s bindings
 to yaml
Message-ID: <20200323221133.GA28453@bogus>
References: <20200311174322.23813-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311174322.23813-1-jbx6244@gmail.com>
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

On Wed, 11 Mar 2020 18:43:21 +0100, Johan Jonker wrote:
> Current dts files with 'i2s' nodes are manually verified.
> In order to automate this process rockchip-i2s.txt
> has to be converted to yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/sound/rockchip-i2s.txt     |  49 ----------
>  .../devicetree/bindings/sound/rockchip-i2s.yaml    | 106 +++++++++++++++++++++
>  2 files changed, 106 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
