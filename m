Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BDF2E8B1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 01:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6552F15E2;
	Thu, 30 May 2019 01:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6552F15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559171219;
	bh=v1t3rLZ091eMKLuXqWMhrWHOnBookODxjQrtiBQCtyo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7o1mGM0CzctSFI5gwU3PyQRXHhRgWo/+ijcpQhbZjXTAPRjNgKuEj9QqTOnNPn8V
	 KIekXC0AcHI7cg2n+D3bPTje8SOjtisiurumoPRub0ClG/umwRF0AyGiuASkNuJSux
	 joWUNCtI4+cPnCkiOGdQfRZvIAbuFWFDjFRHGAcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFFE6F896E4;
	Thu, 30 May 2019 01:05:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62DDAF896E4; Thu, 30 May 2019 01:05:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05CC0F8072E
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 01:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05CC0F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LBLUDOMQ"
Received: by mail-pl1-x642.google.com with SMTP id f97so1697192plb.5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 16:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sn7SzLVePT74hYMrzOggoTTgR0I4/4qPqO4K8HBko7Q=;
 b=LBLUDOMQ6xSIKd5t0CVXmKnt1n9IcYRe4f2iENYgZQTG82Zhf4MtWusceLH4KdlVCU
 siTOUmbaiAUi8F5kfspioZsp/hePgBrFqNX9d8KYRaIGnXbewet8GyZtEdkxPcanuwKH
 /0HJG6Q1gu97wPgB2Be8xBr4st7zRMNkP7NYVeYbgpGoVcXPDDTEHtyC7cDP1dqugmYe
 XZqoviY0Sjj6yf9KcbvE0Vi8JRZOn3jFURIpel56Y6TPgry08kMQyWD4oGtAP9KidjP2
 e3D/ug4SyEtf9hoNn9MrY7JQV650Nl983cftcQb36SHpNKiPDpFEV37aVTEVs365rXpN
 3Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sn7SzLVePT74hYMrzOggoTTgR0I4/4qPqO4K8HBko7Q=;
 b=LtJ0lWBlKYWHSjlhFGrhwhNrbZyTJV6kOyQoRnMeNm0RpP6ZEfwV+phJA4pKU2+2jz
 5lVkK64BqRjk0a9lODk1H83hMXyMh1F9hGauI8JKNvpVZs+f46tIZtiPTzZYHBMjfeAK
 THtU6Bkl92aK3dOE4PNdNyAJh9GpSS1MM8PT8Y+w9wvi2aihvbcqNVeBMGeHwR8OAjAz
 0fCPK0AMdJLUOnW0/EZ+mYSzyUU6gF+/aoH7TWkIAMMq5XYmf8BA0gkXCgDVfSlW9uD9
 LTDvb7/o/qGmSIIT44fyI9/ldEPh8oc344svHqOAz/Pk6qRkVK9SfVQL6XcbbW/dXI4K
 UnZw==
X-Gm-Message-State: APjAAAUM0h8LTNnKGwUxXE5H6kpMUS4+JJdbrSFmwCzFTqROkpxhOOQW
 SJMURfx+jVylNyx+DOtktWY=
X-Google-Smtp-Source: APXvYqycvHn89zXHAwNBj7eZzs5T844h1v9oUP4/ximCLwqfgyxhCd66AUf4/IEmieDgzjtiZALRcg==
X-Received: by 2002:a17:902:2907:: with SMTP id
 g7mr513993plb.114.1559171107812; 
 Wed, 29 May 2019 16:05:07 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id t24sm813254pfq.63.2019.05.29.16.05.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 16:05:07 -0700 (PDT)
Date: Wed, 29 May 2019 16:03:57 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190529230357.GB17556@Asurada-Nvidia.nvidia.com>
References: <20190528132034.3908-1-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528132034.3908-1-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 0/3] Add mclk0 clock source for SAI
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

On Tue, May 28, 2019 at 01:20:46PM +0000, Daniel Baluta wrote:

> 1) SAI clock source select MUX is really part of the hardware
> 2) flexibility! We let DT tell us which is the option for MUX
> option 0.

I think the "MUX" is plausible comparing to your previous version.
As long as DT maintainers ack the DT binding doc, I would be okay
to ack too. Just one comments at the dts/dtsi changes, I know the
driver would just warn old DTs, but it does change the behavior at
the mclk_clk[0] from previously bus_clk to NULL after this series.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
