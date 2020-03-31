Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35A1996BC
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:43:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3813F1616;
	Tue, 31 Mar 2020 14:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3813F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585658639;
	bh=vcz0g72rifXSLeWaNnOdJDDcN3baXq4Yt3Uy827zZ2Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QbH0ETJRBvvkVnxk1y0/Su9f3Hnaiqd5Ga2N18JoJzQTGB1u3CSxSozB5sHGi1YC+
	 v8UJOVmBkoh/ZfgJiaDcr6/8/stzTRdSmi8TUoBs5PqqchoOyFAM40lemsB0Tg0Hae
	 k+QI428yKOR4GsU2jNGYhvLTeJff+mHz/h864xFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E98AF8010C;
	Tue, 31 Mar 2020 14:42:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E133F80146; Tue, 31 Mar 2020 14:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9E3AF8010C;
 Tue, 31 Mar 2020 14:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E3AF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pDQqfzOT"
Received: by mail-wm1-x343.google.com with SMTP id b12so2286672wmj.3;
 Tue, 31 Mar 2020 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vcz0g72rifXSLeWaNnOdJDDcN3baXq4Yt3Uy827zZ2Y=;
 b=pDQqfzOTiRQ7tL7td5hE81Qm/6VdRKt++vY5nVx42+C+gwdAxA8zZhbXiVzDg1B19m
 dLAGEfr8aD2VgGiiu4LQLTz7dxR533Oy/5VawYbQIEEe7Ln9dxSfycYxUoFl+HsnFzeN
 YfxXV6LN3qO0EEAKboOZ577a0Pnb9lepWu3XZeCe5RVq6i8+cqw76YPfOqYPC3Bb+N8N
 ug9J4xmDmfX0BEwhK0Eh9/c9/ZQGM9U9J/3FRHNF7zdMm9qpfLR79fcCsH5VGCvByR/0
 WRwSNf5s4EZqq4EcMWo/Qyhp3SHJg6G15DCxJvS8ft8WPAp9z8HLH6FI86zy+kaMVJYg
 cf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vcz0g72rifXSLeWaNnOdJDDcN3baXq4Yt3Uy827zZ2Y=;
 b=d0/NTI+TfCklJXEbuwt54ZWcb6lms6VIgiRsUusrjt1yDNg5TteR7H31LNeZ4PKUzq
 Td6Oi3Dtb3U29aNHT6XP4QglCKGti7I6ojSJxS3CwfjNym/Op1W1tYOahcU4uldvpSdB
 omIIcaw3BwIJyxMDQ/aD+ea68JtwG8VZq0MzPHB688oWLnhSqSUcPVCnwKjCLaWQK2kG
 tCY2/6CGXO3ggjheLvH72M22NGyzHrKVTcf8zG0YzshmoaJxLX5lTd0bJvAYs5U7o7N7
 6K8SucFqo5djNgJPH+R0WFJz/GT0/KfjbroXmOv7FtrHA3eEzfxFdDnDZFzsN/8JiIi6
 778A==
X-Gm-Message-State: ANhLgQ1QKSQ/SwVBEf/MEGty3FDZ0F6cQw0NK+2a9S2sDqRTmwnztHf7
 hDsm/EIVaLmwQo+Gant3u8QnZHMJwRpo98SANjA=
X-Google-Smtp-Source: ADFU+vv3upvTMzc++M5CXYzCHX8rdxvQ44BYLbC/mPwEbu0+mM3gc1laM5QzlJ1lMnw37DBAu77fn+1n/4pcdPgbFbI=
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr3447283wmf.118.1585658529082; 
 Tue, 31 Mar 2020 05:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200319194957.9569-1-daniel.baluta@oss.nxp.com>
 <20200319194957.9569-3-daniel.baluta@oss.nxp.com>
 <20200331122540.GD4802@sirena.org.uk>
In-Reply-To: <20200331122540.GD4802@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 31 Mar 2020 15:41:57 +0300
Message-ID: <CAEnQRZD_Hjp2vsouUURuZ_zgAnnUXynq_L5YgCZAN4pFkcmGWQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] ASoC: SOF: imx: fix undefined reference issue
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, kai.vehmanen@linux.intel.com,
 Devicetree List <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, Yue Haibing <yuehaibing@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sound-open-firmware@alsa-project.org
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

On Tue, Mar 31, 2020 at 3:25 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Mar 19, 2020 at 09:49:54PM +0200, Daniel Baluta wrote:
> > From: Daniel Baluta <daniel.baluta@nxp.com>
>
> > Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF
> > dependency")
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> This has you as the author but you list a signoff by Pierre before you?

Patch was initially designed by Pierre [1] when in the internal SOF
tree we already had the I.MX8M patches.
Whereas, in the current patch series I firstly fix the i.MX8 then I
add support for i.MX8M.

Should I go back and put Pierre as original author?

[1] https://github.com/thesofproject/linux/commit/0c7dcfee80d96a8e75684178ab738c1e6175c386
