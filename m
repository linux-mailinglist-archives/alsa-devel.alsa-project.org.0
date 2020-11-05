Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1B2A866E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 19:50:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 237CB1683;
	Thu,  5 Nov 2020 19:49:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 237CB1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604602227;
	bh=RYHDryKCgHdBqZFKAxu9FDoTf0qZ2mMmauE0e435ZgE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rL5WtNV8fPSvG2wBeIhv+LT3Ln5vzKJdm13Q6QjzyeLdGwAGggkvy71xsNQeV7JfK
	 4stLYoBQ4gMlDB36j072eMImfwVOWc1xZqmY5XS6H4xc+LiiS/fyYvjq+T/gMax+Io
	 /6Zk1ETiXjSaUawObYuf7XBk/QetRsiAUw0k71M4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A2CF800BA;
	Thu,  5 Nov 2020 19:48:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930EBF80171; Thu,  5 Nov 2020 19:48:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C0DDF800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 19:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C0DDF800BA
Received: by mail-oi1-f194.google.com with SMTP id j7so2713396oie.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 10:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BYNX3sHJkyMH0t/IiPa/KZjWE+bpxLVyxLEUGb+ssX4=;
 b=c6/w9Vanh2AlZnZblHTklPRQxb96O4CjAyCkNY+Z/2nLlVE9+6PRH3BNHIB5/Ei/Gl
 aOb93BdZjKnAA4ime8mnTXkpZ+jUkEz1uw8adGkj8g2dHEYYnH7ZLgOZJ8ZfdxXPvzh4
 B5iNaJqHuDzJMXaHgAa5MISV/jOFu0q2fHwGJ+7JIy/bKJLAWwc9oqM+RLbbznzooJqX
 /Cr7OHzNzdvQLs0BEVbylumot8eH6lw5jLiOohg8KqYsf/uX7RWr6NVkel7Cf71p28Tj
 HhujvTZg8PhN/UKnBwytzF7YsofzjASfQ4K+84H/sbJWhSM2cWKrqPhcQCDPQD/Epl3R
 WOgQ==
X-Gm-Message-State: AOAM531Ii0xR5Bgxk+RnhEldygsEROVYq7RVrHZNC6OTgWqyt9WBuVYH
 OCiau+kPcq3qpzXuY8tlvQ==
X-Google-Smtp-Source: ABdhPJyDHAEgBqcYZhMLwuDBAvHg8cvuucs/nxvXtGPkv7ixqUtMcCymRx0Vx2GSqrwF5pQJqEjC/g==
X-Received: by 2002:a54:4590:: with SMTP id z16mr520016oib.63.1604602124676;
 Thu, 05 Nov 2020 10:48:44 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q10sm513355oih.56.2020.11.05.10.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:48:43 -0800 (PST)
Received: (nullmailer pid 1620893 invoked by uid 1000);
 Thu, 05 Nov 2020 18:48:42 -0000
Date: Thu, 5 Nov 2020 12:48:42 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v6 2/3] dt-bindings: ASoC: renesas, rsnd: switch to yaml
 base Documentation
Message-ID: <20201105184842.GA1620536@bogus>
References: <87eel8baxc.wl-kuninori.morimoto.gx@renesas.com>
 <87blgcbaw4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blgcbaw4.wl-kuninori.morimoto.gx@renesas.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sameer Pujar <spujar@nvidia.com>
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

On Thu, 05 Nov 2020 15:05:10 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> It is still keeping detail explanations at .txt
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.txt           | 520 ------------------
>  .../bindings/sound/renesas,rsnd.yaml          | 450 +++++++++++++++
>  2 files changed, 450 insertions(+), 520 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
