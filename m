Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAA1567839
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 22:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5B016B2;
	Tue,  5 Jul 2022 22:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5B016B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657052048;
	bh=lB/imRdH3/q8PFkRUfU6A8UQUJZZB6tKVzEidXpH5K8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QL8f7Ulb4HkZd4NtpiCEt0dtNnZvrKiu8FhBEtfzoYEbqp0/jZHOp0Ae20sOhdxpC
	 S9BGFSRH0cojK+A6hW+yV7pvORHPVw2Nwf49/3gVcWdWmKk2Raqhb2x33BfKRauAsY
	 4nSzYpRj4DkHfmBp/0ElZT08vMdH4a9q7R6PFDPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC078F80212;
	Tue,  5 Jul 2022 22:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A99E3F8015B; Tue,  5 Jul 2022 22:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F5ACF800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 22:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F5ACF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bokDxqmI"
Received: by mail-ej1-x634.google.com with SMTP id f26so643260ejl.4
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+4Rl23w/icZA1D45EvjNhKFOa2QN4S2mMkfghKH9T+w=;
 b=bokDxqmIAvNaE10/oTxRc+xeNaW52DY859KEXGdIQ9Miw2HatV/FJbH6I7G02PcPjN
 7XwKg8jK75qmfy0QBk8fJElDaseFAI1bsY0LxjeTlulhAp/twfDu95KTQ3pu+TFOkMGj
 /Ey7O2V4frtSaYtNZbW2ewMwfLK830sAScJlVSkGZp0bH3fkSQ/q2F8KeXDDXqkP+J20
 ggU0k8wL69pt8ReHZy65h6gJFNQrIaGWHRy/EhBD6OC74KPqDwh9ePQYLtbbIs1KRa//
 ZpmD608eNgmeyKKj1DB8bj2H4ryQumZE+ChuLFkVOcI9m5w+842X1WL96yHhuBk1jfWO
 dc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4Rl23w/icZA1D45EvjNhKFOa2QN4S2mMkfghKH9T+w=;
 b=agAtcvoK/ixaWemY8ibSbXNKhY+F2WrdvbfDNqFdsjRe1c/N035eCXMZJytMk10rkn
 mZbBOBxBob6JNJgtFt1sUphvoaN3dbMhuN5hOmmf8AZ1hRyZzhpNu6dlv/LNSGP+1qj5
 L8nwqhXD2MqSpwsQunzIvc2rEuxQtVFMVHbnPFwcnVcZ2kFMVLapStN1Tw+m4olLzNX8
 IgLdsTs2A0sJ5Nk6KwyNhSw/66CoqfG5yIK/sKSG4eeneXJGvUqjpSKV5uEPkG5t1f90
 q1A93It6dWwd3RQ7+PPuMTLeMBmnMBXuBAONywfNpjHSghBlqsJ6L8CFy/vnwriP9HRf
 qZww==
X-Gm-Message-State: AJIora9JYWzpxi6A8Y7/x5lyIrTfDQ2WNyGW9VQCLPWqkWiHUWuM7bJm
 zoU+QTdOPZQf8ErOrWxHu8k=
X-Google-Smtp-Source: AGRyM1uxDY4QHvPbRs9gRTse8HNXy2XC7pEEwYoci795EVH18hYFZx0atz3AG4HsgJEPfforNDUfxA==
X-Received: by 2002:a17:907:1623:b0:722:ef86:e25c with SMTP id
 hb35-20020a170907162300b00722ef86e25cmr36283139ejc.461.1657051977854; 
 Tue, 05 Jul 2022 13:12:57 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 t25-20020a056402241900b0043589eba83bsm13832022eda.58.2022.07.05.13.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 13:12:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: lgirdwood@gmail.com, samuel@sholland.org, wens@csie.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: Re: (subset) [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal
 bias support
Date: Tue, 05 Jul 2022 22:12:56 +0200
Message-ID: <3139722.aV6nBDHxoP@kista>
In-Reply-To: <165636279016.4185952.318954133536578049.b4-ty@kernel.org>
References: <20220621035452.60272-1-samuel@sholland.org>
 <165636279016.4185952.318954133536578049.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, arnaud.ferraris@collabora.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 mripard@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Hi Mark!

Dne ponedeljek, 27. junij 2022 ob 22:46:30 CEST je Mark Brown napisal(a):
> On Mon, 20 Jun 2022 22:54:49 -0500, Samuel Holland wrote:
> > This series adds support for enabling the codec's internal microphone
> > bias, which is needed on at least some versions of the PinePhone.
> > 
> > Changes in v2:
> >  - Move register update from component probe to device probe
> > 
> > Arnaud Ferraris (2):
> >   ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
> >   ASoC: sun50i-codec-analog: Add support for internal bias
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
> for-next
> 
> Thanks!
> 
> [1/3] ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
>       commit: 24e0b04dd42be34ec4b18dc1a1e139d66eb572a3
> [2/3] ASoC: sun50i-codec-analog: Add support for internal bias
>       commit: 25ae1a04da0d32c22db0b018e5668129b91fa104

Can you also take patch 3? You picked bindings change, so it's easiest if DT 
change goes through your tree too.

Best regards,
Jernej

> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark


