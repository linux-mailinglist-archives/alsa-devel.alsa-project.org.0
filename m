Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3437E61E4FD
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Nov 2022 18:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98893E8;
	Sun,  6 Nov 2022 18:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98893E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667756741;
	bh=hpjBmVAFvmSRsLP2IyvqOyJxasz5DLjdwiNDwWBmnDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpouvjVT7vyCKhN3oz00lnmauilci7NAlh0w4Z5s4oIGnnnFltM1DDEKVWL+LpUjg
	 i+2Zns/uSoyjVdzDmtkoDjDMhJVu4GBc1Ss37ak7+USIhfM+d0LxHy4FZ1eN9bX/+N
	 QqVw9b2lOdSN2hdlmmnItp/jEeWOESAV4DEuPuqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55DE2F80238;
	Sun,  6 Nov 2022 18:44:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C072AF80137; Sun,  6 Nov 2022 18:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E03F800BB
 for <alsa-devel@alsa-project.org>; Sun,  6 Nov 2022 18:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E03F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FdnOLJCa"
Received: by mail-io1-xd36.google.com with SMTP id d123so7249527iof.7
 for <alsa-devel@alsa-project.org>; Sun, 06 Nov 2022 09:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LmwpYCTGFDgeBb3yaFM0SZa/jnM1t19xpWxBuBKJal8=;
 b=FdnOLJCaxhF57Ct4n+8ZKrn1+v5QwMN+hsh06h/iWEb1N8H9iGKcFf6xiTsvHnaAIi
 KehmF31IWBfev4X0kwpNLvQfbOSYqsP9jjGJgagF58XtGeO22Qw/zyQd65J02lQTRH1n
 qFXeMRJsW9/bRiJ9vHdV9S6oZuIxtgVB8N5sIp6jf1MGi8m4bymCETSvaRU2pCQuxJ9J
 OXpPHaDeadltcQUwxRLiCM+80tBDiz6QB3KPs0yBfY4Rl3HLbcbjPhOWcbokvl/AeUqk
 45DTKn9D3LLfcoOBU/84Nb6s8T2QHof2mBeY1eoQ7s14pkGmBNC08NtXNz8DGt9aIaA6
 zXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LmwpYCTGFDgeBb3yaFM0SZa/jnM1t19xpWxBuBKJal8=;
 b=tX9Ch6fTTv2eH28WRY2vt4CpB34z1LoGCE+TMjcwCyaw5EII4qR5+X2w0SBIR0fc2+
 ++wFuiVY+kYULFTC4ZLTGjdMNnFw7+OyW8rlM9SnZAoOhBGbPrOBrK+2pG9cAAut+ap+
 zvI7Q+1I5+0eUXT/5n9Ckw4TNnUI0pY/EZuHJ+MHNO1gwifoxTfPQa1PigZpt7Pfh0LX
 4TJH/ATZgTjo3GRS+3x8ddLl0m0S5diDIitAL5bjjdDFdSx1R1nMGbZ+tEfpYpz/gyKo
 f64p0v7tRxgWsE3+CUwmizWIdATx6oq+BYbMndzH7W+YQovg2jJ9ur7AlTV/Rn7qu9zk
 t6Qw==
X-Gm-Message-State: ACrzQf33TcsOlhI5jH3yY+wlhACBo7LUICXVQId6HfvpYmbVRXmqLJb/
 +XUyPYJigScuik44Jn7QOIobUiekWG6b9YDfThc=
X-Google-Smtp-Source: AMsMyM418EFQAdgZSCnwSka9QG7J5t/0cMR9HkkhAMxXuxbHyH/U0bq+Cin5uEekUmsh5uyq/C/AGzh6E6wYz9I6AcA=
X-Received: by 2002:a5d:9552:0:b0:6ce:64b7:5198 with SMTP id
 a18-20020a5d9552000000b006ce64b75198mr19618284ios.108.1667756679822; Sun, 06
 Nov 2022 09:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20221106170637.1580802-1-sashal@kernel.org>
 <20221106170637.1580802-9-sashal@kernel.org>
In-Reply-To: <20221106170637.1580802-9-sashal@kernel.org>
From: Siarhei Volkau <lis8215@gmail.com>
Date: Sun, 6 Nov 2022 20:44:28 +0300
Message-ID: <CAKNVLfZ63utLSOujoTZqN8jHKwYwqb-Z0E=VwueFmwMJf961iA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 09/12] ASoC: codecs: jz4725b: fix capture
 selector naming
To: Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, paul@crapouillou.net,
 Mark Brown <broonie@kernel.org>, linux-mips@vger.kernel.org
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

=D0=B2=D1=81, 6 =D0=BD=D0=BE=D1=8F=D0=B1. 2022 =D0=B3. =D0=B2 20:06, Sasha =
Levin <sashal@kernel.org>:
> +       {"ADC Sourc Capture Routee", "Line In", "Line In"},

Please make sure you're grabbing df496157a5af companion commit.

BR,
Siarhei
