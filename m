Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B04724CF21
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F5E165D;
	Fri, 21 Aug 2020 09:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F5E165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597994545;
	bh=3xch1GBzk1RKKyUPjcqmnEnDU9owzU0H+gkXCgyG6E4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCz63ZMeCNTEXY/pXYaWZSZOp6wqQWowMJXBlNqrt/Xs4VRY3ED0wWTbCu1vwF4AY
	 Ia754vnRVZrOi/XPcb3NIgblv9bSiMvea5CGvZyp5XU5QiVtzJd8sGVWxswpKkoAq5
	 L2g+6GNOWYBr79TWqpI7SveXoLertf7QMjyoUFfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB07F8025A;
	Fri, 21 Aug 2020 09:20:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82858F80257; Fri, 21 Aug 2020 09:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 666F8F80218
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666F8F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mIeS9Xim"
Received: by mail-pl1-x642.google.com with SMTP id g15so493704plj.6
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+LGTq1mqvMSViuH9XCWlGLerVDHsR7IO+qqsPsb76uI=;
 b=mIeS9XimBJsE+R74E2h+kzAGFNmF9sHLZa++02iH7VXJs4TWPgfQWEmq0TIGn9dSuY
 bggAhy01WqgfXZAccaweCDv2yCrj7Fnv1w/Rtz2677vfJeT/ZuZK2P8FCehZ3aML7DVe
 JNbOQhn9Ad0YNMUBEeuu9wGHe09e8S/9ZsKJ5NL0xYcRezro27bAQZDb/sbiNb//gSzk
 UM+e3vqmi5mq+SOBGHJ/iF2j4ANUjlJGLyE1PbJkO5QYZsaLvf0RItyuCmcMAe4guCGY
 +3ZzoqR0umpZ59pMu5JRBp9ghz+eBwEHt0hixBuvSslIhPq5Km/6Zo07teG2lwub9bmA
 gYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+LGTq1mqvMSViuH9XCWlGLerVDHsR7IO+qqsPsb76uI=;
 b=lOJqJl+7Gt0exaKub7VCfeq40a58YzlslW1y1l1F3uQwDaPjcoZMPwybSuUb4yUOpW
 /kcns0RayYUe0LUcjyw6hdo1NhlWWW/j/H0LkVvtsJSYq4GCxuF+jO70AgFUI3z0AVSW
 gZA5FkUS5LfIDjybIzeS5jggYXNOz5l/vsvnkrw/+VvT7NJgQEmZJBK0v+q54vqgYJv2
 c86VVIIlraL/9sMqQ73cGwIuBkRei1v/ahz2lewDvVFnlEuYk1C/IwA6xKtx9z3H1ayV
 FKBC20sf7X13MTCWcSA35hMhPl3SCme3dKa4wL5Y7DcldSOWN612T1fPofC7qk86CMwK
 tUSg==
X-Gm-Message-State: AOAM530fdcskAhLW+XZ68sy9CyhmWosRJ2eF01xeSPj5VcxdaGFSOzqn
 ZaWV80/KcXxOeQRs3dKWIW0=
X-Google-Smtp-Source: ABdhPJyY4LIUiQOEFw4qKKYRk/DqxT3xnarW2dvCwbV61Q9ZpHhPswII0/WPHdU5HxTecshuqMQ5vw==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id
 mh9mr1424330pjb.40.1597994415561; 
 Fri, 21 Aug 2020 00:20:15 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y23sm1425650pfb.66.2020.08.21.00.20.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Aug 2020 00:20:15 -0700 (PDT)
Date: Fri, 21 Aug 2020 00:20:03 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: bindings: fsl-asoc-card: add compatible string
 for TLV320AIC32x4 codec
Message-ID: <20200821072003.GB19890@Asurada-Nvidia>
References: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
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

On Fri, Aug 21, 2020 at 09:11:52AM +0200, Matthias Schiffer wrote:
> The TLV320AIC32x4 is commonly used on TQ-Systems starterkit mainboards
> for i.MX-based SoMs (i.MX6Q/DL, i.MX6UL, i.MX7) and LS1021A.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
