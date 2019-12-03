Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A6110516
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 20:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8240D165E;
	Tue,  3 Dec 2019 20:29:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8240D165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575401400;
	bh=ssEIJh5lQa4bcYQXWXY+LRrjxvaiZlzWrRbqwmi6rgE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcOp4vdUbbCBb8lQxgt89tauKlgqpAi7+aYELXc6+P8Qhch9kQAL4k7ET9aLmaUAL
	 vaLLtnZtP/pAufvhqusLhFFN0QQ0s27X2q6Wo6hcry0z3DgES5ztsFGiT4asylhw5u
	 09NADPP1hJrwgrK2aZDrU8NfJvcWkznnG6MnPAB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 207D2F80229;
	Tue,  3 Dec 2019 20:28:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79523F80227; Tue,  3 Dec 2019 20:28:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C440F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 20:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C440F800F0
Received: by mail-oi1-f195.google.com with SMTP id t25so2163134oij.10
 for <alsa-devel@alsa-project.org>; Tue, 03 Dec 2019 11:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HP/XS4lIgFeGIfCqiXtNeLKC0699AGqVSeMl324T2Ik=;
 b=eU9astaJ5gsHaImEYOU6cjaDphb2g7VceGs2lEcbDdxuCvDXFKx0kr3jQ8dUARTOh5
 SoTtFFrbmBGgrN93p3k2ApCtMPkcUm+8N+415XTZkcquXII8CPyDQEczwXKTQ0TyAz47
 B3+vZUPkhgsgUGNgwTDqYKTJnKiaBu6PcOHI9IBssOwG2bEx7p/WQKsxqDpRyg05jht+
 KMiLuzG3bUpwVfjjP4crnWtHzlMVdU4O9fGumBJgKvSOFZAeuiAuS9V0l2CXoGNJAWKV
 ZhdKBW/GhRly2DxIkcqTAhoDrjx4TpA25CaE42ItOpJaGMAuvZeD6G97N/39MLy67RPp
 lPFg==
X-Gm-Message-State: APjAAAWuZJpR0kOl8eMswFiL4OqIzO5No6SXCtSeUrJQ7+O+QNL2xvro
 3QR4ftDDhjwhZyxtjBFSyg==
X-Google-Smtp-Source: APXvYqy0KoeigJ/g+387l+3eFZkkjDJ1VN7OIPFFIQnkeaHpUi5XcqNurGlEInb0iPQfuiS5/pCQpg==
X-Received: by 2002:a05:6808:8f9:: with SMTP id
 d25mr5062297oic.49.1575401278291; 
 Tue, 03 Dec 2019 11:27:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f142sm1443810oig.48.2019.12.03.11.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 11:27:57 -0800 (PST)
Date: Tue, 3 Dec 2019 13:27:57 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Message-ID: <20191203192757.GA32491@bogus>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115160819.15557-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, KCHSU0@nuvoton.com,
 robh+dt@kernel.org, broonie@kernel.org, kernel@pengutronix.de,
 thomas.fehrenbacher@siedle.de
Subject: Re: [alsa-devel] [PATCH 1/3] dt-bindings: ASoC: add nau8812
	documentation
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

On Fri, 15 Nov 2019 17:08:17 +0100, Marco Felsch wrote:
> Add dt-bindings for the nau8812 device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/sound/nau8810.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
