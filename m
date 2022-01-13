Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C33048E037
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 23:22:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD6521FCF;
	Thu, 13 Jan 2022 23:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD6521FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642112544;
	bh=/IBlZ4rNL/H9cqJm+qEPasqMmaQO/Esxa6Qt9uYW59s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dL8NpnwRlEUGcv+XyHwqcNDcAWjmygp5Neyi6I6S0N/2H/EIDhbgbVFYKFvfKEQwW
	 fQmMQ3c8rdoDmrvDWysPjUWDOSUC7M0H56ur+d6qYWBZzicn2YEyb+xWe2vnFjHI+k
	 JKQMhvLrbRxo7oaUUxoRu/DWNrFhYC+Nifotfqt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 603E6F80141;
	Thu, 13 Jan 2022 23:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9A6F8013F; Thu, 13 Jan 2022 23:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CC1F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 23:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CC1F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="VFRMGUaA"
Received: by mail-pl1-x62d.google.com with SMTP id c6so3175329plh.6
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 14:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y/+dGDZUVY2eeNSKSlnflCwfNSDgkq9FO8ZrBACFhVQ=;
 b=VFRMGUaAYDI1ByzXMuvaz1FhAiXBfT0cs/P8TF5WfJRvpFIDSizvM0ZIQmnP05xgff
 sAVe4L/O0Wd5P0l06HLjn6cuRZuQ7qUIQR9Kj0FlwiUDECvUuPH2g8UUtirvsT/Uqt0w
 awEftshTmIpaTr+41j2nju0dQ4kI4hPxw1rz/e4YWH34t9e5TdqR5Jvmo4pTt9JYwxg5
 200giyJaH7OF5p+OGJ4WTvYnHmr4kRGu/z4VQ56bPFeR+ErQE6jxBy8EB/VT9c5F/nfe
 vNYTxpBzpGsPObT9DT6ffJ3ZVG93HEuCJMa+0Yt0SYP05gmSw1xoH6RKAyrvSexTwW6v
 ka7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y/+dGDZUVY2eeNSKSlnflCwfNSDgkq9FO8ZrBACFhVQ=;
 b=5DuILnRDujlULSBKEY99l4a4RLaLElnzmIDRhd66VAWedr6DVOxc5HkpGhZi6y046e
 EfPBWq2TaE0jjjitUzeWr88At9lJ2nfU9CPaoAJ0rpR8+p77wxF+xKTZwP73vV5yuXzI
 1SdPExek/oiLszybV38YtDnRNhcRNxFYCNDcHz23F8C0KvDHSQ4Zy/XORfOkbRCIenyC
 G2zKuUTwWg0FajbwImnAuE6/ncBxQGDM2G8Ev/fwmB+BYn2myqIwVZK/+QZgPnCStBC0
 V73EW4uaJb1sKEGo7PsBs7OASLSkW8l1mbKcVDZG9lEHxINgiwU+DnMFX/f8WFrElrSj
 N+wA==
X-Gm-Message-State: AOAM530F8+xrNiPQX5YEeSZxnMSMANyZg+qVDixrlG5DG8XwWoWBEGey
 oyO5kM4e+tV8QK3pWkxSy9J9DQ==
X-Google-Smtp-Source: ABdhPJzbybmm41eqPkmOQbL1nKomMXteedyO38S0PJqB/lFEb6uj48zMoAtz7afn8aiBif1L5SAfOQ==
X-Received: by 2002:a17:90b:4a87:: with SMTP id
 lp7mr16808661pjb.199.1642112462973; 
 Thu, 13 Jan 2022 14:21:02 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id s24sm3422580pfm.100.2022.01.13.14.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 14:21:02 -0800 (PST)
Date: Fri, 14 Jan 2022 11:20:59 +1300
From: Daniel Beer <daniel.beer@igorinstitute.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
Message-ID: <20220113222059.GB18380@nyquist.nev>
References: <cover.1642063121.git.daniel.beer@igorinstitute.com>
 <2eb938b60d232dfc48fcc53e3c87d1f773b3bf2d.1642063121.git.daniel.beer@igorinstitute.com>
 <1642091374.227294.3647181.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642091374.227294.3647181.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Liu <andy-liu@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

On Thu, Jan 13, 2022 at 10:29:34AM -0600, Rob Herring wrote:
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tas5805m.example.dt.yaml: tas5805m@2c: status:0: 'ok' is not one of ['okay', 'disabled', 'reserved']
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/dt-core.yaml

I ran dt_binding_check against the master branch of the alsa-devel tree
and I'm not seeing this error. Obviously it's easy enough to fix, but is
there another tree I should be testing against before resubmitting?

Cheers,
Daniel

-- 
Daniel Beer
Firmware Engineer at Igor Institute
daniel.beer@igorinstitute.com or +64-27-420-8101
Offices in Seattle, San Francisco, and Vancouver BC or (206) 494-3312
