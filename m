Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038C24E87D7
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 15:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71DF91640;
	Sun, 27 Mar 2022 15:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71DF91640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648386595;
	bh=gZn7/W9sfzaFw4O1mB7Du3Dcmrk51mkx1kGdCZiyTV4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F06zb7DCERXeA9keEEBeK7syLWIXNUqWvV8pXMy2c5nhBcc94Zj+AW824BTaPe9ML
	 qYgghwcCabvR9evq0t9aG2EABwQdEm2E42lpkENVL6+iwQ6V35GWJX063xr7C3oE2U
	 7HQizhxaBBy9FC8i5fjbyixz23K/bd6AxJJdgMWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F4EF8019B;
	Sun, 27 Mar 2022 15:08:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B8AF80121; Sun, 27 Mar 2022 15:08:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6256DF80121
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 15:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6256DF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ufg/OZ4t"
Received: by mail-pl1-x643.google.com with SMTP id j8so2361563pll.11
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ev+jFF4MWyLXe4KFMG0ej9Khdftaw0LvpKgprsKOSno=;
 b=Ufg/OZ4tD+eXPEBdYrrwtmVFy3ZFS2zmA6LG4zlQnU4T+aLWPJWTyNP+eU9Mkif4il
 3kcXtY86W/fklnC9uI+MDlhKhDSSCJRXW8UAkht7kEZuqTzgG2MqU9HtM+WbuAWY+37l
 L7WaNxT+GdFefNK1qfyTyj3L0t7yOm+zeUy3+GOq5K6t3mMnmLpQK0yIkpr1sK9I1PgM
 YvRcFnmZDV0+/98BQzyAqVeeeMbvKMGlfF9xh+YMNkuDbcZjVaL411XXZ60EufOXfqaA
 K3jb4fB11w9UL5qB73hoFsqsROPfeVQYcFFqBjmAQNoOBzKM/HkoGqm4rJ7OvxNp2Jxu
 pdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ev+jFF4MWyLXe4KFMG0ej9Khdftaw0LvpKgprsKOSno=;
 b=x3VJpDuA87ykgvaS/4T4VF0/KoObmE0cyrAR8rKXAtMYW+bHfvGHb8m7ppN+megVvJ
 uyusdpwkZ8Fj+6TCcETaJ1/QjGzO3Cw5gw20t/CMh+zUYGsYf90xImk72n6pMTSNX71u
 M22KAkgGJoeGr4JKUwMSmfoyad0FVNuDhITMe2Z8gk9rb1QWWmdWkJfanhUk2/YlBCEq
 XFeOC1ONDVp+Gma/gZz7KdQTxOxHj43l7XW1umZpz4zh4B8yXGlRVbdQG2RHtG6wfn2C
 EVfZ1yhA+fsjkr6vkxyKV1V9FCpyqVnKY63b3n9KAUFV2RLSNIpj0j0c8x+dTQNXbwDb
 xpzg==
X-Gm-Message-State: AOAM531isC0Hs0Qj5tWdGK073Odmowobj1t4OK6/S2GxIKtqN6DMJKou
 obD1US0TEZC6nXZup/ebvJs=
X-Google-Smtp-Source: ABdhPJyXtZD88gtYEGL6/ADVEXlDLeumzqSwdYxQT/171flyk3eAaXRePwNbyBz93CC4f454cba7VQ==
X-Received: by 2002:a17:90b:4c49:b0:1c7:d6c1:bb0f with SMTP id
 np9-20020a17090b4c4900b001c7d6c1bb0fmr17541719pjb.230.1648386516119; 
 Sun, 27 Mar 2022 06:08:36 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm10967761pjv.57.2022.03.27.06.08.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 06:08:35 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jbrunet@baylibre.com
Subject: Re: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 21:08:01 +0800
Message-Id: <20220327130801.15631-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
References: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
Cc: alsa-devel@alsa-project.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com, tiwai@suse.com,
 lgirdwood@gmail.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, xiam0nd.tong@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Sun, 27 Mar 2022 13:03:14 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun 27 Mar 2022 at 16:18, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> 
> > The bug is here:
> > 	*dai_name = dai->driver->name;
> >
> > For for_each_component_dais(), just like list_for_each_entry,
> > the list iterator 'runtime' will point to a bogus position
> > containing HEAD if the list is empty or no element is found.
> > This case must be checked before any use of the iterator,
> > otherwise it will lead to a invalid memory access.
> >
> > To fix the bug, just move the assignment into loop and return
> > 0 when element is found, otherwise return -EINVAL;
> 
> Except we already checked that the id is valid and know an element will
> be be found once we enter the loop. No bug here and this patch does not
> seem necessary to me.

Yea, you should be right, it is not a bug here. id already be checked before
enter the loop:

if (id < 0 || id >= component->num_dai)
                return -EINVAL;

but if component->num_dai is not correct due to miscaculation or others reason
and the door is reopened, this patch can avoid a invalid memory access. Anyway,
it is a good choice to use the list iterator only inside the loop, as linus
suggested[1]. and we are on the way to change all these use-after-iter cases.

[1]https://lore.kernel.org/lkml/20220217184829.1991035-1-jakobkoschel@gmail.com/

--
Xiaomeng Tong
