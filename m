Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4E910D80
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 21:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB0A1713;
	Wed,  1 May 2019 21:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB0A1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556740334;
	bh=jBVmJVk/RM155H3iUFn4iH+GRJTpI87i2g67vxSaofQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U4eoxyCBltmItLmf8DwcfZFPV7qyaAcrg5aZn8H1nzxUz9cuh7luPVNKutq/Hylim
	 tamPqWCCD8L4EaGyZXa2BPvNbcsR+g8LA4JKyrWJiEVGrxsThGtQggfVjh37TmwpTs
	 +z/NZdPCu9xZ1Ys1hJ9MZupHfWoaQ+RuGFFpb0Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474C7F896B7;
	Wed,  1 May 2019 21:50:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEACCF896B7; Wed,  1 May 2019 21:50:26 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 48E34F8075A
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 21:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E34F8075A
Received: by mail-ot1-f68.google.com with SMTP id g24so54694otq.2
 for <alsa-devel@alsa-project.org>; Wed, 01 May 2019 12:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4aS2uE1D91mkrl/gYeWQtzT+PKkraqjyORTXhMdPTWc=;
 b=SRakLLgRC85YXXGaGTWbJvFELolXt8n0IEMcL1nZNx5/406cwQeYKanmbTsRZwewdR
 ZfybB2sMxK77h5wGuYetI0xviPghFcSxZP9Ta9eUfWOw7UMS3XnhcCL+sCVbcCxHCB1H
 977AJQPIlukgx1xuFlcSB+XpLXX92+B+Ol74QKoUIwxYHlvtWTpQeW0chzqI1P+qxvs0
 NNYjDcEVqolaIal3T8HsPu+KPpJ85mhAu2wCrOgv8lr9zFVJjPeh79R1RzmBrUrBJYpd
 /O8MYsVnBI5F2nAvtMYUCpebYna5cGN7OTdDG2VmuDh9hcF4chnUT5Qr4A6qy9R664po
 3esQ==
X-Gm-Message-State: APjAAAVe3EA3uHBVQ3qXw9eGTIB+YIX6TBzsRl7FzdYrD8ZGrkoxjsTn
 nu5Q0pxYPHJWoSZP+pzA9w==
X-Google-Smtp-Source: APXvYqwGNT8oOeMnhcZ+vSGs9Gi6hU6lT2YIKllylFBKjcxVlXfqb2L6uc1z343lFHswKPCjvxaXXA==
X-Received: by 2002:a9d:6344:: with SMTP id y4mr20118098otk.11.1556740221087; 
 Wed, 01 May 2019 12:50:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m124sm16994766oia.3.2019.05.01.12.50.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 12:50:20 -0700 (PDT)
Date: Wed, 1 May 2019 14:50:19 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Message-ID: <20190501195019.GA13211@bogus>
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
