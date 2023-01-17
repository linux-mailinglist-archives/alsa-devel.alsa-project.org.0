Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F566E48D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 18:12:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD6A6AFD;
	Tue, 17 Jan 2023 18:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD6A6AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673975553;
	bh=ogcNUoswa1oXsPltMcrjGnZHdJ9zhp6Tstld29COrrY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g+9Ikj9c3b0QkPXtBHG3O5+6W07n/x1Yy44XahbkeuPuQUHHju+s9e50DoX+RLwjn
	 ZJj56RU/ZWdanrEMXP2RSXN0oIkOrWa+WRzPnweAhDRI3s2LCzMrIJ+CpuYO+aB2ka
	 U0nV7ffbO4FduBXDPiMeJ7Mi175QNufiLiqv1O/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90554F80083;
	Tue, 17 Jan 2023 18:11:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CACA8F8047B; Tue, 17 Jan 2023 18:11:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE463F8022D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 18:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE463F8022D
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-15ed38a9b04so13993110fac.8
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVkPYQT0+8PLUEYOWtovJMpxQSI+MX+r2Tx1WauPkPU=;
 b=MnrmeC9fY9dyreiD6deQVmbQmFskvz/Sdof96pwRM4tqjSORlF4dpOwLmlCihO8Xca
 pOPWvv44SXEMSFDC3oFe7esl0gi1QV0IfvpDmsb3lrIEPRqRXYJAeNxin8XqsIKfxpjo
 cZ18cLLEw0h70B2g2EvjIEHxAdJ9lSHK3mfJdk+/hUm5TmmqSFtF9mOh3AICOY87TRRT
 dR3QFl9XM0zWyLYYR3HsHybDTxElGpQNUvAhaD9Tu9A5XDTUyGgOFgJKfAJIRmIrnLqJ
 JasgpeeZqaurD4e2rUPB7lyxc/rAnfFDXE5lV7yf9APWKxk0Pim+eQL/uj0t+Pi+KKbo
 d54g==
X-Gm-Message-State: AFqh2kpxqV/MihOtZ0sfLj47+suDHTWOUrzk9cBnxbrEPnTwY+iLPVbw
 uTpigtjA3C/hRjJ/kKa53Q==
X-Google-Smtp-Source: AMrXdXuv4aRfwPuKQk0uSp1scr1y9JapyxOAs2+2rhBM5xBmqDE7nV74YC021t+S9eEbr2xx7dkbiA==
X-Received: by 2002:a05:6871:4684:b0:150:c4e4:447e with SMTP id
 ni4-20020a056871468400b00150c4e4447emr2308171oab.12.1673975489154; 
 Tue, 17 Jan 2023 09:11:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t13-20020a056871020d00b0014435b51ef7sm16662914oad.30.2023.01.17.09.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:11:28 -0800 (PST)
Received: (nullmailer pid 3253303 invoked by uid 1000);
 Tue, 17 Jan 2023 17:11:28 -0000
Date: Tue, 17 Jan 2023 11:11:28 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 05/10] ASoC: dt-bindings: audio-graph-port: remove
 prefix
Message-ID: <167397548762.3253243.4644404963209524392.robh@kernel.org>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <87v8ldho43.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8ldho43.wl-kuninori.morimoto.gx@renesas.com>
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


On Wed, 11 Jan 2023 01:11:08 +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Audio Graph port doesn't use prefix.
> This patch removes it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
