Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70424688D
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 22:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF47188F;
	Fri, 14 Jun 2019 22:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF47188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560542564;
	bh=jRaztfBnK+6C+S3jIJtLKgd/yNAxUsOcQxqLTixm8PM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GW27J4y8oulkpoqNEV/ITJ4Y5VDMlX0StdasDL05VFhENsRZcaxKxY+JizpFwlQ46
	 WBVr1CvZBaTt9jxy6W7b5pvVwtXGT6czf3U77/8VXlIrw3aaXeDrHJpkfadil37EKp
	 prV+83LYzU9P0sVNyb3n/6XL6Ac+jF2Bmj9L2KOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FC34F896E0;
	Fri, 14 Jun 2019 22:01:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4325DF896E0; Fri, 14 Jun 2019 22:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5906F8076F
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 22:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5906F8076F
Received: by mail-qt1-f193.google.com with SMTP id j19so3869224qtr.12
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 13:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eB18U3DxOdsmPtgK5EfLEq54rx6Rwk5ZlbGeYQvoBGc=;
 b=rDjeiX3vO2kdGrvx8davS94I4jaaKODn6MjFfb+CKAu558qSyoxpsuLCUwdNKWRgxo
 qOZOyDzEpHXW8O2KzZ4bJx8E0j3GRP6vLck5V4amvmP5cX+HmPpthNvIL/+Q4PR2YZtZ
 oQkgbZv/Z1LIwyrPXznV2CU1Z3eSdnJSgrAc8lub4ph85okwj2j1ZEaFE2b7H8H0shnk
 m0N2xXOY3FfgOS6eeh3yEyqW4DNZWzK5Z1o8HJkGMPwxUVRPYYlKDmpXJzGF0Eb6l6g+
 /01omDvnJGx3xSuwS20Qp7eeRFNhxiwHpKVpMuA7kLa3awx1ae3vT5YOF8WKK0wOD3JP
 u2mw==
X-Gm-Message-State: APjAAAVWfdx8A7mWm4gZe7yGU52a2gHM0KWQQWMeMudWmo0CPAUFGo5i
 FXot6LW0MjPqSmq1rA19PA==
X-Google-Smtp-Source: APXvYqzW+x16AqmtwTMocoooXQV8wwZ0g2afvcGwk5AwhPvYq70dh12nNiLJH569SFP7sRSoYwKl4Q==
X-Received: by 2002:a0c:afa4:: with SMTP id s33mr9531897qvc.194.1560542453169; 
 Fri, 14 Jun 2019 13:00:53 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id a11sm2039583qkn.26.2019.06.14.13.00.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:00:52 -0700 (PDT)
Date: Fri, 14 Jun 2019 14:00:51 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190614200051.GA12858@bogus>
References: <20190528132034.3908-1-daniel.baluta@nxp.com>
 <20190528132034.3908-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528132034.3908-3-daniel.baluta@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/3] dt-bindings: sound: Clarify the usage
 of clocks in SAI
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

On Tue, 28 May 2019 13:21:01 +0000, Daniel Baluta wrote:
> SAI might have up to 4 clock sources selected by an internal
> CLK mux.
> 
> On imx6/7 mclk0/mclk1 are the same, while on imx8 mclk0 and
> mclk1 are coming from different sources.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
