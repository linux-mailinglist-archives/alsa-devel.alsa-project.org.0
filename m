Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06528370A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 15:57:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6525417B7;
	Mon,  5 Oct 2020 15:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6525417B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601906221;
	bh=RHz8QeyYdCxYTt26MmCf2foPf069tUysZWQK8tWipNc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skLX6G7yN8SiOAv3Z9xzjSYDGf7GNdNG1cbX7519gvaj3DljzeGbxki2w4t2OFAFr
	 qite6qiBHB9qz2UV21jRttwA3OogB+xqzPvk8OfWsJ/uV4+SdOoQcLfpEtMg7gsrUS
	 6Lfnm2e8vufPEgFQqWZvNR/mxkfIneyab6qITp9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA7FF80260;
	Mon,  5 Oct 2020 15:55:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD6A5F8025A; Mon,  5 Oct 2020 15:55:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3298F800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 15:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3298F800C9
Received: by mail-ot1-f65.google.com with SMTP id l4so5178621ota.7
 for <alsa-devel@alsa-project.org>; Mon, 05 Oct 2020 06:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Y4gjDGwHEexJsJEMak2JrCEZKWVBN3DiXlKnxcoWUc=;
 b=YIFfWQ5yQv7bUYo9vfzM8Tpy2SA6YR9HJiCOouBWEldymJtEq23NCL8skgMfFg50kz
 VHELTrSafKK9FqATar4cEXEr4hxupF0XRFVpFg6y0+TqCYDLdJA4syKqqqtDcef7kLer
 /21CXaUExHJg27rvitBHFMS+oL1oZCBcl3c2jMGqtF4nwoeRsKHmop+Za3/5D9kBito0
 /KpqZr8rJDj16zAhenVAW/GL4gT/RxoTLRZgOyWGfym+BAs4VGzzb681KskWV9CF10Ui
 nZJ9kGmxM3q8wux58vO8H+VUUzQqUQ1vrNjs+6lq4ZKhZekc6txbSJsksMu7/mvk/AC2
 gBjA==
X-Gm-Message-State: AOAM531oqR6ZpkYzVSuePjNvHD4hNrtBds5VD1xjMQ2xQ2DMsbB96fgS
 ZHmI6InzIyhwceST2qyxaQ==
X-Google-Smtp-Source: ABdhPJxEM6WWOVQjqWQ3oPRaSuayV/A3zEDzJbkHvCwqWMAtfNXsAh8uKNIiEOm8z6t59edGkCW0VQ==
X-Received: by 2002:a9d:5910:: with SMTP id t16mr12615071oth.155.1601906105026; 
 Mon, 05 Oct 2020 06:55:05 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m22sm2885602otf.52.2020.10.05.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:55:04 -0700 (PDT)
Received: (nullmailer pid 87147 invoked by uid 1000);
 Mon, 05 Oct 2020 13:55:03 -0000
Date: Mon, 5 Oct 2020 08:55:03 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: mt8192: add audio afe document
Message-ID: <20201005135503.GA86716@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601624142-18991-4-git-send-email-jiaxin.yu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, tzungbi@google.com, broonie@kernel.org,
 maowenan@huawei.com, tiwai@suse.com, shane.chien@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 02 Oct 2020 15:35:40 +0800, Jiaxin Yu wrote:
> This patch adds mt8192 audio afe document.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../bindings/sound/mt8192-afe-pcm.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/sound/mt8192-afe-pcm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1375582

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

