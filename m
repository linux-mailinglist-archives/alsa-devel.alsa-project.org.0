Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14CE1D02BE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 01:00:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795821655;
	Wed, 13 May 2020 01:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795821655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589324453;
	bh=IG7ctD2YCoDDUQ8s+e3OABRWevBYaSivGtSptefac3E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHHqucCHBsY9je+3zaWFFKJi7YEhjwQN7H1gBFmzxy/OgLytZJHm0lKjvLBOKEEzA
	 kFoYXSCS8LHrlw1Eva+at9Ws9HCDNoEeVa0Jab++02YSSDhBB0FXq1kE4ba+kKjTUM
	 C7NJY893ZOlwy5NyASu8CFtHkeejRjqCRrGNd0mY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 338A3F80158;
	Wed, 13 May 2020 00:59:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B42DF8014C; Wed, 13 May 2020 00:58:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFBA3F800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 00:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBA3F800AA
Received: by mail-ot1-f65.google.com with SMTP id k110so11938902otc.2
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 15:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cBiUIrWE+UaIH5tajkgyIKVaNp7k7WAC/qZUFSsrV2E=;
 b=hQeu0DiDS0HcScwCXa7rNafG99JEpeBhxGq7k71PqR+tZIsW9WSXS+Bp50QouFA3qM
 XMzSziOdpjJbUgHZ/ogqbFzZYv3GZ82Gw6rMnGJk5NETFN+Uupu47/tt9cOAXwoMeNeR
 sf32NOWhHBQBiiPXfGpR9YD5EJXjiuf4iz8JBewt6H7jaFIGl9ym1k6BX0hpfWG5ou7l
 AauqPJmcAcypo/Ga+xZd0TmKbz3OG6Vq3khp57Sp/Sj2NVWebW/UPvvfjGkRhMLmKJ1g
 gfNhxQNQv1WqFZpET0vVvNDSBOdXimzZbBtZ/cduJ6C8fN9LDbKK7sTIOi3mcJ/0DgIL
 0jLw==
X-Gm-Message-State: AGi0PubiPNKunW0W5GIZ7QXkF+qxHL4F/LqFTNfzD1N+9i6w/4l+Exdq
 /KsyCzKEEHVkQJ14b14KKA==
X-Google-Smtp-Source: APiQypL7PdOIK7Is7Nz5WrJlgO2HUyJLl2vgiulZfCULhki8ejQCn9T9ykjPsFKJznmjeuGro1Uq+g==
X-Received: by 2002:a05:6830:22f8:: with SMTP id
 t24mr18122890otc.148.1589324294619; 
 Tue, 12 May 2020 15:58:14 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w62sm5632505oia.32.2020.05.12.15.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:58:13 -0700 (PDT)
Received: (nullmailer pid 32342 invoked by uid 1000);
 Tue, 12 May 2020 22:58:12 -0000
Date: Tue, 12 May 2020 17:58:12 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] docs: dt: fix broken links due to txt->yaml renames
Message-ID: <20200512225812.GA28862@bogus>
References: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <967df5c3303b478b76199d4379fe40f5094f3f9b.1588584538.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rockchip@lists.infradead.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Jyri Sarha <jsarha@ti.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

On Mon, May 04, 2020 at 11:30:20AM +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:
> 
> 	./scripts/documentation-file-ref-check
> 
> in order to solve those issues while submitting patches.
> This tool can even fix most of the issues with:
> 
> 	./scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
> 
> PS.: This patch is against today's linux-next.

That's not a base anyone can apply this patch against.

> 
> 
>  .../devicetree/bindings/display/bridge/sii902x.txt          | 2 +-
>  .../devicetree/bindings/display/rockchip/rockchip-drm.yaml  | 2 +-
>  .../devicetree/bindings/net/mediatek-bluetooth.txt          | 2 +-
>  .../devicetree/bindings/sound/audio-graph-card.txt          | 2 +-
>  .../devicetree/bindings/sound/st,sti-asoc-card.txt          | 2 +-
>  Documentation/mips/ingenic-tcu.rst                          | 2 +-
>  MAINTAINERS                                                 | 6 +++---
>  7 files changed, 9 insertions(+), 9 deletions(-)
