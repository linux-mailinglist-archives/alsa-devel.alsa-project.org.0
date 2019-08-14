Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8EB8D237
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E073166E;
	Wed, 14 Aug 2019 13:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E073166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565782378;
	bh=ld6x6qJ9xK6MTV/iV2cUQK1PmUa7ppKfFqPVnHE2QDM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crCVcirfjbRwjgpiCHRzvyHv3dohOpnceoHfcpE7YAABsKYQ3yhmHIADsukK/ptqc
	 fz5Q2tT3u+nQmiZqicA4BVuWBCInJw8FcF/OjLil5JlD4g1HKk7WvNbyw4udtyixYj
	 SSPJpiuaERvgFeXZeMP1kLa2d9qqWlRKqXxgKFxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92136F80214;
	Wed, 14 Aug 2019 13:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 722AEF80214; Wed, 14 Aug 2019 13:31:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E4CDF8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4CDF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hfTFjhzl"
Received: by mail-wm1-x342.google.com with SMTP id l2so4147596wmg.0
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vpgdRd/asOikWKpcYOp7GCtusnJpkP9qaZJO14nOi54=;
 b=hfTFjhzlmuNszaG+J2XzDCFC9aCurGRC0kLthghagIg+0PJ20Dx7kf2nNkG9JU3ERX
 sMqGce+Qf4BDhgEUPK4Rd4vEZCpbmQC7K1/6RZzfY31Yp3haEq0Js3ELAwSBr9/nA2iD
 GhyVpqwCGQyu+Jhti41HcgsIDNhvWeTYe8EGzhknBYSr9WC8t5KgB1iHXZZaKT6PHkhe
 FuAELBI2DEa7WfzxP/VFy/LtihhymwQhun/vKe6/XpqccxmxnBDjxBiHIYhVqBDg+HqX
 0JwWXfqaDZu0VuZuScYKhzuItc+tUInwwQqP+t+INn6cOvKuXjpC4eEpvKJAMb201k1H
 iTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vpgdRd/asOikWKpcYOp7GCtusnJpkP9qaZJO14nOi54=;
 b=bVbI9R+nzEDNTSrZ9/Ux7eoH+84o1jelcBFfG1KRPAF24z2Fj8l+/nTjOBjsI3elB+
 up5VbBgilqouUB9vsSSU1sMzA8JtRJ5LQHoxs7xUdhMXuqZ/W4y5HXrOy95LlbF87d0b
 fi7qNl2zGF5/QWpnsxxwFgbxKOESxGSCxA5jj8kHHnkMm2j2neKfmZlciRCVcOddX6tR
 WTkcvM90Bm+1JYuLyjzIVWKFo3MsCLVNhbsFpt0RJATQEpoRikVm3/xrvFFNC3/CpUkY
 /rxRBH021TpfWJ8uvh0sEadjzKojkz6F7HpcXLWhBV8Ckb2Cth9h18sXhK7KO+JLMGDU
 d8Mg==
X-Gm-Message-State: APjAAAU/igPFdL8x9z7VXGH1CmY13PDrxRwgG/TsSG3xlcE9PEs4dmsm
 Srfvl2szAUr6Ys0q3x9B8mA=
X-Google-Smtp-Source: APXvYqzoN/SFNr2n82+7oK/p1XvBt/QNrznmv2OOYTSvMxrNYtuX4Mj5uXeLY4ZZiHdavFSt3jiBfg==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr8368403wmi.168.1565782267282; 
 Wed, 14 Aug 2019 04:31:07 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net.
 [89.212.178.211])
 by smtp.gmail.com with ESMTPSA id 12sm3824512wmi.34.2019.08.14.04.31.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 04:31:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, maxime.ripard@bootlin.com
Date: Wed, 14 Aug 2019 13:31:04 +0200
Message-ID: <4005451.bVnTXbg3Co@jernej-laptop>
In-Reply-To: <20190814072007.6tfvhzsw4oxbwpc2@flea>
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-16-codekipper@gmail.com>
 <20190814072007.6tfvhzsw4oxbwpc2@flea>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, be17068@iperbole.bo.it, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, codekipper@gmail.com, wens@csie.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v5 15/15] ASoC:
	sun4i-i2s: Adjust regmap settings
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

Dne sreda, 14. avgust 2019 ob 09:20:07 CEST je Maxime Ripard napisal(a):
> On Wed, Aug 14, 2019 at 08:08:54AM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> > 
> > Bypass the regmap cache when flushing the i2s FIFOs and modify the tables
> > to reflect this.
> > 
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> 
> This patch looks like it's fixing something while the commit log
> doesn't mention what is being fixed.

Main issue addressed here is that SUN4I_I2S_FIFO_CTRL_REG has two self-clear 
registers (SUN4I_I2S_FIFO_CTRL_FLUSH_RX and SUN4I_I2S_FIFO_CTRL_FLUSH_TX) and 
thus it should be marked as volatile.

Best regards,
Jernej

> 
> Having some context here would be great.
> 
> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
