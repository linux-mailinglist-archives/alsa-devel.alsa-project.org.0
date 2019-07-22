Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED96FDF8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 12:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84605176E;
	Mon, 22 Jul 2019 12:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84605176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563792104;
	bh=0sJNwIlahI4a7/ATAoYgWTU/jb8eLmh49J8rcyYWCPc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbmsaLgRiTkQDyPEKAN7gCTHJOFpjJJAH7+zjdOgw0LNJccXMAUCHNXfihJqB5ESM
	 Sf95uaqNE/O2D+kciazoleNCOmskQw6uVJCuAb6cA5bWMMVgksOAgBAuT3ZpHFEp55
	 0ahPJyvrU/G1/rZTEr0H772xxwqYh6l1ipGwdYeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA1AF803D5;
	Mon, 22 Jul 2019 12:40:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E1D2F803D5; Mon, 22 Jul 2019 12:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C178F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 12:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C178F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ebjKVTfL"
Received: by mail-wr1-x443.google.com with SMTP id r1so38864814wrl.7
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 03:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lxsAfSJoqyeaMPKMmqAmoJ963yFSMya5n61X5ri34Z0=;
 b=ebjKVTfL4zIrrwXnNUPOLIN/mi43URSVgGFfc+AGOISeOMF4pHglkyUmZbyKD688MV
 NyM2Wt6T6TRLX9W5Lp84gY2aaE/KKTH3JiOB3UuCdZ91wEUDIcE8lfNDAEElZd5DB2er
 OyhLKC+QNtnbL66ZPC41OmQf5qmbaPV1cGer19cT/7ku2JGG2WPo3p5ej27rW3tyh9/V
 6l4jZpAVV2uMFgO2FirDAjgN4cpTYKsTUIJ2zXQWOzP1f6p5U12k/eLiV7YE6lifrdY2
 I2hTewRwgVEpB0iESApPpxU2pFurjOsYLd+YC61fBObBM0mDroLOqAkCRhQC/PHEwTRv
 cULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lxsAfSJoqyeaMPKMmqAmoJ963yFSMya5n61X5ri34Z0=;
 b=qig2ArzDWxVyVtQai0xO8ozgwmK1N5AAl00CditQq5tNzNbt2N+MG7kMAg2ZNVAG6U
 AHxo0WGSA3/YSIqoGSa3YJsgW6p/83fN7t5nrS1L+GK92UOv5xW/wZq+lw7hHf7CGUAI
 PyuvnWte61T7ueoR0sNgXevDDXZBt5JMJ8ARQDYzyWxK8x3oYiUhpHqTGwf8jTcC4leS
 KjItFVRXwW2l6tvcPMXfXwhp0pjjPY0I5K3qOGb7cXB73mzyoiHnHPSF1SJVwKP+YMLH
 QEOP7EqoLBvBOf+oNq/gjVDlFfs7bKrA4PE2XVi0w2g7xawFCOnerFUWRM5LAQsQfdfY
 ruEg==
X-Gm-Message-State: APjAAAUVfy4nbDlFZUTbXenbhP/xzHy0kq69wA6KWNmnVRW4kr+pbytP
 aSLG2jbR5ieE6HdYmZM6n152yw/zqepAjhEOFg8=
X-Google-Smtp-Source: APXvYqxhw2/hjWa+OVjGt2/opou2VusHC4wUa8CSwEuKd7WCLihV4U9OKj600NhZIoyN6j3qwhoIomdTvviHNmRMYEA=
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr76992990wrs.93.1563791995189; 
 Mon, 22 Jul 2019 03:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <18b4d49b410248766e834f3a0444e106@akkea.ca>
In-Reply-To: <18b4d49b410248766e834f3a0444e106@akkea.ca>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 22 Jul 2019 13:39:44 +0300
Message-ID: <CAEnQRZBXjXPq6UL2tPshOtoRu4SJ3XZ8DRVnw13fyi3SL_EqXA@mail.gmail.com>
To: Angus Ainslie <angus@akkea.ca>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jul 18, 2019 at 1:36 PM Angus Ainslie <angus@akkea.ca> wrote:
>
> On 2019-07-17 04:56, Lucas Stach wrote:
> > The SAI block on the i.MX8M moved the register layout, as 2 version
> > registers were added at the start of the register map. We deal with
> > this by moving the start of the regmap, so both register layouts
> > look the same to accesses going through the regmap.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>
> checkpatch has a complaint about mixing code and device tree bindings.

Hello Angus, Lucas,

What imx-sdma firmware have you used to test this with linux-next? I've
finished my changes but aplay gets stuck sending the first audio frame.

Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
