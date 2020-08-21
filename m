Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC824CF10
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C71C1689;
	Fri, 21 Aug 2020 09:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C71C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597994501;
	bh=tYwM8fh4a9xawr7sgUILC3fbpG7a0F+1Y+0HSdP/0GA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=He4nZZXvWbjG97m0OaknqadAEpE9eIyCPDAfhYO+hIgxgZc321XLWFz+QsTCfqs2n
	 lJngnBwnRN75sXVqchUOsj/mgJebSABMG1kGL55ecISK018PNHHybEzWGXGY/3IYHi
	 SLO4hCK8d5L+mBm2rPWmXFqqfymIZ9QlXiwOgOV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A431F80253;
	Fri, 21 Aug 2020 09:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 453AEF80218; Fri, 21 Aug 2020 09:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09548F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09548F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Q0gyOliY"
Received: by mail-pl1-x643.google.com with SMTP id h2so504263plr.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ToFeweCF4QEpNtbMUOZZ3hTuXD1Vza7sE5bC5UlfQn8=;
 b=Q0gyOliYC1Hl/9OIBYcPQRCsfr85jJpFGwjo4NLbW+ZXJ7ecn3uAhErhu6dGNh9och
 PKeIIwVZkmVq6+vfwySBslfth31MIWSk2vVhNt2YPd6FeenH+04VxW0EU4ngwVpMSqwI
 9PJ29+gE9sMb+DnznCZbXBF/QLQiXp2MbHRsQjD1KgeblY6kX3KR7wnuH9VHUTYbaHZg
 qOoEzUjPot/8DoGkZNDNbF3/Y3t8ERGgS94iOX3ExGj5cpQ27iritPK0m+uuux7HegFy
 3fTMQZoSq/mXfjfVSPSrrJefy+XJb6++2hlAyPzVyiH2jfJ9dJ8O3xae+H1ZWD3GrEKB
 0beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ToFeweCF4QEpNtbMUOZZ3hTuXD1Vza7sE5bC5UlfQn8=;
 b=ZTFUB4ju94GAaqJFRakhmPX8KXVEBKt4WziMwLIi+QC8RmhRRaBUsKTM/U5BPP+piM
 EWhsjFBUy42TTzdfjKTh4m8Gl4FeQDU26NOz/W+3Q3fSzW3guAh4gUCygXs+i8Anmbzg
 ijdrN7NdXKlAzYJo47a9FR2BSoOQa5b5U47tVl5yuWbGb2Bc0RB672fOkerdfvWlrDF8
 A15Iv4UR38fs+cPRt5doX/F+vhucz4RmnNpxkHbO56E9nHwGpu/56qFHwXWTnxjW9qBh
 6F9BPhkCcw8Nh+KltualOU9JfCrVh4E2tNatUYzHfYl9ua80JrRFv90VkKMUiqWQPUjx
 LQPQ==
X-Gm-Message-State: AOAM531kPwnl50nRmqFVqtfNr9D5eTjAtloHogi9SiqNLFY8sitoeLQE
 mxC82OK6byjHfO7LLsNLEOg=
X-Google-Smtp-Source: ABdhPJxUOkJcKhXdRHc95o5EBPHtGYO4oYqb9z/UtARj0vOot1dG2cKwPh+Wg2N5VG9AFifzDhJAZA==
X-Received: by 2002:a17:90a:f313:: with SMTP id
 ca19mr1423558pjb.226.1597994383047; 
 Fri, 21 Aug 2020 00:19:43 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id c20sm958965pjv.31.2020.08.21.00.19.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Aug 2020 00:19:42 -0700 (PDT)
Date: Fri, 21 Aug 2020 00:19:28 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 2/2] ASoC: fsl-asoc-card: add support for TLV320AIC32x4
 codec
Message-ID: <20200821071928.GA19890@Asurada-Nvidia>
References: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
 <20200821071153.7317-2-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821071153.7317-2-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
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

On Fri, Aug 21, 2020 at 09:11:53AM +0200, Matthias Schiffer wrote:
> The TLV320AIC32x4 is commonly used on TQ-Systems starterkit mainboards
> for i.MX-based SoMs (i.MX6Q/DL, i.MX6UL, i.MX7) and LS1021A.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
