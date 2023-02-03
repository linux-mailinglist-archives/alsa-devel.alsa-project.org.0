Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E768A523
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 23:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD27C82C;
	Fri,  3 Feb 2023 23:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD27C82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675461772;
	bh=Zjj6/U5R9Nl5m6X+fTRWyUlmTx2EJrPlcn9myK8cyBY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RPbgnjR1iTPe71CV4QybvJ9N0bKmCBpjtUZNdV2az5azdKhNSazqMCIhUYR+DVMJN
	 cUufFswrmOwcjaPf4Io7Gsr9jFJmKbP9BppIZw3xdPluTBQSyU3kh5XEQtSU8WLUQ3
	 XZj2G8UAhm+3jzj7AMxWhOsa1M8/SVdk9Yi6SQMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 336DBF80022;
	Fri,  3 Feb 2023 23:01:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4B64F80254; Fri,  3 Feb 2023 23:01:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7E9F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 23:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7E9F800E3
Received: by mail-ot1-f41.google.com with SMTP id
 n25-20020a9d7119000000b0068bd8c1e836so1797645otj.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 14:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sLBbKHff03+vVGWqe2MOMoSPPBdcGrhs7s9dvLhZ51E=;
 b=JTL+Xom1Z7czaE9uyevVnYYJIzOUdevadqBAm85e7iQExWUzvTzVhPIcJ6WCn2QrQh
 ZINgNJjyFmfk5yh4YaOOOD2G407XOz/ALnSHI6zC9fARDEqeyJYZZ91Evxj4DMqeykKR
 rfMw0XFlOWkGRSa2/Yd5aC823W//UdrZdUQqCC2BbRVtChYmNZNjNtTQgMldMRWK3eCU
 kC/kGNYqgfjxxGLomWJG9GS8gJxGxu949yBhBTbqB1c3h/MqOevHnyuheze8TYr22dJE
 rc8J/o87WPOs3Du9RV71Xka0dZxfGzxMtzk05CqQvgnJSzUwBb0i/fbIjzZJ/CBJw5J3
 rMeA==
X-Gm-Message-State: AO0yUKXSSSIRFTt8TqA1D7s5xeO89Ka6Pt3RsIMGOKCDOYOE3UZG2sMJ
 Z/zgzpEA05J6Oh1Y8I4cFQ==
X-Google-Smtp-Source: AK7set8/0qEFxBOGZr4WEUquF66k/9USt4Hb9aZLwSyX4t9XclvAwOXr5VkKe7LmJGpajO8W4MjLcQ==
X-Received: by 2002:a9d:66ce:0:b0:68b:d30e:7aa3 with SMTP id
 t14-20020a9d66ce000000b0068bd30e7aa3mr6048424otm.33.1675461704923; 
 Fri, 03 Feb 2023 14:01:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j74-20020a9d17d0000000b0068bd04b4292sm1612292otj.31.2023.02.03.14.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 14:01:44 -0800 (PST)
Received: (nullmailer pid 952016 invoked by uid 1000);
 Fri, 03 Feb 2023 22:01:43 -0000
Date: Fri, 3 Feb 2023 16:01:43 -0600
From: Rob Herring <robh@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: irondevice,sma1303: Rework
 binding and add missing properties
Message-ID: <20230203220143.GA947805-robh@kernel.org>
References: <20230203094239.25700-1-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203094239.25700-1-kiseok.jo@irondevice.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 03, 2023 at 09:42:37AM +0000, Kiseok Jo wrote:
> Fix according to the writing-schema.rst file and tested.
> Add the missing property as compatible, reg, sys-clk-id.
> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  .../bindings/sound/irondevice,sma1303.yaml    | 35 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 3 deletions(-)

What's the output of 'make dt_binding_check'? Asking since linux-next 
has been broken in different ways with this schema.

Rob
