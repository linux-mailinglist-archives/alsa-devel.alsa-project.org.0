Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574D66E486
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 18:11:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96EE86B01;
	Tue, 17 Jan 2023 18:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96EE86B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673975474;
	bh=PKfVZA6Y+jGLD+yvKM7jtjfmj+Ws40Nmee3pJ5QOsKw=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d/aRMq+cYlKulLeUi/DeVj6OvAKcDEK5njPpVdBiRyJV/d0F78mv0ugOewlOgfu3s
	 ITl4OAtGTfNPwOFmaApRFik+npBSJsw72DX2q+0ho0KPnjstwOZgcIYOnUGp/yBLQZ
	 Ib3BvlK8d/1SsmTOfRvbtI7R1hkiFXxJ3kQYOX7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0106F8047B;
	Tue, 17 Jan 2023 18:09:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0C23F80083; Tue, 17 Jan 2023 18:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D9CF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 18:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D9CF80083
Received: by mail-oo1-f51.google.com with SMTP id
 b10-20020a4a9fca000000b004e6f734c6b4so8129094oom.9
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EBt6OwEc7aWzfw3HNqGtJVkR6yiTPViGz+8y019qzbo=;
 b=O1XEKf+OMu6OnaNUqi88dUqPtpnk0/MVkdddNJNjbS8ch27dyC/YWKGoBoN8cHIRgW
 397MiVjzXW6b8EqGj3lC514qisfOftpbIrUeTjHySNYhLqdedOlIiwFjUZv768VvEWMD
 laql6Wo1DXZjgkS45bEGca7a9mCtjaElzCovLZ/iGyOj+Fkx59rL1gDX9fVcPov8N+f6
 OV8bvWFxLkHD572darBigksooS03hY3f0YbE4iDuBc38GalRIgJ3RAuYKvRYSanyKGLQ
 x3OG9yHNjiuJVrOnffQV/5RjtuW9Y4ELaadUz289wTPZ69G6+GGM163DCuVMGuznwrJO
 YyPw==
X-Gm-Message-State: AFqh2koI8V/nJE7AZQsHbnJ0knuCuv/ke4kStuHKWcfy6HIrZiEfpPQj
 +pkqPejm+Wnjsj/mJxterQ==
X-Google-Smtp-Source: AMrXdXuoCd2emcRioMWSkuiL5UJXYiiL7j05Xg3FB4TAOariAaf9grOg2xUsCHaHs0HnjFZPhOVlFg==
X-Received: by 2002:a05:6820:150a:b0:4f2:875:5252 with SMTP id
 ay10-20020a056820150a00b004f208755252mr12029257oob.3.1673975383168; 
 Tue, 17 Jan 2023 09:09:43 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r5-20020a4a83c5000000b0049ee88e86f9sm15310809oog.10.2023.01.17.09.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:09:42 -0800 (PST)
Received: (nullmailer pid 3250793 invoked by uid 1000);
 Tue, 17 Jan 2023 17:09:42 -0000
Date: Tue, 17 Jan 2023 11:09:42 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 03/10] ASoC: dt-bindings: audio-graph-port: add
 missing mclk-fs
Message-ID: <20230117170942.GA3244879-robh@kernel.org>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <87y1q9ho56.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1q9ho56.wl-kuninori.morimoto.gx@renesas.com>
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 11, 2023 at 01:10:29AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> audio-graph-port is missing "mclk-fs" on ports/port,
> it is used not only endpoint. It is already defined on simple-card.
> This patch fixup it.
> Without this patch, we will get below warning.
> 
> ${LINUX}/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

IMO, the warning is correct. 'ports' should not be anything but a 
container of 'port' nodes. If something applies to all ports, then it 
should probably be in the device node (or implicit).

Rob
