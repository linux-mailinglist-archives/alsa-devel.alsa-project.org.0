Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7681BA1E2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 13:05:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4619D1690;
	Mon, 27 Apr 2020 13:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4619D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587985507;
	bh=YGgK5CRFIPvp5oQwSbTJDNV152r7++oABkTa9vPmsQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJTa5qEnXuHDiLdGt3LtibR6ek2cw6zuA2+yF3yezrOXy3nMeIHd0+QkZmM3dXsQM
	 yFhcH6Fg+ewDBI+DvimfdWImPuCZFlEZY/QyLVcmK4M3chTLgSzQ0hVTx5tvo64rda
	 BQyRs3XH6yNuhafDm4aLo3LTie9q8byySWOPJTJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C6DAF8010A;
	Mon, 27 Apr 2020 13:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 912BCF80113; Mon, 27 Apr 2020 13:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8327FF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 13:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8327FF80113
Received: by mail-lf1-f67.google.com with SMTP id 131so13396391lfh.11
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 04:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YGgK5CRFIPvp5oQwSbTJDNV152r7++oABkTa9vPmsQs=;
 b=pfL+30EJFTjVk5gsJoOjr1ylMcGOtGOS8PbTk0sdw/VZg0UNvb2/KkL42EeuJCN/Wq
 DReaQVUZpcZhVfM1xpLPY3up717LaO5BV5+zntYj+JC2mV24v+6odJvV1zXryXequ31G
 I6Hb7EU1wR1MWq0yVJSgtvzv0Rsw2bIk2EcgtvLkbcpP/JYi4ZqIZaZFKET9pH+uPyYQ
 DRqdIRqLWEam12IAf21SBySRPlqmqzKZnE+hbdS21CSh3ztbcy1Y+ZojKGgJQM9/Pk0f
 FsTCCmfordI6fLqPAQXmMto/cCUpTnx5TqWTYNznP8TIMPon33dXI9n1ncFpl5CDuvgS
 IY5g==
X-Gm-Message-State: AGi0PuaQ5KM3yom7lrcfa0Pur/mOX4gOpqNGhHRLrokI7l8FelkLD4gP
 GEjqOkAvzZKAFUBjgC0JXCpj2Cs1pN4=
X-Google-Smtp-Source: APiQypK3I6ut2onxqJB4NKK5n6e19/HfMldtiOpWGq2kPLkKV1eVD6y4SS/WrKvG1sFHuejEZvvOJw==
X-Received: by 2002:ac2:5395:: with SMTP id g21mr15008118lfh.61.1587985397161; 
 Mon, 27 Apr 2020 04:03:17 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181])
 by smtp.gmail.com with ESMTPSA id l12sm11117662lfp.35.2020.04.27.04.03.16
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 04:03:16 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id y4so17104334ljn.7
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 04:03:16 -0700 (PDT)
X-Received: by 2002:a2e:910e:: with SMTP id m14mr12649569ljg.141.1587985396375; 
 Mon, 27 Apr 2020 04:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-7-peron.clem@gmail.com>
In-Reply-To: <20200426104115.22630-7-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 27 Apr 2020 19:03:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66TFzpEmzdqxmjqGvVONkPEhaDMHNA4tRUvrX_Mg8w=tA@mail.gmail.com>
Message-ID: <CAGb2v66TFzpEmzdqxmjqGvVONkPEhaDMHNA4tRUvrX_Mg8w=tA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ASoC: sun4i-i2s: Adjust regmap settings
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Marcus Cooper <codekipper@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Sun, Apr 26, 2020 at 6:41 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> From: Marcus Cooper <codekipper@gmail.com>
>
> Bypass the regmap cache when flushing or reading the i2s FIFOs.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
