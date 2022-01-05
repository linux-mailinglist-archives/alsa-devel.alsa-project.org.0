Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35036484FD2
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 10:12:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D331793;
	Wed,  5 Jan 2022 10:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D331793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641373927;
	bh=VLMzKxDtoaNo1+BAzrqjlKXzKLf5hgQ+aO1HfuwufzQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahd5Upw98/jwIH/abFZ+kPRdHVcbSa2VGnjmHdqgz7YtogyyrUb4g6aWjRnQ0eGL0
	 e9QyzlEYWj6+WDO2IVg8TxHkI2I3tEIKc8n2oTGojtwuilXecga9bFxcYbMhAScSGF
	 8yJmx7QEnVBSRL5a4iDJCI0cJ1k1dwBHbzK7TQEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E4B7F8020C;
	Wed,  5 Jan 2022 10:11:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA437F801D8; Wed,  5 Jan 2022 10:10:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8211EF800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 10:10:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8211EF800BB
ARC-Seal: i=1; a=rsa-sha256; t=1641373832; cv=none; d=zohomail.eu; s=zohoarc; 
 b=GJYKqyWhdJlXFR45O4wYWdHIWczRxk6BDOMaKucWOL9YxWyXR/yetmFSQk2x/du6iy1/I1uV1FnnL+GSHXCgMzZtect5BiWN6yZ91iMrNtc/+fzrF7RZt5pG/9SVE+KSYP88r550q0EmCNP3kQt5qjOiPPUqF0g9UGNx5Ie0w4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1641373832;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=oPNfawC90lftrQQuBSvQ6SfphKGqT7CocEJaoV8xMDw=; 
 b=TFEgnjDDJaSst70MFfNdqP8iYxZ30vOk/9uApzt1NXG7tWunlScPHqDN/SoLaylZ3huJwiMjWjxIlZmEiDdAIl9XktRKT2zmlxmzVbOlB8ndcwe8awIQRESgiXXXxea9XP0EDDxEgT7SbZC8QQjEfR61XqbLoKvhAFKdYKyGf3s=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-123.unity-media.net
 [37.201.192.123]) by mx.zoho.eu
 with SMTPS id 1641373829850604.0765913733462;
 Wed, 5 Jan 2022 10:10:29 +0100 (CET)
Date: Wed, 5 Jan 2022 10:10:28 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: kuninori.morimoto.gx@gmail.com
Subject: Re: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for
 componants provideing jack events via set_jack
Message-Id: <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
In-Reply-To: <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
 <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tony@atomide.com, merlijn@wizzup.org, sre@kernel.org,
 linux-omap@vger.kernel.org
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

Hi,

> I'm sorry but I don't understand what you want to do by this patch.
> Is main code of this patch asoc_simple_dai_init() update
> (= call set_jack() for all component) ?

Yes, so asoc-audio-graph-card currently only supports headphone jack plug
detection on devices that provide a simple gpio to sense plug state. The
intent of this patch is to allow the componant driver to implement jack
detection in cases where something else has to be done to sense state,
sutch as comunicating with device firmware or using a shared irq. See
the other patches in this series for an example. This is performed by
sharing the jack with the component via set_jack().
 
> ${LINUX}/sound/soc/fsl/fsl-asoc-card.c is using this function, too.
> We will have compile error without update it.

indeed, will do.

> > +		sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);
> > +		sjack_d = *sjack;
> 
> Am I misunderstanding ?
> I think you need to do here is this ?
> 
> 	-	sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);	
> 	+	*sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);

Ah yes thank you, another problem is i lack hardware to test this (the gpio) path.

-- 
Carl Philipp Klemm <philipp@uvos.xyz> <carl@uvos.xyz>
