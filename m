Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5CB4A4E9C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 19:40:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D0316B1;
	Mon, 31 Jan 2022 19:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D0316B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643654425;
	bh=w7AiGUluPxc0UiTDIqENVKqTDlOyS4uHsgpuwHwLOeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwalsTUHZ1XPL4tTR5PcrMI2KANwxy1iZLNDN0ZZG0xX1Go+wSZnnAew+71LXqdNK
	 6lF5sYXDQIhUfqcMP6hQo9BAu9JBMy7qWvUk58b7cWRwkIiGPuVg14/3Tgbb+LUgqy
	 VcXDwp0VY5LqZPquNtJ+iA0yn8PcAjCVFzIINU50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA1C1F800CE;
	Mon, 31 Jan 2022 19:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F380CF800CE; Mon, 31 Jan 2022 19:39:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86D55F800CE
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 19:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86D55F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qesb75kc"
Received: by mail-wr1-x431.google.com with SMTP id e8so27280629wrc.0
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 10:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7AiGUluPxc0UiTDIqENVKqTDlOyS4uHsgpuwHwLOeg=;
 b=qesb75kcRx+bDIaLCM24KVqxxOLbJ9n9n2UGEJHBZT9ib/x4I5+h7gXGj3i71uRZ6z
 aCL92nTYDzuilalvWL63SaXLu04Dy6r7dftFe96usZpjVwxmyyNcnLmGVU2rnFbXoHfO
 6gXlcmJY330p+t9Wa9Q3BV+3wi+LKaJEYrmzV5LMLDIrFtwoj4uMxIiy7lu00Yi+Cuex
 aknT5IeAOuK3FNFYLmUNWCFOjzzXDCST23mVgIqypACTQ3OmCEvUvnpjqHmDQz2FAijo
 b496zk60iFns+G72MZtWGbeplYK3Trfynqto3U6IP3/zgyMOBjHjoYt0Ywlzlu+TF5ej
 YwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7AiGUluPxc0UiTDIqENVKqTDlOyS4uHsgpuwHwLOeg=;
 b=L9De3XJ101OX4RfAtLV6G+PdnGCy0cYs/2ZRBRcijcD70s6GR3L7D7x6JCNP0OXlFC
 gvOl8b4PIaNCBngk1nDI3XjVhO7kdmOCo8O3aSm5U5lFq+EbjOGCO/Bg/qUGkKFB1n6e
 IiLBm7n132vYpdTKwCKAvDG/43rvburstStZuB4E9klR3hGh5o4/n4hjaoBSg94n+lYU
 NkCrZegcUqJgN5rP7kuZVBTbz/SKKejxp98gqxd1Y+2nwegep5G4SbJgeNy4w11+TzoF
 gxFyL8VlvhLhxaQs0q4cSrAxktAxIXI47kj9sGn7QjB4R79uwEqcVNbWGA15KM0ZhmUe
 myLg==
X-Gm-Message-State: AOAM530qzsdsGYjEGYaYyx77NeXY+GYcDSojmCdym/6ZGS+Zb+fj/AhN
 wKpvPC5t6rV8G8yIkg/k2jIDC5IKnTguJhyojFU=
X-Google-Smtp-Source: ABdhPJxls4LiARlzwvKBacPiPXYA243f991NP7fBtWDu66SvwODeqEa2vmOpr70ho733SPXtbttVHv7+1KJV3gRHPmI=
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr17533319wrz.583.1643654352357; 
 Mon, 31 Jan 2022 10:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20220129000837.6207-1-cujomalainey@chromium.org>
 <a8ffb740-9f03-340f-a7ba-5e0f1a074b22@amd.com>
In-Reply-To: <a8ffb740-9f03-340f-a7ba-5e0f1a074b22@amd.com>
From: Curtis Malainey <cujomalainey@gmail.com>
Date: Mon, 31 Jan 2022 10:39:00 -0800
Message-ID: <CAGXAbSq4+YY3qNt2c8J-P278QtUMTkJAo7x3=6UvJof4bH2C2Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "ASoC: amd: acp: Power on/off the speaker enable
 gpio pin based on DAPM callback."
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Eric Peers <epeers@google.com>,
 Rob Barnes <robbarnes@google.com>
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

> > --
> > 2.32.0
> >
> I feel instead of reverting this complete patch we can quickly submit a
> new patch set with "gpio_spk_en = NONE" for maxim codec case. As codec
> driver is anyhow controlling that gpio we don't need to do it from
> machine driver. We've already done that here
> https://patchwork.kernel.org/project/alsa-devel/patch/20220131203225.1418648-1-vsujithkumar.reddy@amd.com/

I'm pretty sure the proper solution is to shove this logic into the
alc1019 driver like it is in the max98357 driver. The header is
already there for gpio which makes me think it was planned but
forgotten. Otherwise everyone else who uses this codec and associated
pin will have to duplicate this logic in their machine driver.
