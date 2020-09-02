Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85525A8F7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 11:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDDFA1822;
	Wed,  2 Sep 2020 11:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDDFA1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599040405;
	bh=EKpi267vbzLLil8dcd4yrQBebQ9VxJ8wVN0hLh7H4pw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+9/Lbsp83+w9b7ne3KOwKaTkMUpIpTLH2s/w3kBKB+sAts7NEPtd0rGcP9+bBuPz
	 69wCAdCbBdiIN90QYewIFL8JsEOf9Y7Oh/CBboufVzcPyZLtI66Sp1AdajmYDMVz+q
	 RGrLbb3YWswGXpTm3vHDV0mtGtFXA02/MiqJT9YA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16EE6F80257;
	Wed,  2 Sep 2020 11:51:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08FC9F8024A; Wed,  2 Sep 2020 11:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BE7DF800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 11:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BE7DF800BA
Received: by mail-ed1-f65.google.com with SMTP id n22so4299485edt.4
 for <alsa-devel@alsa-project.org>; Wed, 02 Sep 2020 02:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v+z/Iz5Kt6N55tJf/v6lifigRsgJrV4tsPh9oDDZNS8=;
 b=rKd5jgGU/6IbrCedQrlIakuOgdc/jF+VYFi2kx/JoKXSqf5viVKcB4olGjt4xh6ulq
 /4NdOmW9XVAVbvUtZ19MOGA9TjLOvsQ/ggRAPjIAjTAhjYaj+fF5makT2k/dmg3PxGJQ
 fGccDRRaOmhW5plLDonfAfkhy9cgQphjOVVhHpn2k4sR4rGh0yDlN7R4tJoXCjgVisHn
 TOakwwguKXw17hAsMhRvwZDqHf1O+g8m5cSa/F+kt3K4gW/ruK5FF0FgNs1+E9PM56Px
 /GFXKSLp84U0TXic4O/GgUrjY1Ec+eckmn7aX2gJgmPhUWLf8ITG44ZlIUK5Y5fE4OQ/
 Npeg==
X-Gm-Message-State: AOAM533xY6+rtUW+vWjBfg/TKpdS7YDjbZbATShRt+jJsP//JMqygYbA
 9LCgi3M0iKBxknT26yrunZ8=
X-Google-Smtp-Source: ABdhPJwQBzxHKXtb9qVKUc/ANdcVm79cQo5uAcpJOq0mP2c85DCaM8X3t+UdeH1e6u4Wj8v9CTgd2g==
X-Received: by 2002:a50:cc92:: with SMTP id q18mr5778693edi.159.1599040240771; 
 Wed, 02 Sep 2020 02:50:40 -0700 (PDT)
Received: from pi3 ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id d23sm3740363ejj.74.2020.09.02.02.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 02:50:40 -0700 (PDT)
Date: Wed, 2 Sep 2020 11:50:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: midas-audio: Correct parsing
 sound-dai phandles
Message-ID: <20200902095038.GA14284@pi3>
References: <20200830112633.6732-1-krzk@kernel.org>
 <20200901110349.GC6262@sirena.org.uk> <20200902091038.GB13726@pi3>
 <20200902093839.GA6162@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200902093839.GA6162@sirena.org.uk>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
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

On Wed, Sep 02, 2020 at 10:38:39AM +0100, Mark Brown wrote:
> On Wed, Sep 02, 2020 at 11:10:38AM +0200, Krzysztof Kozlowski wrote:
> > On Tue, Sep 01, 2020 at 12:03:49PM +0100, Mark Brown wrote:
> 
> > > Please submit patches using subject lines reflecting the style for the
> > > subsystem, this makes it easier for people to identify relevant patches.
> 
> > The usual prefix for bindings is "dt-bindings: ..." so I wonder what
> > type of prefix you expect:
> > 1. ASoC: dt-bindings: ...
> 
> This.  Bindings aren't a separate subsystem.

Sure, thanks!

Best regards,
Krzysztof

