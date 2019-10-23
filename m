Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F2FE1392
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 10:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7A011660;
	Wed, 23 Oct 2019 10:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7A011660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571817910;
	bh=TGhO7Lg1bhjRNnkMNV97TbL7QN9KRlYT27B3exJdouk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqSvQy0g0QhYgDT0dg3hb0Id4IA2ry/gsdoPQP4/2e2EEJt8doCI1EbjN4GvwwnLB
	 KHyPNQOaxoTm8rVIHkn2SiT/scl7PjsazRjGYbtBvQIcNfftgI9D8OfIKhiOmYXg9M
	 b3Gr1vbbRpapvB4SI2czLmWocdMypqPy8NTJ9lhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21CF6F80321;
	Wed, 23 Oct 2019 10:03:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A75F80368; Wed, 23 Oct 2019 10:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935CAF80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 10:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935CAF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gHIg3gQn"
Received: by mail-ot1-x344.google.com with SMTP id n48so1685453ota.11
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 01:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6uunPk4FRGMVRF/7mka4EzN9Nm4HV/2M2f5HwcfgzDg=;
 b=gHIg3gQn71VKU1Zb5o/Bjl3AtqVaiUFOBs/9yFdHsyR5Cp3O9qFur0Z7Yp6eGhpSJP
 zwARXUjs2v0bUpgfQNpyh3eSjlOfqyeklONDjphVP78YlJqbsj6txItzZMqz4fLMkXjE
 ujdJRD/EJ6Dn4eD61vueYzyHTWA2nMju0JbBrdnWyHj3k0z5rIMg6SaSDLL/aGtcsJyz
 mM79AoUbEry+9j1JIloGvt49aoCGf7Gc5GT1Lt07h+2w635KjXjOVVq/P8OhlKbEhx/9
 sb6SUs2Kmy//iuqTRXE9jU1OwV+XtPfM1lxotMBnnPjKkStTZ/JgbvF6bo4zsjRaxsII
 7J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6uunPk4FRGMVRF/7mka4EzN9Nm4HV/2M2f5HwcfgzDg=;
 b=GVEJXIf6Zn5eIOs8IvcXm8O7XXWrbEmhI28yCNSKo/1m3IzlHn4EGpHoXrhLozZzaC
 /cejvtqvyMmq29g8q0BX3QFNqpVZozpwyWYCip1kvwXBWV68UdJiXgUcUXgRjJtQAUPJ
 TVwFCpOHl8Ln/EHCAf08rdLi5DAkkWqjWlSiAa80/TYqcn+EQCZkXUbYHy5wgpUN4Ib6
 z+MevaGwKQKWLeQnOQpL8zbUUym6LxbobT9aNjiT+0vn+bsJyR5wEFSNszEMJrOOPxP/
 vEeO68VKul7CwaS+byQxWS9DYsPcRJYiVr+BaBzrobL3YeK+/8M8RDsVlskQqXI5cA+F
 T1ZQ==
X-Gm-Message-State: APjAAAUQbQbe/oF/mjCxKeMos0VJBcTt7fn/XLwVc6cNKRegqL4vEAwb
 LaA38A6wmwkgBTP00euBseNaprmre+pVcqBGv1TiJw==
X-Google-Smtp-Source: APXvYqyfHE/ivBJeAMwtq+xDy7lllkwK/zu3sWWZGYeVM4ARAomhLhU7HXNGvp44TV8sDYdi8DuU8C7CCvatK56LIEM=
X-Received: by 2002:a9d:7d12:: with SMTP id v18mr4015609otn.103.1571817800353; 
 Wed, 23 Oct 2019 01:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191023063103.44941-1-maowenan@huawei.com>
In-Reply-To: <20191023063103.44941-1-maowenan@huawei.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 23 Oct 2019 16:03:07 +0800
Message-ID: <CA+Px+wU5UrVC0pk5pbfGTdVsh7OHcBx_MhbC3Bjmj_+zgn54PQ@mail.gmail.com>
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
 ALSA development <alsa-devel@alsa-project.org>,
 kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuehaibing@huawei.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: mediatek: Check
	SND_SOC_CROS_EC_CODEC dependency
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

On Wed, Oct 23, 2019 at 2:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
> below errors can be seen:
> sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
> cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
> cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'
>
> This is because it will select SND_SOC_CROS_EC_CODEC
> after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
> but SND_SOC_CROS_EC_CODEC depends on CROS_EC.
>
> Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Acked-by: Tzung-Bi Shih <tzungbi@google.com>

Thanks for the catching.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
