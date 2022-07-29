Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E3584C85
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 09:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B1B165D;
	Fri, 29 Jul 2022 09:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B1B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659079564;
	bh=h4m+Uaoa6vgF7mNRpKnllqhl3yvzFlezzPoFT9TDilU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nQr4urxSOJijoqUtZjsO0shpcQB2EUPAEu9q1JoUs381AwgpliNLaCeCs0HmHlnZD
	 iWj5KEln+fz4gPqEXZh6j9zh+loaP15Tv7m0iFxTCmcbiGJXkGH+bcTgNVx48e8AfN
	 bzAf18rhE3d0B6AGDeH+2fBYicnCQ42Rz85djjGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B466F804B1;
	Fri, 29 Jul 2022 09:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40092F8049C; Fri, 29 Jul 2022 09:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 163C0F80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 09:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163C0F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n60DdHcg"
Received: by mail-pg1-x531.google.com with SMTP id f11so3378892pgj.7
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=33Rwnskq4erAqUnyXAPvYs71+w14N7qF8scWU/F/gks=;
 b=n60DdHcgdMIJAPs+PXLRf5QYgbNy36Us6fBNsNRIpHwIy0eJuaCzzWdvBxHzcqjwR4
 QR6NnaRPFuJReZIG/CJ2SBwazV9gBPrzRvbOPAmBLH+z/nhkEiUT7/kXqD1aXRrQZeEr
 +FYtI4nDoH4VAWUrnr8ZLbBvjSTT8cjVsJ+ngk4T04gXhpFQa+Q+KsHFxR5T/mGQ0OXT
 BgT+Q9LUHMWwWRJrFk0ynwNKZDE57E7JpskoTfS02pDAGLjh6XX7sZvd+Zq6PIDyNJ+W
 ut90IVebm/+eXfbNEymJAnfrL5G4C1sqJC7BrQtGVXlaWa7wlBOrHPrnxrhrZH7x3Jfa
 X5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=33Rwnskq4erAqUnyXAPvYs71+w14N7qF8scWU/F/gks=;
 b=Kggji6F9Khy/CL2dI51sEgncsrAt93xiSp3ICMvv4PBEGcQx63gk7c+spob2PYbwvO
 0ENx9kyD9SDgcyYnTps7sf6QF0x5bsO4AOcYOLFCvaO4GnpKbyjWBrI1AjNr4m+/DNi+
 ReO+qpJUf/PqAHxqhJmc3pCzgl/J/nMvJIK2U9yx+XMtuHDd61JsG0kt4Vr8+qsDtD9j
 CQL87rNH17y3b/+8lR3Z8iCONUjXMYATMWbgn3G8PBpTYKo6XeU9vWNF1Ltsf3cN/rJE
 l309HW1dbWysJqueVElfwpS/vbbitKaPtgFU8gaF2624sPkZxaRc5XE5iRCIsmFLS4GO
 V+Pw==
X-Gm-Message-State: AJIora/z66X0mWCrILXq95Kmq3GL3v3nfU4QJx0Hr7g4r+PYJrDtErJj
 Jfwej5PE9Ro8kgbRpIwZm10=
X-Google-Smtp-Source: AGRyM1swaG+M9jG8eYgP/1eOjgJpvz6r5DhtEDqSpqH53hsYL78+cWnJzPcurS6fJ/lUsw6uur2VFw==
X-Received: by 2002:a05:6a00:3498:b0:52a:f8f4:ca7c with SMTP id
 cp24-20020a056a00349800b0052af8f4ca7cmr2197912pfb.5.1659079496615; 
 Fri, 29 Jul 2022 00:24:56 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.140])
 by smtp.gmail.com with ESMTPSA id
 4-20020a620604000000b0052b6277df9esm2085533pfg.43.2022.07.29.00.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 00:24:56 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: pierre-louis.bossart@linux.intel.com
Subject: Re: [PATCH v3 1/2] ASoC: codecs: add support for ES8326
Date: Fri, 29 Jul 2022 15:24:45 +0800
Message-Id: <20220729072445.420129-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <372a1c8c-b70c-c5f9-3a0b-a4d554d5acf2@linux.intel.com>
References: <372a1c8c-b70c-c5f9-3a0b-a4d554d5acf2@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, zhuning0077@gmail.com, tiwai@suse.com,
 broonie@kernel.org, zhuning@everest-semi.com, yangxiaohua@everest-semi.com
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

>Nothing ever restores the constraints if a clock is specified again, and=0D
>in general it's odd that the enable/disable don't match up - if we're=0D
>setting variable constraints I'd expect that in the freq =3D=3D 0 case we=
=0D
>should be setting ->sysclk_constraints to NULL rather than the contents.=0D
>Indeed, we'll segfault here if the frequency is set to 0 without having=0D
>first been set to some actual value.  It's also bad to modify static=0D
>data potentially shared between multiple instances of the device in a=0D
>system.=0D
>=0D
>Having said all that though I'm not clear why we're doing this=0D
>constraint stuff at all, we never reference sysclk_constraints during=0D
>startup and teardown and you'd usually do this because you want to set=0D
>constraints that depend on the sysclk but this is just a constant set of=0D
>constraints that should be set in the DAI desription.=0D
=0D
Comes from 8316.c. Will remove the constraints. Will submit a patch later=0D
to remove the constraints in es8316.c. We can assume that the producer(mast=
er)=0D
provides correct mclk(sysclk) rate.=0D
=0D
>>> One question on the interrupt handling: should there be an interrupt=0D
>>> disable on suspend and conversely an interrupt enable on resume?=0D
>>=0D
>> That shouldn't be needed (in general the interrupt enable/disable stuff=
=0D
>> shouldn't be needed at all).=0D
>=0D
>isn't there a risk of an interrupt being triggered after all the jack=0D
>detection resources are disabled?=0D
=0D
The jack detection resources are only disabled after codec power down?=0D
=0D
