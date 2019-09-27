Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EEC0977
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 18:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E751665;
	Fri, 27 Sep 2019 18:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E751665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569601186;
	bh=7SN7yzycSXB0KiGdzaY5f+GE1CQYV9iyHNVegQHdQgE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=or431Zr6xgmAKaC/6CRtwEJglsmeOR3zbzmt/pQiadaGF6a/3c+gMmpkxGI5CfgBE
	 srQ1o2JSkSl+4jVKfznRqsy3xp8dTxwWDISfLFinYSbMUWOEHU1rU2M2twX3OoHBso
	 Da91EZk34QZe6hy8OCiA2PTKlzEZ4bxXjBuvtnA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B4FF8044C;
	Fri, 27 Sep 2019 18:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA19F8049A; Fri, 27 Sep 2019 18:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE536F800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 18:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE536F800B3
Received: by mail-oi1-f193.google.com with SMTP id k9so5668724oib.7
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 09:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=61wEmdcrcYWJhNxd2306tXwFPpNdjt5BEaPJ4YXafyM=;
 b=o9zie7fPwnls5gwz9zrcfi8e7e48nXlQ/Jnyj8AXMVuLW95IJGS1GMLM7BwKcVkTPu
 aacLhNRbK+GD669B4MDQqtpyx7OsBLQ/OtUgMCDPfK1wYVAvP0DeJ2o57jpVPNCR8ZvZ
 3TSx1HMRmb2Kx3sDVoJMwpk+le1tUz6zqOM3Ufk2NGO26KWunF6NMVeHrLiLg2+P4smw
 K2e8i0JfNnEHYK56ObGTtcN+Wy/W8sKscC3YG2ZYwfhMfW9lsziJVFTVpmS+llh26Jao
 VHchZDZbxawSshaZlE+657VuOvnTsxK8ok59/0t5+gpRq9qqw6uCKP9ko2tkIsyTweeu
 Ejsw==
X-Gm-Message-State: APjAAAUW5OjLdvfMINiKlD+y0qZ+X8Zi0qS66FxjfMxPjSV/HdLEQGHv
 3cMkcQzlHijekE7DgvvD0Q==
X-Google-Smtp-Source: APXvYqzQ50C+MzxL+jlDDEzxwVOUDJXNh2/Ri5dfX21zjNX52KVp6n8DSiAfRPZ1iIKlDQ96r5QBdw==
X-Received: by 2002:aca:d58c:: with SMTP id m134mr7507074oig.178.1569601074750; 
 Fri, 27 Sep 2019 09:17:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l81sm1778474oih.10.2019.09.27.09.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 09:17:54 -0700 (PDT)
Date: Fri, 27 Sep 2019 11:17:53 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20190927161753.GA30805@bogus>
References: <CGME20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633@eucas1p2.samsung.com>
 <20190925132628.31858-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925132628.31858-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Maciej Falkowski <m.falkowski@samsung.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH v5] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
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

On Wed, 25 Sep 2019 15:26:28 +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung I2S controller to newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v5:
> - Removed '#clock-cells' property from required properties
> - Added deprecated property to 'clock-output-names'
> and removed corresponding comment. 
> 
> Best regards, 
> Maciej Falkowski
> ---
>  .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
>  .../bindings/sound/samsung-i2s.yaml           | 136 ++++++++++++++++++
>  2 files changed, 136 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
