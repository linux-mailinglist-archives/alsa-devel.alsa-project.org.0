Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB310EC9
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 23:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F7131712;
	Wed,  1 May 2019 23:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F7131712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556747669;
	bh=jBVmJVk/RM155H3iUFn4iH+GRJTpI87i2g67vxSaofQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VEMfK5XDoeyLVkMaus+zmmCbh8LODvf3EqX1rDwtFM5Ln5+zg+MhxHNBy31RXl34+
	 NnKnikcVJ0SOqW/pXyKRqitcamu/EgcOqeUzNpCwLLjXITMdZJC1SEh6BgZzGPX7+g
	 gQ1mq+/11DvkMejw7JsXliVdT0mI0h2t5Geama2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC56EF89693;
	Wed,  1 May 2019 23:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86E48F896B7; Wed,  1 May 2019 23:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADBDEF89693
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 23:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADBDEF89693
Received: by mail-ot1-f68.google.com with SMTP id d24so262128otl.11
 for <alsa-devel@alsa-project.org>; Wed, 01 May 2019 14:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4aS2uE1D91mkrl/gYeWQtzT+PKkraqjyORTXhMdPTWc=;
 b=Jq7V6KLvaD6XdNDA3Xs8VFlw5q7QaPsNuZRyp52kahVkCrfC4hv3NUnAhzSFUzKXaS
 dpaDEYDL82rjAVN72xG0tZ8yzEEDgIUyTei7q64/vYXmLiC7MpYJ//u58bIqnSlougK0
 M8rsaBSPAoRWwXSyp+MpvfF1SmSaa8qeukRQiNTuoFlpEvCHGHLvktbKOeUKJiIF6e9A
 jJiiNtDlhj9sh6v7qPysKp4/Xh7r3VnZ+NhxaPBWaIKmFSfYQ6lQBBi4G345KdKIbdP4
 c6lcVjM5ml+6/OUooexdWE56WwxhXZRJaeGHRCEd0324M1FVdawPDgtoUC4jBRwIjCHy
 ugTQ==
X-Gm-Message-State: APjAAAUSb/HVb1BaPC59TVkgRzq+7cf7FySF8kSPMRs45nx3W4Ycq0Fh
 QEh494PYhGQDNDvpdkLKSQ==
X-Google-Smtp-Source: APXvYqxmtbWrY/WLRlpa30jAQrLAn/rBzs1+rA0hxlCtOKQ5kF+JMyAgDmkIhtG26z9qXLGD7xaGMg==
X-Received: by 2002:a9d:62c7:: with SMTP id z7mr173222otk.103.1556747556350;
 Wed, 01 May 2019 14:52:36 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c3sm10788016otr.57.2019.05.01.14.52.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 14:52:35 -0700 (PDT)
Date: Wed, 1 May 2019 16:52:34 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Message-ID: <20190501215234.GA31269@bogus>
References: <20190419191730.9437-1-peron.clem@gmail.com>
 <20190419191730.9437-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190419191730.9437-2-peron.clem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 1/5] dt-bindings: sound: sun4i-spdif:
 Add Allwinner H6 compatible
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 19 Apr 2019 21:17:26 +0200, =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=
=3DA9ron?=3D wrote:
> Allwinner H6 has a SPDIF controller with an increase of the fifo
> size and a sligher difference in memory mapping compare which
> make it not compatible with the previous generation H3/A64.
> =

> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
